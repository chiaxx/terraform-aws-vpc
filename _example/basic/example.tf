provider "aws" {
  region = "us-west-1"
}
##-----------------------------------------------------------------------------
## VPC Module Call. 
##-----------------------------------------------------------------------------
module "vpc" {
  source                              = "../.."
  name                                = "vpc"
  environment                         = "example"
  cidr_block                          = "10.0.0.0/16"
  enable_flow_log                     = true # Flow logs will be stored in cloudwatch log group. Variables passed in default.
  create_flow_log_cloudwatch_iam_role = true
  additional_cidr_block               = ["172.3.0.0/16", "172.2.0.0/16"]
  dhcp_options_domain_name            = "service.consul"
  dhcp_options_domain_name_servers    = ["127.0.0.1", "10.10.0.2"]
}
