############
# Greens
############

echo "Installing Greens"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

sudo mkdir -p /var/www/greens
sudo mkdir /var/www/greens/tmp
sudo chown -R ubuntu:ubuntu /var/www/greens

cd $HOME_DIR
git clone https://github.com/uhlibraries-digital/greens.git
mv $HOME_DIR/greens/* /var/www/greens
rm -Rf $HOME_DIR/greens

cp -f $SHARED_DIR/config/greens_database.yml.mysql /var/www/greens/config/database.yml
cp -f $SHARED_DIR/config/secrets.yml /var/www/greens/config/secrets.yml
cp -f $SHARED_DIR/config/greens_app.yml.sample /var/www/greens/config/app.yml

cd /var/www/greens
gem install bundler -q
bundle install

bundle exec rake RAILS_ENV=production db:migrate

sudo cp -f $SHARED_DIR/config/greens.conf /etc/apache2/sites-available/greens.conf
sudo a2ensite greens

sudo service apache2 restart

echo "Done"
