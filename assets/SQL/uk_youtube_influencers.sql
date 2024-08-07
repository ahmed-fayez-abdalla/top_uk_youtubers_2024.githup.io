/* Selecting The needed Columns */

SELECT
      NOMBRE
      ,total_subscribers
      ,total_views
      ,total_videos
  FROM top_uk_youtube_influencers;

/* Extracting The Channel Name From NOMBRE */

SELECT
	CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE)-2) AS VARCHAR(50)) as channel_name
	,total_subscribers
    ,total_views
    ,total_videos
  FROM top_uk_youtube_influencers;

/* Create A View For BI Tool */

CREATE VIEW view_uk_youtube_2024 AS

SELECT
	CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE)-2) AS VARCHAR(50)) as channel_name
	,total_subscribers
    ,total_views
    ,total_videos
  FROM top_uk_youtube_influencers;

-- Show The View Table

SELECT
	channel_name
	,total_subscribers
    ,total_views
    ,total_videos
  FROM view_uk_youtube_2024;

/* Testing The Data */

-- 1- Testing That There are 100 Rows

SELECT COUNT(*) as no_of_rows 
	FROM view_uk_youtube_2024;

-- 2- Testing That There Is No Duplicates In The Data

SELECT channel_name 
	, COUNT(*) AS no_of_channel
	FROM view_uk_youtube_2024
	GROUP BY channel_name
	HAVING COUNT(*) > 1;

-- 3- Testing That There Are 4 Columns In The View Table 

SELECT COUNT(*) AS ColumnCount
	FROM information_schema.columns
	WHERE table_name = 'view_uk_youtube_2024';

-- 4- Testing The Data Types For The Columns

SELECT COLUMN_NAME, DATA_TYPE
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'view_uk_youtube_2024';