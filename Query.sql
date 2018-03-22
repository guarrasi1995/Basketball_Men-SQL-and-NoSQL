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
#The number of choaches awards for the top ten team in descresent order
select distinct t.name, count(ac.id)
from coaches as c join awards_coaches as ac join teams as t
where ac.coachID = c.coachID and ac.year = c.year and c.year = t.year and c.tmID = t.tmID
group by t.name
order by count(ac.id) desc
limit 10;

# 4
#Top 50 Players of all time
select p.firstName, p.lastName, sum(pt.points)+ 1.7*sum(pt.rebounds) + 2.2*sum(pt.assists) + 6.1*sum(pt.blocks) + 9.1*sum(pt.steals) + 5.4*sum(pt.turnovers) as score
from players_teams as pt join players as p
where pt.playerID = p.playerID
group by pt.playerID
order by sum(pt.points)+ 1.7*sum(pt.rebounds) + 2.2*sum(pt.assists) + 6.1*sum(pt.blocks) + 9.1*sum(pt.steals) + 5.4*sum(pt.turnovers) desc
limit 50;

#5
#
