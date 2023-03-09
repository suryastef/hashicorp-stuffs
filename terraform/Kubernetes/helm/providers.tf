# Description : Get Kubernetes endpoint address from gke tfstate 
data "terraform_remote_state" "gke" {
  backend = "gcs"
  config = {
    bucket = "suryastef-tfstate"
    prefix = "safer-cluster-iap-bastion"
  }
}

data "google_client_config" "gke" {}

provider "kubernetes" {
  host                   = "https://${data.terraform_remote_state.gke.outputs.endpoint}"
  token                  = data.google_client_config.gke.access_token
  cluster_ca_certificate = base64decode(data.terraform_remote_state.gke.outputs.ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.gke.outputs.endpoint
    token                  = data.google_client_config.gke.access_token
    cluster_ca_certificate = base64decode(data.terraform_remote_state.gke.outputs.ca_certificate)
  }
}
