variable "revision" {
  description = "Our version number"
  type        = number
  default     = 1
}

variable "created_hostnames" {
  description = "Our version number"
  type        = list(string)
  default     = []
}

variable "entitlement_id" {
  description = "Our CPS certificate entitlement_id"
  type        = number
  nullable    = false

  validation {
    condition     = var.entitlement_id > 0
    error_message = "Make sure you have a valid CPS entitlement id. So create certificate before trying to make a property. "
  }
}
