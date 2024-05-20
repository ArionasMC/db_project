-- 3.1
SELECT avg(grade), c1.id, c2.name
	FROM grading g 
		INNER JOIN episode_has_recipe ehr
        ON g.participant_chef_id = ehr.chef_id
        INNER JOIN chef c1 
        ON c1.id = ehr.chef_id 
        INNER JOIN chef_has_cuisine chc
        ON chc.chef_id = c1.id
        INNER JOIN cuisine c2
        ON chc.cuisine_name = c2.name
	GROUP BY c1.id, c2.name
    ORDER BY c1.id;

SELECT avg(grade), g.participant_chef_id
	FROM grading g 
		INNER JOIN episode_has_recipe ehr ON g.participant_chef_id = ehr.chef_id
	GROUP BY g.participant_chef_id
UNION ALL
SELECT avg(grade), c2.name
	FROM grading g
		INNER JOIN episode_has_recipe ehr ON g.participant_chef_id = ehr.chef_id
        INNER JOIN chef c1 ON c1.id = ehr.chef_id 
        INNER JOIN chef_has_cuisine chc ON chc.chef_id = c1.id
        INNER JOIN cuisine c2 ON chc.cuisine_name = c2.name
	GROUP BY c2.name;
    
-- 3.2
-- DROP PROCEDURE get_cuisine;
-- DROP PROCEDURE get_year;
DELIMITER //

CREATE PROCEDURE `get_cuisine`(IN mycuisine VARCHAR(128))
BEGIN
    SELECT c.id, mycuisine
    FROM chef c
    INNER JOIN chef_has_cuisine chc ON c.id = chc.chef_id
    WHERE chc.cuisine_name = mycuisine;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE `get_year`(IN my_year INT)
BEGIN
    SELECT c.id, my_year
    FROM chef c 
    INNER JOIN episode_has_recipe ehr ON c.id = ehr.chef_id
    WHERE ehr.episode_year = my_year;
END //

DELIMITER ;

call get_cuisine('Greek');
call get_year(2024);



-- 3.3
SELECT c.id, COUNT(*) AS max_recipe_count
	FROM chef c
		INNER JOIN recipe_has_chef rhc ON rhc.chef_id = c.id
	WHERE c.age < 30
	GROUP BY c.id
	HAVING max_recipe_count = (
		SELECT MAX(recipe_count)
			FROM (
				SELECT COUNT(*) AS recipe_count
					FROM chef c
						INNER JOIN recipe_has_chef rhc ON rhc.chef_id = c.id
					WHERE c.age < 30
					GROUP BY c.id
			) AS sub_recipe_count
	);

-- 3.4
SELECT id
	FROM chef 
    WHERE id NOT IN 
		(SELECT c.id 
			FROM chef c 
				INNER JOIN episode_judges ej ON ej.chef_id = c.id);

-- 3.5
SELECT ej.chef_id, count(*) as appearances
	FROM episode_judges ej
	GROUP BY ej.chef_id, ej.episode_year
	HAVING appearances = ANY
		(SELECT count(*) 
			FROM episode_judges ej2
             GROUP BY ej2.chef_id, ej2.episode_year
             HAVING ej2.chef_id <> ej.chef_id)
		AND appearances >= 3
	ORDER BY appearances;

-- 3.6
SELECT LEAST(rhl1.label_name, rhl2.label_name) AS label_name1, GREATEST(rhl1.label_name, rhl2.label_name) AS label_name2, count(*) as appearances
	FROM recipe_has_label rhl1
		INNER JOIN recipe_has_label rhl2 ON (rhl2.recipe_name = rhl1.recipe_name AND rhl2.recipe_cuisine_name = rhl1.recipe_cuisine_name AND rhl1.label_name <> rhl2.label_name)
        GROUP BY label_name1, label_name2
        ORDER BY appearances DESC
        limit 3;

