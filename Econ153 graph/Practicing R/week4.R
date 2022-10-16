#week4
#Reference:https://www.geo.fu-berlin.de/en/v/soga/Basics-of-statistics/Continous-Random-Variables/Continuous-Uniform-Distribution/Continuous-Uniform-Distribution-in-R/index.html

# set random seed
set.seed(123)
set.seed(111)
# randomly draw the 6 numbers from number 1 to 80 
sample(1:49, size = 6)

#uniform distribution
runif(10000, min = -1, max = 1)
x<-runif(10000, min = -1, max = 1)
hist(x, freq = FALSE, xlab = 'x', density = 2)

#
a <- -1
b <- 1
hist(x, 
     freq = FALSE, 
     xlab = 'x',  
     ylim = c(0, 0.4),
     xlim = c(-3,3),
     density = 2,
     main = "Uniform distribution for the interval [-1,1]")
curve(dunif(x, min = a, max = b), 
      from = -5, to = 5, 
      n = 100000, 
      col = "darkblue", 
      lwd = 2, 
      add = TRUE, 
      yaxt = "n",
      ylab = 'probability')

#mean for a given distribution
unif.mean <- (-2+7)/2
unif.mean

#What is value of x corresponding to the value that divides the given uniform distribution 
#into two equal parts, or written more formally
px.0.5  <- qunif(0.5, min = -2, max = 7)
px.0.5


# find x, such that Prob(x<0.8) for a uniform distribution (-1,1)
punif(0.8, min=-1 , max =1)

a <- -1
b <- 1
curve(dunif(x, min = a, max = b), 
      from = -1.5, to = 1.5, 
      n = 100000, 
      col = "darkblue", 
      lwd = 2, 
      add = TRUE, 
      yaxt = "n",
      ylab = 'probability')
abline(v=0.8, col="orange")

#################### End here
#Normal Distribution
# draw a plot of the N(0,1) PDF
curve(dnorm(x),
      xlim = c(-5, 5),
      ylab = "Density", 
      main = "Standard Normal Density Function") 

# draw a plot of the N(10,2) PDF
curve(dnorm(x,mean=10,sd=2),
      xlim = c(-5,5 ),
      ylab = "Density", 
      main = "Normal Density Function") 

# plot the standard normal CDF
curve(pnorm(x), 
      xlim = c(-3.5, 3.5), 
      ylab = "Probability", 
      main = "Standard Normal Cumulative Distribution Function")
#
pnorm(0,mean=0,sd=1)

#compute probability  x<=-1.96, x<=0 and x<=1.96
pnorm(-1.96,mean=0,sd=1)
pnorm(c(-1.96,0,1.96),mean=0,sd=1)

pnorm(0.8,mean=0,sd=2)

# compute density at x=-1.96, x=0 and x=1.96
dnorm(x = c(-1.96, 0, 1.96),mean=10,sd=8)


rnorm(10000,mean=10,sd=2 )
x<-rnorm(10000, mean=10, sd = 8)
hist(x, freq = FALSE, xlim=(c(-0,20)),breaks=150,)
abline(v=10, lwd=2,col="red")

abline(v=c(4,6,8,12,14,16), lwd=1,lty=3,col="darkblue")
curve(dnorm(x, mean=10, sd=8), xlim=(c(-0,20)),
      col="green", lwd=2, add=TRUE, yaxt="n")


#reference: https://www.statmethods.net/advgraphs/probability.html
# Children's math scores are normally distributed with a
# mean of 100 and a standard deviation of 15. What
# proportion of children are expected to have an IQ between
# 80 and 120?

mean=100; sd=15
lb=80; ub=120

x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)

plot(x, hx, type="n", xlab="Math Scores", ylab="",
     main="Normal Distribution", axes=FALSE)

i <- x >= lb & x <= ub
lines(x, hx)
polygon(c(lb,x[i],ub), c(0,hx[i],0), col="red")

area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(",lb,"< math <",ub,") =",
                signif(area, digits=3))
mtext(result,3)
axis(1, at=seq(40, 160, 20), pos=0)


###Correlation
# generate dataset
X <- runif(n = 100, 
           min = 18, 
           max = 70)


Y <- X + rnorm(n=100, 50, 15)

# compute sample covariance of X and Y
cov(X, Y)

# compute sample correlation between X and Y
cor(X, Y)

# an equivalent way to compute the sample correlation
cov(X, Y) / (sd(X) * sd(Y))


# plot observations
plot(X, 
     Y, 
     type = "p",
     main = "A Scatterplot of X and Y",
     xlab = "Age",
     ylab = "Earnings",
     col = "steelblue",
     pch = 19)


