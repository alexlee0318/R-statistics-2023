##### 출처 및 해설:  https://math100.tistory.com/40

# 1. 어느 회사 종업원들의 근무기간은 평균 11년, 표준편차가 4년인 정규분포를 따른다.
#1) 이 회사에서 14년 이상 근무한 종업원의 비율을 구하시오.
par(mar=c(1,1,1,1))
options(digits=4)
mu=11
sigma=4
ll = mu - 3 * sigma         # lower limit
ul = mu + 3 * sigma         # upper limit
x = seq(ll, ul, by=0.01)

prob = round(pnorm(14,11,4), 4)
prob          # 0.7734
1-prob        # 0.2266
print(paste('14년 이상 근무한 종업원의 비율', 1-prob, '입니다.'))
# 검증
p0.2=qnorm(0.77)
p0.2        # 0.7388468
######수업 풀이 ######
# x = 14 ?
z = (14-11)/4       # 0.75  
# -> 표준정규분포 표에서 0.7734 확인
# 이 문제의 경우 표준정규분포 변환 필요없이 바로 계산 가능
1 - pnorm(14,11,4)  # 0.2266

# 2. 어느 전구회사에서 생산하는 전구의 수명은 평균이 800일이고 표준편차가 30일인
#정규분포를 따른다고 한다. 그럼 전구의 수명이 760일 이하일 확률을 구하시요.
mu = 800
sigma=30
ll = mu - 4 * sigma
ul = mu + 4 * sigma
x = seq(ll, ul, by=0.01)
px = dnorm(x, mean=mu, sd=sigma)
plot(x, px, type='l', xlab='전구수명', ylab='P[X=x]',
     lwd=2, col='red', main='N(800, 30^2)')
prob = round(pnorm(760, 800, 30), 4)
prob   # 0.0912

########## 수업 풀이 ############
z = (760 - 800)/30     # -1.33  
# 음수가 나왔으므로 표준정규분포의 대칭을 이용해서 풀어야 함
1 - 0.0918  # 0.9082
pnorm(760, 800, 300)



# 3. 학생들의 수학 성적은 평균이 70점이고 *분산이 64점인 정규분포를 따른다.
# 점수가 80점 이상이고 90점 이하일 확률을 구하시오.
# 표준편차 구하기 = 분산의 루트값-> 8

pnorm(90, 70, 8) - pnorm(80, 70, 8)     # 0.09944

#### 수업풀이 #####
(80-70)/8       # 1.25
(90-70)/8       # 2.5
0.9938-0.8944   # 0.0994
# R풀이와 결과 동일
