# generatoqr

Project for creating dynamic QR codes. (content of QR code can change after if was created withouth changing code)

## How it works

Normally when QR code is created there is no option to change http address associated with this QR code (when address changes, QR changes too). But there is the possibility of redirection to other sites, which can already be dynamically controlled even after creation of QR code. In this project, codes are created that lead to a blank page that redirects to the appropriate one, which can be changed at a later time.

## Usage

### Using redirections

Main use case is providing endpoints with empty pages that redirects to other http addresses. Redirection endpoint: https://europe-central2-generatoqr.cloudfunctions.net/scan-function/{id}, where id is id of created QR code.

### Managing QR codes

Applications allows to create QR code and set the page it leads to. Management endpoint: https://europe-central2-generatoqr.cloudfunctions.net/crud-function. 

Parameters:
`id` - Specifies identifier of QR code. This changes QR code, so it appearance depends on its id.
`destination_address` - Specifies resulting address that dynamic QR code will lead to. This parameter does not affect the appearance of QR code.

#### Creating new RQ code

Creation endpoint: https://europe-central2-generatoqr.cloudfunctions.net/crud-function. This URL leads to forms where id and destination address can be specified. Alternatively code can be created using POST method to this URL with body parameters `{"id": "string id", "destination_address": "Address that QR code leads to"}`

#### Updating existing QR code

QR codes are updated in the same way they are created. New code simply overrides old one.

#### Generating QR code

Endpoint: https://europe-central2-generatoqr.cloudfunctions.net/crud-function/{id}, where `id` is id of QR code. This endpoint redurns html page  with QR code generated on js canvas.

## Infrastructure

Project is deployed in GCP using terraform.

