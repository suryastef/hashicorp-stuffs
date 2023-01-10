terraform {
  backend "gcs" {
    bucket = "suryastef-tfstate"
    prefix = "enable-service-api"
  }
}