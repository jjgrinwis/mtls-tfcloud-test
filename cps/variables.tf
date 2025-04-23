variable "organization" {
  description = "HCP Terraform organization name"
  type        = string
}

variable "variable_set" {
  description = "The variable set assigned to our project"
  type        = string
  default     = "TFE"
}
