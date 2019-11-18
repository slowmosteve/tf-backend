variable "project_id" {
  default     = "tf-backend-259220"
  description = "Terraform backend for storing state"
}

variable "enabled_api" {
  description = "The list of enabled APIs for this project"
  type        = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
    "storagetransfer.googleapis.com"
  ]
}