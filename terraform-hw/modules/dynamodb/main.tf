resource "aws_dynamodb_table" "user_logins" {
  name           = "user_logins"
  hash_key       = "user_id"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "user_id"
    type = "S"
  }

  attribute {
    name = "login_time"
    type = "S"
  }

  global_secondary_index {
    name               = "LoginTimeIndex"
    hash_key           = "login_time"
    projection_type    = "ALL"
  }


  tags = {
    Name = "User Login Table"
  }
}
