# 산점도
head(cars)
# jitter: 노이즈 추가옵션 함수-겹치는 값끼리는 위치 조정하여 보여줌
plot(cars$speed, jitter(cars$dist),
     main = '속도와 제동거리',
     xlab = '속도(mph)', ylab='제동거리(ft)',
     pch=1, col='pink')

# 선그래프
tail(Nile)
plot(Nile, main='나일강의 연도별 유량 변화',
     xlab='연도', ylab='유량')


######## ggplot으로 그리기 ####### 
######## ggplot 설치, 불러오기####### 
install.packages('ggplot2')
library('ggplot2')

# ggplot: 파이썬의 matplotlib와 비슷, layer로 쌓는방식
df = as.data.frame(Nile)
head(df)
df$year= 1871:1970
ggplot(df, aes(x=year, y=x))+ 
    geom_line() +
    ggtitle('나일강의 연도별 유량 변화') + 
    xlab('연도') + ylab('유량')
