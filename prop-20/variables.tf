// this variable should be provided via a variable set in HCP Terraform.
variable "entitlement_id" {
  description = "Our CPS certificate entitlement_id"
  type        = number
  nullable    = false

  validation {
    condition     = var.entitlement_id > 0
    error_message = "Make sure you have a valid CPS entitlement id. So create certificate before trying to make a property. "
  }
}

variable "hostnames" {
  description = "Hostname we're going to create."
  type        = list(string)
  default     = []
}
