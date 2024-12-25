# Install openldap server
sudo yum install openldap-servers openldap-clients
sudo systemctl enable  slapd
sudo systemctl start  slapd

# Configure manager user and create base entry
# generate password for manager to use it after in ldapadd
slappasswd -s your_password

ldapmodify -Y EXTERNAL -H ldapi:/// <<EOF
dn: olcDatabase={2}mdb,cn=config
changetype: modify
add: olcRootPW
olcRootPW: {SSHA}GMyR1y1jv1oEP2UzQufIHnkDsP6XcLZY
EOF

# Create base entry
ldapadd -x -D "cn=Manager,dc=my-domain,dc=com" -W <<EOF
dn: dc=my-domain,dc=com
objectClass: dcObject
objectClass: organization
dc: my-domain
o: My Organization
EOF
##################################################################################################################
# Install phpldapadmin in apache server
sudo yum update -y
sudo yum install -y httpd php php-xml php-mbstring php-ldap
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install -y wget
wget https://github.com/leenooks/phpLDAPadmin/archive/refs/heads/master.zip
sudo yum install -y unzip
unzip master.zip
sudo mv phpLDAPadmin-master /var/www/html/phpldapadmin
sudo cp /var/www/html/phpldapadmin/.env.testing /var/www/html/phpldapadmin/.env
# populate env variables in .env
sudo chown -R apache:apache /var/www/html/phpldapadmin
sudo chmod -R 755 /var/www/html/phpldapadmin
sudo chmod -R 775 /var/www/html/phpldapadmin/storage

######  INSTALL COMPOSER
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo composer install --ignore-platform-reqs
# To ignore php version requirements
sudo yes | composer install --ignore-platform-reqs
# Install node Compile assets in webpack.mix.js
sudo yum install -y nodejs npm
sudo npm install
sudo npm run dev

# Rerun this
sudo chown -R apache:apache /var/www/html/phpldapadmin
sudo chmod -R 755 /var/www/html/phpldapadmin
sudo chmod -R 775 /var/www/html/phpldapadmin/storage

# add in /etc/httpd/conf.d/phpldapadmin.conf
Alias /phpldapadmin /var/www/html/phpldapadmin/public
<VirtualHost *:80>
  DocumentRoot /var/www/html/phpldapadmin/public
  <Directory /var/www/html/phpldapadmin/public>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
  </Directory>
</VirtualHost>
# then you can access the phpldapadmin app with http://ec2-ip:80
##################################################################################################################
