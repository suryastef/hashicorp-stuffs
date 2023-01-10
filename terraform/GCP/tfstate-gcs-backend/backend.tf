terraform {
  backend "gcs" {
    bucket = "suryastef-tfstate"
    prefix = "tfstate-gcs-backend"
  }
}