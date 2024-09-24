#Deleting unnecessary row and column

#Finding and deleting unnecessary row where important column is blank
SELECT *
FROM layoff_Staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoff_Staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

#Delete unwanted column
ALTER TABLE layoff_Staging2
DROP COLUMN row_num;

SELECT *
FROM layoff_Staging2;

#### Data clening done ####
