resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-terra-ansible-multi-env"  # Make sure `var.env` is unique or set to something unique

  tags = {
    Name        = "${var.env}-terra-ansible-multi-env"
    Environment = var.env
  }
}
