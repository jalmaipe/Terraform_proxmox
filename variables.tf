# variables.tf

variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "target_node" {
  description = "Proxmox node name (e.g., proxmox)"
  type        = string
}

variable "template_name" {
  description = "Name of the Proxmox VM template to clone"
  type        = string
}

variable "vm_name" {
  description = "Name of the new VM"
  type        = string
}

variable "vm_memory" {
  description = "Memory (RAM) in MB"
  type        = number
  default     = 2048
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