-- 3.7
SELECT c.id, count(*) as appearances
	FROM chef c
		INNER JOIN episode_has_recipe ehr ON ehr.chef_id = c.id
    GROUP BY c.id
    HAVING appearances <= (
		SELECT MAX(appearance) as max_appearance
			FROM (
				SELECT COUNT(*) AS appearance
					FROM chef c2
						INNER JOIN episode_has_recipe ehr ON ehr.chef_id = c2.id
					GROUP BY c2.id
			) AS sub_appearances
	) - 5
    ORDER BY appearances DESC;
    
    -- 3.8
    SELECT ehr.episode_id, ehr.episode_year, count(*) as amount
	FROM episode_has_recipe ehr
		INNER JOIN recipe r ON (r.name = ehr.recipe_name AND r.cuisine_name = ehr.recipe_cuisine_name)
        INNER JOIN recipe_has_equipment rhe ON (rhe.recipe_name = r.name AND rhe.recipe_cuisine_name = r.cuisine_name)
	GROUP BY ehr.episode_id, ehr.episode_year
    ORDER BY amount DESC
    limit 1;
    
    -- 3.9
    SELECT avg(carbohydrate)
	FROM food_info fi
		INNER JOIN recipe r ON (r.name = fi.recipe_name AND r.cuisine_name = fi.recipe_cuisine_name)
        INNER JOIN episode_has_recipe ehr ON (ehr.recipe_name = r.name AND ehr.recipe_cuisine_name = r.cuisine_name)
        GROUP BY ehr.episode_year;
	
    -- 3.10 (;)
    SELECT DISTINCT c.name, count(*) as appearances
	FROM cuisine c 
		INNER JOIN recipe r ON r.cuisine_name = c.name
        INNER JOIN episode_has_recipe ehr ON ehr.recipe_cuisine_name = r.cuisine_name
	GROUP BY c.name, ehr.episode_year
    HAVING appearances = ANY (
		SELECT count(*) as appearance
			FROM cuisine c2 
				INNER JOIN recipe r2 ON r2.cuisine_name = c2.name
				INNER JOIN episode_has_recipe ehr2 ON ehr2.recipe_cuisine_name = r2.cuisine_name
			GROUP BY c2.name, ehr2.episode_year
            HAVING (c2.name <> c.name) AND (ehr2.episode_year = ehr.episode_year + 1 OR ehr2.episode_year = ehr.episode_year - 1)
        ) AND appearances >= 3;
        
	-- 3.11
    SELECT g.judge_chef_id, g.participant_chef_id, g.total_grade
		FROM (
			SELECT 
				g.judge_chef_id, 
				g.participant_chef_id, 
				SUM(g.grade) AS total_grade,
				ROW_NUMBER() OVER (PARTITION BY g.judge_chef_id ORDER BY SUM(g.grade) DESC) AS rn
					FROM grading g
					GROUP BY g.judge_chef_id, g.participant_chef_id
		) g
		WHERE g.rn = 1
		ORDER BY g.total_grade DESC
        limit 5;
        
    -- 3.12
	SELECT e.id, e.year, sum(r.difficulty) as technical_difficulty
	FROM episode e
		INNER JOIN episode_has_recipe ehr ON (ehr.episode_id = e.id AND ehr.episode_year = e.year)
        INNER JOIN recipe r ON (r.name = ehr.recipe_name AND r.cuisine_name = ehr.recipe_cuisine_name)
        GROUP BY e.id, e.year
        ORDER BY technical_difficulty DESC
        limit 1;

    -- 3.13
    SELECT e.id, e.year, SUM(CAST(c.rank AS UNSIGNED)) as episode_rank
	FROM episode e
		INNER JOIN episode_has_recipe ehr ON (ehr.episode_id = e.id AND ehr.episode_year = e.year)
		INNER JOIN chef c ON c.id = ehr.chef_id
	GROUP BY e.id, e.year
    ORDER BY episode_rank
    limit 1;
    
    -- 3.14
    SELECT t.name, count(*) as appearances
	FROM theme t
		INNER JOIN recipe_has_theme rht ON rht.theme_name = t.name 
		INNER JOIN recipe r ON (r.name = rht.recipe_name AND r.cuisine_name = rht.recipe_cuisine_name)
        INNER JOIN episode_has_recipe ehr ON (ehr.recipe_name = r.name AND ehr.recipe_cuisine_name = r.cuisine_name)
        GROUP BY t.name
        ORDER BY appearances DESC
        limit 1;
        
	-- 3.15(Εχουν εμφανιστει όλες)
    SELECT short_name
	FROM food_team
    WHERE short_name NOT IN (
		SELECT ft.short_name
			FROM food_team ft	
				INNER JOIN ingredient i ON i.food_team_short_name = ft.short_name
                INNER JOIN recipe_has_ingredient rhi ON rhi.ingredient_name = i.name
				INNER JOIN recipe r ON (r.name = rhi.recipe_name AND r.cuisine_name = rhi.recipe_cuisine_name)
                INNER JOIN episode_has_recipe ehr ON (ehr.recipe_name = r.name AND ehr.recipe_cuisine_name = r.cuisine_name)
		);

    
    


