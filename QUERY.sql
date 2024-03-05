/****** Script for SelectTopNRows command from SSMS  ******/

-- Hello, lets analyse this dataset from Kaggle!

-- count of manufacturers that participated in the study
SELECT COUNT(DISTINCT company_manufacturer) FROM dbo.chocolate

-- in which years the study was performed
SELECT DISTINCT review_date FROM dbo.chocolate
ORDER BY review_date DESC

-- how many reviews were made in each year
SELECT 
COUNT(*) AS [count of reviews]
,review_date  
FROM dbo.chocolate
GROUP BY review_date 

-- countries where the chocolate beans came from
SELECT DISTINCT country_of_bean_origin FROM dbo.chocolate


-- INTERESTING INSIGHT FOR VISUALISATIONS

-- where the best cocoa bean comes from?
SELECT COUNT(*) AS [count of reviews], 
country_of_bean_origin 
FROM dbo.chocolate 
WHERE rating = '4' 
GROUP BY country_of_bean_origin  
ORDER BY 1 DESC

-- what cocoa % participation in chocolate was rated the highest?
SELECT 
COUNT(*), 
cocoa_percent
FROM dbo.chocolate 
WHERE rating = '4' 
GROUP BY cocoa_percent 
ORDER BY 1 DESC

-- what rating was given most often?
SELECT 
COUNT(*),
rating 
FROM dbo.chocolate 
GROUP BY rating 
ORDER BY 1 DESC

-- what was the average rating generally
SELECT 
ROUND(AVG(cast(rating AS float)),2) AS [average rating]
FROM dbo.chocolate 

-- what was the average rating per bean origin according to the surver
SELECT 
ROUND(AVG(cast(rating AS float)),2) AS [average rating]
,country_of_bean_origin 
FROM dbo.chocolate 
GROUP BY country_of_bean_origin 
ORDER BY 1 DESC

-- which manufacturer was rated the best?
SELECT
ROUND(AVG(cast(rating AS float)),2) AS [average rating]
,company_manufacturer
FROM dbo.chocolate
GROUP BY company_manufacturer
ORDER BY 1 DESC

-- for better analysis purposes I updated one record
/*UPDATE dbo.chocolate
SET country_of_bean_origin = 'Congo'
WHERE country_of_bean_origin = 'DR Congo'*/

-- I connected Power Bi with code below

SELECT *,
CASE WHEN cocoa_percent >= 0.90 THEN '90-100%'
WHEN cocoa_percent < 0.90 AND cocoa_percent >= 0.80 THEN '80-89%'
WHEN cocoa_percent < 0.80 AND cocoa_percent >= 0.70 THEN '70-79%'
WHEN cocoa_percent < 0.70 AND cocoa_percent >= 0.60 THEN '60-69%'
WHEN cocoa_percent < 0.60 AND cocoa_percent >= 0.50 THEN '50-59%'
WHEN cocoa_percent < 0.50 AND cocoa_percent >= 0.40 THEN '40-49%'
WHEN cocoa_percent < 0.40 AND cocoa_percent >= 0.30 THEN '30-39%'
WHEN cocoa_percent < 0.30 AND cocoa_percent >= 0.20 THEN '20-29%'
WHEN cocoa_percent < 0.20 AND cocoa_percent >= 0.10 THEN '10-19%'
WHEN cocoa_percent < 0.10 AND cocoa_percent >= 0.00 THEN '00-09%'
ELSE '0' END AS [percent_simple]
FROM [Chocolate].[dbo].[chocolate]













