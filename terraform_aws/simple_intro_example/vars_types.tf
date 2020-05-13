variable "my_var" {
  type    = string
  default = "hellow world"
}
# refer to the variables
# var.my_var

variable "my_map" {
  type = map(string)
  default = {
    mykey = "my value"
  }
}
# refer to the variables
# var.my_map["mykey"] or "${var.my_map["mykey"]}"

variable "my_lst" {
  type    = list
  default = [1, 2, 3]
}
# refer to the variables
# var.my_lst[0]
# element(var.my_lst, 0)
# slice(var.my_lst, 0 , 2)

variable "my_bool" {
  type    = bool
  default = true
}

variable "my_num" {
  type    = number
  default = 19
}
