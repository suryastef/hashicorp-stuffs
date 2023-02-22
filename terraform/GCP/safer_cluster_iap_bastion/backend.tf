terraform {
  backend "gcs" {
    bucket = "suryastef-tfstate"
    prefix = "safer-cluster-iap-bastion"
  }
}