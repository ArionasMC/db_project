from PIL import Image
import random
import pandas as pd
import csv

hair = [Image.open("base_images/hair.png"), Image.open("base_images/hair2.png"), Image.open("base_images/hair3.png")]
mouth = [Image.open("base_images/mouth.png"), Image.open("base_images/mouth2.png"), Image.open("base_images/mouth3.png")]
eyes = [Image.open("base_images/eyes.png"), Image.open("base_images/eyes2.png")]

WHITE = (255,255,255,255)
BLACK = (0,0,0,255)
skin_colors = [(255, 217, 112, 255), (252, 186, 3, 255), (92, 69, 53, 255), (66, 53, 43, 255), (242, 240, 131, 255)]

image = {
    "id": [],
    "description": [],
    "image_url": []
}

def get_random_hair_or_mouth(is_hair=True):
    rh = random.choice(hair).convert('RGBA')
    if not is_hair:
        rh = random.choice(mouth).convert('RGBA')
    color = (random.randint(0,255), random.randint(0,255), random.randint(0,255), 255)
    for i in range(0, rh.size[0]):
        for j in range(0, rh.size[1]):
            if rh.getpixel((i, j)) == WHITE:
                rh.putpixel((i,j), color)
    return rh  

def get_random_eyes():
    re = random.choice(eyes).convert('RGBA')
    color = (random.randint(0,255), random.randint(0,255), random.randint(0,255), 255)
    for i in range(0, re.size[0]):
        for j in range(0, re.size[1]):
            if re.getpixel((i, j)) == BLACK:
                re.putpixel((i,j), color)
    return re

def generate_face():
    face = Image.new(mode='RGBA', size=(16,16), color=random.choice(skin_colors))
    face_hair = get_random_hair_or_mouth()
    face_mouth = get_random_hair_or_mouth(is_hair=False)
    face_eyes = get_random_eyes()
    face.paste(face_hair, (0,0), face_hair)
    face.paste(face_mouth, (0,0), face_mouth)
    face.paste(face_eyes, (0,0), face_eyes)
    return face

def save_faces(prefix, times):
    for i in range(0, times):
        face = generate_face()
        path = "generated/{0}_{1}.png".format(prefix, i+1)
        face.save(path)
        image["id"].append(9001+i)
        image["description"].append("chefs image :O")
        image["image_url"].append(path)    
    pd.DataFrame(image).to_csv("chef_image.csv", index=False, quoting=csv.QUOTE_NONNUMERIC, quotechar='"')
