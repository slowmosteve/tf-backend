# Terraform GCP backend

This project provisions a storage bucket in Google Cloud Platform for use as a Terraform backend


## Setup

1. Create project in GCP and note the project ID
2. Create a service account with `project editor` permissions
3. Generate a key `key.json` for this service account and save to a subdirectory `/service-acct`
4. Run `terraform init`
5. Run `terraform apply`


## Notes

- ensure billing has been enabled on this project
- `cloudresourcemanager.googleapis.com` is required to enable APIs
