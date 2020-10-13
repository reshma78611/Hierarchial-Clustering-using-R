library(readr)
data1<-read.csv('C:/Users/HP/Desktop/datasets/Universities.csv')
View(data1)
#take out names of univ and scale the remainingdata
data<-scale(data1[,2:7])
View(data)
#Euclidean distance b/w data
d<-dist(data,method='euclidean')
d
#clustering using average method
fit<-hclust(d,method='average')#mostly average or centroid is used
#dendogram graph
#install.packages("factoextra")
library(factoextra)
fviz_dend(fit,k=4,cex=0.5,color_labels_by_k =TRUE,rect=TRUE)
#final output with univ and their belonging cluster
clusters<-cutree(fit,k=4)
clusters
final_output<-data.frame('UNI'=data1[,1],'cluster'=clusters)
View(final_output)
