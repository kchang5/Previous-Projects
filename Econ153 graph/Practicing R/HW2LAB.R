#lab_hw2_template
#Section038
#Kevin Chang 862085333
#Milt Aubry 862061935
#Bryan Lac 862170218
#Kelvin Wen 
#Q1

#suppose the total population of country A is infinite. 
#the wage is normally distributed with 
#mean of 100 dollar and the variance of the wage is 9.
#Unfortunately, this information is not known by economists, they have to do surveys on wages.
#The first survey with sample size of 49,The second survey with sample size of 121 
 
#a) plot the distribution of sample standard deviation of the first survey

#sample size 49,repeat the survey for 1000 times
wage.sample1 <- replicate(expr= sd(sample(rnorm(49, mean=100, sd=3))), n = 1000) 
wage.sample1

#sample size 121,repeat the survey for 1000 times
wage.sample2 <- replicate(expr = sd(sample(rnorm(121, mean=100, sd=3))), n = 1000)

plot(density(wage.sample1), 
     col = "green", 
     lwd = 2,
     ylim = c(0, 10),
     xlab = "Wage",
     main = "Sampling Distributions of Estimators")
lines(density(wage.sample1), 
col = "steelblue", 
lwd = 2, 
bty = "l",lty = 2,xlim = c(5, 100),
  ylim = c(0, 1))

#b) plot the distribution of sample standard deviation of the second survey

lines(density(wage.sample2), 
col = "red2", 
lwd = 2)

#c) add a vertical line at the true parameter (sd of population)

abline(v = 3, lty = 2)

#d) from the graph, which survey has a larger SE of sample sd?
#The first survey has a larger SE of sample sd because the graph is more spread out compared
#to the 2nd survey which has a more narrow SE of sample sd. 


#Q2
#Ref:https://www.andrew.cmu.edu/user/achoulde/94842/lectures/lecture07/lecture07-94842.html
#Ref:https://uc-r.github.io/t_test#twosample

#a) 
covid <- function(n1, n2, mean.shift = 0) {
  rate_positive <- rnorm(n1 + n2,mean=0,sd=10) + c(rep(30, n1), rep(30+mean.shift, n2))
  groups <- c(rep("mask", n1), rep("no_mask", n2))
  data.frame(rate_positive  = rate_positive, groups = groups)
}

obs.data <- covid(n1 = 100, n2 = 150, mean.shift = 20)
View(obs.data)

#b)
qplot(fill = groups, x = rate_positive, data = obs.data, geom = "density", 
      alpha = I(0.5),
      adjust = 1.5)
#c)
ggplot(obs.data, aes(groups, rate_positive)) +
  geom_boxplot()

# The plot suggest that wearing a mask decreases the rate positive.
# let's find out if the difference is statisitcally significant.

obs.data %>%
  group_by(groups) %>%
  summarize(num.obs = n(),
            mean.rate_positive = round(mean(rate_positive), 0),
            sd.rate_positive = round(sd(rate_positive), 0),
            se.rate_positive = round(sd(rate_positive) / sqrt(num.obs), 0))

# Let's run a t test

t_test <- t.test(rate_positive ~ groups, data = obs.data)
t_test

#d)
print(paste("the p_value of the t test is:",t_test$p.value))

#e)
# the confidence interval is:
t_test$conf.int

# The result confirmed that the rate positive is on average 17 higher in the counties that don't have a mask mandate than the ones that do. 
# t_statistic : -14.29 , p_value < 2.2e-16, 95% CI [-20.22  -15.32]
# the confidence interval means that 95% of the difference in means of a random population will be in this interval

# Since the p_value is less than the level of significance 0.05, 
# so we can reject the null hypothesis saying that there's not any difference 
# in rate positive for both groups

#Masks are effective in preventing covid-19
