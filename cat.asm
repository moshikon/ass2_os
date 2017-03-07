
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
  int fd, i;

  if(argc <= 1){
   5:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int
main(int argc, char *argv[])
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 45 0c             	mov    0xc(%ebp),%eax
  int fd, i;

  if(argc <= 1){
  14:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  18:	8d 58 04             	lea    0x4(%eax),%ebx
  1b:	7e 5a                	jle    77 <main+0x77>
  1d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  27:	00 
  28:	8b 03                	mov    (%ebx),%eax
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 30 03 00 00       	call   362 <open>
  32:	85 c0                	test   %eax,%eax
  34:	89 c7                	mov    %eax,%edi
  36:	78 20                	js     58 <main+0x58>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  38:	89 04 24             	mov    %eax,(%esp)
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  3b:	83 c6 01             	add    $0x1,%esi
  3e:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  41:	e8 4a 00 00 00       	call   90 <cat>
    close(fd);
  46:	89 3c 24             	mov    %edi,(%esp)
  49:	e8 fc 02 00 00       	call   34a <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  4e:	3b 75 08             	cmp    0x8(%ebp),%esi
  51:	75 cd                	jne    20 <main+0x20>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
  53:	e8 ca 02 00 00       	call   322 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
  58:	8b 03                	mov    (%ebx),%eax
  5a:	c7 44 24 04 27 08 00 	movl   $0x827,0x4(%esp)
  61:	00 
  62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  69:	89 44 24 08          	mov    %eax,0x8(%esp)
  6d:	e8 3e 04 00 00       	call   4b0 <printf>
      exit();
  72:	e8 ab 02 00 00       	call   322 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
  77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7e:	e8 0d 00 00 00       	call   90 <cat>
    exit();
  83:	e8 9a 02 00 00       	call   322 <exit>
  88:	66 90                	xchg   %ax,%ax
  8a:	66 90                	xchg   %ax,%ax
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:

char buf[512];

void
cat(int fd)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	83 ec 14             	sub    $0x14,%esp
  97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  9a:	eb 1c                	jmp    b8 <cat+0x28>
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    write(1, buf, n);
  a0:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4:	c7 44 24 04 20 0b 00 	movl   $0xb20,0x4(%esp)
  ab:	00 
  ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b3:	e8 8a 02 00 00       	call   342 <write>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  b8:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  bf:	00 
  c0:	c7 44 24 04 20 0b 00 	movl   $0xb20,0x4(%esp)
  c7:	00 
  c8:	89 1c 24             	mov    %ebx,(%esp)
  cb:	e8 6a 02 00 00       	call   33a <read>
  d0:	83 f8 00             	cmp    $0x0,%eax
  d3:	7f cb                	jg     a0 <cat+0x10>
    write(1, buf, n);
  if(n < 0){
  d5:	75 06                	jne    dd <cat+0x4d>
    printf(1, "cat: read error\n");
    exit();
  }
}
  d7:	83 c4 14             	add    $0x14,%esp
  da:	5b                   	pop    %ebx
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    write(1, buf, n);
  if(n < 0){
    printf(1, "cat: read error\n");
  dd:	c7 44 24 04 16 08 00 	movl   $0x816,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 bf 03 00 00       	call   4b0 <printf>
    exit();
  f1:	e8 2c 02 00 00       	call   322 <exit>
  f6:	66 90                	xchg   %ax,%ax
  f8:	66 90                	xchg   %ax,%ax
  fa:	66 90                	xchg   %ax,%ax
  fc:	66 90                	xchg   %ax,%ax
  fe:	66 90                	xchg   %ax,%ax

00000100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 109:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 10a:	89 c2                	mov    %eax,%edx
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 110:	83 c1 01             	add    $0x1,%ecx
 113:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 117:	83 c2 01             	add    $0x1,%edx
 11a:	84 db                	test   %bl,%bl
 11c:	88 5a ff             	mov    %bl,-0x1(%edx)
 11f:	75 ef                	jne    110 <strcpy+0x10>
    ;
  return os;
}
 121:	5b                   	pop    %ebx
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    
 124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 12a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	53                   	push   %ebx
 137:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 13a:	0f b6 02             	movzbl (%edx),%eax
 13d:	84 c0                	test   %al,%al
 13f:	74 2d                	je     16e <strcmp+0x3e>
 141:	0f b6 19             	movzbl (%ecx),%ebx
 144:	38 d8                	cmp    %bl,%al
 146:	74 0e                	je     156 <strcmp+0x26>
 148:	eb 2b                	jmp    175 <strcmp+0x45>
 14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 150:	38 c8                	cmp    %cl,%al
 152:	75 15                	jne    169 <strcmp+0x39>
    p++, q++;
 154:	89 d9                	mov    %ebx,%ecx
 156:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 159:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 15c:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 15f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 163:	84 c0                	test   %al,%al
 165:	75 e9                	jne    150 <strcmp+0x20>
 167:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 169:	29 c8                	sub    %ecx,%eax
}
 16b:	5b                   	pop    %ebx
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
 16e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 171:	31 c0                	xor    %eax,%eax
 173:	eb f4                	jmp    169 <strcmp+0x39>
 175:	0f b6 cb             	movzbl %bl,%ecx
 178:	eb ef                	jmp    169 <strcmp+0x39>
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 39 00             	cmpb   $0x0,(%ecx)
 189:	74 12                	je     19d <strlen+0x1d>
 18b:	31 d2                	xor    %edx,%edx
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c2 01             	add    $0x1,%edx
 193:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 197:	89 d0                	mov    %edx,%eax
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 19d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <memset>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	89 d0                	mov    %edx,%eax
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	53                   	push   %ebx
 1d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1da:	0f b6 18             	movzbl (%eax),%ebx
 1dd:	84 db                	test   %bl,%bl
 1df:	74 1d                	je     1fe <strchr+0x2e>
    if(*s == c)
 1e1:	38 d3                	cmp    %dl,%bl
 1e3:	89 d1                	mov    %edx,%ecx
 1e5:	75 0d                	jne    1f4 <strchr+0x24>
 1e7:	eb 17                	jmp    200 <strchr+0x30>
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	38 ca                	cmp    %cl,%dl
 1f2:	74 0c                	je     200 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	0f b6 10             	movzbl (%eax),%edx
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1fe:	31 c0                	xor    %eax,%eax
}
 200:	5b                   	pop    %ebx
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 215:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 217:	53                   	push   %ebx
 218:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 21b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	eb 31                	jmp    251 <gets+0x41>
    cc = read(0, &c, 1);
 220:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 227:	00 
 228:	89 7c 24 04          	mov    %edi,0x4(%esp)
 22c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 233:	e8 02 01 00 00       	call   33a <read>
    if(cc < 1)
 238:	85 c0                	test   %eax,%eax
 23a:	7e 1d                	jle    259 <gets+0x49>
      break;
    buf[i++] = c;
 23c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 240:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 242:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 245:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 247:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 24b:	74 0c                	je     259 <gets+0x49>
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	74 08                	je     259 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 251:	8d 5e 01             	lea    0x1(%esi),%ebx
 254:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 257:	7c c7                	jl     220 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 259:	8b 45 08             	mov    0x8(%ebp),%eax
 25c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 260:	83 c4 2c             	add    $0x2c,%esp
 263:	5b                   	pop    %ebx
 264:	5e                   	pop    %esi
 265:	5f                   	pop    %edi
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    
 268:	90                   	nop
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <stat>:

