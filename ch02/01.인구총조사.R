load('data/pop.rda')
head(pop)

# 테이블 그림 보기
tableV1 = table(pop$V1)
barplot(tableV1, main='남녀 인구수', xlab='성별', ylab='인구')

tableV5 = table(pop$V5)
tableV5
barplot(tableV5, main='출생아별 빈도', xlab='출생아수', ylab='빈도')

# 히스토그램 - x축인 연령구간값을 알아서 계산해서 보여줌
hist(pop$V2, main='연령별 분포', xlab='연령', ylab='빈도')

# 히스토그램 - right
hist(pop$V2, breaks=seq(0,90,10), right=F, 
     main = '연령별 분포',xlab='연령',ylab='빈도')

# 히스토그램 - right, probability
hist(pop$V2, breaks=seq(0,90,10), right=F, probability = T,
     main = '연령별 분포',xlab='연령',ylab='빈도')

#
tableV4 = table(pop$V4)
tableV4
pie(tableV4, main='학력별 비중', cex=0.8) # cex: 라벨(글)크기
