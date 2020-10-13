library(readxl)
airlines_data<-read_excel('C:/Users/HP/Desktop/assignments submission/clustering/EastWestAirlines.xlsx',sheet=2)
View(airlines_data)
airlines<-scale(airlines_data[,-1])
View(airlines)

#euclidean distance
d=dist(airlines,method='euclidean')
d
fit<-hclust(d,method='average')

#dendogram
library(factoextra)
fviz_dend(fit,cex=0.5,k=4,color_labels_by_k = TRUE,rect=TRUE)
clusters<-cutree(fit,4)
final_out<-data.frame('airline_id'=airlines_data[,1],'clusters'=clusters)
View(final_out)