int
stat(char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 282:	00 
 283:	89 04 24             	mov    %eax,(%esp)
 286:	e8 d7 00 00 00       	call   362 <open>
  if(fd < 0)
 28b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 28f:	78 27                	js     2b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 291:	8b 45 0c             	mov    0xc(%ebp),%eax
 294:	89 1c 24             	mov    %ebx,(%esp)
 297:	89 44 24 04          	mov    %eax,0x4(%esp)
 29b:	e8 da 00 00 00       	call   37a <fstat>
  close(fd);
 2a0:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2a3:	89 c6                	mov    %eax,%esi
  close(fd);
 2a5:	e8 a0 00 00 00       	call   34a <close>
  return r;
 2aa:	89 f0                	mov    %esi,%eax
}
 2ac:	83 c4 10             	add    $0x10,%esp
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	90                   	nop
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2bd:	eb ed                	jmp    2ac <stat+0x3c>
 2bf:	90                   	nop

000002c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 11             	movsbl (%ecx),%edx
 2ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 2cd:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 2cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2d4:	77 17                	ja     2ed <atoi+0x2d>
 2d6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2d8:	83 c1 01             	add    $0x1,%ecx
 2db:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2de:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e2:	0f be 11             	movsbl (%ecx),%edx
 2e5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2e8:	80 fb 09             	cmp    $0x9,%bl
 2eb:	76 eb                	jbe    2d8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 2ed:	5b                   	pop    %ebx
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    

