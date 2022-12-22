# Enable Firestore
# resource "google_app_engine_application" "app" {
#   provider = google-beta
#   project = var.project_id
#   location_id = var.region
#   database_type = "CLOUD_FIRESTORE"
# }

resource "google_firestore_document" "destination_adresses" {
  project     = var.project_id
  collection  = "destination_adresses"
  document_id = "google"
  fields      = "{\"destination\":{\"stringValue\":\"https://google.com\"}}"
}