SELECT *
FROM layoffs;

##Creating a same type_of table_to keep original
CREATE TABLE layoff_Staging
LIKE layoffs;

##Inserting value_into duplct table
INSERT INTO layoff_Staging
SELECT *
FROM layoffs;

SELECT *
FROM layoff_Staging;

##Identifying duplicates

SELECT *,
ROW_NUMBER() OVER
(PARTITION BY company, location, industry,total_laid_off, percentage_laid_off, 	`date`, stage, country, funds_raised_millions) as row_num
FROM layoff_Staging;

WITH Duplicate_CTE as
		(
        SELECT *,
		ROW_NUMBER() OVER
		(PARTITION BY company, location, industry,total_laid_off, percentage_laid_off, 	`date`, stage, country, funds_raised_millions) as row_num
		FROM layoff_Staging
        )
Select *
FROM Duplicate_CTE
Where row_num>1;

##Creating another table to delete duplicates (row_num) which are 2
##Table-layoff_staging-right click-Copy to clipboard-create statement

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoff_Staging2
WHERE ROW_NUM>1;

INSERT INTO layoff_Staging2
SELECT *,
ROW_NUMBER() OVER
(PARTITION BY company, location, industry,total_laid_off, percentage_laid_off, 	`date`, stage, country, funds_raised_millions) as row_num
FROM layoff_Staging;

##Deleting duplicates which row_num are 2

Delete
FROM layoff_Staging2
WHERE row_num>1;
