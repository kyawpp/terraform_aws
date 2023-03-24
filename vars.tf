variable "AWS_ACCESS_KEY" {
  
}
variable "AWS_SECRET_KEY" {
  
}
variable "AWS_REGION" {
  default="us-east-2"
}
variable "AMIS" {
  default ={
    us-east-2="ami-01d80f6504669ea91",
    ap-southeast-1="ami-07ef7933c011a38e"
  }
}
variable "INSTANCE_USER_NAME" {
  default = "ubuntu"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
