# dataframe(데이터프레임)
No <- c(1,2,3,4)
Name <- c("Appel", "Peach","Banana","Grape")
Price <-c(500,200,100,50)
Qty <- c(5,2,4,7)

sales <- data.frame(No, Name, Price, Qty)
sales   # dataframe -> 번호에 대괄호[] 없음
View(sales)

sales[ , 2]     # 2col의 모든 행
sales[ ,3]
sales[ ,4]

sales[1, ]
sales[2, ]
sales[3, ]

sales$Price
sales$Name

sales[1, ]         # 1행의 값, 모든 열
sales[c(1,2), ]

### 특정 조건에 맞는 행 추출: subset함수사용
subset(sales, Qty >3)   # Qty가 3이상인 행만 출력
subset(sales, Name =="Apple")
subset(sales, Price >= 300)

# 특정 컬럼만 조회하고 싶을 때

subset(sales, Price >= 100, select= Name)
subset(sales, Qty >=2, select= -Price)

# 문제
# Qty개수가 3개 이상인 행에서 Name, Price만 추출하기
subset(sales, Qty>=3, select=c(Name, Price))
######################################################
Sys.Date()
Sys.time()
date()