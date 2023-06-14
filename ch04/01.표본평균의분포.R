################## 표본'평균' ####################
# 모집단에서 추출한 표본들의 '평균'
# 표본오차를 줄이고 싶으면 n을 4배 키워야 함(통계표본 증가시키기)

#### 표본'평균' Xbar의 분포 ######
m10 = rep(NA, 1000)         # m10: 표본의 크기가 10인 것의 평균
m40 = rep(NA, 1000)         # m40: 표본의 크기가 40인 것의 평균
# -> 이제 위 변수들에 값 넣기
set.seed(9)
for (i in 1:1000) {
    m10[i] = mean(rnorm(10))
    m40[i] = mean(rnorm(40))
}

# 표본 평균의 평균과 표준편차
option(digits=4)
c(mean(m10), sd(m10))
c(mean(m40), sd(m40))

par(mfrow=c(1,2))
hist(m10, xlim=c(-1.5, 1.5), main='표본의 크기:10', xlab='x',
     ylab='', col = 'cyan', border = 'blue')
hist(m40, xlim=c(-1.5, 1.5), main='표본의 크기:40', xlab='x',
     ylab='', col = 'cyan', border = 'blue')

par(mfrow=c(1,1))   # 그래프 세팅값 리셋

