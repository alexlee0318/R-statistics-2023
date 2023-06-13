###### R 변수 #######
name <- 'Alex'
name = 'Alex'
age <- 25
age = 25

# 출력하기
name
print(name)
#print() 에서는 하나의 인자만 사용 가능

# 두 개 이상의 인자 print하기 
print(paste(name, age))  # "Alex 25"
print(paste0(name, age)) # "Alex25"  --> 띄어쓰기 없음

# 변수명 사용: 단어 사이는 . 으로 구분
person.name <- 'Maria'
person.gender <- 'Female'
person.age <- 23

########## R 데이터 타입 ############
# 1. numeric
x = 10.5
class(x)

# 2. integer : 변수값 끝에 L을 붙임(반드시 정수여야 할 경우만)
y = 10L
class(y)

# 3. complex(복소수)
# 복소수 = 실수 + 허수
# cn = x + yi (i = 제곱했을 때-1 인 수, 즉 허수)
z = 9 + 3i
class(z)
print(z*z)

# 4. character(a.k.a. string)
s = 'R is exciting'
class(s)

# 5. logical(a.k.a. boolean: TRUE, FALSE 또는 T, F)
class(T)   # logical

## 보통 정수는 32bit로 표현, 64비트는 Long이라고 함.

####### Type conversion ##########
as.numeric(y)    # 10
as.numeric(TRUE)  # 1
as.character(F)   # "FALSE"

############## Math ################
10+5            # 15
'10' + '5'      # Error -> str의 concat은 paste() 함수 사용할 것
max(5, 10, 15)  # 가장 큰 값 뽑아줌
sqrt(16)        # 4
ceiling(1.3)    # 2
floor(2.3)      # 2

########### String #############
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit"        # multi-Line string
str # 줄바꿈 없이 \n로 표시되어 출력 
cat(str) # 줄바꿈 그대로 출력(\n없음)
length(str) # 1 (요소가 premitive 한 개)
nchar(str)  # 55 (문자개수)

########## Operator(연산자)############
#### 1. 산술연산자: +, -, *, /
2^5         # 32, exponent (2를 5번곱함)
5 %% 2      # 1, modulo
5 %/% 2     # 2, 몫

#### 2. 비교연산자: 파이썬과 동일

#### 3. 논리연산자: &, &&, |, ||, !
x > 10 && x < 20    # Logical AND, 10 < x < 20
person.age > 24 || age > 24   # Logical OR
!(nchar(s)>5)       # Logical NOT

c(F,F,T,T) & c(F,T,F,T)
c(F,F,T,T) | c(F,T,F,T)













