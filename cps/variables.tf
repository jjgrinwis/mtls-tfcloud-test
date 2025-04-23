variable "organization" {
  description = "HCP Terraform organization name"
  type        = string
}

variable "variable_set" {
  description = "The variable set assigned to our project"
  type        = string
  default     = "TFE"
}

variable "entitlement_id" {
  description = "Our unused entitlement_id to to ignore some warnings as it will be set automatically by a variable set."
  type        = number
}
