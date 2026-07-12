# applied ecotrix book Ex.4,1
setwd("G:/My Drive/003Claude/ecotrix")

# loading the libraries
library(tidyverse)
library(broom)
library(modelsummary)

df <- read_csv("health.csv")


# exploring the data
glimpse(df)
summary(df)

# plotting the charts 
ggplot(df, aes(x = faminc, y = bwght, color = cigs))+
  geom_point()

ggplot(df, aes(x = cigs, y = bwght, color = faminc))+
  geom_point()


# build the model 1
mod1 <- lm(bwght ~ ., data = df)
# summary(mod1)
tidy(mod1)
glance(mod1)

# conclusion 
# faminc has a statistically significant, but very small positive impact on weight
# cigs has a statistcally significant, but a small negative impact on weight 

# model 2
mod2 <- lm(bwght ~ faminc, data = df)

tidy(mod2)
glance(mod2)

# conclusion 
# the significance of faminc increases and is significant 
# the overall model fit decreases further

mod3 <- lm(bwght ~ cigs, data = df)

tidy(mod3)
glance(mod3)

# combine the results
models <- list(
  "Model 1" = mod1,
  "Model 2" = mod2,
  "Model 3" = mod3
)

modelsummary(models)

# also 
model_comparison <- bind_rows(
  glance(mod1) |> mutate(model = "Model 1"),
  glance(mod2) |> mutate(model = "Model 2"),
  glance(mod3) |> mutate(model = "Model 3")
) |>
  select(model, r.squared, adj.r.squared, sigma, AIC, BIC, p.value)

model_comparison
