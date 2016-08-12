# preparation of data for analysis

# price vector
price = data[, 30]
price

# definition of a new vector for payment intervalls
quest.Int = ifelse(data$P002 == "einmalig" | data$P002 == "nicht beantwortet",
                   0, 1)
quest.Int  #means question Intervall

table(quest.Int)  # 11 values are excluded

# definition of a new price vector including just prices with intervall 
# monthly and yearly
new.price = mapply("*", price, quest.Int)
new.price

# definition of a new price vector with just monthly prices
new.data = ifelse(data$P002 == "jaehrlich", new.price/12, new.price)
new.data

# regression with income

# defining dummy variables for income

# vector for income group 500 - 1000 Euro
income.2 = ifelse(data$SD08 == "501 Euro - 1000 Euro", 1, 0)
income.2
plot(income.2, new.data, type = "p", main = "income.2", 
     xlab = "income group: 501 Euro - 1000 Euro", 
     ylab = "Price paid")

# vektor for income group 1001 - 2000 Euro
income.3 = ifelse(data$SD08 == "1001 Euro - 2000 Euro", 1, 0)
income.3
plot(income.3, new.data, type = "p", main = "income.3",
     xlab = "income group: 1001 Euro - 2000 Euro", 
     ylab = "Price paid")

# vektor for income 2001 - 3000 Euro
income.4 = ifelse(data$SD08 == "2001 Euro - 3000 Euro", 1, 0)
income.4
plot(income.4, new.data, type = "p", main = "income.4", 
     xlab = "income group: 2001 Euro - 3000 Euro", 
     ylab = "Price paid")

# vektor for income > 3000 Euro
income.5 = ifelse(data$SD08 == "ueber 3000 Euro", 1, 0)
income.5
plot(income.5, new.data, type = "p", main = "income.5",
     xlab = "income group: more than 3000 Euro", 
     ylab = "Price paid")

# multiple regression
model = lm(new.data ~ income.2 + income.3 + income.4 + income.5)
model
summary(model)
