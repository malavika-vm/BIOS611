library(readr)
product_info <- read_csv("C:/Users/malav/611/source_data/product_info.csv")
data<-product_info
summary(data)
str(data)
#data cleaning
data=data%>%na.omit()
#data formatting
data$limited_edition=as.factor(data$limited_edition)
data$new=as.factor(data$new)
data$online_only=as.factor(data$online_only)
data$sephora_exclusive=as.factor(data$sephora_exclusive)
data$out_of_stock=as.factor(data$out_of_stock)
library(ggplot2)
#figure 1
figure1<- ggplot(data, aes(x = primary_category, y = price_usd)) +
  geom_point() +
  labs(title = "Scatter Plot of Prices by Primary Category",
       x = "Primary Category",
       y = "Price (USD)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better visibility
#figure 2
data$loves_count_category<-ifelse(data$loves_count > 5000, "Loves Count > 5000", "Loves Count =< 5000")
figure2<-ggplot(data, aes(x = factor(sephora_exclusive), fill = loves_count_category)) +
  geom_bar() +
  labs(title = "Stacked Bar Chart of Sephora Exclusive Products with Loves Count",
       x = "Sephora Exclusive",
       y = "Count") +
  scale_fill_manual(values = c("Loves Count > 5000" = "lightblue", "Loves Count =< 5000" = "maroon")) +
  theme_minimal()
ggsave(filename = "figures/figures1.png",plot=figure1)
ggsave(filename = "figures/figures2.png",plot=figure2)

