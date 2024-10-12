### Jira Assignment #3.
<p align="justify">
**Goal** : build an Wordpress webserver infrastructure.
**Structure** : 2 Tier Application, where 1st Tier is a Webserver and Application and 2nd Tier is Database server.
Tool used for creating infrastructure : **Terraform**
Split 2 Tiers into 2 modules: Main module (containing Network and Public components) and Child Module containing Database and all Private network components(such as - SG, RT, subnets etc)
The purpose is to seperate the Database infrastructure apart from the public

Some key components used: Subnet group(3 private subnets), DB SG has security rule to EC2 SG with port 3306.    
The SSH port to Wordspress is opened to any location for demonstrating purposes, and has to be set to certain IP or /MyIP option.  
</p>
In this demo I used **RDS DB** with configurations below:  
**RDS MYSQL**  
ver: *8.0.35*  
type: *db.t3.micro*  
storage : *20GB*  
Multi AZ - *no* (Free Tier)  
Database Subnet Group - *True (3 Private Subnet)*  

For Wordpress' Webserver and Application I used:  
**AMZ EC2**  
Public IP - *yes*  
DNS Hostname - *yes*  
Type : *t2.micro*  
AMI : *AMZ Linix 2 AMI (HVM)*  
Data resource for autoupdate - *yes*  




<img width="741" alt="Screenshot 2024-10-11 at 11 42 56 PM" src="https://github.com/user-attachments/assets/285c794a-b421-46a6-ad47-b49ae55c5c77">
