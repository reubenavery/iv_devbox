#!/bin/bash

type -P mysql > /dev/null || {
  echo "ERROR: Percona Server is not installed. Please run 'vagrant provision' again before continuing."
  exit 1
}

type -P drush > /dev/null || {
  echo "ERROR: drush is not installed. Please run 'vagrant provision' again before continuing."
  exit 1
}

/usr/bin/mysql -udrupal_dev -pdrupal_dev -s -e'SELECT 1' > /dev/null 2>&1 || {
  echo "NOTICE: No drupal_dev user exists. Creating it."
  /usr/bin/mysql -uroot -e "CREATE USER 'drupal_dev'@'%' IDENTIFIED BY 'drupal_dev'"
  /usr/bin/mysql -uroot -e "GRANT ALL ON *.* TO 'drupal_dev'@'%'"
  /usr/bin/mysql -uroot -e "CREATE USER 'drupal_dev'@'localhost' IDENTIFIED BY 'drupal_dev'"
  /usr/bin/mysql -uroot -e "GRANT ALL ON *.* TO 'drupal_dev'@'localhost'"
}

if [ -d /opt/ivillage/edit.iv7 ]; then
  /usr/bin/mysql -udrupal_dev -pdrupal_dev -Ddrupal_iv7_dev_edit -s -e'SELECT 1' > /dev/null 2>&1 || {

    echo "NOTICE: Installing the edit site."
    /usr/bin/drush @dev-edit site-install ivillage -y

    echo "NOTICE: Enabling development modules."
    /usr/bin/drush @dev-edit pm-enable devel,devel_generate -y

    echo "NOTICE: Generating dummy users and articles."
    /usr/bin/drush @dev-edit generate-users 10
    /usr/bin/drush @dev-edit generate-content 10 --type=article

    echo "INFO: Content generated. Enjoy!"
  }
fi

if [ -d /opt/ivillage/mps ]; then
    /usr/bin/mysql -uroot -Dmpsdb_mps -s -e'SELECT 1' > /dev/null 2>&1 && {
      echo "INFO: The mpsdb_mps database exists. You should be good to go!"
    } || {
        /usr/bin/mysql -uroot -Dmpsdb_mps -s -e'SELECT 1' > /dev/null 2>&1 || {
            echo "NOTICE: No mpsdb_mps database. Creating it."
            /usr/bin/mysql -uroot -e "CREATE DATABASE mpsdb_mps"
        }

        echo "NOTICE: Creating MPS tables and base data."
        /usr/bin/mysql -uroot -Dmpsdb_mps < /opt/ivillage/mps/deploy/mpsdb.sql
    }
fi
