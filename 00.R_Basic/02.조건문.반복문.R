##### 조건문 #####
#### indentation이 아닌 {} brace로 syntax 식별 ###
### single state일 경우 {} 생략 가능하나 그냥 쓰기 ###
### 그래도 줄 잘 맞추기 ###
a =33
b = 200
if (a < b) {
    print('a가 b보다 작다.')
}

if (a < b) {
    print('a가 b보다 작다.')
} else if (a==b) {
    print('a가 b와 같다.')
} else {
    print('a가 b보다 크다.')
}

##### While 반복문 #####
# 1에서 몇까지 더하면 1000을 넘길까?
cum.sum = 0
i = 0
while (cum.sum <= 1000) {
    cum.sum = cum.sum + i
    i = i + 1
}
print(paste(i, cum.sum))

cum.sum = 0
i = 1
while (TRUE) {
    if (cum.sum > 1000)
        break
    cum.sum = cum.sum + i
    i = i + 1
}
print(paste(i, cum.sum))

#### For 반복문
for (x in 1:10) {       # 1~10까지의 sequence
    print(x)
}

# vector
dice = c(1,2,3,4,5,6)
for (x in dice) {
    print(x)
}

# List
fruits = list('apple', 'banana', 'cherry')
for (fruit in fruits) {
    print(fruit)
}

# sequence가 2씩 증가-> sqe()써야함. 콤마로 구분
for (i in seq(1, 10, 2)) {
    print(i)    
}
# 위와 같은식 다른 버전
for (i in 1:10) {
    if (i %% 2 == 0)
        next
    print(i)
}






