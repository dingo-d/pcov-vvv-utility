#!/usr/bin/env bash

# Check if the extension exists and is set up
php -m | grep pcov -q

if [ $? -eq 0 ]; then
  echo "PCOV is already set up."
else
  echo "Setting up pcov extension"

  git clone https://github.com/krakjoe/pcov.git
  cd pcov
  phpize
  ./configure --enable-pcov

  make
  make test
  make install

  # Find php.ini and add the extension
  echo "Enabling the pcov extension in the php.ini"
  INI_PATH=$(php -i | grep /.+/php.ini -oE)

  echo "extension=pcov.so" >> $INI_PATH
  echo "pcov.enabled=1" >> $INI_PATH
fi

