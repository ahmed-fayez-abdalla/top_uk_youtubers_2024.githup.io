DECLARE @conversionRate FLOAT = 0.02;
DECLARE @productPrice MONEY = 5.0;
DECLARE @campaignCost MONEY = 50000.0;


WITH cte AS (
SELECT 
	channel_name, 
	total_videos, 
	total_views,
	ROUND((CAST(total_views AS FLOAT) / total_videos), -4) AS rounded_avg_views_per_video
FROM view_uk_youtube_2024
)


SELECT 
	channel_name,
	rounded_avg_views_per_video,
	(rounded_avg_views_per_video * @conversionRate) AS rounded_potential_sales,
	(rounded_avg_views_per_video * @conversionRate * @productPrice) AS rounded_potential_revenue,
	((rounded_avg_views_per_video * @conversionRate * @productPrice) - @campaignCost) AS net_profit
FROM cte
WHERE channel_name IN ('NoCopyrightSounds', 'DanTDM', 'Dan Rhodes')
ORDER BY net_profit DESC