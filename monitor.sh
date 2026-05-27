#!/bin/bash

#set -x  #debug mode
#Author:ridhinaws@gmail.com
#Date:27/May/2026
#############################
#Version:V1
############################
#This script will report the AWS resource usage.
############################
#Resources:
#AWS S3
#AWS ec2
#AWS Lambda
#AWS IAM Users
###########################

echo "Date and Time"
echo
date
echo

#List of S3 buckets

echo "List of S3 Buckets"
aws s3 ls

#List of ec2 Instances

echo "List of ec2 InstanceId"
aws ec2 describe-instances --region ap-south-1  | jq .Reservations[].Instances[].InstanceId

echo "PublicIP"
aws ec2 describe-instances --region ap-south-1 | jq .Reservations[].Instances[].PublicIpAddress

echo "MAC Address"
aws ec2 describe-instances --region ap-south-1 | jq .Reservations[].Instances[].NetworkInterfaces[].MacAddress
#List of Lambda functions

echo "List of Lambda functions"
aws lambda list-functions --region ap-south-1

#List of IAM Users

echo "List of IAM Users"
aws iam list-users

echo "###CPU Usage###"
echo
top -bn1 | grep "Cpu(s)";
echo

echo "###Memory Usage###"
echo
free -h
echo

echo "###Disk Usage###"
echo
df -h
echo

#END

