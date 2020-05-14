variable "alarms_email" {
}

variable "instance_id_lst" {
  type    = list
  default = ["i-my_instance_id", "i-my_instance_id2"]
}

variable "instance_name" {
  type    = list
  default = ["server_1", "server_2"]
}