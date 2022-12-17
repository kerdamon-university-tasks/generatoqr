resource "google_storage_bucket" "function_bucket" {
    name     = "${var.project_id}-function"
    location = var.region
}

resource "google_storage_bucket" "qr_codes_bucket" {
    name     = "${var.project_id}-qr-codes"
    location = var.region
}
