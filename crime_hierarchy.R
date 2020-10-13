library(readr)
crime_data<-read.csv('C:/Users/HP/Desktop/assignments submission/clustering/crime_data.csv')
View(crime_data)
crime<-scale(crime_data[,-1])
View(crime)

#hierarchial clustering
d<-dist(crime,method='euclidean')
d
fit<-hclust(d,method='average')
#dendigram graph
library(factoextra)
fviz_dend(fit,k=4,color_labels_by_k=TRUE,cex=0.5,rect=TRUE)

clusters<-cutree(fit,4)
clusters
final_output<-data.frame(crime_data[,1],clusters)
View(final_output)
