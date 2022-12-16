data "archive_file" "scan_source" {
    type        = "zip"
    source_dir  = "../src"
    output_path = "/tmp/function.zip"
}

resource "google_storage_bucket_object" "scan_function_src" {
  name   = "scan-function-src-${data.archive_file.scan_source.output_md5}.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = data.archive_file.scan_source.output_path
}

resource "google_cloudfunctions_function" "scan_function" {
  name        = "scan-function"
  runtime     = "nodejs16"
  entry_point = "helloHttp"
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.scan_function_src.name
  trigger_http = true
}

resource "google_cloudfunctions_function_iam_member" "scan_function_invoker" {
  project        = google_cloudfunctions_function.scan_function.project
  region         = google_cloudfunctions_function.scan_function.region
  cloud_function = google_cloudfunctions_function.scan_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
