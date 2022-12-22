resource "google_storage_bucket" "function_bucket" {
    name     = "${var.project_id}-function"
    location = var.region
}

resource "google_storage_bucket" "crud_frontend" {
    name     = "${var.project_id}-crud-frontend"
    location = var.region
    website {
      main_page_suffix = "index.html"
      not_found_page   = "index.html"
  }
}


