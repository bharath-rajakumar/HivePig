HivePig
=======

CS6301 - Big data - Assignment III Pig Latin, Hive &amp; UDFs

###Pig Latin
---

- `listFemale` - to list the unique userid of female users whose age between 20 - 30 and  who have rated the highest rated Action and War movies

- `cogroup` - cogroup command on MovieID for the datasets ratings_new and movies_new 

- `flatten` - to implement join using cogroup and flatten

- `genreFormat` - a Pig UDF(User Define Function) which basically formats the genre in movies_new in the following:

```
Before formatting:		Children's
After formatting:		Children's

Before formatting:		Animation|Children's
After formatting:		Animation, and Children's

Before formatting:		Adventure|Animation|Children's
After formatting:		Adventure, Animation, and Children's
```

###Hive
---

- `actionTop10` - to find top 10 average rated "Action" movies with descending order of rating

- `actionDrama` - to list all the movies with its genre where the movie genre is Action or Drama and the average movie rating is in between 4.4 - 4.7 and only the male users rate the movie

- `partition` - to create one table partitioned by year, load data from local unix directory (specified in the dataset) using three insert commands, a Hive query that selects all columns from the table for the virtual column year of 2009.

- `multipleInsert` - to create three tables that have three columns each (MovieID, MovieName, Genre). Each table represents a year. The three years are 2009, 2010 and 2011. Insert values from the table you created in `partition` to these three tables using Hive multi-table insert.

- `genreFormat` -  a Hive UDF(User Define Function) which basically formats the genre in movies_new in the following:

```
Before formatting:		Children's
After formatting:		Children's

Before formatting:		Animation|Children's
After formatting:		Animation, and Children's

Before formatting:		Adventure|Animation|Children's
After formatting:		Adventure, Animation, and Children's
```
