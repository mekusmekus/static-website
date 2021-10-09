variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "VPC CIDR BLOCK"
    type = string
  
}

variable "pub1-cidr" {
    default = "10.0.0.0/24"
    description = "public subnet 1 cidr"
    type = string
}

variable "pub2-cidr" {
    default = "10.0.1.0/24"
    description = "public subnet 1 cidr"
    type = string
}


variable "priv1-cidr" {
    default = "10.0.2.0/24"
    description = "private subnet 1 cidr"
    type = string
}

variable "priv2-cidr" {
    default = "10.0.3.0/24"
    description = "private subnet 2 cidr"
    type = string
}

variable "priv3-cidr" {
    default = "10.0.4.0/24"
    description = "private subnet 3 cidr"
    type = string
}

variable "priv4-cidr" {
    default = "10.0.5.0/24"
    description = "private subnet 4 cidr"
    type = string
}

variable "ssh-location" {
    default = "0.0.0.0/0"
    description = "IP Address that can ssh "
    type = string

}

variable "database-snapshot-identifier" {
    default = "arn:aws:rds:us-east-1:502034881280:snapshot:myssql-final-snapshot"
    description = "Database Snapshot ARN "
    type = string

}

variable "database-instance-class" {
    default = "db.t3.micro"
    description = "Database Instance Type"
    type = string

}

variable "database-Instance-identifier" {
    default = "myssql"
    description = "Database Instance Identifier"
    type = string

}

variable "multi-az-deployment" {
    default = "false"
    description = "Create a standby database instance"
    type = bool

}





