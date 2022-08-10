variable "project_id" {
  description = "The ID of the project where resource will be created"
  type        = string
}

variable "region_id" {
  description = "GCP region"
  type        = string
}

variable "zone_id" {
  description = "GCP zone"
  type        = string
}

variable "service_name" {
  description = "Name of service deployed to Cloud Run"
  type        = string
}

variable "repository_id" {
  description = "Name of artifact repository in Artifact Regisrty"
  type        = string
}

variable "file_path" {
  description = "path of credentials json"
  type        = string
}