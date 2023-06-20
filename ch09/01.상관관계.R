##################### 상관관계 ######################

## 1) 아버지 - 아들의 키 상관관계 ##########
hf = read.table('data/Galton.txt', header=T, stringsAsFactors = F)
tail(hf)
hf$Gender = factor(hf$Gender, levels=c('M','F'))
# filtering
hf.son = hf[hf$Gender =='M',]   # hf.son = subset(hf, Gender=='M')
# selection
hf.son = hf.son[c('Father', 'Height')]
#inch --> cm으로 변환
hf.son = hf.son *2.54

### 공분산(Covariance)
f.mean = mean(hf.son$Father)
s.mean = mean(hf.son$Height)
cov.num = sum((hf.son$Father - f.mean) * (hf.son$Height - s.mean))
cov.fs = cov.num / (length(hf.son$Father) -1)
cov.fs                              # 15.28023
# R의 cov() 함수 이용
cov(hf.son$Father, hf.son$Height)   # 15.28023

### 상관계수
f.sd = sd(hf.son$Father)
s.sd = sd(hf.son$Height)
c(f.sd, s.sd)
cor.fs = cov.fs / (f.sd * s.sd) 
cor.fs              # 0.3913174
# R의 cor() 함수 이용
cor(hf.son$Father, hf.son$Height)

## 2) 엄마 -딸 키의 상관관계 ##########
# hf.dter = read.table('data/Galton.txt', header=T, stringsAsFactors = F)
hf.dter = subset(hf, Gender=='F')
hf.dter = hf.dter[c('Mother', 'Height')] * 2.54 
cov(hf.dter$Mother, hf.dter$Height)                 # 10.92328
cor(hf.dter$Mother, hf.dter$Height)                 # 0.3136984

########### 그림으로 비교 ########
# 독립변수 x:부모의 키, 종속변수 y: 아들의 키 
par(mfrow=c(1,2))
plot(hf.son$Father, hf.son$Height, main='Father vs Son')
plot(hf.dter$Mother, hf.dter$Height, main='Mother vs Daughter')
par(mfow=c(1,1))










