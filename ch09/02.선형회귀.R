########### 단순 선형 회귀 #####################
#### 1) 아버지-아들의 키
hf = read.table('data/Galton.txt', header=T, stringsAsFactors=F)
tail(hf)
hf$Gender = factor(hf$Gender, levels=c('M','F'))
# filtering
hf.son = hf[hf$Gender =='M',]
#selection
hf.son = hf.son[c('Father', 'Height')] * 2.54   # inch -> cm 변환

### R에서 선형회귀 구하는 방법
# lm(): linear model
out = lm(Height ~ Father, data=hf.son)  # 종속(y)~ 독립(x) 순서로
summary(out)
# out값 출력결과: 'Signif. codes'에서 '*'의 개수에 따라 중요도를 알 수 있음

# <좋은 선형 모델의 조건> #
# 선형성: 첫번째 그림_랜덤하게 퍼져있음
# 정규성: 두번째 그림_대각선상에 점이 몰려있을 것.
# 등분산성: 셋째 그림_랜덤하게 퍼져있을 것
# 독립성: (내용무)
par(mfrow=c(2,2))
plot(out)               # 위 조건을 충족하는 그래프
par(mfrow=c(1,1))   

#### 비교
women
plot(weight~height, data=women)     # 종속(y)~ 독립(x) 순서
out2 = lm(weight~height, data=women)
summary(out2)
par(mfrow=c(2,2))
plot(out2)
par(mfrow=c(1,1))

### 다항식
poly = lm(weight~height + I(height^2), data=women)
summary(poly)       # R-squared: 0.9995
par(mfrow=c(2,2))
plot(poly)
par(mfrow=c(1,1))









