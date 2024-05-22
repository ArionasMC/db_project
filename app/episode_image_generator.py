from PIL import Image
import random
import pandas as pd
import csv

border = Image.open("base_images/border.png")
ep = Image.open("base_images/ep.png")
nums = []
for i in range(0, 10):
    nums.append(Image.open("base_images/num{0}.png".format(i)))

WHITE = (255,255,255,255)

image = {
    "id": [],
    "description": [],
    "image_url": []
}

def save_episodes(years):
    for i in range(0, len(years)):
        eps = generate_season_episodes()
        for j in range(0, len(eps)):
            e_name = "episode_{0}_{1}".format(j+1, years[i])
            path = "generated/episodes/{0}.png".format(e_name)
            eps[j].save(path)
            image["id"].append(years[i]*100+1+j)
            image["description"].append("{0} image".format(e_name))
            image["image_url"].append(path)

def get_random_border():
    bor = border.convert('RGBA')
    color = (random.randint(0,255), random.randint(0,255), random.randint(0,255), 255)
    for i in range(0, bor.size[0]):
        for j in range(0, bor.size[1]):
            if bor.getpixel((i, j)) == WHITE:
                bor.putpixel((i,j), color)
    return bor

def get_colored_ep(color):
    e = ep.convert('RGBA')
    for i in range(0, e.size[0]):
        for j in range(0, e.size[1]):
            if e.getpixel((i, j)) == WHITE:
                e.putpixel((i,j), color)
    return e
def get_colored_num(color, num):
    num = nums[num].convert('RGBA')
    for i in range(0, num.size[0]):
        for j in range(0, num.size[1]):
            if num.getpixel((i, j)) == WHITE:
                num.putpixel((i,j), color)
    return num

def generate_season_episodes():
    color = (random.randint(0,255), random.randint(0,255), random.randint(0,255), 255)
    episodes = []
    bor = get_random_border()
    for i in range(0, 10):
        e = Image.new(mode='RGBA', size=(16,16), color=(255, 237, 189, 255))
        label = get_colored_ep(color)
        num = get_colored_num(color, i+1 if i < 9 else 0)
        e.paste(bor, (0,0), bor)
        e.paste(label, (0,0), label)
        e.paste(num, (0,0), num)
        episodes.append(e)
    return episodes

def save_episodes(years):
    for i in range(0, len(years)):
        eps = generate_season_episodes()
        for j in range(0, len(eps)):
            e_name = "episode_{0}_{1}".format(j+1, years[i])
            path = "generated/episodes/{0}.png".format(e_name)
            eps[j].save(path)
            image["id"].append(years[i]*100+1+j)
            image["description"].append("{0} image".format(e_name))
            image["image_url"].append(path)
    pd.DataFrame(image).to_csv("episode_image.csv", index=False, quoting=csv.QUOTE_NONNUMERIC, quotechar='"')