000002f0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	56                   	push   %esi
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	53                   	push   %ebx
 2fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2fd:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 300:	85 db                	test   %ebx,%ebx
 302:	7e 12                	jle    316 <memmove+0x26>
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 312:	39 da                	cmp    %ebx,%edx
 314:	75 f2                	jne    308 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31a:	b8 01 00 00 00       	mov    $0x1,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <exit>:
SYSCALL(exit)
 322:	b8 02 00 00 00       	mov    $0x2,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <wait>:
SYSCALL(wait)
 32a:	b8 03 00 00 00       	mov    $0x3,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <pipe>:
SYSCALL(pipe)
 332:	b8 04 00 00 00       	mov    $0x4,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <read>:
SYSCALL(read)
 33a:	b8 05 00 00 00       	mov    $0x5,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <write>:
SYSCALL(write)
 342:	b8 10 00 00 00       	mov    $0x10,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <close>:
SYSCALL(close)
 34a:	b8 15 00 00 00       	mov    $0x15,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <kill>:
SYSCALL(kill)
 352:	b8 06 00 00 00       	mov    $0x6,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <exec>:
SYSCALL(exec)
 35a:	b8 07 00 00 00       	mov    $0x7,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <open>:
SYSCALL(open)
 362:	b8 0f 00 00 00       	mov    $0xf,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mknod>:
SYSCALL(mknod)
 36a:	b8 11 00 00 00       	mov    $0x11,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <unlink>:
SYSCALL(unlink)
 372:	b8 12 00 00 00       	mov    $0x12,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <fstat>:
SYSCALL(fstat)
 37a:	b8 08 00 00 00       	mov    $0x8,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <link>:
SYSCALL(link)
 382:	b8 13 00 00 00       	mov    $0x13,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mkdir>:
SYSCALL(mkdir)
 38a:	b8 14 00 00 00       	mov    $0x14,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <chdir>:
SYSCALL(chdir)
 392:	b8 09 00 00 00       	mov    $0x9,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <dup>:
SYSCALL(dup)
 39a:	b8 0a 00 00 00       	mov    $0xa,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getpid>:
SYSCALL(getpid)
 3a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sbrk>:
SYSCALL(sbrk)
 3aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <sleep>:
SYSCALL(sleep)
 3b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <uptime>:
SYSCALL(uptime)
 3ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <kthread_create>:
SYSCALL(kthread_create)
 3c2:	b8 16 00 00 00       	mov    $0x16,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <kthread_id>:
SYSCALL(kthread_id)
 3ca:	b8 17 00 00 00       	mov    $0x17,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <kthread_exit>:
SYSCALL(kthread_exit)
 3d2:	b8 18 00 00 00       	mov    $0x18,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <kthread_join>:
SYSCALL(kthread_join)
 3da:	b8 19 00 00 00       	mov    $0x19,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <kthread_mutex_alloc>:
SYSCALL(kthread_mutex_alloc)
 3e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <kthread_mutex_lock>:
SYSCALL(kthread_mutex_lock)
 3ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <kthread_mutex_unlock>:
SYSCALL(kthread_mutex_unlock)
 3f2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <kthread_mutex_dealloc>:
