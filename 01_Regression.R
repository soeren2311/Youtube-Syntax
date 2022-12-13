x <- c(10, 3, 14, 5, 6, 3, 19, 8, 8, 7, 11, 13, 16, 9, 13, 6, 16, 4, 20, 1)
y <- c(9, 5, 12, 6, 3, 7, 16, 5, 3, 7, 12, 9, 20, 13, 18, 13, 10, 1, 17, 3)

df <- data.frame(x, y)
df

plot(df$x, df$y, main="Zusammenhang zwischen x und y", xlab="Größe in Cm", ylab="Gewicht in kg")

model <- lm(y~x, data=df)
summary(model)

abline(model, col="blue")