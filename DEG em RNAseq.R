stat<- data.frame()
genes<-as.factor(genes)

gene <- colnames(data)
table_test = NULL
for (i in 1:length(gene)) {#i=1
  formula <- paste(gene[i], " ~ clinical.Groups") %>% formula()
  teste1 <- compare_means(formula = formula, 
                          data = data, method = "anova",p.adjust.method = "fdr")
  table_test <- rbind(table_test, teste1)
  
  print(gene[i])
  i=i+1
}

table_test1 <- subset(table_test, table_test$p <= 0.05)
