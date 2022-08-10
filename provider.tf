terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.31.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.31.0"
    }
  }
}

provider "google" {
  credentials = file(var.file_path)

  project = var.project_id
  region  = var.region_id
  zone    = var.zone_id
}

provider "google-beta" {
  credentials = file(var.file_path)

  project = var.project_id
  region  = var.region_id
  zone    = var.zone_id
}