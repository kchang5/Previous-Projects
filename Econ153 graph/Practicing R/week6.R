#week 6
#HW1 Q1.a
census<- read.table('https://www.openintro.org/data/csv/census.csv', header=T, sep=",")
View(census)


  
#HW1 Q2.c  ref:week3 code
#simulation
avg=rep(0,1)
N=rep(0,1)

for(j in 1:1000)
{ x<-mean(sample(1:13,j,replace=TRUE))
avg[j]=x
N[j]=j
}
avg
N
plot(N,avg,xlab="sample size", ylab="sample mean")

##

avg=rep(0,1)
N=rep(0,1)

for(j in 10:20)
{ x<-mean(sample(1:13,j,replace=TRUE))
avg[j-9]=x
N[j-9]=j
}
plot(N,avg,xlab="sample size", ylab="sample mean")

##
avg=rep(0,1)
N=rep(0,1)
for(j in 10:1000)
{ x<-mean(sample(1:13,j,replace=TRUE))
avg[j-9]=x
N[j-9]=j
}

N2=rep(0,1)
for (i in 0:9)
{
N2[i+1]=N[100*i+1]
}

avg2=rep(0,1)
for (i in 0:9)
{
  avg2[i+1]=avg[100*i+1]
}
plot(N2,avg2,xlab="sample size", ylab="sample mean")
abline(h=7)




#Weak Law of Large Number and The Central Limit Theorem
#As sample size grows larger, the probabilty that sample mean converge to population mean 
#becomes larger.

#The central limit theorem:
#if you have a population with mean μ and standard deviation σ and take sufficiently large 
#random samples from the population with replacement,
#then the distribution of the sample means will be approximately normally distributed. 
#This will hold true regardless of whether the source population is normal or skewed, 
#provided the sample size is sufficiently large (usually n > 30). 
#If the population is normal, then the theorem holds true even for samples smaller than 30.


#Example: 
#suppose the total population of country A is 10000. 
#the wage is normally distributed with 
#mean of 10 dollar and the variance of the wage is 1.
#Unluckly, this information is not known by economists, they have to do a survey about wage.
#they hope that the sample could represent the population characteristics (mean) well!


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

##plot normal distribution
curve(dnorm(x, mean = 10), 
      lwd = 2,
      lty = 2,
      add = T)

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
legend("topleft",cex = 0.5,
       legend = c("N(10,1)",
                  '',
                  expression('Wage Population'),
                  '',
                  expression(bar(Wage) ~ n == 5),
                  '',
                  expression(bar(Wage) ~ n == 30)
                
       ), 
       lty = c(4, 1, 1, 1, 1, 1, 1), 
       col = c("black","white","green","white","steelblue","white","red2"),
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
     ylim = c(0, 2.5),
     xlab = "Wage",
     main = "Sampling Distributions of Estimators")

##plot normal distribution
curve(dnorm(x, mean = 10), 
      lwd = 2,
      lty = 2,
      add = T)

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
legend("topleft",cex = 0.5,
       legend = c("N(10,1)",
                  '',
                  expression('Wage Population'),
                  '',
                  expression(bar(Wage) ~ n == 5),
                  '',
                  expression(bar(Wage) ~ n == 30)
                  
       ), 
       lty = c(4, 1, 1, 1, 1, 1, 1), 
       col = c("black","white","green","white","steelblue","white","red2"),
       lwd = 2)





###What if population is not normal distribution???
##Example: If the population uniformly dostributed from 1 to 13
wage.pop <- runif(10000, min=1, max=13)

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
     ylim = c(0, 1),
     xlab = "Wage",
     main = "Sampling Distributions of Estimators")

##plot normal distributino
curve(dunif(x, min = 1,max=13), 
      lwd = 2,
      lty = 2,
      add = T)

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
abline(v = 7, lty = 2)


# add a legend
legend("topleft",cex = 0.5,
       legend = c("Unif(1,13)",
                  '',
                  expression('Wage Population'),
                  '',
                  expression(bar(Wage) ~ n == 5),
                  '',
                  expression(bar(Wage) ~ n == 30)
                  
       ), 
       lty = c(3, 1, 1, 1, 1, 1, 1), 
       col = c("black","white","green","white","steelblue","white","red2"),
       lwd = 2)


###repeat the survey for 1000 times

wage.pop <- runif(10000, min=1, max=13)
# sample from the population and estimate the mean
#sample size 5,repeat the survey for 1000 times
wage.sample1 <- replicate(expr= mean(sample(x = wage.pop, size = 5)), n = 1000) # expr is expression function.https://www.geeksforgeeks.org/create-an-expression-in-r-programming-expression-function/
#sample size 30,repeat the survey for 25 times
wage.sample2 <- replicate(expr = mean(sample(x =wage.pop, size = 30)), n = 1000)

plot(density(wage.pop), 
     col = "green", 
     lwd = 2,
     ylim = c(0, 1),
     xlab = "Wage",
     main = "Sampling Distributions of Estimators")

##plot normal distributino
curve(dunif(x, min = 1,max=13), 
      lwd = 2,
      lty = 2,
      add = T)

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
abline(v = 7, lty = 2)


# add a legend
legend("topleft",cex = 0.5,
       legend = c("Unif(1,13)",
                  '',
                  expression('Wage Population'),
                  '',
                  expression(bar(Wage) ~ n == 5),
                  '',
                  expression(bar(Wage) ~ n == 30)
                  
       ), 
       lty = c(3, 1, 1, 1, 1, 1, 1), 
       col = c("black","white","green","white","steelblue","white","red2"),
       lwd = 2)

