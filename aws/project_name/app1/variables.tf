# VPC CIDR blocks
variable "vpc_cidr" {
  default               = "10.7.0.0/24"
}

# private subnet names                                      
variable "private_subnet_names" {
  default 		= 
  [
    "project_name.poc.perimeter.a", 
    "project_name.poc.perimeter.b", 
    "project_name.poc.presentation.a", 
    "project_name.poc.presentation.b", 
    "project_name.poc.logic.a", 
    "project_name.poc.logic.b", 
    "project_name.poc.data.a", 
    "project_name.poc.data.b"
  ]
}

# public subnet names
variable "public_subnet_names" {          
  default 		= []
}                                          

# private subnet CIDR blocks                              
variable "private_subnet_cidr" {           
  default               = 
  [
    "10.7.0.0/27", 
    "10.7.0.32/27", 
    "10.7.0.64/27", 
    "10.7.0.96/27", 
    "10.7.0.128/27", 
    "10.7.0.160/27", 
    "10.7.0.192/27", 
    "10.7.0.224/27"
  ]
} 

# public subnet CIDR blocks
variable "public_subnet_cidr" {            
  default 		= []                             
}

# azs
variable "azs" {
  default = 
  [
    "us-east-1a", 
    "us-east-1b"
    "us-east-1a", 
    "us-east-1b"
    "us-east-1a", 
    "us-east-1b"
    "us-east-1a", 
    "us-east-1b"
  ]
}
