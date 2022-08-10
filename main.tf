resource "google_service_account" "upload_container" {
  account_id   = "artifact-registry-upload"
  display_name = "artifact registry upload"
  project      = var.project_id
  description  = "Used to upload to artifact registry"
}

resource "google_service_account" "container_deployer" {
  account_id   = "cloud-run-deployer"
  display_name = "cloud-run-deployer"
  project      = var.project_id
  description  = "Used to deploy to Cloud Run"
}

/*resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:cloud-run-deployer@${var.project_id}.iam.gserviceaccount.com"
  depends_on = [google_service_account.container_deployer]
}*/

module "project-services" {
  source                      = "terraform-google-modules/project-factory/google//modules/project_services"
  version                     = "~> 13.0"
  project_id                  = var.project_id
  enable_apis                 = true
  disable_services_on_destroy = true

  activate_apis = [
    "cloudresourcemanager.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "iam.googleapis.com",
    "binaryauthorization.googleapis.com",
    "containerscanning.googleapis.com",
    "sqladmin.googleapis.com",
    "sql-component.googleapis.com"
  ]
}