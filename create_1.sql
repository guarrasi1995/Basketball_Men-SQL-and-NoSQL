# Schema SENZA foreign key, SENZA primary key e SENZA indici


# Create schema
CREATE DATABASE IF NOT EXISTS Basketball_bis;
USE Basketball_bis;

SET SQL_SAFE_UPDATES = 0;
-- -----------------------------------------------------
-- Table teams
-- -----------------------------------------------------
create table if not exists teams
(
  year int(11) not null,
  lgID varchar(255) default NULL,
  tmID varchar(255) not null,
  franchID varchar(255) default NULL,
  confID varchar(255) default NULL,
  divID varchar(255) default NULL,
  rank int(11) default NULL,
  confRank int(11) default NULL,
  playoff varchar(255) default NULL,
  name varchar(255) default NULL,
  o_fgm int(11) default NULL,
  o_fga int(11) default NULL,
  o_ftm int(11) default NULL,
  o_fta int(11) default NULL,
  o_3pm int(11) default NULL,
  o_3pa int(11) default NULL,
  o_oreb int(11) default NULL,
  o_dreb int(11) default NULL,
  o_reb int(11) default NULL,
  o_asts int(11) default NULL,
  o_pf int(11) default NULL,
  o_stl int(11) default NULL,
  o_to int(11) default NULL,
  o_blk int(11) default NULL,
  o_pts int(11) default NULL,
  d_fgm int(11) default NULL,
  d_fga int(11) default NULL,
  d_ftm int(11) default NULL,
  d_fta int(11) default NULL,
  d_3pm int(11) default NULL,
  d_3pa int(11) default NULL,
  d_oreb int(11) default NULL,
  d_dreb int(11) default NULL,
  d_reb int(11) default NULL,
  d_asts int(11) default NULL,
  d_pf int(11) default NULL,
  d_stl int(11) default NULL,
  d_to int(11) default NULL,
  d_blk int(11) default NULL,
  d_pts int(11) default NULL,
  o_tmRebound int(11) default NULL,
  d_tmRebound int(11) default NULL,
  homeWon int(11) default NULL,
  homeLost int(11) default NULL,
  awayWon int(11) default NULL,
  awayLost int(11) default NULL,
  neutWon int(11) default NULL,
  neutLoss int(11) default NULL,
  confWon int(11) default NULL,
  confLoss int(11) default NULL,
  divWon int(11) default NULL,
  divLoss int(11) default NULL,
  pace int(11) default NULL,
  won int(11) default NULL,
  lost int(11) default NULL,
  games int(11) default NULL,
  min int(11) default NULL,
  arena varchar(255) default NULL,
  attendance int(11) default NULL,
  bbtmID varchar(255) default NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table coaches
-- -----------------------------------------------------
create table if not exists coaches
(
coachID varchar(255) not null,
year int(11) not null,
tmID varchar(255) not null,
lgID varchar(255) default NULL,
stint int(11) not null,
won int(11) default NULL,
lost int(11) default NULL,
post_wins int(11) default NULL,
post_losses int(11) default NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table awards_coaches
-- -----------------------------------------------------
create table if not exists awards_coaches (
id int(11) not null,
year int(11) default NULL,
coachID varchar(255) default NULL,
award varchar(255) default NULL,
lgID varchar(255) default NULL,
note varchar(255) default NULL
)
ENGINE = InnoDB
AUTO_INCREMENT = 62
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table players
-- -----------------------------------------------------
create table if not exists players
(
  playerID varchar(255) not null,
  useFirst varchar(255) default NULL,
  firstName varchar(255) default NULL,
  middleName varchar(255) default NULL,
  lastName varchar(255) default NULL,
  nameGiven varchar(255) default NULL,
  fullGivenName varchar(255) default NULL,
  nameSuffix varchar(255) default NULL,
  nameNick varchar(255) default NULL,
  pos varchar(255) default NULL,
  firstseason int(11) default NULL,
  lastseason int(11) default NULL,
  height FLOAT default NULL,
  weight int(11) default NULL,
  college varchar(255) default NULL,
  collegeOther varchar(255) default NULL,
  birthDate DATE default NULL,
  birthCity varchar(255) default NULL,
  birthState varchar(255) default NULL,
  birthCountry varchar(255) default NULL,
  highSchool varchar(255) default NULL,
  hsCity varchar(255) default NULL,
  hsState varchar(255) default NULL,
  hsCountry varchar(255) default NULL,
  deathDate DATE default NULL,
  race varchar(255) default NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table awards_players
-- -----------------------------------------------------
create table if not exists awards_players
(
playerID varchar(255) not null,
award varchar(255) not null,
year int(11) not null,
lgID varchar(255) default NULL,
note varchar(255) default NULL,
pos varchar(255) default NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table draft
-- -----------------------------------------------------
create table if not exists draft
(
id int(11) not null DEFAULT '0',
draftYear int(11) default NULL,
draftRound int(11) default NULL,
draftSelection int(11) default NULL,
draftOverall int(11) default NULL,
tmID varchar(255) default NULL,
firstName varchar(255) default NULL,
lastName varchar(255) default NULL,
suffixName varchar(255) default NULL,
playerID varchar(255) default NULL,
draftFrom varchar(255) default NULL,
lgID varchar(255) default NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table player_allstar
-- -----------------------------------------------------
create table if not exists player_allstar
(
playerID varchar(255) not null,
last_name varchar(255) default NULL,
first_name varchar(255) default NULL,
season_id int(11) not null,
conference varchar(255) default NULL,
league_id varchar(255) default NULL,
games_played int(11) default NULL,
minutes int(11) default NULL,
points int(11) default NULL,
o_rebounds int(11) default NULL,
d_rebounds int(11) default NULL,
rebounds int(11) default NULL,
assists int(11) default NULL,
steals int(11) default NULL,
blocks int(11) default NULL,
turnovers int(11) default NULL,
personal_fouls int(11) default NULL,
fg_attempted int(11) default NULL,
fg_made int(11) default NULL,
ft_attempted int(11) default NULL,
ft_made int(11) default NULL,
three_attempted int(11) default NULL,
three_made int(11) default NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table players_teams
-- -----------------------------------------------------
create table if not exists players_teams
(
id int(11) not null,
playerID varchar(255) not null,
year int(11) default NULL,
stint int(11) default NULL,
tmID varchar(255) default NULL,
lgID varchar(255) default NULL,
GP int(11) default NULL,
GS int(11) default NULL,
minutes int(11) default NULL,
points int(11) default NULL,
oRebounds int(11) default NULL,
dRebounds int(11) default NULL,
rebounds int(11) default NULL,
assists int(11) default NULL,
steals int(11) default NULL,
blocks int(11) default NULL,
turnovers int(11) default NULL,
PF int(11) default NULL,
fgAttempted int(11) default NULL,
fgMade int(11) default NULL,
ftAttempted int(11) default NULL,
ftMade int(11) default NULL,
threeAttempted int(11) default NULL,
threeMade int(11) default NULL,
PostGP int(11) default NULL,
PostGS int(11) default NULL,
PostMinutes int(11) default NULL,
PostPoints int(11) default NULL,
PostoRebounds int(11) default NULL,
PostdRebounds int(11) default NULL,
PostRebounds int(11) default NULL,
PostAssists int(11) default NULL,
PostSteals int(11) default NULL,
PostBlocks int(11) default NULL,
PostTurnovers int(11) default NULL,
PostPF int(11) default NULL,
PostfgAttempted int(11) default NULL,
PostfgMade int(11) default NULL,
PostftAttempted int(11) default NULL,
PostftMade int(11) default NULL,
PostthreeAttempted int(11) default NULL,
PostthreeMade int(11) default NULL,
note varchar(255) default NULL
)
ENGINE = InnoDB
AUTO_INCREMENT = 23752
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table series_post
-- -----------------------------------------------------

create table if not exists series_post
(
id int(11) not null,
year int(11) default NULL,
round varchar(255) default NULL,
series varchar(255) default NULL,
tmIDWinner varchar(255) default NULL,
lgIDWinner varchar(255) default NULL,
tmIDLoser varchar(255) default NULL,
lgIDLoser varchar(255) default NULL,
W int(11) default NULL,
L int(11) default NULL
)
ENGINE = InnoDB
AUTO_INCREMENT = 776
DEFAULT CHARACTER SET = utf8;


############################################################################################
############################################################################################
############################################################################################

# INSERT DATA
LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/teams.csv' 
INTO TABLE teams 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/coaches.csv' 
INTO TABLE coaches 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/awards_coaches.csv' 
INTO TABLE awards_coaches 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/players.csv' 
INTO TABLE players 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/awards_players.csv' 
INTO TABLE awards_players 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/draft.csv' 
INTO TABLE draft 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/player_allstar.csv' 
INTO TABLE player_allstar 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/HW1/project/dataset/players_teams.csv' 
INTO TABLE players_teams 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/project/dataset/series_post.csv' 
INTO TABLE series_post 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


