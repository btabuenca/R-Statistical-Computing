#
# Anova test
#
# based on https://stats.stackexchange.com/questions/90760/example-where-comparison-of-three-mean-anova-and-t-test-have-different-results
#
set.seed(270)
As = rnorm(5, mean = 0, sd = 5)
As
Bs = rnorm(5, mean = 0, sd = 5)
Bs
Cs = rnorm(5, mean = 0, sd = 5)
Cs

dat = data.frame(factor = c("A","A","A","A","A","B","B","B","B","B", "C","C","C","C","C"), response = c(As, Bs, Cs))

dat

summary(aov(response ~ factor, data = dat))
t.test(As, Bs)
t.test(Bs, Cs)
t.test(As, Cs)


#
#  paired t-test. Calculates the difference between paired observations (e.g., before and after)
#


#
#  unpaired t-test. 
#    - Two data samples are independent (or upaired) if they come from unrelated populations and the samples does not affect each other.
#    - For example, suppose that we have measured the weight of 100 individuals: 50 women (group A) and 50 men (group B). We want to know if the mean weight of women (mAmA) is significantly different from that of men (mBmB).
#
# Note that, unpaired two-samples t-test can be used only under certain conditions:
#   - when the two groups of samples (A and B), being compared, are normally distributed. This can be checked using Shapiro-Wilk test.
#   - and when the variances of the two groups are equal. This can be checked using F-test.
#
# Check this: https://github.com/btabuenca/R-Statistical-Computing/blob/69f0c4ef0692e2d4498e5e771a4c99d8cfa8b3c2/Noise/noiseJournal.R
#    pshych alpha - Internal Consistency Reliability
#    https://www.r-bloggers.com/five-ways-to-calculate-internal-consistency/

