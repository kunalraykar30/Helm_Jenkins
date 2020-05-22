# Deployment of GKE cluster and Helm, kubectx and kubens
# Tiller is not deployed in the script
# Author: Kunal Raykar

printf "\nPlease enter Project ID: "
read PROJECT_ID
printf "\nPlease provide Cluster Name for GKE: "
read CLUSTER_NAME

gcloud config set project ${PROJECT_ID}
gcloud container clusters create $CLUSTER_NAME \
    --num-nodes=3 --enable-autoupgrade --no-enable-basic-auth \
    --no-issue-client-certificate --enable-ip-alias --zone   us-central1-c  --metadata \
    disable-legacy-endpoints=true

printf "Cluster - $CLUSTER_NAME has been created. Below are the details of the cluster.\n"
kubectl cluster-info

# Installation of Helm, kubectx and kubens starts from here. 

printf "\nDownloading Helm and copying helm to /usr/local/bin \n"
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.0-linux-amd64.tar.gz
tar -xvzf helm-v2.13.0-linux-amd64.tar.gz
sudo cp -f linux-amd64/helm /usr/local/bin/

## Getting kubectx and kubens on cloud shell, thus allowing easy switch between the context and namespace.

printf "\nDownloading kubectx and kubens.\n"
git clone https://github.com/ahmetb/kubectx kubectx/
export PATH=$PATH:/home/kunal_raykar/

gcloud container clusters get-credentials $CLUSTER_NAME --zone us-central1-c
kubectx gke=gke_${PROJECT_ID}_us-central1-c_gke
