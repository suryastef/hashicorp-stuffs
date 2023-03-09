terraform {
  backend "gcs" {
    bucket = "suryastef-tfstate"
    prefix = "kubernetes-helm-chart"
  }
}