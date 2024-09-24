
#Same type of company but one row has data and another is blank
SELECT *
FROM layoff_Staging2
WHERE company = 'Airbnb';
#Finding same type of company has different data in same column
SELECT t1.Company, t1.industry, t2.industry
FROM layoff_Staging2  as t1
JOIN layoff_Staging2  as t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry='')
    AND t2.industry IS NOT NULL;

#Updating all the blank to NULL to make update easier and one way for later
UPDATE layoff_Staging2 
SET industry =null
WHERE industry ='';

UPDATE layoff_Staging2  as t1
JOIN layoff_Staging2  as t2
	ON t1.company = t2.company
    SET t1.industry=t2.industry
WHERE t1.industry IS NULL
    AND t2.industry IS NOT NULL;
    





