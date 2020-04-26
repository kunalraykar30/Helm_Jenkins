# Deployment of GKE cluster
# Author: Kunal Raykar

printf "\nPlease enter Project ID: "
read PROJECT_ID
printf "\nPlease provide Cluster Name for GKE: "
read CLUSTER_NAME

gcloud config set project ${PROJECT_ID}
CLUSTER_NAME=gke
gcloud container clusters create $CLUSTER_NAME \
    --num-nodes=3 --enable-autoupgrade --no-enable-basic-auth \
    --no-issue-client-certificate --enable-ip-alias --zone   us-central1-c  --metadata \
    disable-legacy-endpoints=true

printf "Cluster - $CLUSTER_NAME has been created. Below are the details of the cluster.\n"
kubectl cluster-info
