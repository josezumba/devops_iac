variable "cluster_name" {
  description = "El nombre del cluster AKS"
  default     = "clusterdevops"
}
variable "env_name" {
  description = "Ambiente del cluster AKS"
  default     = "dev"
}
variable "instance_type" {
  description = "Tipo de instancia"
  default = "standard_d2_v2"
}