SYSCALL(kthread_mutex_dealloc)
 3fa:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    
 402:	66 90                	xchg   %ax,%ax
 404:	66 90                	xchg   %ax,%ax
 406:	66 90                	xchg   %ax,%ax
 408:	66 90                	xchg   %ax,%ax
 40a:	66 90                	xchg   %ax,%ax
 40c:	66 90                	xchg   %ax,%ax
 40e:	66 90                	xchg   %ax,%ax

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	89 c6                	mov    %eax,%esi
 417:	53                   	push   %ebx
 418:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 41e:	85 db                	test   %ebx,%ebx
 420:	74 09                	je     42b <printint+0x1b>
 422:	89 d0                	mov    %edx,%eax
 424:	c1 e8 1f             	shr    $0x1f,%eax
 427:	84 c0                	test   %al,%al
 429:	75 75                	jne    4a0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 42b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 42d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 434:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 437:	31 ff                	xor    %edi,%edi
 439:	89 ce                	mov    %ecx,%esi
 43b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 43e:	eb 02                	jmp    442 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 440:	89 cf                	mov    %ecx,%edi
 442:	31 d2                	xor    %edx,%edx
 444:	f7 f6                	div    %esi
 446:	8d 4f 01             	lea    0x1(%edi),%ecx
 449:	0f b6 92 43 08 00 00 	movzbl 0x843(%edx),%edx
  }while((x /= base) != 0);
 450:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 452:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 455:	75 e9                	jne    440 <printint+0x30>
  if(neg)
 457:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 45a:	89 c8                	mov    %ecx,%eax
 45c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 45f:	85 d2                	test   %edx,%edx
 461:	74 08                	je     46b <printint+0x5b>
    buf[i++] = '-';
 463:	8d 4f 02             	lea    0x2(%edi),%ecx
 466:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 46b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 46e:	66 90                	xchg   %ax,%ax
 470:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 475:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 478:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47f:	00 
 480:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 484:	89 34 24             	mov    %esi,(%esp)
 487:	88 45 d7             	mov    %al,-0x29(%ebp)
 48a:	e8 b3 fe ff ff       	call   342 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 48f:	83 ff ff             	cmp    $0xffffffff,%edi
 492:	75 dc                	jne    470 <printint+0x60>
    putc(fd, buf[i]);
}
 494:	83 c4 4c             	add    $0x4c,%esp
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4a0:	89 d0                	mov    %edx,%eax
 4a2:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 4a4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4ab:	eb 87                	jmp    434 <printint+0x24>
 4ad:	8d 76 00             	lea    0x0(%esi),%esi

