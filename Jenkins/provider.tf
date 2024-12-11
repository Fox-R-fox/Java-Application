terraform {
  required_providers {
    aws =  {
        source = "hashicorp/aws"
        version = "~> 5.0"
      
    }
  }


backend "s3" {
    bucket = "flappybird-terraform-state"
    key = "jenkins/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region = "us-east-1"
}
}

resource "aws_dynamodb_table" "tf_lock" {
    name = "terraform-lock"
    hash_key = "LockID"
    read_capacity = 3
    write_capacity = 3

    attribute {
      name = "LockID"
      type = "S"
    }
  tags = {
    Name = "Terraform Lock Table"
  }
  lifecycle {
    prevent_destroy = true
  }
}