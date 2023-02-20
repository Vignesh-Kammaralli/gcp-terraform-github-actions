resource "google_storage_bucket" "default" {
  name="myvigbucket"
  count=1
  location = "us-central1"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }
  public_access_prevention = "enforced"
  uniform_bucket_level_access = true
}