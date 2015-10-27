<VirtualHost *:80>
    RailsEnv production
    ServerName clientsentinel.cl
    ServerAlias *.clientsentinel.cl
    DocumentRoot /home/ubuntu/webapp/public
    <Directory /home/ubuntu/webapp/public>
        AllowOverride all
        Options -MultiViews
    </Directory>
</VirtualHost>