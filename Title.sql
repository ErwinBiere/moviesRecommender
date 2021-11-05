ALTER TABLE movies
ADD lexemesTitle tsvector;
UPDATE movies
SET lexemesTitle = to_tsvector(Title);

ALTER TABLE movies
ADD rankTitle float4;

UPDATE movies
SET rankTitle = ts_rank(lexemesTitle,plainto_tsquery(
(
SELECT title FROM movies WHERE url='ice-age-dawn-of-the-dinosaurs'
)
));
CREATE TABLE recommendationsBasedOnTitleField AS SELECT url, rankTitle FROM movies WHERE rankTitle > -1 ORDER BY rankTitle DESC LIMIT 50;

\copy (SELECT * FROM recommendationsBasedOnTitleField) to '/home/pi/RSL/top50recommendationsTitle.csv' WITH csv;

