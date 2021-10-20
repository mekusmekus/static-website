variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "vpc cidr block"
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
    default = ""
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

variable "endpoint-email" {
    default = "
    description = "Email to recieve sns notification"
    type = string

}


variable "ssl-certificate-arn" {
    default = "arn:aws:acm:us-east-1:502034881280:certificate/337685c0-ec6c-4367-bce2-93edf9c96c82"
    description = "ssl certficate arn"
    type = string

}

variable "PATH_TO_PRIVATE_KEY" {

    default = "mykeypair"

 }

 variable "PATH_TO_PUBLIC_KEY" {

    default = "mykeypair.pub"

 }

 variable "INSTANCE_USERNAME" {
     default = "linux"
   
 }




