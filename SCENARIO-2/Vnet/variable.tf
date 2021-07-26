variable "subscription-id" {
  type = string
}
variable "client-id" {
  type = string
}
variable "client-secret" {
  type = string
}
variable "tenant-id" {
  type = string
}
variable "test-rg" {
  type = string
}
variable "vnet-location" {
  type = string
}
variable "vnet-name" {
  type = string
}
variable "vnet-address-space" {
  type = list(string)
}
variable "subnet1-name" {
  type = string
}
variable "subnet2-name" {
  type = string
}
variable "subnet1-address-space" {
  type = list(string)
}
variable "subnet2-address-space" {
  type = list(string)
}
variable "nsg-name" {
  type = string
}
