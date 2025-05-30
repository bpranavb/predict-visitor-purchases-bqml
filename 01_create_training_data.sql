#standardSQL
CREATE OR REPLACE VIEW `bqml_lab.training_data` AS
SELECT
  IF(totals.transactions IS NULL, 0, 1) AS label, 
  IFNULL(device.operatingSystem, "") AS os, 
  device.isMobile AS is_mobile, 
  IFNULL(geoNetwork.country, "") AS country,
  IFNULL(totals.pageviews, 0) AS pageviews
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170631'
LIMIT 10000;

