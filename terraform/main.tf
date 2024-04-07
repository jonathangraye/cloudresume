
#lambda role resource

resource "aws_iam_role" "lambda_role" {
 name   = "terraform_aws_lambda_role"
 assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#logging role

resource "aws_iam_policy" "iam_policy_for_lambda" {

  name         = "aws_iam_policy_for_terraform_aws_lambda_role"
  path         = "/"
  description  = "AWS IAM Policy for managing aws lambda role"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

# this attaches the policy to the role - thanks codewhisperer

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role        = aws_iam_role.lambda_role.name
  policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

#zipping function - zips python code to be uploaded

data "archive_file" "zip_python_code" {
    type = "zip"
    source_file = "${path.module}/lambda/counter.py"
    output_path = "${path.module}/lambda/counter.zip"
}


#deploys the lambda function to AWS Lambda, depends on all roles being created otherwise won't run

resource "aws_lambda_function" "counter" {
  filename = "${path.module}/lambda/counter.zip"
  function_name = "terraform_counter"
  role = aws_iam_role.lambda_role.arn
  handler = "counter.lambda_handler"
  runtime = "python3.11"
  depends_on = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]

}
