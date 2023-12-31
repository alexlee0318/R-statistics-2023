######### 모집단이 2개인 경우의 평균 비교 검정

### 독립표본 : 2 sample T test
data = read.table('data/chapter7.txt', header=T)
head(data)

girl = subset(data, gender == 1)
boy = subset(data, gender == 2)
c(mean(girl$weight), mean(boy$weight))

# 등분산성 테스트 ( 등분이 같은지 )
var.test(data$weight ~ data$gender) # p-value의 값: 0.08 ==> 분산이 같아고 봄

# 2-sample T test
t.test(data$weight ~ data$gender, mu=0, alternative='less', var.equal=T)
# p-value: 0.07 ==> 고로, 귀무가설 채택. 차이가 없다.

### 대응 표본: paired T test ###
# 식욕부진 치료요법의 효과 검증
data = read.csv('data/anorexia.csv')
head(data)

t.test(data$Prior, data$Post, paired=T, alternative='less')
# p-value:  0.004
# 귀무가설 기각, 대립가설 채택
# 신경성 식욕부진증 치료요법은 효과가 있다.
# -> 귀무가설 채택은 사실 분석결과 별 소득(발견)이 없다는 뜻.