000004b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4b4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4b6:	56                   	push   %esi
 4b7:	53                   	push   %ebx
 4b8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4be:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4c1:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 4c7:	0f b6 13             	movzbl (%ebx),%edx
 4ca:	83 c3 01             	add    $0x1,%ebx
 4cd:	84 d2                	test   %dl,%dl
 4cf:	75 39                	jne    50a <printf+0x5a>
 4d1:	e9 c2 00 00 00       	jmp    598 <printf+0xe8>
 4d6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d8:	83 fa 25             	cmp    $0x25,%edx
 4db:	0f 84 bf 00 00 00    	je     5a0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4e1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4e4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4eb:	00 
 4ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f0:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4f3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4f6:	e8 47 fe ff ff       	call   342 <write>
 4fb:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4fe:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 502:	84 d2                	test   %dl,%dl
 504:	0f 84 8e 00 00 00    	je     598 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 50a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 50c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 50f:	74 c7                	je     4d8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 511:	83 ff 25             	cmp    $0x25,%edi
 514:	75 e5                	jne    4fb <printf+0x4b>
      if(c == 'd'){
 516:	83 fa 64             	cmp    $0x64,%edx
 519:	0f 84 31 01 00 00    	je     650 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 51f:	25 f7 00 00 00       	and    $0xf7,%eax
 524:	83 f8 70             	cmp    $0x70,%eax
 527:	0f 84 83 00 00 00    	je     5b0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 52d:	83 fa 73             	cmp    $0x73,%edx
 530:	0f 84 a2 00 00 00    	je     5d8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 536:	83 fa 63             	cmp    $0x63,%edx
 539:	0f 84 35 01 00 00    	je     674 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 53f:	83 fa 25             	cmp    $0x25,%edx
 542:	0f 84 e0 00 00 00    	je     628 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 548:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 54b:	83 c3 01             	add    $0x1,%ebx
 54e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 555:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 556:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 558:	89 44 24 04          	mov    %eax,0x4(%esp)
 55c:	89 34 24             	mov    %esi,(%esp)
 55f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 562:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 566:	e8 d7 fd ff ff       	call   342 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 56b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 56e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 571:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 578:	00 
 579:	89 44 24 04          	mov    %eax,0x4(%esp)
 57d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 580:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 583:	e8 ba fd ff ff       	call   342 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 588:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 58c:	84 d2                	test   %dl,%dl
 58e:	0f 85 76 ff ff ff    	jne    50a <printf+0x5a>
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 598:	83 c4 3c             	add    $0x3c,%esp
 59b:	5b                   	pop    %ebx
 59c:	5e                   	pop    %esi
 59d:	5f                   	pop    %edi
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5a0:	bf 25 00 00 00       	mov    $0x25,%edi
 5a5:	e9 51 ff ff ff       	jmp    4fb <printf+0x4b>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5b3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5b8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5c1:	8b 10                	mov    (%eax),%edx
 5c3:	89 f0                	mov    %esi,%eax
 5c5:	e8 46 fe ff ff       	call   410 <printint>
        ap++;
 5ca:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5ce:	e9 28 ff ff ff       	jmp    4fb <printf+0x4b>
 5d3:	90                   	nop
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 5df:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 5e1:	b8 3c 08 00 00       	mov    $0x83c,%eax
 5e6:	85 ff                	test   %edi,%edi
 5e8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 5eb:	0f b6 07             	movzbl (%edi),%eax
 5ee:	84 c0                	test   %al,%al
 5f0:	74 2a                	je     61c <printf+0x16c>
 5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5f8:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5fe:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 601:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 608:	00 
 609:	89 44 24 04          	mov    %eax,0x4(%esp)
 60d:	89 34 24             	mov    %esi,(%esp)
 610:	e8 2d fd ff ff       	call   342 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 615:	0f b6 07             	movzbl (%edi),%eax
 618:	84 c0                	test   %al,%al
 61a:	75 dc                	jne    5f8 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 61c:	31 ff                	xor    %edi,%edi
 61e:	e9 d8 fe ff ff       	jmp    4fb <printf+0x4b>
 623:	90                   	nop
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 628:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 62b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 62d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 634:	00 
 635:	89 44 24 04          	mov    %eax,0x4(%esp)
 639:	89 34 24             	mov    %esi,(%esp)
 63c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 640:	e8 fd fc ff ff       	call   342 <write>
 645:	e9 b1 fe ff ff       	jmp    4fb <printf+0x4b>
 64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 650:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 658:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 65b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 662:	8b 10                	mov    (%eax),%edx
 664:	89 f0                	mov    %esi,%eax
 666:	e8 a5 fd ff ff       	call   410 <printint>
        ap++;
 66b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 66f:	e9 87 fe ff ff       	jmp    4fb <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 674:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 677:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 679:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 682:	00 
 683:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 686:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 689:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 68c:	89 44 24 04          	mov    %eax,0x4(%esp)
 690:	e8 ad fc ff ff       	call   342 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 695:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 699:	e9 5d fe ff ff       	jmp    4fb <printf+0x4b>
 69e:	66 90                	xchg   %ax,%ax

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 00 0b 00 00       	mov    0xb00,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ae:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6b0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b3:	39 d0                	cmp    %edx,%eax
 6b5:	72 11                	jb     6c8 <free+0x28>
 6b7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b8:	39 c8                	cmp    %ecx,%eax
 6ba:	72 04                	jb     6c0 <free+0x20>
 6bc:	39 ca                	cmp    %ecx,%edx
 6be:	72 10                	jb     6d0 <free+0x30>
 6c0:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c4:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c6:	73 f0                	jae    6b8 <free+0x18>
 6c8:	39 ca                	cmp    %ecx,%edx
 6ca:	72 04                	jb     6d0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6cc:	39 c8                	cmp    %ecx,%eax
 6ce:	72 f0                	jb     6c0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6d3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 6d6:	39 cf                	cmp    %ecx,%edi
 6d8:	74 1e                	je     6f8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6da:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 48 04             	mov    0x4(%eax),%ecx
 6e0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6e3:	39 f2                	cmp    %esi,%edx
 6e5:	74 28                	je     70f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6e7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6e9:	a3 00 0b 00 00       	mov    %eax,0xb00
}
 6ee:	5b                   	pop    %ebx
 6ef:	5e                   	pop    %esi
 6f0:	5f                   	pop    %edi
 6f1:	5d                   	pop    %ebp
 6f2:	c3                   	ret    
 6f3:	90                   	nop
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6f8:	03 71 04             	add    0x4(%ecx),%esi
 6fb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6fe:	8b 08                	mov    (%eax),%ecx
 700:	8b 09                	mov    (%ecx),%ecx
 702:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 705:	8b 48 04             	mov    0x4(%eax),%ecx
 708:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 70b:	39 f2                	cmp    %esi,%edx
 70d:	75 d8                	jne    6e7 <free+0x47>
    p->s.size += bp->s.size;
 70f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 712:	a3 00 0b 00 00       	mov    %eax,0xb00
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 717:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 71a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 71d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5f                   	pop    %edi
 722:	5d                   	pop    %ebp
 723:	c3                   	ret    
 724:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 72a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 73c:	8b 1d 00 0b 00 00    	mov    0xb00,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	8d 48 07             	lea    0x7(%eax),%ecx
 745:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 748:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 74a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 74d:	0f 84 9b 00 00 00    	je     7ee <malloc+0xbe>
 753:	8b 13                	mov    (%ebx),%edx
 755:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 758:	39 fe                	cmp    %edi,%esi
 75a:	76 64                	jbe    7c0 <malloc+0x90>
 75c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 763:	bb 00 80 00 00       	mov    $0x8000,%ebx
 768:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 76b:	eb 0e                	jmp    77b <malloc+0x4b>
 76d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 770:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 772:	8b 78 04             	mov    0x4(%eax),%edi
 775:	39 fe                	cmp    %edi,%esi
 777:	76 4f                	jbe    7c8 <malloc+0x98>
 779:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 77b:	3b 15 00 0b 00 00    	cmp    0xb00,%edx
 781:	75 ed                	jne    770 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 783:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 786:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 78c:	bf 00 10 00 00       	mov    $0x1000,%edi
 791:	0f 43 fe             	cmovae %esi,%edi
 794:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 797:	89 04 24             	mov    %eax,(%esp)
 79a:	e8 0b fc ff ff       	call   3aa <sbrk>
  if(p == (char*)-1)
 79f:	83 f8 ff             	cmp    $0xffffffff,%eax
 7a2:	74 18                	je     7bc <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7a4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7a7:	83 c0 08             	add    $0x8,%eax
 7aa:	89 04 24             	mov    %eax,(%esp)
 7ad:	e8 ee fe ff ff       	call   6a0 <free>
  return freep;
 7b2:	8b 15 00 0b 00 00    	mov    0xb00,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7b8:	85 d2                	test   %edx,%edx
 7ba:	75 b4                	jne    770 <malloc+0x40>
        return 0;
 7bc:	31 c0                	xor    %eax,%eax
 7be:	eb 20                	jmp    7e0 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7c0:	89 d0                	mov    %edx,%eax
 7c2:	89 da                	mov    %ebx,%edx
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7c8:	39 fe                	cmp    %edi,%esi
 7ca:	74 1c                	je     7e8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7cc:	29 f7                	sub    %esi,%edi
 7ce:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 7d1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 7d4:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 7d7:	89 15 00 0b 00 00    	mov    %edx,0xb00
      return (void*)(p + 1);
 7dd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7e0:	83 c4 1c             	add    $0x1c,%esp
 7e3:	5b                   	pop    %ebx
 7e4:	5e                   	pop    %esi
 7e5:	5f                   	pop    %edi
 7e6:	5d                   	pop    %ebp
 7e7:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7e8:	8b 08                	mov    (%eax),%ecx
 7ea:	89 0a                	mov    %ecx,(%edx)
 7ec:	eb e9                	jmp    7d7 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7ee:	c7 05 00 0b 00 00 04 	movl   $0xb04,0xb00
 7f5:	0b 00 00 
    base.s.size = 0;
 7f8:	ba 04 0b 00 00       	mov    $0xb04,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7fd:	c7 05 04 0b 00 00 04 	movl   $0xb04,0xb04
 804:	0b 00 00 
    base.s.size = 0;
 807:	c7 05 08 0b 00 00 00 	movl   $0x0,0xb08
 80e:	00 00 00 
 811:	e9 46 ff ff ff       	jmp    75c <malloc+0x2c>
