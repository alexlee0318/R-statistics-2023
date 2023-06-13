# stringsAsFactors=F로 놓기->숫자데이터를 범주형으로 읽지 않도록 
cafe = read.csv('data/cafedata.csv', stringsAsFactors=F)
str(cafe)
head(cafe)
dim(cafe)       # 48 22
summary(cafe)   # pandas describe()와 유사

sum(is.na(cafe$Coffees))    # 결측치 1개 있음

# 커피 판매량의 최대값과 최소값
cafe$Coffees = as.numeric(cafe$Coffees)  # 먼저 캐릭터 바꿔줌
sort(cafe$Coffees)
sort(cafe$Coffees)[1]   # 3

# 최대값 방법1
sort(cafe$Coffees, decreasing=T)[1]  # 48
# 최대값 방법2_ 결측치를 빼주기
sort(cafe$Coffees)[length(cafe$Coffees)
                   -sum(is.na(cafe$Coffees))]  # 48
min(cafe$Coffees, na.rm=T)  # 3
max(cafe$Coffees, na.rm=T)  # 48

# 최빈값을 알기위한 방법
stem(cafe$coffees)  # 줄기-잎 그림
table(cafe$Coffees)

# 평균과 중앙값(1~5의 중앙값은 3, 1~6의 중앙값은 3.5)
 num.na = sum(is.na(cafe$Coffees))      # NA 의 개수
 weight = 1 / (length(cafe$Coffees) - num.na)
sum(cafe$Coffees * weight, na.rm=T)     # 산술평균
mean(cafe$Coffees, na.rm=T)

# 양 끝 값의 변화에 따른 평균의 변화
rc = na.omit(cafe$Coffees)
length(rc)
rc[rc ==max(rc)] = 480
mean(rc)                # 21.5 --> 30.7로 바뀜

# 중앙값
median.idx = (1 + length(rc)) / 2
median.idx
sort(rc)[median.idx]  # 23
median(rc, na.rm=T)   # 23

# 양 끝 값의 변화에 따른 평균의 변화는 크고, 중앙값의 변화는 없다

###### 대표값이 지닌 약점- 각자료의 정보를 알 수 없음.
##### 자료의 퍼진 정도 - 표준편차와 사분위수

#### 표준 편차
# 아래와같이 계산하면 퍼진 정도를 알 수 없다.
height = seq(164, 176, 2)
height.m = mean(height)
h.dev = height - height.m
sum(h.dev)

sum(h.dev ^ 2) / 7
mean(h.dev ^ 2)         # 분산_ 16
sqrt(mean(h.dev ^ 2))   # 표준편차_ 4

# R에서 제공하는 함수
var(height)             # 표본분산_ 18.67
sd(height)              # 표본 표준편차_ 4.32
# 왜 n-1로 나누는가?.......

### 사분위수
quantile(rc, na.rm=T)
qs = quantile(rc, na.rm=T)
bp = boxplot(rc, main='커피 판매량의 Box Plot')

IQR(rc, na.rm=T)
qs[4] = qs[2]           # 3분위수 - 1분위수 --> IQR(Inter Quantile Range)

### 이상치(Outlier):  iqr과 iqr의 1.5배 구간을 벗어난 값
boxplot(cars$dist)  # iqr=네모박스  
hist(cars$dist, breaks=seq(0,120,10))

qs=quantile(cars$dist)
qs
iqr = qs[4] - qs[2]
upperlimit = qs[4] + 1.5 * iqr
lowerlimit = qs[2] - 1.5 * iqr
upperlimit; lowerlimit
cars$dist[cars$dist > upperlimit | cars$dist < lowerlimit]




