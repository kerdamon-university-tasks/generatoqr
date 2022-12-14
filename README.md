# generatoqr

Project for creating dynamic QR codes. (content of QR code can change after if was created withouth changing code)

## How it works

Normally when QR code is created there is no option to change http address associated with this QR code (when address changes, QR changes too). But there is the possibility of redirection to other sites, which can already be dynamically controlled even after creation of QR code. In this project, codes are created that lead to a blank page that redirects to the appropriate one, which can be changed at a later time.

## Usage

### Using redirections

Main use case is providing endpoints with empty pages that redirects to other http addresses.

### Managing QR codes

Applications allows to create QR code and set the page it leads to.

## Infrastructure

Project is deployed in GCP using terraform.

