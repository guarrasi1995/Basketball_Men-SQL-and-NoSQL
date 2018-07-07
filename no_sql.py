
import csv
from pymongo import MongoClient
from pprint import pprint


################################################################################
################################################################################
# Create json format for our dataset
################################################################################
################################################################################


# PLAYER

player_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/players.csv","r") as f:
    player = csv.reader(f,delimiter=";")
    for row in player:
        player_list.append(row)
 
       
player_bson_dict = {}
player_bson = []

for i in range(1,len(player_list)):
    player_dict = {}
    for j in range(len(player_list[0])):
        if j == 0:
            player_dict["_id"] = player_list[i][j]
        else:
            player_dict[player_list[0][j]] = player_list[i][j]
    player_bson.append(player_dict)
    player_bson_dict[player_dict["_id"]] = player_dict




# TEAM

team_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/teams.csv","r") as f:
    team = csv.reader(f,delimiter=";")
    for row in team:
        team_list.append(row)
 
       
team_bson_dict = {}
team_bson = []

for i in range(1,len(team_list)):
    team_dict = {}
    for j in range(len(team_list[0])):
        if j == 2:
            team_dict["_id"] = team_list[i][j]
        else:
            team_dict[team_list[0][j]] = team_list[i][j]
    team_bson.append(team_dict)
    team_bson_dict[team_dict["_id"]] = team_dict






# PLAYER TEAM

player_team_list = []
with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/players_teams.csv","r") as f:
    players_teams = csv.reader(f,delimiter=";")
    for row in players_teams:
        player_team_list.append(row)



player_teams_bson = []

for i in range(1,len(player_team_list)):
    player_teams_dict = {}
    for j in range(len(player_team_list[0])):
        if j == 0:
            player_teams_dict["_id"] = player_team_list[i][j]
        elif player_team_list[0][j] == "playerID":
            player_teams_dict["playerID"] = player_bson_dict[player_team_list[i][j]]
        elif player_team_list[0][j] == "tmID":
            player_teams_dict["tmID"] = team_bson_dict[player_team_list[i][j]]
        else:
            player_teams_dict[player_team_list[0][j]] = player_team_list[i][j]
    player_teams_dict["points"]=int(player_teams_dict["points"])
    player_teams_dict["rebounds"]=int(player_teams_dict["rebounds"])
    player_teams_dict["assists"]=int(player_teams_dict["assists"])
    player_teams_dict["blocks"]=int(player_teams_dict["blocks"])
    player_teams_dict["steals"]=int(player_teams_dict["steals"])
    player_teams_dict["turnovers"]=int(player_teams_dict["turnovers"])
    player_teams_dict["year"]=int(player_teams_dict["year"])
    player_teams_bson.append(player_teams_dict)






# DRAFT

draft_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/draft.csv","r") as f:
    draft = csv.reader(f,delimiter=";")
    for row in draft:
        draft_list.append(row)
 
       
draft_bson_dict = {}
draft_bson = []

for i in range(1,len(draft_list)):
    draft_dict = {}
    for j in range(len(draft_list[0])):
        if j == 0:
            draft_dict["_id"] = draft_list[i][j]
        elif draft_list[0][j] == "tmID":
            draft_dict["tmID"] = team_bson_dict[draft_list[i][j]]
        else:
            draft_dict[draft_list[0][j]] = draft_list[i][j]
    draft_dict["draftYear"] = int(draft_dict["draftYear"])
    draft_bson.append(draft_dict)
    draft_bson_dict[draft_dict["_id"]] = draft_dict




# SERIES POST
series_post_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/series_post.csv","r") as f:
    series_post = csv.reader(f,delimiter=";")
    for row in series_post:
        series_post_list.append(row)
 
       
series_post_bson_dict = {}
series_post_bson = []

for i in range(1,len(series_post_list)):
    series_post_dict = {}
    for j in range(len(series_post_list[0])):
        if j == 0:
            series_post_dict["_id"] = series_post_list[i][j]
        elif series_post_list[0][j] == "tmIDWinner":
            series_post_dict["tmIDWinner"] = team_bson_dict[series_post_list[i][j]]
        elif series_post_list[0][j] == "tmIDLoser":
            try:
                series_post_dict["tmIDLoser"] = team_bson_dict[series_post_list[i][j]]
            except:
                pass
        else:
            series_post_dict[series_post_list[0][j]] = series_post_list[i][j]
    series_post_bson.append(series_post_dict)
    series_post_bson_dict[series_post_dict["_id"]] = series_post_dict




# COACHES

coaches_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/coaches.csv","r") as f:
    coaches = csv.reader(f,delimiter=";")
    for row in coaches:
        coaches_list.append(row)
 
       
coaches_bson_dict = {}
coaches_bson = []

