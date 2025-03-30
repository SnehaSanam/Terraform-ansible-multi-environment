resource "aws_dynamodb_table" "my_table" {
  name         = "${var.env}-terra-ansible-multi-env-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "userId"  # Ensure that this matches the attribute name

  attribute {
    name = "userId"  # Make sure this matches the hash_key
    type = "S"       # 'S' stands for String
  }

  tags = {
    Name        = "${var.env}-terra-ansible-multi-env-table"
    Environment = var.env
  }
}
