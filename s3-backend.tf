/* 
# Create an S3 bucket to store Terraform state files
resource "aws_s3_bucket" "terraform_state" {
    bucket = "my-terraform-state-bucket-keiincloud" # Change this to a unique bucket name

    versioning {
        enabled = true
    }

    tags = {
        Name = "my-terraform-state-bucket-keiincloud"
    }
}

# Create a DynamoDB table for state locking and consistency
resource "aws_dynamodb_table" "terraform_locks" {
    name         = "terraform-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name = "terraform-locks"
    }
}

# Configure the backend to use the S3 bucket and DynamoDB table
terraform {
    backend "s3" {
        bucket         = "my-terraform-state-bucket-keiincloud" # Change this to your bucket name
        key            = "terraform.tfstate"
        region         = "eu-west-1"
        dynamodb_table = "terraform-locks"
    }
}
*/