resource "google_storage_bucket_object" "indexpage" {
  name   = "index.html"
  bucket = google_storage_bucket.crud_frontend.name
  content_type = "text/html"
  source = "../static_files/index.html"
}

# resource "google_storage_bucket_access_control" "public_rule" {
#   bucket = google_storage_bucket.crud_frontend.name
#   role   = "READER"
#   entity = "allUsers"
# }

resource "google_storage_bucket_iam_member" "member" {
  provider = google-beta
  bucket   = google_storage_bucket.crud_frontend.name
  role     = "roles/storage.objectViewer"
  member   = "allUsers"
}
