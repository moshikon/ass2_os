#include "types.h"
#include "stat.h"
#include "user.h"
#include "kthread.h"

#define STATES_NUM 6	//number of states in the machine


enum soilders_state { Q, P, R, Z, M, F};
int father_id;
int max_threads;
int state[NTHREAD];
int next_state[NTHREAD];
int counter;
int count_protector, mbarrier;


int moves[5][6][6] =
	{	//state Q (0)
		{{Q,P,Q,Q,-1,Q},
		{P,P,-1,-1,-1,P},
		{Q,-1,Q,-1,-1,-1},
		{Q,-1,-1,Q,-1,Q},
		{-1,-1,-1,-1,-1,-1},
		{Q,P,Q,Q,-1,-1}},
		//state P (1)
		{{Z,Z,R,R,-1,-1},
		{Z,-1,Z,Z,-1,-1},
		{R,Z,Z,-1,-1,Z},
		{R,Z,-1,Z,-1,Z},
		{-1,-1,-1,-1,-1,-1},
		{Z,-1,Z,Z,-1,-1}},
		//state R (2)
		{{-1,-1,R,1,Z,-1},
		{-1,-1,M,R,M,-1},
		{R,4,-1,-1,M,-1},
		{P,R,-1,-1,R,-1},
		{Z,M,M,R,4,-1},
		{-1,-1,-1,-1,-1,-1}},
		//state Z (3)
		{{-1,-1,Q,P,Q,-1},
		{-1,Z,-1,Z,-1,-1},
		{Q,-1,Q,Q,-1,Q},
		{P,Z,Q,5,Q,5},
		{Q,-1,-1,Q,Q,Q},
		{-1,Z,Q,5,Q,-1}},
		//state M (4)
		{{-1,-1,-1,-1,-1,-1},
		{-1,-1,-1,-1,-1,-1},
		{-1,-1,R,Z,-1,-1},
		{-1,-1,Z,-1,-1,-1},
		{-1,-1,-1,-1,-1,-1},
		{-1,-1,-1,-1,-1,-1}}

		// state 5-F
	};


void barrier(void){
	if(kthread_mutex_lock(count_protector) < 0)
		printf(1, "mutex %d lock faild\n", count_protector);
	counter++;
	if(counter < max_threads){	
		if(kthread_mutex_unlock(count_protector) < 0)// let other threds inc the counter
				printf(1, "mutex %d unlock faild\n", count_protector);
	}
	else{ //if all threads reached the barrier
		if(kthread_mutex_unlock(mbarrier) < 0)
			printf(1, "mutex %d unlock faild\n", mbarrier);
	}

	if(kthread_mutex_lock(mbarrier) < 0)//wait till all threads reached the barrier
		printf(1, "mutex %d lock faild\n", mbarrier);
	counter--;	//how many threads needs to wakes up
	if(counter > 0){
		if(kthread_mutex_unlock(mbarrier) < 0)//wakeup the next thread
			printf(1, "mutex %d unlock faild\n", mbarrier);
	}
	else{
		if(kthread_mutex_unlock(count_protector) < 0)// unlock the count protector mutex
			printf(1, "mutex %d unlock faild\n", count_protector);
	//	kthread_mutex_lock(mutex_departure);
	}
}

void *next_state_calc(){

	int i = kthread_id()-(father_id)-1;
	int j;
	while(state[i] != F){	//while we did't get into final state
		if(i == 0){	//general 
			if((next_state[i] = moves[state[i]][STATES_NUM-1][state[i+1]]) == -1)	
				goto err;
		}
		else if(i == max_threads-1){	//last soldier
			if((next_state[i] = moves[state[i]][state[i-1]][STATES_NUM-1]) == -1)
				goto err;
		}
		else{	//rest of the soldiers
			if((next_state[i] = moves[state[i]][state[i-1]][state[i+1]]) == -1)	
				goto err;
		}

		barrier();	//wait till all threads calculates the next state
		state[i] = next_state[i];	//update the new status
		barrier();	//wait till all threads update next status

		if(i==0){	//print array
			for(j = 0 ; j < max_threads; j++)
				printf(1,"%d ", state[j]);
			printf(1,"\n");
		} 

	}

	if(state[i] != F){
	err:
		printf(1,"thread: %d, didn't find next state\n", kthread_id() -(father_id)-1);
		exit();
	}
	kthread_exit();
	return 0;
}
void dealloc_mutexs(){
	if(kthread_mutex_dealloc(count_protector) == 1)
		printf(1, "dealloc mutex: %d faild\n",count_protector );
	else
		printf(1, "dealloc mutex: %d\n",count_protector );
	if(kthread_mutex_dealloc(mbarrier) == 1)
		printf(1, "dealloc mutex: %d faild\n",mbarrier );
	else
		printf(1, "dealloc mutex: %d\n",mbarrier);
}

int main(int argc, char **argv)
{
	int i,j,k;
	uint *stack = 0;
	if(argc < 2){
		printf(1,"too few arguments\n");
		exit();
	}
	max_threads = atoi(argv[1])+1; //soldiers included the general
	father_id = kthread_id();

	state[0] = 1;
	for( j= 0; j<max_threads; j++){
		printf(1, "%d ",state[j]);
	}
	printf(1, "\n");

	counter = 0;
	count_protector = kthread_mutex_alloc();
	mbarrier = kthread_mutex_alloc();
	if(kthread_mutex_lock(mbarrier) < 0)
		printf(1, "mutex %d lock faild\n", mbarrier);


	for(i = 0 ; i < max_threads ; i++){
   		if((stack  = malloc(4096)) == 0){// create user stack
   			 printf(1,"create stack faild\n"); 
   			 dealloc_mutexs();
			exit();
   		}
   		memset(stack, 0, sizeof(*stack));
		if(kthread_create(next_state_calc, stack, 4096) == -1) {
			printf(1,"create thread faild\n");
			dealloc_mutexs();
			exit();
		}
	}
	for(k = 0; k< max_threads; k++){
		kthread_join(father_id + k +1);
	}
	if(kthread_mutex_unlock(mbarrier) < 0)
		printf(1, "mutex %d unlock faild\n", mbarrier);
	dealloc_mutexs();
	kthread_exit();
	return 1;

}
