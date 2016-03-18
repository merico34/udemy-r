# ESR and Plasma Proteins

# to put two cdplots two columns on one graphic frame:
data("plasma",package="HSAUR3")
layout(matrix(1:2,ncol=2))
cdplot(ESR ~ fibrinogen, data=plasma)
cdplot(ESR ~ globulin, data=plasma)

## fit the model
m1 <- glm(ESR ~ fibrinogen, data = plasma,
                    family = binomial())

# look at results
summary(m1)

# 95% CI
confint(m1, parm = "fibrinogen")

# odds-ratio
exp(coef(m1)["fibrinogen"])

# 95% CI around coefficient
exp(confint(m1, parm = "fibrinogen"))

# Now with globulin
m2 <- glm(ESR ~ fibrinogen + globulin,
                    data = plasma, family = binomial())

# results
summary(m2) # globulin not significant

# which model is better?
anova(m1, m2, test = "Chisq")

# bubble plot
plot(globulin ~ fibrinogen, 
     data = plasma, 
     xlim = c(2, 6),
     ylim = c(25, 55), 
     pch = ".")
symbols(plasma$fibrinogen, 
        plasma$globulin, 
        circles = prob,
        add = TRUE)

### WOMEN'S ROLE IN SOCIETY
data("womensrole", package = "HSAUR3")
fm1 <- cbind(agree, disagree) ~ gender + education
womensrole_glm_1 <- glm(fm1, data = womensrole,
                        family = binomial())

# results
summary(womensrole_glm_1)

# predict
role.fitted1 <- predict(womensrole_glm_1, type = "response")

# plot it
myplot <- function(role.fitted) {
  f <- womensrole$gender == "Female"
  plot(womensrole$education, role.fitted, type = "n",
       ylab = "Probability of agreeing",
       xlab = "Education", ylim = c(0,1))
  lines(womensrole$education[!f], role.fitted[!f], lty = 1)
  lines(womensrole$education[f], role.fitted[f], lty = 2)
  lgtxt <- c("Fitted (Males)", "Fitted (Females)")
  legend("topright", lgtxt, lty = 1:2, bty = "n")
  y <- womensrole$agree / (womensrole$agree +
                             womensrole$disagree)
  text(womensrole$education, y, ifelse(f, "\\VE", "\\MA"),
       family = "HersheySerif", cex = 1.25)
}

# plot the function above
myplot(role.fitted1)

# add education as interaction
fm2 <- cbind(agree,disagree) ~ gender * education
womensrole_glm_2 <- glm(fm2, data = womensrole,
                        family = binomial())

# results
summary(womensrole_glm_2)

# fit the model
role.fitted2 <- predict(womensrole_glm_2, 
                        type = "response")
myplot(role.fitted2)

# is some interaction above
# residuals fit ok
res <- residuals(womensrole_glm_2, type = "deviance")
plot(predict(womensrole_glm_2), res,
     xlab="Fitted values", ylab = "Residuals",
     ylim = max(abs(res)) * c(-1,1))
abline(h = 0, lty = 2)

# colonic polyps
data("polyps", package = "HSAUR3")
polyps_glm_1 <- glm(number ~ treat + age, data = polyps,
                    family = poisson())

# results
summary(polyps_glm_1)

# add all variables
polyps_glm_2 <- glm(number ~ treat + age, data = polyps,
                    family = quasipoisson())
summary(polyps_glm_2)

