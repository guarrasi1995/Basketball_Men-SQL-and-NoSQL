### Query


# 1
# Player that scored the most points in 1995 NBA season

select p.firstName, p.lastName
from players_teams as pt join players as p on pt.playerID=p.playerID
where pt.year="1995" and pt.points=(select max(pt1.points)
									from players_teams as pt1
                                    where pt1.year="1995");



# 2
# All the team names in which Julius Erving (Doctor J) played

select distinct t.name
from players as p join players_teams as pt join teams as t 
where p.playerID = pt.playerID and pt.tmID = t.tmID and p.firstName="Julius" and p.lastName = "Erving";

# 3
# 


# 4
#

#5
#
select lastName from players;