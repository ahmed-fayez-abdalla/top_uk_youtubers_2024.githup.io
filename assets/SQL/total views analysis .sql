DECLARE @conversionRate FLOAT = 0.02;
DECLARE @productCost MONEY = 5.0;
DECLARE @campaignCost MONEY = 130000.0;



WITH ChannelData AS (
    SELECT
        channel_name,
        total_views,
        total_videos,
        ROUND(CAST(total_views AS FLOAT) / total_videos, -4) AS avg_views_per_video
    FROM
        youtube_db.dbo.view_uk_youtubers_2024
)

SELECT
    channel_name,
    avg_views_per_video,
    (avg_views_per_video * @conversionRate) AS potential_units_sold_per_video,
    (avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
    (avg_views_per_video * @conversionRate * @productCost) - @campaignCost AS net_profit
FROM
    ChannelData
WHERE
    channel_name IN ('Mister Max', 'DanTDM', 'Dan Rhodes')
ORDER BY
    net_profit DESC;
