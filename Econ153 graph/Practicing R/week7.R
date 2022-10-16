#week7

#The sampling distribution of the sample mean is a probability distribution 
#consisting of all possible sample means of a given sample size selected from 
#a population

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



#Example (normal distribution and population variance is known): 

#suppose the total population of country A is infinite. 
#the wage is normally distributed with 
#mean of 10 dollar and the variance of the wage is 1.
#Unluckly, this information is not known by economists, they have to do a survey about wage.
#they hope that the sample could represent the population characteristics (mean and sd) well!

##

avg<- numeric(0)
N<- numeric(0)
avg2<- numeric(0)
N2<- numeric(0)

for (i in 1:1000)
{x<-mean(sample(rnorm(10, mean=10, sd=1)))
avg[i]=x
N[i]=10
i=i+1
}
avg2=c(avg,avg2)
N2=c(N,N2)
plot(N2,avg2,xlab="sample size", ylab="sample mean")
sd(avg2)
#1/sqrt(10)=

for(j in seq(from=20, to=100, by=10))
  {
  for (i in 1:1000)
  { x<-mean(sample(rnorm(j, mean=10, sd=1)))
  avg[i]=x
  N[i]=j
  }
avg2=c(avg,avg2)
N2=c(N,N2)
i=i+1
}

plot(N2,avg2,xlab="sample size", ylab="sample mean")
abline(h=10)

by(avg2, N2, sd)



#repeat the survey for different times, as it goes to infinit
# sample from the population and estimate the mean

#sample size 5,repeat the survey for 25 times
wage.sample1 <- replicate(expr= mean(sample(rnorm(5, mean=10, sd=1))), n = 25) # expr is expression function.https://www.geeksforgeeks.org/create-an-expression-in-r-programming-expression-function/
#sample size 5,repeat the survey for 100 times
wage.sample2 <- replicate(expr = mean(sample(rnorm(5, mean=10, sd=1))), n = 100)
#sample size 5,repeat the survey for 1000 times
wage.sample3 <- replicate(expr = mean(sample(rnorm(5, mean=10, sd=1))), n = 1000)

#Let's plot!
##plot population distribution ( N(10, 1) )
curve(dnorm(x, mean = 10,sd=1), 
      lwd = 2,
      lty = 2,
      col = "green",
      xlim = c(5, 15),
      ylim = c(0, 1.2))

# add density estimate for the distribution of the sample mean with sample size 5, repeat 25 times
lines(density(wage.sample1), 
      col = "steelblue", 
      lwd = 2, 
      bty = "l")

# add density estimate for the distribution of the sample mean  sample size 5, repeat 100 times
lines(density(wage.sample2), 
      col = "red2", 
      lwd = 2)

# add density estimate for the distribution of the sample mean with sample size 5, repeat 1000 times
lines(density(wage.sample3), 
      col = "orange", 
      lwd = 2)




#sample size 100,repeat the survey for 25 times
wage.sample1 <- replicate(expr= mean(sample(rnorm(100, mean=10, sd=1))), n = 25) # expr is expression function.https://www.geeksforgeeks.org/create-an-expression-in-r-programming-expression-function/
#sample size 100,repeat the survey for 100 times
wage.sample2 <- replicate(expr = mean(sample(rnorm(100, mean=10, sd=1))), n = 100)
#sample size 100,repeat the survey for 1000 times
wage.sample3 <- replicate(expr = mean(sample(rnorm(100, mean=10, sd=1))), n = 1000)

#Let's plot!
##plot population distribution ( N(10, 1) )
curve(dnorm(x, mean = 10,sd=1), 
      lwd = 2,
      lty = 2,
      col = "green",
      xlim = c(5, 15),
      ylim = c(0, 2.5))

# add density estimate for the distribution of the sample mean with sample size 100, repeat 25 times
lines(density(wage.sample1), 
      col = "steelblue", 
      lwd = 2, 
      bty = "l")

# add density estimate for the distribution of the sample mean  sample size 100, repeat 100 times
lines(density(wage.sample2), 
      col = "red2", 
      lwd = 2)

# add density estimate for the distribution of the sample mean with sample size 100, repeat 1000 times
lines(density(wage.sample3), 
      col = "orange", 
      lwd = 2)

##CLT is proved by the graph!!!


#comparing variance of sample mean for different sample size

#sample size 10,repeat the survey for 1000 times
wage.sample1 <- replicate(expr= mean(sample(rnorm(10, mean=10, sd=1))), n = 1000) # expr is expression function.https://www.geeksforgeeks.org/create-an-expression-in-r-programming-expression-function/

#sample size 100,repeat the survey for 1000 times
wage.sample2 <- replicate(expr = mean(sample(rnorm(100, mean=10, sd=1))), n = 1000)

#Let's plot!
##plot normal distribution
curve(dnorm(x, mean = 10,sd=1), 
      lwd = 2,col = "green",
      lty = 2,xlim = c(5, 15),
      ylim = c(0, 2.5))

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

sd(wage.sample1)
sd(wage.sample2)

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

#uniform distribution
##Example: If the population uniformly dostributed from 1 to 13

#repeat the survey for 25 times
# sample from the population and estimate the mean
#sample size 10,repeat the survey for 1000 times
wage.sample1 <- replicate(expr= mean(sample( runif(5, min=1, max=13))), n = 1000) # expr is expression function.https://www.geeksforgeeks.org/create-an-expression-in-r-programming-expression-function/
#sample size 100,repeat the survey for 1000 times
wage.sample2 <- replicate(expr = mean(sample( runif(100, min=1, max=13))), n = 1000)

#Let's plot!

##plot normal distributino
curve(dunif(x, min = 1,max=13), 
      lwd = 2,
      lty = 2,
      col = "green",xlim = c(0, 14),ylim = c(0, 1),
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
abline(v = 7, lty = 2)



###binomial distribution
#ref: http://ablejec.nib.si/R/quincunx.pdf
#ref: https://yihui.org/animation/example/quincunx/
#ref: https://www.r-bloggers.com/2009/12/galtons-quincunx-in-r/
library(animation)
set.seed(123)
ani.options(nmax = 200 + 15 - 2, 2)
freq = quincunx(balls=200, layers = 15, pch.layers = 2, pch.balls = 19, 
                col.balls = rainbow(200), cex.balls = 2)
## frequency table
barplot(freq, space = 0)
