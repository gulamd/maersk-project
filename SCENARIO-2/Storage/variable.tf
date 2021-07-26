variable "storage-account-name" {
  default = "stgflecqanew"
}

variable "stg-location" {
  default = "uksouth"
}

variable "account-tier" {

  default = "Standard"
}

variable "account-replication-type"{
  default = "GRS"
}

variable "account-kind"{
  default = "BlobStorage"

}
variable "client-id" {
    default = "************************************"
variable "client-secret" {
    default = "************************************"

}
variable "subscription-id" {
    type  = string
    default = "************************************"
}
variable "tenant-id" {
    type = string
    default = "************************************"
}
