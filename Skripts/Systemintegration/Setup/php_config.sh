echo "========================================="
echo "PHP Installation"
echo "========================================="

sudo apt install -y phpmyadmin

sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
sudo systemctl restart apache2

echo "phpmyadmin phpmyadmin/dbconfig-install boolean true"
echo "phpmyadmin phpmyadmin/app-password-confirm password admin"
echo "admin"
echo "phpmyadmin phpmyadmin/mysql/admin-pass password admin"
echo "admin"
echo "phpmyadmin phpmyadmin/mysql/app-pass password admin"
echo "admin"
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect nginx"