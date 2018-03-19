### Query


# 1
# Conference che ha vinto il maggior numero di anelli

# 2
# Name of all players that play with the Los Angeles Lakers
select distinct P.PlayerName
from Actions as A , Player as P , Team as T
where T.TeamName = "Los Angeles Lakers" and A.PlayerId = P.PlayerId and T.TeamId = A.TeamId;

# 3
# 