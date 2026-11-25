variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure resource location"
  type        = string
  default     = "westus3"
}

variable "student_name" {
  description = "Student name for resource naming"
  type        = string
}