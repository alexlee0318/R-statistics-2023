######## 확률 분포
# 확률질량함수 (바그래프 수치) -> 값이 이산적일 때, 베르누이
# 확률밀도함수 ( 평균 선 그래프 )->이항분포, iid, 팩토리얼
##### 이항분포 binomial distribution #######
n = 6
p = 1/3
x = 0:n         # B(6, 1/3)

# 확률 질량함수 'd'
#   nCx p^x (1-p)^(n-x) == nCx p^x (1-p)^(6-x)
dbinom(2, n, p)   # 2=x 이항분포 함수
# 6C2 (1/3)^2 (1-1/3)^(6-2)

dbinom(x=4, size=n, prob=p) # 성공횟수, 시행횟수, 성공확률
px = dbinom(x, n, p)    # x,n,p를 주면 알아서 계산해줌
px
plot(x, px, type='s', xlab='성공 횟수', ylab='확률(P[X=x]', main='B(6, 1/3)')
plot(x, px, type='h', xlab='성공 횟수', ylab='확률(P[X=x]', main='B(6, 1/3)',
     lwd=20, col='hotpink')

# 누적 분포함수 'p'
pbinom(2, n, p)   # == dbinom(0,n,p) + dbinom(1,n,p) + dbinom(2,n,p)
# 성공횟수가 1~3인 확률
dbinom(1,n,p) + dbinom(2,n,p) + dbinom(3,n,p)   # 0.8120713
pbinom(3,n,p) - pbinom(0,n,p)                   # 0.8120713, 누적된 값을 빼주는 방식

# 누적확률 값이 p가 될 때의 x값을 찾아주는 함수 'q'
qbinom(0.1,n,p) # 1 : 그래프에서- 확률 0.1일 때 해당하는 x 값
qbinom(0.5,n,p) # 2

# 이항분포를 따르는 n개의 표본 랜덤 추출(난수) 'r'
set.seed(2023)
rbinom(10, n, p)

# 기대값과 분산
n = 6
p = 1/3
x = 0:n         # B(6, 1/3)
px = dbinom(x,n,p)

ex = sum(x * px)        # Expectation value
ex
ex2 = sum(x^2 * px)
varx = ex2 - ex^2       # Variation
varx                    # 1.33333 = 4/3

############### 정규분포 #######################
# 표준정규분포 식 z = (x-mu)/sigma

# 어느 대학교 남학생의 키의 평균은 170, 표준편차는 6인 정규분포를 따른다.
# 180cm보다 큰 학생의 확률은?
options(digits=4)
mu=170
sigma=6
ll = mu - 3 * sigma         # lower limit
ul = mu + 3 * sigma         # upper limit
x = seq(ll, ul, by=0.01)
px = dnorm(x, mean=mu, sd=sigma)     # mean, sd 선언 생략 가능
plot(x, px, type='l', xlab='남학생의 키(x)', ylab='P[X=x]',
     lwd=2, col='red', main='N(170, 6^2)')

prob = round(pnorm(180,170,6), 4)
print(paste('180보다 큰 남학생의 확률은', 1-prob, '입니다.'))

#### 상위 10%에 속하려면  키가 몇이어야 하는가?
# -> q 사용, 90% 즉 0.9
height = qnorm(0.9, 170, 6)                 # 177.7
height

# 키가 165cm ~ 175cm일 확률
pnorm(175, 170, 6) - pnorm(165, 170, 6)     # 0.5953

# 95%에 속하는 학생들의 키의 범위는? -> q
ll = round(qnorm(0.025, 170, 6))
ul = round(qnorm(0.975, 170, 6))
print(paste(ll, '~', ul, '(cm)'))       # 158~182(cm)
# 170에서 2시그마(6*2) 이동함 --> 182
# 시험에는 숫자 값이 딱 떨어지게 나옴. 정규분포 표를 볼 줄 알아야 함.
# d,q,r 잘 기억하기 (근데 노말에서는 d값은 쓸 일 이 없음_ 키가 180일 확률 묻지x)
# ~ 이상은 몇이냐, ~이하가 몇이냐 질문할 가능성이 더 높음

# 400개의 난수를 생성하여 모집단과 비교
set.seed(5)
smp = rnorm(400, 170, 6)
print(paste(mean(smp), sd(smp)))    # 평균, 표준편차
hist(smp, proba=T, main='N(170, 6^2)으로부터 추출한 표본의 분포(n=400',
     xlab='', ylab='', col = 'white', border='black')
# 위에서 그렸던 그림 가져옴-합치기
lines(x, px, lty=2, lwd=2, col='red')

#### 정규분포의 특징 ####
# 표준정규분포
mu = 0
sigma = 1
p0.05 = qnorm(0.95)         # qnorm(0.05)도 부호는 다르지만 같은 수치 나옴
p0.05                       # 90% 신뢰수준, 1.645
p0.025 = qnorm(0.975)
p0.025                      # 95% 신뢰수준, 1.96
qnorm(0.995)                # 99% 신뢰수준, 2.576
# pnorm으로 각 신뢰도 검증
pnorm(1.96) - pnorm(-1.96)      # 0.95
pnorm(2.576) - pnorm(-2.576)    # 0.99
pnorm(1.645) - pnorm(-1.645)    # 0.90

##############################################
# 95% 신뢰구간 그림
z <- seq(-3, 3, by=0.001)
z.p <- dnorm(z)
plot(z, z.p, axes=F, type="l", 
     main="표준정규분포 (95%)", ylab="", ylim=c(-0.04, 0.4))
axis(1)

lines(c(-3, 3), c(0, 0))
points(-1.96, -0.02, pch=17, col="red")
text(-1.96, -0.035, "-1.96", col="red")
points(1.96, -0.02, pch=17, col="red")
text(1.96, -0.035, "1.96", col="red")

s <- seq(-1.96, 1.96, by=0.001)
s.z <- dnorm(s, mean=0, sd=1)
s <- c(-1.96, s, 1.96)
s.z <- c(0, s.z, 0)
polygon(s, s.z, col="red", density=10, angle=305)



