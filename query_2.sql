### HOMEWORK 2





# 1
# Teams and number of players that won MVP (Most Valuable Player) award playing in that team


# 1) Schema senza primary key e senza foreign key --> 13.5 secondi
# 2) Schema CON primary key e CON foreign key --> 0.012 secondi
# 3) Schema CON primary key e CON foreign key e CON indici --> 0.0023 secondi


select t.name, count(*) as counter
from teams as t join players_teams as pt on t.tmID = pt.tmID and t.year = pt.year join players as p on p.playerID = pt.playerID join awards_players as ap on ap.playerID = p.playerID
where ap.year = pt.year and ap.award="Most Valuable Player" and t.lgID="NBA"
group by t.tmID, t.name;









# 2
# All the team names in which Julius Erving (Doctor J) played

# 1) Schema senza primary key e senza foreign key --> 6.6 secondi
# 2) Schema CON primary key e CON foreign key --> 0.0028 secondi
# 3) Schema CON primary key e CON foreign key e CON indici --> 0.0025 secondi

select distinct t.name
from players as p join players_teams as pt join teams as t 
where p.playerID = pt.playerID and pt.tmID = t.tmID and p.firstName="Julius" and p.lastName = "Erving";







#3
#kobe bryant's team mates


# 1) schema senza primary key e senza foreign key e query con subqueries --> ci mette troppo a girare
# 2) schema senza primary key e senza foreign key e query ristrutturata con vista --> 16 secondi
# 3) schema CON primary key e CON foreign key e query con subqueries --> 0.05 sec
# 4) schema CON primary key e CON foreign key e query ristrutturata con vista --> 0.01 secondi
# 5) schema CON primary key e CON foreign key e CON index e query con subqueries --> 0.052 secondi
# 6) schema CON primary key e CON foreign key e CON index e query ristrutturata con vista --> 0.0085 secondi


# Old query
select distinct p1.firstName, p1.lastName
from players as p1, players_teams as pt1
where p1.playerID = pt1.playerID and p1.firstName != 'Kobe' and p1.lastName != 'Bryant'
and pt1.year in (select pt.year
				from players as p, players_teams as pt
				where p.firstName = 'Kobe' and p.lastName = 'Bryant' and p.playerID = pt.playerID) 
and pt1.tmID in (select pt.tmID
				from players as p, players_teams as pt
				where p.firstName = 'Kobe' and p.lastName = 'Bryant' and p.playerID = pt.playerID);
			
                
# QUERY REFORMULATION

create view view1 (year) as
select distinct pt.year
from players as p, players_teams as pt
where p.firstName = 'Kobe' and p.lastName = 'Bryant' and p.playerID = pt.playerID;

create view view2 (teamID) as
select distinct pt.tmID
from players as p, players_teams as pt
where p.firstName = 'Kobe' and p.lastName = 'Bryant' and p.playerID = pt.playerID;
            

select distinct p1.firstName, p1.lastName
from players as p1, players_teams as pt1, view1, view2
where p1.playerID = pt1.playerID and p1.firstName != 'Kobe' and p1.lastName != 'Bryant' and pt1.year = view1.year and pt1.tmID = view2.teamID;
                








# 4
# Players that in their career scored more points in average than any player from the 90's

# 1) schema senza primary key, senza foreign e senza index --> 16.75
# 2) schema CON primary key, CON foreign e senza index --> 0.102
# 3) schema CON primary key, CON foreign e CON index --> 0.092

select players.firstName,players.lastName, round(avg(points),0)
from players_teams join players on players.playerID = players_teams.playerID
group by players.playerID,players.firstName,players.lastName
having avg(points) > all(select avg(points)
				from players_teams
                where year>1990 and year<2000
                group by playerID)
;

