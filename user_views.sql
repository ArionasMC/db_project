USE mydb;

-- Create the test user user_chef with password: 'user'
CREATE USER IF NOT EXISTS 'user_chef'@'localhost' IDENTIFIED BY 'user';

-- Create my_profile view for user chef with id = 1
CREATE OR REPLACE VIEW my_profile AS SELECT * FROM chef WHERE chef.id = 1;

-- Grant user the permission to change his my_profile data
GRANT UPDATE, SELECT ON mydb.my_profile TO 'user_chef'@'localhost';

-- Create my_recipes_* views and grant permissions
-- DROP VIEW IF EXISTS my_recipes;
-- CREATE OR REPLACE VIEW my_recipes AS SELECT r.* FROM recipe r INNER JOIN recipe_has_chef rhc ON rhc.recipe_name = r.name AND rhc.recipe_cuisine_name = r.cuisine_name WHERE rhc.chef_id = 1;

DROP TABLE IF EXISTS my_recipes;
CREATE TABLE IF NOT EXISTS my_recipes AS
	SELECT r.*
    FROM recipe r INNER JOIN recipe_has_chef rhc ON rhc.recipe_name = r.name AND rhc.recipe_cuisine_name = r.cuisine_name
    WHERE rhc.chef_id = 1;
    
DROP TRIGGER IF EXISTS update_recipes_insert;
DELIMITER //
CREATE TRIGGER update_recipes_insert AFTER INSERT ON mydb.my_recipes FOR EACH ROW
BEGIN
	INSERT INTO recipe (type, difficulty, name, description, prep_time_m, cook_time_m, cuisine_name, ingredient_name, portions, image_id)
		VALUES (NEW.type, NEW.difficulty, NEW.name, NEW.description, NEW.prep_time_m, NEW.cook_time_m, NEW.cuisine_name, NEW.ingredient_name, NEW.portions, NEW.image_id);
    INSERT INTO recipe_has_chef (recipe_name, recipe_cuisine_name, chef_id) VALUES (NEW.name, NEW.cuisine_name, 1);
END;
//
DELIMITER ; 

DROP TRIGGER IF EXISTS update_recipes_update;
DELIMITER //
CREATE TRIGGER update_recipes_update AFTER UPDATE ON mydb.my_recipes FOR EACH ROW
BEGIN
	DELETE FROM recipe_has_chef WHERE recipe_name=OLD.name AND recipe_cuisine_name=OLD.cuisine_name AND chef_id=1;
	DELETE FROM recipe WHERE name=OLD.name AND cuisine_name=OLD.cuisine_name;
    INSERT INTO recipe (type, difficulty, name, description, prep_time_m, cook_time_m, cuisine_name, ingredient_name, portions, image_id)
		VALUES (NEW.type, NEW.difficulty, NEW.name, NEW.description, NEW.prep_time_m, NEW.cook_time_m, NEW.cuisine_name, NEW.ingredient_name, NEW.portions, NEW.image_id);
    INSERT INTO recipe_has_chef (recipe_name, recipe_cuisine_name, chef_id) VALUES (NEW.name, NEW.cuisine_name, 1);
END;
//
DELIMITER ; 
-- INSERT privilage is also granted because the user can add a new recipe
GRANT UPDATE, SELECT, INSERT ON mydb.my_recipes TO 'user_chef'@'localhost';

CREATE OR REPLACE VIEW my_recipes_equipment AS
	SELECT rhe.recipe_name, rhe.recipe_cuisine_name, eq.*
    FROM recipe_has_chef rhc INNER JOIN recipe_has_equipment rhe ON rhc.recipe_name = rhe.recipe_name AND rhc.recipe_cuisine_name = rhe.recipe_cuisine_name
							 INNER JOIN equipment eq ON eq.name = rhe.equipment_name
    WHERE rhc.chef_id = 1;
    
GRANT UPDATE, SELECT ON mydb.my_recipes_equipment to 'user_chef'@'localhost';

CREATE OR REPLACE VIEW my_recipes_ingredients AS
	SELECT rhi.*, ing.cal_per_100, ing.food_team_short_name, ing.image_id
    FROM recipe_has_chef rhc INNER JOIN recipe_has_ingredient rhi ON rhc.recipe_name = rhi.recipe_name AND rhc.recipe_cuisine_name = rhi.recipe_cuisine_name
							 INNER JOIN ingredient ing ON ing.name = rhi.ingredient_name
	WHERE rhc.chef_id = 1;
    
GRANT UPDATE, SELECT ON mydb.my_recipes_ingredients to 'user_chef'@'localhost';

CREATE OR REPLACE VIEW my_recipes_steps AS
	SELECT rhc.recipe_name, rhc.recipe_cuisine_name, s.number, s.description
    FROM recipe_has_chef rhc INNER JOIN step s ON rhc.recipe_name = s.recipe_name AND rhc.recipe_cuisine_name = s.recipe_cuisine_name
    WHERE rhc.chef_id = 1;
    
GRANT UPDATE, SELECT ON mydb.my_recipes_steps to 'user_chef'@'localhost';

CREATE OR REPLACE VIEW my_recipes_meals AS
	SELECT rhm.*
    FROM recipe_has_chef rhc INNER JOIN recipe_has_meal rhm ON rhc.recipe_name = rhm.recipe_name AND rhc.recipe_cuisine_name = rhm.recipe_cuisine_name
    WHERE rhc.chef_id = 1;
    
GRANT UPDATE, SELECT ON mydb.my_recipes_meals to 'user_chef'@'localhost';

CREATE OR REPLACE VIEW my_recipes_labels AS
	SELECT rhl.*
    FROM recipe_has_chef rhc INNER JOIN recipe_has_label rhl ON rhc.recipe_name = rhl.recipe_name AND rhc.recipe_cuisine_name = rhl.recipe_cuisine_name
    WHERE rhc.chef_id = 1;
    
GRANT UPDATE, SELECT ON mydb.my_recipes_labels to 'user_chef'@'localhost';

CREATE OR REPLACE VIEW my_recipes_themes AS
	SELECT rht.*, th.description, th.image_id
    FROM recipe_has_chef rhc INNER JOIN recipe_has_theme rht ON rhc.recipe_name = rht.recipe_name AND rhc.recipe_cuisine_name = rht.recipe_cuisine_name
							 INNER JOIN theme th ON th.name = rht.theme_name
	WHERE rhc.chef_id = 1;

GRANT UPDATE, SELECT ON mydb.my_recipes_themes to 'user_chef'@'localhost';

CREATE OR REPLACE VIEW my_recipes_tips AS
	SELECT rht.*, t.tip
    FROM recipe_has_chef rhc INNER JOIN recipe_has_tip rht ON rhc.recipe_name = rht.recipe_name AND rhc.recipe_cuisine_name = rht.recipe_cuisine_name
							 INNER JOIN tip t ON t.id = rht.tip_id
	WHERE rhc.chef_id = 1;

GRANT UPDATE, SELECT ON mydb.my_recipes_tips to 'user_chef'@'localhost';
