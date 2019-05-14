####################
# Base R -augment
# Dookyung Kim
# 2019-04-24
####################


#### I. R 기본 ---------------------------------------------

### 인터랙티브 vs 스크립트 모드

### 사칙연산

3 + 5
3 - 5
-2
3 * 5
3 / 5
3 ^ 5
5 / 3
5 %/% 3   # 몫
5 %% 3    # 나머지


### 할당
x <- 5
my_name <- "sbko"


### (중요) R에서 데이터의 기본타입은 벡터 !!!

x <-  c(1,2,3)
y <-  c(4,5,6)

x - y
x * y
x / y
x %/% y

x %% y

x ^ y

# c()
height <- c(175,167,157)
height

weight <- c(80,73,56)
weight

# 백터연산(vectorized operation)
j <- 2
k <- "biology"


bmi <- weight / (height/100) ^ j    # iteration
bmi

nick_name <- c("A", "B", "C")
nick_name

trial <- c(1, "A", "B")  # 형태변환
trial 

trial_aug <- c(trial, c(2))

length(x)
length(y)

x <- c(x, 7)
length(x)
x
y

x + y   # vector recycling


x + 1
y * 3
2 ^ y


### 벡터의 종류 
# 1. atomic vector : 한가지 타입만 포함 가능
# 2. list : 가장 유연
# 행렬, 데이터프레임, 팩터 등도 벡터를 기본으로 생성됨



### 아토믹(베이직) 백터의 타입

# 1. 논리값(logical)

TRUE
FALSE

c(TRUE, FALSE, TRUE)

# 2. 문자열(character)

a <-  "안녕하세요"

# 3. 수치값(numeric) 
a <- 5
b <- 3L

3+2i

### vectordml 타입 확인
typeof(b)
typeof(c(3,4,5))
typeof(3L)
typeof(3+2i)
typeof("r")
typeof(c("C", "python"))
typeof(TRUE)
typeof(c(TRUE, FALSE, TRUE))

### 백터 생성

c(2, 4, 6)
2:6

seq(1,10)
seq(2,4, by = 0.5)
seq(10,1, by=-2)  #증감
seq(1,10, length.out=7)  #개수

rep(1:3, times=3)
rep(1:3, each=3)
rep(c(3,5,1), 3)


### 벡터함수

x <- c(1,5,2,8,2,1,5,9)

sort(x) 
rev(x)
table(x)
sort(unique(x))


### 주요 수학함수

x <- 1:100
x

sum(x)
mean(x)
var(x)
sd(x)


mean(x)

### 통계확률

set.seed(1)
x <- sample(1:100, 50, replace=TRUE)
x

### 이름/속성을 가진 벡터

x <- c(34,25,19,25)
x 

x[2]
names(x)

names(x) <- c("a", "b", "c", "d")
x
names(x)
x[1]

x['c']
names(x)[3] <- "cc" 

attributes(x)

attr(x, "my") <- "example"

attributes(x)



### 벡터 서브세팅(subsetting)
x <- 11:20
typeof(x)

# 1. 자연수로 구성된 숫자형 벡터
x[3]
x[c(1,3,5)]

x[c(1,3,3,5)]
x[c(5,3,1)]

# 2. 음의 정수  : 제외
x[-3]
x[c(-1,-2,-3)]
x[-(1:3)]

# 3. 논리형 벡터 : TRUE값

x[c(TRUE, FALSE)]

x>14

x[x>14]

x>14

# 4. 이름으로 접근
letters
LETTERS

names(x) <- letters[1:length(x)]
x

x[c("a", "d", "f")]


### 벡터 교체(replacement)
x <- 11:20
x
x[3] <- 33
x

x[c(1,3,5)] <- c(111,333,555)

x
x[x>100] <- NA
x

### 누락치 처리

a <- c(12,51,36,999,34,999,45)
a == 999
a[a==999]

a[a==999] <- NA

a

a <- c(12,51,36,999,34,999,45)
which(a==999)

a[which(a==999)] <- NA
a


###  비교와 논리 연산

3 > 5
3 >= 5
3 < 5
3 == 5
3 != 5

x <- c(1,2,3)
y <- c(4,5,6)
x > y
x < y
x == y
x != y
x
x > 1
x[3]
a <- x > 1
a
x[a]      # 논리형 벡터를 이용한 subsetting

a <- (x > 1)
x[x > 1]


set.seed(1)  # 난수 시드 설정
xx <- sample(1:100, 50, replace=TRUE)
xx


xx[xx > 30]

