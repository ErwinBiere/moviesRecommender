CREATE TABLE movies(
url text,
title text,
ReleaseDate text,
Distributor text,
Starring text,
Summary text,
Director text,
Genre text,
Rating text,
Runtime text,
Userscore text,
Metascore text,
scoreCounts text);

\copy movies FROM '/home/pi/RSL/moviesFromMetacritic.csv' delimiter ';' csv header;

\copy (SELECT * FROM movies) to '/home/pi/RSL/moviesprint.csv' WITH csv;
