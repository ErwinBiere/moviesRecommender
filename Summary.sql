ALTER TABLE movies
ADD lexemesSummary tsvector;
UPDATE movies
SET lexemesSummary = to_tsvector(Summary);

ALTER TABLE movies
ADD rankSummary float4;

UPDATE movies
SET rankSummary = ts_rank(lexemesSummary,plainto_tsquery(
(
SELECT Summary FROM movies WHERE url='ice-age-dawn-of-the-dinosaurs'
)
));
CREATE TABLE recommendationsBasedOnSummaryField AS SELECT url, rankSummary FROM movies WHERE rankSummary > 0.1 ORDER BY rankSummary DESC LIMIT 50;

\copy (SELECT * FROM recommendationsBasedOnSummaryField) to '/home/pi/RSL/top50recommendationsSummary.csv' WITH csv;

