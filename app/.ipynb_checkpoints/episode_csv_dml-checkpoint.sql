USE mydb;
SELECT @@secure_file_priv;
SET SESSION sql_mode='NO_AUTO_VALUE_ON_ZERO';
LOAD DATA INFILE '/var/lib/mysql-files/data/to_import/episode.csv' INTO TABLE episode FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE '/var/lib/mysql-files/data/to_import/episode_judges.csv' INTO TABLE episode_judges FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE '/var/lib/mysql-files/data/to_import/episode_has_recipe.csv' INTO TABLE episode_has_recipe FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE '/var/lib/mysql-files/data/to_import/grading.csv' INTO TABLE grading FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
