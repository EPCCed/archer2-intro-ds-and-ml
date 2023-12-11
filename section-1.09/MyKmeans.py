# The function MyKmeans implements k-means
# predefined number of clusters and initial centroids
# Read the function so that you undertsand what it does at each step.
# MyKmeans
#  input: dataset, number of clusters, initial centroids
#  output: the dataset with the cluster membership assigned to each point
 
def MyKmeans(df, n_cluster, c_initial):

    import pandas as pd
    import numpy as np
    from math import sqrt 

    # centroid is a dataframe of centroids, with each centroid on a different row
    # first centroid = first 2 data points
    centroid = df.iloc[0:n_cluster,:]
    cent_DF = pd.concat([pd.Series(c_initial,name='c'),centroid])
    # We define a matrix d to store the distance calculations at each step
    d = np.zeros(shape=(df.shape[0],n_cluster))
    # creating 0 vector for containing cluster number  at each step
    c = np.zeros(shape=(df.shape[0],1))
    # creating 0 matrix for storing intermediate centroids
    updCentroid = np.zeros(shape=(centroid.shape[0],df.shape[1]))

    status = 10
    itern = 0
    tolerance = 0.0000001
    
    while (status != 0): # while we haven't reached convergence
        itern = itern+1

        # calculate distance between each pair of X[,1], X[,2] and current centroids 
        for i in range(df.shape[0]):
            d[i,:]=centroid.apply(lambda x:sqrt(sum((x - df.iloc[i,:])**2)),axis=1)
                    
        #assign cluster number on each data
        for i in range(df.shape[0]):
            c[i]=np.argmin(d[i,])

        #calculate the new centroid based on new clustered data
        compare = pd.concat([df,pd.DataFrame(c,columns=['cluster'])],axis=1)
        
        for i in range(n_cluster):
            x=compare[compare.iloc[:,2]==i]
            for j in range(df.shape[1]):
                updCentroid[i,j]=x.iloc[:,j].mean()

        if((abs(centroid.to_numpy()-updCentroid).sum())>tolerance):
            status=1
            centroid=pd.DataFrame(updCentroid)
        else:
            status=0

    return(compare)


        
