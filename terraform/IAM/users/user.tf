###### location ########

provider "aws" {
    region = var.region
}
####### create new users ######

resource "aws_iam_user" "newusers" {
    count = length(var.username)
    name  = element(var.username,count.index)
}

resource "aws_iam_user_policy_attachment" "ec2_full_access" {
    count = length(var.username)
    user  = element(aws_iam_user.newusers.*.name, count.index)
    policy_arn = aws_iam_policy.ec2_full.arn
}
	
  
