# Jira Assignment #3.
<p align="justify">
<b>Goal</b> : build Wordpress webserver infrastructure.
  
<b>Structure</b> : 2 Tier Application, where 1st Tier is a Webserver and Application and 2nd Tier is Database server.

Tool used for creating infrastructure : <b>Terraform</b>
  
6 modules: Root module (Main module), VPC module, Public network module, EC2 module, Private Network Module and Database Module.  

The purpose is to seperate the Database infrastructure apart from the public network

Some key components used: Database Subnet group(3 private subnets), DB SG has security ingress/egress rule targeting EC2 SG : port 3306 (255.255.255.255/32).   
The SSH port for Wordspress EC2 is opened to any location(0.0.0.0/0) for demonstrating purposes, and has to be set to /MyIP option after launch.  
</p>

In this demo I used **RDS DB** with configurations below:  
**RDS MYSQL**  
ver: *8.0.35*  
type: *db.t3.micro*  
storage : *20GB*  
Multi AZ - *no* (Free Tier)  - to allow replica and Standby DB, this option needs to be changed to "true"(However, Multi AZ option is not free Tier)  
Database Subnet Group - *yes (3 Private Subnets)*  

For Wordpress' Webserver and Application server I used:  
**AMZ EC2**  
Public IP - *yes*  
DNS Hostname - *yes*  
Type : *t2.micro*  
AMI : *AMZ Linix 2 AMI (HVM)*  
Data resource for autoupdate - *yes*  

Webserver: **httpd (Apache)**  
Application: **Wordpress**

## How to Access Wordpress DB:
**sudo yum install -y mysql**  
**export MYSQL_HOST=your-endpoint**   
**mysql --user=admin --password=adminadmin wordpress**

## How to deploy Wordpress :  
**1.sudo yum install -y httpd**  
**2.sudo service httpd start**  
**3.wget https://wordpress.org/latest.tar.gz**  
**4.tar -xzf latest.tar.gz**  
**5.cd wordpress**  
**6.cp wp-config-sample.php wp-config.php**  
**7.vi wp-config.php**

**8.Edit the database configuration by changing the following lines:**  

// ** MySQL settings - You can get this info from your web host ** //  
/** The name of the database for WordPress */  
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */  
define( 'DB_USER', 'admin' );  

/** MySQL database password */  
define( 'DB_PASSWORD', 'adminadmin' );

/** MySQL hostname */  
define( 'DB_HOST', 'localhost' );  #copy-paste endpoint for localhost located in RDS DB tab - configuration menu


**9.The second configuration section you need to configure is the Authentication Unique Keys and Salts. It looks as follows in the configuration file:**  
/**#@+
 * Authentication Unique Keys and Salts.  
 *
 * Change these to different unique phrases!  
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}  
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.  
 *  
 * @since 2.6.0  
 */  
define( 'AUTH_KEY',         'put your unique phrase here' );  
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );  
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );  
define( 'NONCE_KEY',        'put your unique phrase here' );  
define( 'AUTH_SALT',        'put your unique phrase here' );  
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );  
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );  
define( 'NONCE_SALT',       'put your unique phrase here' );  

Go to this link to generate values for this configuration section. You can replace the entire content in that section with the content from the link.
https://api.wordpress.org/secret-key/1.1/salt/

**10.sudo amazon-linux-extras install -y mariadb10.5 php8.2**  
**11.cd /home/ec2-user**  
*12.sudo cp -r wordpress/* /var/www/html/*  
**13.sudo service httpd restart**  
**14.copy-paste your dns hostname in the browser, login with credentials: admin, adminadmin**

Mysql and httpd are preinstalled and enabled through userdata.  
To ensure everything installed properly run: **sudo cat /var/log/cloud-init-output.log** after running Terraform apply

<img width="741" alt="Screenshot 2024-10-11 at 11 42 56 PM" src="https://github.com/user-attachments/assets/285c794a-b421-46a6-ad47-b49ae55c5c77">
