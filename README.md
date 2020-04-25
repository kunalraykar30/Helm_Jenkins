# Helmcharts

### Creation of GKE 
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
GKE create a PersistentVolumeClaim ( Dynamically provisioning PersistentVolumes)and Kubernetes automatically provisions a persistent disk to the dpeloyment.

### Installation fo the Helm 
Seperate service account will be required for the helm in order to create the resouce/objects of the charts from template on Cluster
```
# kubectl create serviceaccount tiller -n kube-system 
# kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller 

```

#### Initialize the tiller as server side component in kube-system 

```
# helm init --service-account tiller 
# helm version
```
Installation of Jenkins using Helm 

Here before installation the jenkins I have modified the values of jenkins charts.
```
# helm inspect values stable/jenkins > /tmp/jenkins.values
# helm install stable/jenkins --values /tmp/jenkins.values --name myjenkins 

# helm ls 
# kubectl get po 
```
