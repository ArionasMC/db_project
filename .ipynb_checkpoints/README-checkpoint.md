### Changelog 2
1. Μέσα στο ddl άλλαξα όλα τα πεδία των enums από ελληνικά σε αγγλικά
2. Μέσα στον φάκελο external_data έχω notebook που παίρνει dataset που βρήκα και δημιουργεί τους εξής πίνακες
   1. food_team  -> λείπουν: short_name(είναι ίδιο με long_name για τώρα), description, image_id
   2. ingredient -> λείπουν: cal_per_100, image_id
   3. food_info  -> λείπουν: -
   4. recipe     -> λείπουν: description, ingredient_name
   5. step       -> λείπουν: -
   6. image
Όσα πεδία "λείπουν" ή έχουν πάρει τυχαίες τιμές ή "-". Χρειάζονται να φτιαχτούν με το χέρι.
Το dataset που βρήκα έχει 1090 συνταγές αλλά επεξεργάζομαι μόνο τις 20 πρώτες ως test data.

### Changelog
1. Το food_team_short_name βγήκε από PK στο ingredient
2. Έσβησα επομένως το attribute ingredient_food_team_short_name από το recipe
3. Έσβησα το table quantity_ingredient επειδή μας ήταν άχρηστο για τα queries
4. Στον πίνακα recipe_has_ingredient μπήκε νέο attribute quantity (int) με default 20 για υλικά που λένε πχ "1 cup"