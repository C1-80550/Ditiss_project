resource "aws_s3_object" "index"{
	bucket = "c180471-ditiss-project2"
	key = "index.html"
	source = "index.html"
	acl = "private"
	content_type = "text/html"
	server_side_encryption = "AES256"


}

resource "aws_s3_object" "error" {
	bucket = "c180471-ditiss-project2"
	key = "error.html"
	source = "error.html"
	acl = "private"
	content_type = "text/html"
	server_side_encryption = "AES256"
	
}
resource "aws_s3_object" "dashboard" {
	bucket = "c180471-ditiss-project2"
	key = "dashboard.html"
	source = "dashboard.html"
	acl = "private"
	content_type = "text/html"
	server_side_encryption = "AES256"
	
}

resource "aws_s3_object" "image" {
	bucket = "c180471-ditiss-project2"
	key = "shinichi.jpeg"
	source = "shinichi.jpeg"
	acl = "private"
	content_type = "image/jpeg"
	server_side_encryption = "AES256"

}
resource "aws_s3_object" "pngas" {
	bucket = "c180471-ditiss-project2"
	key = "ditiss.png"
	source = "ditiss.png"
	acl = "private"
	content_type = "image/png"
	server_side_encryption = "AES256"

}

resource "aws_s3_object" "style" {
	bucket = "c180471-ditiss-project2"
	key = "style.css"
	source = "style.css"
	acl = "private"
	content_type = "text/css"
	server_side_encryption = "AES256"

}


resource "aws_s3_object" "script" {
	bucket = "c180471-ditiss-project2"
	key = "script.js"
	source = "script.js"
	acl = "private"
	content_type = "text/javascript"
	server_side_encryption = "AES256"

}

resource "aws_s3_bucket_website_configuration" "website" {
	bucket = "c180471-ditiss-project2"
	index_document {
		suffix = "index.html"
		}
	
	error_document {
		key = "error.html"
		}
	depends_on = [
		aws_s3_object.index,
		aws_s3_object.error,
		aws_s3_object.style,
		aws_s3_object.script
		]

}