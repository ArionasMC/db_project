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