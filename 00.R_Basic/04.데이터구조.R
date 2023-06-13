##### vectors @######
fruits = c('apple', 'banana', 'cherry')
numbers = c(1, 2, 3L)  # integer 3L이 numeric으로 자동 타입 변환됨
numbers

seqs = 1:10     # 시작:끝
seqs = 6:1
nums = 1.5:5.5
print(nums)

# sequence
seq(from=1, to=10, by=2)    # seq(1, 10, 2)로 사용할 수 있음
seq(0,1,0.1)
seq(0, 1, length.out=11)    # 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
                            # np.linspace(0,1,11)
rep(c(1:3), times=2)        # 1 2 3 1 2 3  결과 출력*2
rep(c(1:3), each=2)         # 1 1 2 2 3 3  각각 두번씩 반복

#### Sorting
fruits <- c("banana", "apple", "cherry", "mango", "lemon")
numbers <- c(13, 3, 5, 7, 20, 2)

sort(fruits)  # Sort a string
sort(numbers) # Sort numbers
numbers       # 비파괴적 함수 SORT()

##### Indexing: '-' 사용법 다름#####
fruits[1]       # 첫번째 요소, banana
fruits[-1]      # 첫번째(banana) 제외한 나머지 출력

###### Slicing ########
fruits[2:4] #2,3,4번 모두 출력

####### Selection(임의선택)######
fruits[c(1,4,5)]

####### 값 변경#######
fruits[1] = 'kiwi'  # banana -> kiwi 로

####### List ########
numbers = list(1, 2, 3L, 4+3i)  # 요소의 데이터 타입이 달라도 됨
numbers[4]                      # 4+3i

####### Element(요소) 개수#########
length(fruits)
length(numbers)

########## Matrices ########### two dimensional data set with columns and rows
m1= matrix(c(1:6), nrow=2, ncol = 3)    # 숫자채우는 순서:row길이만큼씩
m1
m2 = matrix(c(1:6), nrow = 3, ncol = 2)
m2
# Access Matrix Items 행/열 단위의 인덱싱
m1[1, 2]    # 3
m2[3, 1]    # 3

thismatrix <- matrix(c("apple", "banana", "cherry", "peach","grape","pineapple",
                       "pear", "melon", "fig"), nrow = 2, ncol = 3)
thismatrix
thismatrix[c(1, 2),]    # 첫번째, 두번째 행
thismatrix[, c(2,3)]    # 두번째, 세번째 열
thismatrix[c(1,2),c(1,2)]

# bind
m1
v1 = c(10,20,30)
m1 = rbind(m1, v1)  # 행단위 바인딩: v1값이 각각 m1의 행에 추가됨
m1
m1 = cbind(m1, c(100, 200, 300))
m1

# contains
'apple' %in% fruits

# 크기
dim(thismatrix)
length(thismatrix)

# matrix와 반복문
m3 = matrix(c(1:12), nrow = 3, ncol = 4)
for (row in 1:nrow(m3)) {
    for (col in 1:ncol(m3)){
        print(m3[row, col])
    }
}
m3

#### 행렬 곱 ####
m1 = matrix(c(1:6), nrow = 2, ncol=3)
m1
m1 = matrix(c(1:6), nrow = 3, ncol=3)
m2
m1 %*% m2

#### 전치 행렬(transpose)
t(m1)


##### Array
arr = array(1:24, dim=c(2,3,4))     # dim= 생략 가능
arr
dim(arr)
length(arr)

arr[1,1,4]      # 19





















