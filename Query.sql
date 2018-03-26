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
order by score desc
limit 50;

#5
#kobe bryant's team mates
select distinct p1.firstName, p1.lastName
from players as p1, players_teams as pt1
where p1.playerID = pt1.playerID and p1.firstName != 'Kobe' and p1.lastName != 'Bryant'
and pt1.year in (select pt.year
				from players as p, players_teams as pt
				where p.firstName = 'Kobe' and p.lastName = 'Bryant' and p.playerID = pt.playerID) 
and pt1.tmID in (select pt.tmID
				from players as p, players_teams as pt
				where p.firstName = 'Kobe' and p.lastName = 'Bryant' and p.playerID = pt.playerID);
				
				
# 6
# Number of series played by NBA teams in post season (TOP 10)

create view post_season_score (name, number, id) as
select t.name, count(*) as conta, t.tmID
from series_post as sp join teams as t on t.tmID = sp.tmIDWinner and sp.year = t.year
where t.lgID="NBA"
group by t.name,t.tmID
union all
select t.name, count(*) as conta, t.tmID
from series_post as sp join teams as t on t.tmID = sp.tmIDLoser and sp.year = t.year
where t.lgID="NBA"
group by t.name,t.tmID;


select name, sum(number) as count
from post_season_score
group by name,id
order by count desc
limit 10;


# 7
# Name and year of the first absolute picks from 2011 to 1990

select firstName, lastName, draftYear
from draft
where draftOverall=1 and draftYear>1990
order by draftYear desc;


# 8
# Names and year of the players that were drafted in the first round and, in that same year, partecipated to Conference Finals and/or Finals of the series post season.
# Results are ordered by year

select distinct firstName,lastName, draftYear
from draft as d join teams as t on d.tmID = t.tmID and d.draftYear = t.year join series_post as sp on sp.tmIDWinner = t.tmID join series_post as sp2 on sp2.tmIDLoser = t.tmID
where sp.year = d.draftYear and d.draftRound=1 and (sp.round="CF" or sp.round="F" or sp2.round="CF" or sp2.round = "F")
order by d.draftYear;

# 9
# Teams and number of players that won MVP (Most Valuable Player) award playing in that team

select t.name, count(*) as counter
from teams as t join players_teams as pt on t.tmID = pt.tmID and t.year = pt.year join players as p on p.playerID = pt.playerID join awards_players as ap on ap.playerID = p.playerID
where ap.year = pt.year and ap.award="Most Valuable Player" and t.lgID="NBA"
group by t.tmID, t.name;

# 10
# Average points and games played at the ALL STAR GAMES for each player in 2000's

select p.firstName, p.lastName, round(avg(pa.points),2) as avg_point, count(*)
from players as p join player_allstar as pa on pa.playerID = p.playerID
where pa.season_id >= 2000
group by p.playerID, p.firstName, p.lastName;

# 11
# Players that in their career scored more points in average than any player from the 90's

select players.firstName,players.lastName, round(avg(points),0)
from players_teams join players on players.playerID = players_teams.playerID
group by players.playerID,players.firstName,players.lastName
having avg(points) > all(select avg(points)
				from players_teams
                where year>1990 and year<2000
                group by playerID)
;
