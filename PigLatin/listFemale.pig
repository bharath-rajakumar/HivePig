A = LOAD '/HW_3_Data/movies_new' USING PigStorage(';') AS (movie_id:int,name:chararray,genre:chararray);

filter_action_war = FILTER A BY (genre MATCHES '.*Action.*' AND genre MATCHES '.*War.*');

B = LOAD '/HW_3_Data/ratings_new' USING PigStorage(';') AS(user_id:int,movie_id:int,ratings:int,timestamp:int);

movie_rating = JOIN filter_action_war BY $0, B BY $1;

C = FOREACH movie_rating generate $0,$1,$2,$5;

by_movie = GROUP C BY ($0);

avg_rating = FOREACH by_movie GENERATE group, AVG(C.$3) AS average;

group_avg = GROUP avg_rating BY average;

order_desc = ORDER group_avg BY $0 DESC;

top_movies = LIMIT order_desc 1;

Y = FOREACH top_movies GENERATE FLATTEN (avg_rating);

D = LOAD '/HW_3_Data/users_new' USING PigStorage(';') AS(user_id:int,gender:chararray,age:int,occupation:int,zipcode:int);

female_users = FILTER D BY (age >= 20 AND age <= 30) AND (gender MATCHES 'F');

female_movie_rating = JOIN female_users BY $0, B BY $0;

R = FOREACH female_movie_rating GENERATE $0,$1,$2,$6;

final_join = JOIN R by $3, Y by $0;

dump final_join;