terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
    region = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "aws_iam_user" "will_user" {
    name = var.name
}

resource "aws_iam_user_policy_attachment" "attach-will_user" {
    user = "${aws_iam_user.will_user.name}"
    policy_arn = var.policy_arns
}