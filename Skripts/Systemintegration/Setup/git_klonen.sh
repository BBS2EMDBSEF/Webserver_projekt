cd /home/

if [ -d "/home/Webserver_projekt.git" ]; then
    echo "Das Repository wurde bereits geklont."
else
    git clone https://github.com/BBS2EMDBSEF/Webserver_projekt.git /home/
fi

git pull origin main