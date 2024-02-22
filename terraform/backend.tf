terraform {
  backend "s3" {
    bucket = "c180471-ditiss-project2"
    key = "myterraformenvironment/main"
    region = "ap-south-1"
    dynamodb_table = "stnnt-lock"
    
  }
}