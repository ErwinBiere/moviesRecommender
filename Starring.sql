ALTER TABLE movies
ADD lexemesStarring tsvector;
UPDATE movies
SET lexemesStarring = to_tsvector(Starring);

ALTER TABLE movies
ADD rankStarring float4;

UPDATE movies
SET rankStarring = ts_rank(lexemesStarring,plainto_tsquery(
(
SELECT Starring FROM movies WHERE url='ice-age-dawn-of-the-dinosaurs'
)
));
CREATE TABLE recommendationsBasedOnStarringField AS SELECT url, rankStarring FROM movies WHERE rankStarring > 0.1 ORDER BY rankStarring DESC LIMIT 50;

\copy (SELECT * FROM recommendationsBasedOnStarringField) to '/home/pi/RSL/top50recommendationsStarring.csv' WITH csv;

