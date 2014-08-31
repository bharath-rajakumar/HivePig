REGISTER /home/004/b/bx/bxr121630/PigUDF2/pig_udf.jar;

A = LOAD '/HW_3_Data/movies_new' using PigStorage(';') as (movie_id: chararray, name: chararray, genre: chararray);
B = FOREACH A GENERATE movie_id, name, GENRE_FORMAT(genre);
C = LIMIT B 10;
STORE C INTO 'pig-udf';
