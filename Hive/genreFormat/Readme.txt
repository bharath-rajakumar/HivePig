1. Compile the java class file 

javac -cp /usr/local/hive-0.9.0/lib/hive-serde-0.9.0.jar:/usr/local/hive-0.9.0/lib/hive-exec-0.9.0.jar:/usr/local/hadoop-1.0.4/hadoop-core-1.0.4.jar Genre_Format.java

2. Create the jar file

jar -cf Genre_Format.jar Genre_Format.class

3. Add the jar file to hive

hive> add jar Genre_Format.jar;

4. Create a temporary function

create temporary function genre_format as 'Genre_Format';

5. Execute the query

hive> select movieid, moviename,Genre_Format(genre) from movies LIMIT 10;