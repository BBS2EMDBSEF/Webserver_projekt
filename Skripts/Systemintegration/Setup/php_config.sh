echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password admin" | debconf-set-selections
echo "admin"
echo "phpmyadmin phpmyadmin/mysql/admin-pass password admin" | debconf-set-selections
echo "admin"
echo "phpmyadmin phpmyadmin/mysql/app-pass password admin" | debconf-set-selections
echo "admin"
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect nginx" | debconf-set-selections

echo "PHP Konfiguration abgeschlossen."