SELECT *
FROM layoff_Staging2

##Trim all the column to remove space

UPDATE layoff_Staging2
SET COMPANY = TRIM(Company),
	Industry = TRIM(Industry),
    Location = TRIM(Location),
	Country = TRIM(Country);

##Same type of things with different name/ Updating this for removing unique

#Finding same type of names
SELECT distinct COUNTRY
FROM layoff_Staging2
order by 1;

#Updating names
UPDATE layoff_Staging2
SET INDUSTRY ='Crypto'
WHERE Industry LIKE 'CRYPTO%';

##Removing .(dot) from the name
UPDATE layoff_Staging2
SET COUNTRY= TRIM(TRAILING '.' FROM COUNTRY)
WHERE COUNTRY LIKE 'UNITED STATES%';

##Updating date format
UPDATE layoff_Staging2
SET `date`= STR_TO_DATE(`date`,'%Y-%m-%d');

#Modified date from text format to date format.
ALTER TABLE layoff_Staging2
MODIFY COLUMN `Date` date;






