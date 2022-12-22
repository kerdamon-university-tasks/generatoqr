resource "google_storage_bucket_object" "indexpage" {
  name   = "index.html"
  bucket = google_storage_bucket.crud_frontend.name
  content_type = "text/html"
  source = "../static_files/index.html"
}
