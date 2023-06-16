##### 단일 모집단의 가설 검정 ########

## 단일 모집단의 평균 검정(1-sample T test)
df = read.table('data/babyboom.dat.txt', header=F) # data에 헤더가 없으므로
names(df) = c('time', 'gender', 'weight', 'minutes')
head(df)
girl_baby = subset(df, gender==1)
weight = girl_baby[[3]]
weight
# 검정 통계량(t) 계산
barx = mean(weight)
s = sd(weight)
n = length(weight)
mu0 = 2800
t = (barx - mu0) / (s / sqrt(n))
t
# 임계값과 유의확률
alpha = 0.05
upper.limit = qt(1 - alpha, df=n-1)
upper.limit
if (t > upper.limit) {
    print('귀무가설 기각')
    print('여 신생아 체중이 2800보다 크다')
} else {
    print('귀무가설 채택')
    print('여 신생아 체중이 2800보다 크지 않다')
}

p.value = 1-pt(t, df=n-1)
p.value
# 판정
if (p.value < alpha) {
    print('귀무가설 기각')
    print('여 신생아 체중이 2800보다 크다')
} else {
    print('귀무가설 채택')
    print('여 신생아 체중이 2800보다 크지 않다')
}

######### R로 풀기 ############
t.test(weight, mu=2800, alternative='greater')
# p-value가 0.02가 나왔으므로 귀무가설 기각

###################################################
# 정규성 검정 -> 표본이 정규성을 가져야 1-sample T test를 할 수 있음
# : 표본이 30 이상인 경우 정규성을 가진다고 봄(검정 필요없음)
# : 표본 30 이하인 경우, p-value가 0.05 이상이면 정규성을 가진다고 봄
#####################################################

# weight 데이터의 경우 정규성을 가진다고 볼 수 없음(아래 샤피로 검정)
shapiro.test(weight)   # p-value = 0.02
# 이 경우 비모수 검정 등 고급 통계에서 다루는 방법을 사용해야 함.
# 출력되는 표에서 데이터가 직선 근처에 있으면 정규성을 가진다고 봄.
qqnorm(weight)
qqline(weight)

# 정규성을 갖는 데이터 x의 예(p-value: 0.6)
x <- c(25,16,44,82,36,58,63,18)
shapiro.test(x)     # p-value: 0.6
qqnorm(x)
qqline(x, col='red')

### 단일 모비율의 검정
bb = read.table('data/restitution.txt', header=T)
head(bb)
rel = ifelse(bb$rst < 0.4134 | bb$rst > 0.4374, 1, 0)

# 검정 통계량 계산
n = length(rel)
nos = sum(rel)
nos
phat = nos / n
p0 = 0.1
z = (phat - p0) / sqrt(p0 * (1-p0) / n)     # 0.333

# 임계값과 유의확률
alpha = 0.05
upper.limit = qnorm(1 - alpha)  # 1.645
p.value= 1 - pnorm(z)           # 0.3694
c(upper.limit, p.value)

# 검정통계량 z가 upper limit보다 작으므로 귀무가설 채택
# 유의확률 p-value가 0.05보다 큼 -> 귀무가설 채택

# R: prop.test
prop.test(nos, n, p=0.1, alternative='greater', correct=F)











