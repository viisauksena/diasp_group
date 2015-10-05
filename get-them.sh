#!/bin/sh
#
# Skript to get Diaspora* 0.4xx Posts that are Limited (private) to a specific user
# identified by number
#
# v. 0.1
#
# where sql is in a specific file
# TODO all this config stuff in seperate config-file, so that changing scriptfile
#      does not effect your values

mysql_u=diaspora
mysql_pw=UrdiasporamysqlPW
mysql_table=diaspora_production
file_sql=getallposts.sql

#
# should look like 
# mysql -udiaspora -pUrdiasporamysqlPW diaspora_production -Bse 'source getallposts.sql'

mysql -u$mysql_u -p$mysql_pw $mysql_table -Bse 'source getallposts.sql' 

# for a different author_id you should change line nr 18 with sed or similar to desired number of getallposts.sql
# > output

