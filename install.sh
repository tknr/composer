#!/bin/bash -x

## https://getcomposer.org/download/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

chmod +x composer.phar
ln -s `pwd`/composer.phar /usr/local/bin/composer

## 光遅い問題に対応して Composer を100倍速くする - Qiita https://qiita.com/bezeklik/items/f9bc7afc229b5476e822
composer config -g repos.packagist composer https://packagist.jp
composer global require hirak/prestissimo




