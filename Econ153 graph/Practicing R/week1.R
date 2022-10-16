#Week1
##Reference: Introduction to Econometrics with R by Hanck, Arnold, Gerber, and Schmelzer (2020)

#dice roll:randomly select a number from 1 to 6
#Now simulate the dice roll!
sample(1:6, 1) 
#Q1:
#probability density function (PDF)
#cumulative density function (CDF)

# 1     2    3    4    5   6
# 1/6  1/6  1/6  1/6  1/6 1/6  PDF
# 1/6  2/6 3/6   4/6  5/6   1    CDF

# generate the vector of probabilities 
probability <- rep(1/6, 6)  #the function rep() which replicates a given value a specified number of times.
print(probability)

probability2<-c(1/6, 1/6, 1/6,1/6,1/6,1/6)
probability2

# plot the probabilities 
plot(probability,
     xlab = "outcomes",
     main = "Probability Distribution") 

# generate the vector of cumulative probabilities 
cum_probability <- cumsum(probability) 
cum_probability
# plot the probabilites 
plot(cum_probability, 
     xlab = "outcomes", 
     main = "Cumulative Probability Distribution") 

#Flip a coin, Bernoulli Distribution
#Q2:
#what's the probalbility to get the a Head by flipping the coin one time
#Answer: 0.5! fair coin
dbinom(1,
       size = 1,
       prob = 0.5)

#what's the probalbility to get 4 times Heads by flipping a coin 10 times
dbinom(4,
       size = 10,
       prob = 0.5)


#what's the probalbility to get 7 times Heads by flipping a coin 10 times
dbinom(7,
       size = 10,
       prob = 0.5)

#what's the probalbility to get 0 to 3 times Heads by flipping a coin 10 times
dbinom(0:3,
       size = 10,
       prob = 0.5)

sum(dbinom(0:3,
       size = 10,
       prob = 0.5))

#what's the probalbility to get 4 to 5 times Heads by flipping a coin 10 times
sum(dbinom(4:5,
       size = 10,
       prob = 0.5))

#what's the probalbility to get 0 to 5 times Heads by flipping a coin 10 times
sum(dbinom(0:5,
           size = 10,
           prob = 0.5))

#Q3 pdf? cdf?
dbinom(x = 0:10,
           size = 10,
           prob = 0.5)

sum(dbinom(x = 0:10,
       size = 10,
       prob = 0.5))

#Q4 graph
#set up vector of possible outcomes
k <- 0:10
k

# assign the probabilities
p<- dbinom(k,
              size = 10, 
              prob = 0.5)
print(p)
# plot the outcomes against their probabilities (PDF)
plot(x = k, 
     y = p,
     main = "Probability Distribution Function") 



# compute cumulative probabilities
prob <- pbinom(k, 
               size = 10, 
               prob = 0.5)

# plot the cumulative probabilities (CDF)
plot(x = k, 
     y = prob,
     main = "Cumulative Distribution Function") 
