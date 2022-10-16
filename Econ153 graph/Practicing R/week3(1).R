##week3
#Law of Large Number

#Example: roll a dice for N times
#population: N is infinity
#expected mean of the population : (1+2+3+4+5+6)/6=3.5
#sample mean? 
#LLN: as sample size going to infinity,the sample mean converge to the population mean.
# N=10 (10 observations)
sample(1:6,10,replace=TRUE)
mean(sample(1:6,10,replace=TRUE))

#x<-(sample(1:6,10,replace=TRUE))
#y<-mean(x)


# N=100 (100 observations)
mean(sample(1:6,100,replace=TRUE))


# N=1000 (1000 observations)
mean(sample(1:6,1000,replace=TRUE))

#simulation
avg=rep(0,1)
N=rep(0,1)

for(j in 10:100)
{ x<-mean(sample(1:6,j,replace=TRUE))
avg[j-9]=x
N[j-9]=j
}
plot(N,avg,xlab="Sample size", ylab="Sample mean")


for(j in 10:500)
{ x<-mean(sample(1:6,j,replace=TRUE))
avg[j-9]=x
N[j-9]=j
}
plot(N,avg,xlab="Sample size", ylab="Sample mean")

for(j in 10:1000)
{ x<-mean(sample(1:6,j,replace=TRUE))
avg[j-9]=x
N[j-9]=j
}
plot(N,avg,xlab="Sample size", ylab="Sample mean")

for(j in 10:10000)
{ x<-mean(sample(1:6,j,replace=TRUE))
avg[j-9]=x
N[j-9]=j
}
plot(N,avg,xlab="Sample size", ylab="Sample mean")

##Any Questions?
#### We stop here!

#Weak Law of Large Number and The Central Limit Theorem
#As sample size grows larger, the probabilty that sample mean converge to population mean 
#becomes larger.

#Example 2 : suppose the total population of country A is 10000. the mean wage is 10 dollar 
#            and the variance of the wage is 1.
#           Unluckly, this information is not known by economists, they have to do a survey about wage!
#           they hope that the sample could represent the population characteristics (mean) well!


# generate Country A population (wage)
wage.pop <- rnorm(10000, 10, 1)


#repeat the survey for 25 times
# sample from the population and estimate the mean
#sample size 5,repeat the survey for 25 times
wage.sample1 <- replicate(expr= mean(sample(x = wage.pop, size = 5)), n = 25) # expr is expression function.https://www.geeksforgeeks.org/create-an-expression-in-r-programming-expression-function/
#sample size 30,repeat the survey for 25 times
wage.sample2 <- replicate(expr = mean(sample(x =wage.pop, size = 30)), n = 25)

#Let's plot!
#population density
plot(density(wage.pop), 
     col = "green", 
     lwd = 2,
     ylim = c(0, 2),
     xlab = "Wage",
     main = "Sampling Distributions of Estimators")

# add density estimate for the distribution of the sample mean with n=5 to the plot
lines(density(wage.sample1), 
      col = "steelblue", 
      lwd = 2, 
      bty = "l")

# add density estimate for the distribution of the sample mean with n=30 to the plot
lines(density(wage.sample2), 
      col = "red2", 
      lwd = 2)

# add a vertical line at the true parameter
abline(v = 10, lty = 2)


# add a legend
legend("topleft",cex = 0.75,
       legend = c(expression('Wage Population'),
                   '',
                  expression(bar(Wage) ~ n == 5),
                  '',
                  expression(bar(Wage) ~ n == 30)
       ), 
       lty = c(2, 1, 1, 1), 
       col = c("green","white", "steelblue","white", "red2"),
       lwd = 2)


#repeat the survey for 100 times
# sample from the population and estimate the mean
#sample size 5,repeat the survey for 100 times
wage.sample1 <- replicate(expr= mean(sample(x = wage.pop, size = 5)), n = 100) # expr is expression function.https://www.geeksforgeeks.org/create-an-expression-in-r-programming-expression-function/
#sample size 30,repeat the survey for 100 times
wage.sample2 <- replicate(expr = mean(sample(x =wage.pop, size = 30)), n = 100)

#Let's plot!
#population density
plot(density(wage.pop), 
     col = "green", 
     lwd = 2,
     ylim = c(0, 2),
     xlab = "Wage",
     main = "Sampling Distributions of Estimators")

# add density estimate for the distribution of the sample mean with n=5 to the plot
lines(density(wage.sample1), 
      col = "steelblue", 
      lwd = 2, 
      bty = "l")

# add density estimate for the distribution of the sample mean with n=30 to the plot
lines(density(wage.sample2), 
      col = "red2", 
      lwd = 2)

# add a vertical line at the true parameter
abline(v = 10, lty = 2)


# add a legend
legend("topleft",cex = 0.75,
       legend = c(expression('Wage Population'),
                  '',
                  expression(bar(Wage) ~ n == 5),
                  '',
                  expression(bar(Wage) ~ n == 30)
       ), 
       lty = c(2, 1, 1, 1), 
       col = c("green","white", "steelblue","white", "red2"),
       lwd = 2)

##https://umatter.github.io/courses/berkstats/Berkstats_LLM_CLT.html

