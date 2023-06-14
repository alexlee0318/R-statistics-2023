## 주사위 2회 던졌을 때 3의 배수 개수
x = c(0,1,2)
px = c(4/9, 4/9, 1/9)
ex = sum(x* px)
ex

0*(4/9) + 1*(4/9) + 2*(1/9)

x2 = x^2
x2
ex2 = sum(x2 *px)
ex2
varx = ex2 - ex^2       # 분산, 4/9
varx