a <- c(TRUE, TRUE, FALSE, FALSE)
b <- c(FALSE, TRUE, TRUE, FALSE)

a & b
a | b
!a
!b

xx[xx > 30 & xx < 50]


### R은 '느슨한 타입을 가진 언어(losely-typed language)'

l <- c(1,0,1)

as.logical(l)

as.character(l)
as.numeric(l)
as.factor(l)


m <- c("Kim", "Lee", "Park")

data.frame(l, m)
data.frame(attendence=l, name=m)


#### II. Environment 이해 ---------------------------------------------

### Working Diriectory

getwd()
setwd('D:/')
getwd()

# (중요) 항상 Project 생성 !!!!  



### 도움말 
help(mean)
?mean

mean(x, na.rm=TRUE)


### R에 존재하는 모든 것은 객체이다.

# clear버튼

# 워크스페이스
x <- c(1,2,3)
y <- c("a", "b", "c")


# Global Environment 
ls()  
rm("y")    # 객체 삭제
ls()


# restart session

rm(list=ls(all=TRUE))
gc() 

.rs.restartR()


### R 데이터 파일로 저장하고, 로딩하기

x <- c(1, 2, 3)
y <- c("a", "b", "c")

save(x, y, file="myData.Rdata")
getwd()
ls()

# x, y 지우기
rm(x, y)
ls()
load("./myData.Rdata")



#### III. Package 이해 ---------------------------------------------

### R의 대부분의 기능은 패키지(package)로 모듈화되어 있다. (애드온)

search()
sessionInfo()
R.home()   # R이 설치된 위치
.libPaths()   # library 위치

### 패키지 종류

# 1. 내장 패키지
#base::
#mean(), getwd(), ls(), rm()

# 2. CRAN 패키지 (https://cran.r-project.org/)
# 3. Bioconductor 사이트 (www.bioconductor.org)


### 패키지 설치(install)

install.packages("dplyr")
install.packages(c("ggplot2", "shiny"))

### 패키지 로딩
library(dplyr)

#dplyr::

search()
# 화면정리 : Ctrl + L 



#### IV. 자주쓰는 데이터 타입 ---------------------------------------------

### 리스트 생성


x <- 1:10
y <- LETTERS[1:10]

z <- list(x, y)
z

is.atomic(z)
is.vector(z)

names(z) <- c("x", "y")
z

z <- list(xx=x, yy=y)
z

# 리스트는 R에서 가장 유연한 타입
l <- list(x = 1:5, y = c("a", "b"))


### 리스트 추출(subsetting) 방법
# 1. $
z$xx
z$yy

# 2. []

z[[1]]
z[["xx"]]
z[1]


# $ : 뒤의 이름을 프로그래밍 방법으로 줄 수 없다.
# [] 또는 [[]] : 이름을 프로그래밍 방법으로 줄 수 있다. 

a <- "xx"

z$a

z[a]
z[[a]]


# 주의 : 접근시 


z$yy
z[["yy"]]

z$yy[3]
z[["yy"]][3]


z["yy"][3]



### 데이터프레임

id <- 1:10
pt_name <- letters[1:10]

category <- rep(c("Treat", "Control"), 5)

scores <- c(35, 45, 56, 25, 45, 12, 14, 15, 14, 95)
length(scores)


df <- data.frame(id, pt_name, category, scores)
df
df$id
df$pt_name
df["pt_name"]
df["category"]
df[["id"]]

df[["scores"]]

mean(df$scores)

mean(df[["scores"]])

str(df)
attributes(df)

dim(df)
names(df)
colnames(df)
row.names(df)
summary(df)

df$id <- as.character(df$id)
str(df)
summary(df)

ncol(df)
nrow(df)

head(df)
tail(df)


### R 객체의 메타데이터 :  속성

attributes(df)

attr_list <- attributes(df)
attr_list$names

attr_list$row.names
attr_list$class


attr(df, "names")
attr(df, "row.names")

attr(df, "example") <- "my Data set"

attributes(df)
attr(df, "example")

df
str(df)
class(df)




## 엑셀 등 외부 데이터 파일 읽기 기능

- Environment 창 -> Import datasets 

- library(readxl) : excel 파일 읽을 때

- library(openxlsx) : excel 파일 기록시





















# create test.R file
fileConn<-file("test.R")
writeLines(c("set.seed(1)", "r <- sample(1:100, 30, replace=TRUE)", "summary(r)", "hist(r)"), fileConn)
close(fileConn)

source("test.R", echo=TRUE)





