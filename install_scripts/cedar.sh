############
# Hyku
############

echo "Installing Cedar"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

sudo mkdir -p /var/www/cedar
sudo chown -R ubuntu:ubuntu /var/www/cedar

cd $HOME_DIR
git clone https://github.com/uhlibraries-digital/cedar.git
mv $HOME_DIR/cedar/* /var/www/cedar
rm -Rf $HOME_DIR/cedar

cp -f $SHARED_DIR/config/database.yml.mysql /var/www/cedar/config/database.yml
cp -f $SHARED_DIR/config/secrets.yml /var/www/cedar/config/secrets.yml

cd /var/www/cedar
gem install bundler -q
bundle install

bundle exec rake RAILS_ENV=production assets:precompile
bundle exec rake RAILS_ENV=production db:create
bundle exec rake RAILS_ENV=production db:migrate
bundle exec rake RAILS_ENV=production db:seed

sudo service apache2 restart

sudo cp $SHARED_DIR/config/cedar.init /etc/init.d/cedar
sudo chmod 755 /etc/init.d/cedar
sudo update-rc.d cedar defaults
sudo update-rc.d cedar enable
sudo /etc/init.d/cedar start

echo "Done"