for i in range(1,len(coaches_list)):
    coaches_dict = {}
    coaches_dict["_id"] = (coaches_list[i][0],coaches_list[i][1])
    for j in range(len(coaches_list[0])):
        if coaches_list[0][j] == "tmID":
            coaches_dict["tmID"] = team_bson_dict[coaches_list[i][j]]
        else:
            coaches_dict[coaches_list[0][j]] = coaches_list[i][j]
    coaches_bson.append(coaches_dict)
    coaches_bson_dict[coaches_dict["_id"]] = coaches_dict
    
    

# COACHES AWARDS

coaches_awards_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/awards_coaches.csv","r") as f:
    coaches_awards = csv.reader(f,delimiter=";")
    for row in coaches_awards:
        coaches_awards_list.append(row)
 
       
coaches_awards_bson_dict = {}
coaches_awards_bson = []

for i in range(1,len(coaches_awards_list)):
    coaches_awards_dict = {}
    for j in range(len(coaches_awards_list[0])):
        if j == 0:
            coaches_awards_dict["_id"] = coaches_awards_list[i][j]
        elif coaches_awards_list[0][j] == "coachID":
            coaches_awards_dict["coachID"] = coaches_bson_dict[(coaches_awards_list[i][j],coaches_awards_list[i][1])]
        else:
            coaches_awards_dict[coaches_awards_list[0][j]] = coaches_awards_list[i][j]
    coaches_awards_bson.append(coaches_awards_dict)
    coaches_awards_bson_dict[coaches_awards_dict["_id"]] = coaches_awards_dict
    
    
    
    
    
    
    
    
# AWARD PLAYERS

awards_players_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/awards_players.csv","r") as f:
    awards_players = csv.reader(f,delimiter=";")
    for row in awards_players:
        awards_players_list.append(row)
 
       
awards_players_bson_dict = {}
awards_players_bson = []

for i in range(1,len(awards_players_list)):
    awards_players_dict = {}
    awards_players_dict["_id"] = i
    for j in range(len(awards_players_list[0])):

        if awards_players_list[0][j] == "playerID":
            awards_players_dict["playerID"] = player_bson_dict[awards_players_list[i][j]]
        else:
            awards_players_dict[awards_players_list[0][j]] = awards_players_list[i][j]
    awards_players_bson.append(awards_players_dict)
    awards_players_bson_dict[awards_players_dict["_id"]] = awards_players_dict
    
    
    
   


    
# PLAYER ALL STAR

player_all_star_list = []

with open("/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/player_allstar.csv","r") as f:
    player_all_star = csv.reader(f,delimiter=";")
    for row in player_all_star:
        player_all_star_list.append(row)
 
       
player_all_star_bson_dict = {}
player_all_star_bson = []

for i in range(1,len(player_all_star_list)):
    player_all_star_dict = {}
    player_all_star_dict["_id"] = i
    for j in range(len(player_all_star_list[0])):

        if player_all_star_list[0][j] == "playerID":
            player_all_star_dict["playerID"] = player_bson_dict[player_all_star_list[i][j]]
        else:
            player_all_star_dict[player_all_star_list[0][j]] = player_all_star_list[i][j]
    player_all_star_dict["season_id"] = int(player_all_star_dict["season_id"])
    player_all_star_dict["points"] = int(player_all_star_dict["points"])
    player_all_star_bson.append(player_all_star_dict)
    player_all_star_bson_dict[player_all_star_dict["_id"]] = player_all_star_dict
    
    
    
    


################################################################################
################################################################################

# LOAD DATA ON MONGO

################################################################################
################################################################################


# Deleete elements from a collection
# db.collection_players_teams.delete_many({})


# Connect to Mongo
client = MongoClient('localhost', 27017)


# Create database 
db = client["Basketball"]


# Create collections
collection_players_teams= db["players_teams"]
collection_draft= db["draft"]
collection_series_post= db["series_post"]
collection_awards_coaches= db["awards_coaches"]
collection_awards_players= db["awards_players"]
collection_player_all_star= db["player_all_star"]


# Insert data into collections
db.collection_players_teams.insert_many(player_teams_bson)
db.collection_draft.insert_many(draft_bson)
db.collection_series_post.insert_many(series_post_bson)
db.collection_awards_coaches.insert_many(coaches_awards_bson)
db.collection_awards_players.insert_many(awards_players_bson)
db.collection_player_all_star.insert_many(player_all_star_bson)






################################################################################
################################################################################
############################## Query ###########################################
################################################################################
################################################################################


# 1
# Player that scored the most points in 1995 NBA season

cursor = db.collection_players_teams.aggregate([
        {"$match":{"year":1995}},
        {"$group":{"_id":"$year","max_points":{"$max":"$points"}}},
        {"$project":{"_id":0,"max_points":1}}
        ])

# Read values into the cursor object obtained in output from the query

aux=[]
for i in cursor:
    aux.append(i)
    
max_points_1995 = int(aux[0]["max_points"])



