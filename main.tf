# configure provider
provider "google" {
  project = var.project_id
  credentials = file("./service-acct/key.json")
  region  = "us-central1"
  zone    = "us-central1-c"
}

# confi
resource "google_storage_bucket" "tf-backend-state" {
  name     = "tf-backend-259220_state"
  location = "US"
}

resource "google_project_service" "storage" {
  for_each                   = toset(var.enabled_api)
  project                    = var.project_id
  service                    = each.key
  disable_dependent_services = false
}

# add service account from project tf-ref-project to bucket
resource "google_storage_bucket_iam_binding" "bucket_admin" {
  bucket = google_storage_bucket.tf-backend-state.name
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:terraform@tf-ref-project.iam.gserviceaccount.com"
  ]
}
