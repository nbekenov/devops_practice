variable "alarms_email" {
  default = "example.com"
}

variable "instance_id_lst" {
  type    = list
  default = ["i-my_instance_id", "i-my_instance_id2"]
}

variable "instance_name" {
  type    = list
  default = ["server_1", "server_2"]
}

variable "instance_maps" {
  type = map
  default = { 0 = ["server1", "id-instanceid1"],
    1 = ["server2", "id-instanceid2"]
  }
}