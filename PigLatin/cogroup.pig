A = LOAD '/HW_3_Data/movies_new' USING PigStorage(';') AS (movie_id:int,name:chararray,genre:chararray);
B = LOAD '/HW_3_Data/ratings_new' USING PigStorage(';') AS(user_id:int,movie_id:int,ratings:int,timestamp:int);
C = COGROUP A BY movie_id inner, B BY movie_id inner; 
STORE C INTO 'cogroup_out';