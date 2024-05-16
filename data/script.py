import json
import csv
import sys
import time
import urllib.request
import urllib.parse

def get_nutrition_info(ingredients):
    time.sleep(10)
    app_id = '47379841'  # Replace with your actual Edamam app_id
    app_key = 'd28718060b8adfd39783ead254df7f92'  # Replace with your actual Edamam app_key
    url = "https://api.edamam.com/api/nutrition-details?app_id={}&app_key={}".format(app_id, app_key)
    
    headers = {
        'Content-Type': 'application/json'
    }
    
    data = json.dumps({"ingr": ingredients}).encode('utf-8')
    
    request = urllib.request.Request(url, data=data, headers=headers, method='POST')
    
    try:
        with urllib.request.urlopen(request) as response:
            result = response.read()
            parsed_data = json.loads(result)
            return [{
                'name': item['parsed'][0]['food'],
                'weight': item['parsed'][0]['weight'],
                'kcal': item['parsed'][0]['nutrients']['ENERC_KCAL']['quantity'] if 'ENERC_KCAL' in item['parsed'][0]['nutrients'] else 0,
                'carbs': item['parsed'][0]['nutrients']['CHOCDF']['quantity'] if 'CHOCDF' in item['parsed'][0]['nutrients'] else 0
            } for item in parsed_data['ingredients']]
    except urllib.error.HTTPError as e:
        print('Failed to fetch nutrition data: Status code', e.code)
        return None  # Handle errors or provide default values as necessary
    except urllib.error.URLError as e:
        print('URL Error: ', e.reason)
        return None

def process_recipes(json_input):
    recipes = json.loads(json_input)

    # Initialize CSV files
    with open('recipe.csv', 'w', newline='') as recipe_file, \
         open('recipe_has_meal.csv', 'w', newline='') as meal_file, \
         open('recipe_has_label.csv', 'w', newline='') as label_file, \
         open('recipe_has_tip.csv', 'w', newline='') as tip_file, \
         open('recipe_has_equipment.csv', 'w', newline='') as equipment_file, \
         open('recipe_has_ingredient.csv', 'w', newline='') as ingredient_file:
        
        recipe_writer = csv.writer(recipe_file)
        meal_writer = csv.writer(meal_file)
        label_writer = csv.writer(label_file)
        tip_writer = csv.writer(tip_file)
        equipment_writer = csv.writer(equipment_file)
        ingredient_writer = csv.writer(ingredient_file)

        # Write headers
        recipe_writer.writerow(['type', 'difficulty', 'name', 'description', 'prep_time', 'cook_time', 'cuisine_name', 'ingredient_name', 'portions', 'image_id'])
        meal_writer.writerow(['recipe_name', 'recipe_cuisine_name', 'meal_type'])
        label_writer.writerow(['recipe_name', 'recipe_cuisine_name', 'label_name'])
        tip_writer.writerow(['recipe_name', 'recipe_cuisine_name', 'tip'])
        equipment_writer.writerow(['recipe_name', 'recipe_cuisine_name', 'equipment'])
        ingredient_writer.writerow(['recipe_name', 'recipe_cuisine_name', 'ingredient_name', 'ingredient_full_name', 'ingredient_weight', 'ingredient_kcal', 'ingredient_carbs'])

        # Process each recipe
        for data in recipes:
            ingredient_texts = data['ingredients']
            ingredients_info = get_nutrition_info(ingredient_texts)

            # Append to recipe.csv
            recipe_writer.writerow([data['type'], data['difficulty'], data['name'], data['description'], data['prep_time'], data['cook_time'], data['cuisine_name'], ingredients_info[0]['name'], 1, 0])

            # Append to recipe_has_meal.csv
            meal_writer.writerow([data['name'], data['cuisine_name'], data['tags'][0]])

            # Append to recipe_has_label.csv
            for tag in data['tags']:
                label_writer.writerow([data['name'], data['cuisine_name'], tag])

            # Append to recipe_has_tip.csv
            for tip in data['tips']:
                tip_writer.writerow([data['name'], data['cuisine_name'], tip])

            # Append to recipe_has_equipment.csv
            for equipment in data['equipment']:
                equipment_writer.writerow([data['name'], data['cuisine_name'], equipment])

            # Append to recipe_has_ingredient.csv
            for ingredient, details in zip(data['ingredients'], ingredients_info):
                ingredient_writer.writerow([data['name'], data['cuisine_name'], details['name'], ingredient, details['weight'], details['kcal'], details['carbs']])

# Read JSON input from stdin
json_input = sys.stdin.read()
process_recipes(json_input)
