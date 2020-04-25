# Helmcharts
Here, I have created GKE Cluster for the installation of the Helm. 

```
# PROJECT_ID=your_gke_project_id
# gcloud config set project ${PROJECT_ID}
# CLUSTER_NAME=gke

# gcloud container clusters create $CLUSTER_NAME \
    --num-nodes=3 --enable-autoupgrade --no-enable-basic-auth \
    --no-issue-client-certificate --enable-ip-alias --zone   us-central1-c  --metadata \
    disable-legacy-endpoints=true
    
# gcloud container clusters list
# kubectl cluster-info

# gcloud container clusters get-credentials $CLUSTER_NAME --zone us-central1-c 
# kubectx gke=gke_${PROJECT_ID}_us-central1-c_gke
    
```	

I have done modification has been in the values of the helm chart


