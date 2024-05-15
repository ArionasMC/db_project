### Changelog
1. Το food_team_short_name βγήκε από PK στο ingredient
2. Έσβησα επομένως το attribute ingredient_food_team_short_name από το recipe
3. Έσβησα το table quantity_ingredient επειδή μας ήταν άχρηστο για τα queries
4. Στον πίνακα recipe_has_ingredient μπήκε νέο attribute quantity (int) με default 20 για υλικά που λένε πχ "1 cup"