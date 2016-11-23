
scripts_dir="../scripts/"

echo "-------------------------------------------------------------------" >>log.txt 
echo "---------New Script Run--------------------------------------------" >>log.txt 
echo "-------------------------------------------------------------------" >>log.txt 

if [ -f dirty_transaction ]; then
  echo "Potentially incomplete transaction, read log.txt and fix the issue!"
  exit 1
fi

psql demodb -f engine-db-scripts/create-shema-version-table.sql &>>log.txt

current_version=`psql demodb --quiet --no-align -f engine-db-scripts/get-schema-version.sql | sed -n 2p`
# the above return the result as second line, but when there are no rows in result set, then the second line has already the number of rows in result set i.e. 0 rows
echo $current_version | grep row && current_version=-1 && echo "No current version number... using -1" >> log.txt
echo "current_version=$current_version" >> log.txt

ls $scripts_dir | \
while read file_name; do
  file_number=`echo $file_name | sed 's/\([0-9]*\).*/\1/'`
  if [[ -z "${file_number// }" ]]; then echo "no more numbered scripts..." && exit 0
  fi
  if [ "$file_number" -gt "$current_version" ] ; then
      if [ -f dirty_transaction ]; then
        echo "Potentially incomplete transaction, read log.txt and fix the issue!"
        exit 1
      fi
      echo "$file_number > $current_version executing $file_name"
      touch dirty_transaction
      INSERT_SQL="insert into schema_version values($file_number);"
      echo "executing $file_name" >> log.txt
      psql demodb -v "ON_ERROR_STOP=1" -f $scripts_dir/$file_name &>> log.txt && \
      echo "execution succeeded - updating db schema number" >> log.txt && \
      current_version=$file_number && \
      echo $INSERT_SQL &>>log.txt && \
      psql demodb -v "ON_ERROR_STOP=1" -c "$INSERT_SQL" &>>log.txt && \
      psql demodb -f engine-db-scripts/delete-from-schema-version.sql &>>log.txt && \
      echo "schema number succesfully updated in db" >> log.txt && \
      rm dirty_transaction
   else
      echo "$file_number =< $current_version skipping $file_name"
   fi
done

