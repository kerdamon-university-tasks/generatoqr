data "archive_file" "crud_source" {
    type        = "zip"
    source_dir  = "../src/crud"
    output_path = "/tmp/crud_function.zip"
}

resource "google_storage_bucket_object" "crud_function_src" {
  name   = "crud-function-src-${data.archive_file.crud_source.output_md5}.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = data.archive_file.crud_source.output_path
}

resource "google_cloudfunctions_function" "crud_function" {
  name        = "crud-function"
  runtime     = "nodejs16"
  entry_point = "crud_qrcode"
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.crud_function_src.name
  trigger_http = true
}

resource "google_cloudfunctions_function_iam_member" "crud_function_invoker" {
  project        = google_cloudfunctions_function.crud_function.project
  region         = google_cloudfunctions_function.crud_function.region
  cloud_function = google_cloudfunctions_function.crud_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
