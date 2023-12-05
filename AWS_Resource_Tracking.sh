#!/bin/bash

#########################################

# Author : Manmeet Singh
# Date: 17th August
#
# Version: v1
#
# This script will report the AWS resource usage.

#########################################

# Resources I am going to track:
# AWS EC2
# AWS IAM users
# AWS Load Balancer
# AWS Route53
# AWS S3

#list S3 bucket

echo " Below is the list of S3 buckets " > resources.txt

aws s3 ls >> resources.txt



#list EC2 instances

echo " Below is the list of Ec2 instances " >> resources.txt

aws ec2 describe-instances >> resources.txt

#
#
#
#
#
echo " Ec2 Instance IDs after JSON parsing " >> resources.txt

aws ec2 describe-instances| jq '.Reservations[].Instances[].InstanceId' >> resources.txt

#
#
#
#
#

#list IAM users

echo " Below is the list of users " >> resources.txt

aws iam list-users >> resources.txt

#
#
#
#
#
#List Route53 Hosted Zones

echo " Below is a list of the public and private hosted zones that are associated with the current Amazon Web Services account " >> resources.txt

aws route53 list-hosted-zones >> resources.txt

#
#
#
#
#
#
# List Elastic Load Balancer

echo " Lists Load balancers. If no load balancer is specified, it lists all Load balancers " >> resources.txt

aws elbv2 describe-load-balancers >> resources.txt