# TROVA IL GIOCATORE CHE HA FATTO IL MASSIMO NUMERO DI PUNTI NEL 1995
cursor = db.collection_players_teams.find(
        {"year":1995,"points":max_points_1995},
        projection={"playerID.firstName":1,"playerID.lastName":1,"_id":0,"points":1})


for i in cursor:
    pprint(i)

    







# 2
# All the team names in which Julius Erving (Doctor J) played

cursor = db.collection_players_teams.find(
        {"playerID.firstName":"Julius","playerID.lastName":"Erving"},
        projection={"tmID.name":1,"_id":0}).distinct("tmID.name")


for i in cursor:
    pprint(i)





  
    
# 3
# The number of choaches awards for the top ten team in descresent order


cursor = db.collection_awards_coaches.aggregate([
        {"$group":{"_id":"$coachID.tmID.name","count":{"$sum":1}}},
        {"$project":{"_id":1,"count":1}},
        {"$sort":{"count":-1}},
        {"$limit": 10}
        ])
    
for i in cursor:
    pprint(i)
    
    
# 4
#Top 50 Players of all time

cursor = db.collection_players_teams.aggregate([
        {"$group":{"_id":{"firstName":"$playerID.firstName","lastname":"$playerID.lastName"},"points":{"$sum":"$points"},"rebounds":{"$sum":"$rebounds"},"assists":{"$sum":"$assists"},"blocks":{"$sum":"$blocks"},"steals":{"$sum":"$steals"},"turnovers":{"$sum":"$turnovers"}}},
        {"$project":{ 'totalSum' : { '$sum' : [ {'$multiply':['$points',1]} , {'$multiply':['$rebounds',1.7]},{'$multiply':['$assists', 2.2]},{'$multiply':['$blocks',6.1]},{'$multiply':['$steals',9.1]},{'$multiply':['$turnovers',5.4]}] }}},
        {"$sort":{"totalSum":-1}},
        {"$limit": 50}
        ])


for i in cursor:
    pprint(i)





# 5
# kobe bryant's team mates


temp = db.collection_players_teams.find(
        {"playerID.firstName":"Kobe","playerID.lastName":"Bryant"},
        projection={"tmID.name":1,"year":1,"_id":0})

team_aux = []
year_aux = []
for i in temp:
    team_aux.append(i["tmID"]["name"])
    year_aux.append(i["year"])
    pprint(i)


cursor = db.collection_players_teams.aggregate([
        {"$match":{"tmID.name":{"$in":team_aux},"year":{"$in":year_aux},"playerID.lastName":{"$ne":"Bryant"}}},
        {"$group":{"_id":"$playerID.lastName"}},
        {"$project":{"playerID.lastName":1}}
        ])


for i in cursor:
    pprint(i)

# 6
# Number of series win by NBA teams in post season (TOP 10)

cursor = db.collection_series_post.aggregate([
        {"$group":{"_id":"$tmIDWinner.name","count":{"$sum":1}}},
        {"$project":{"tmIDWinner.name":1,"count":1}},
        {"$sort":{"count":-1}},
        {"$limit": 10}
        ])


for i in cursor:
    pprint(i)







# 7
# Name and year of the first absolute picks from 2011 to 1990
cursor = db.collection_draft.find(
        {"draftOverall":"1","draftYear":{"$gt": 1989}},
        projection={"firstName":1,"lastName":1,"draftYear":1,"_id":0})


for i in cursor:
    pprint(i)
    


    
# 8
# Top 5 NBA teams with the most number of players

cursor = db.collection_players_teams.aggregate([
        {"$group":{"_id":"$tmID.name","count":{"$sum":1}}},
        {"$project":{"tmID.name":1,"count":1}},
        {"$sort":{"count":-1}},
        {"$limit": 5}
        ])


for i in cursor:
    pprint(i)






# 9
# Average points and games played at the ALL STAR GAMES for each player in 2000's


cursor = db.collection_player_all_star.aggregate([
        {"$match":{"season_id":{"$gt":1999}}},
        {"$group":{"_id":"$playerID.lastName","mean_pts":{"$avg":"$points"},"count":{"$sum":1}}},
        {"$project":{"_id":1,"mean_pts":1,"count":1}}
        ])


for i in cursor:
    pprint(i)




# 10
# Players that in their career scored more points at least one season than any player from the average in the 90's


cursor = db.collection_players_teams.aggregate([
        {"$match":{"year":{"$in": [1990,1991,1992,1993,1994,1995,1996,1997,1998,1999]}}},
        {"$group":{"_id":"$playerID.lastName","pts":{"$avg":"$points"}}},
        {"$project":{"_id":1,"pts":1}},
        {"$sort":{"pts":-1}},
        {"$limit": 1}
        ])

aux = []
for i in cursor:
    aux.append(i)
    
    
cursor = db.collection_players_teams.find({"points":{"$gt": aux[0]["pts"]}},
        projection={"playerID.firstName":1,"playerID.lastName":1,"_id":0}).distinct("playerID.lastName")


for i in cursor:
    pprint(i)