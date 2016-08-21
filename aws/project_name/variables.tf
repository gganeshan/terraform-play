# VPC CIDR blocks
variable "vpc_cidr" {
  default 		= "10.7.0.0.0/24"
}

# VPC Subnet Names
variable "vpc_subnet_names" {                                
  default 		= {                                           
    "0" 		= "project_name.poc.perimeter.a"     
    "1" 		= "project_name.poc.perimeter.b"     
    "2" 		= "project_name.poc.presentation.a"  
    "3" 		= "project_name.poc.presentation.b"  
    "4" 		= "project_name.poc.logic.a"         
    "5"			= "project_name.poc.logic.b"       
    "6" 		= "project_name.poc.data.a"        
    "7" 		= "project_name.poc.data.b"         
  }                                         
}

# CIDR Blocks                            
variable "vpc_cidr_blocks" {                 
  default 		= {                                 
    "0" 		= "10.7.0.0.0/27"
    "1" 		= "10.7.0.0.32/27"
    "2" 		= "10.7.0.0.64/27"
    "3" 		= "10.7.0.0.96/27"
    "4" 		= "10.7.0.0.128/27"       
    "5" 		= "10.7.0.0.160/27"       
    "6" 		= "10.7.0.0.192/27"        
    "7" 		= "10.7.0.0.224/27"        
  }                                              
}                                                                        
