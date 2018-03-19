# CREATE SCHEMA

CREATE DATABASE IF NOT EXISTS NBA;
USE NBA ;

SET SQL_SAFE_UPDATES = 0;

#####################################################################

# Create tables


-- -----------------------------------------------------
# Table `Team`
-- -----------------------------------------------------

create table if not exists Conference 
(
Division varchar(50) primary key,
Conference varchar(50) not null
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;




create table if not exists Team
(
TeamId int(11) not null primary key,
TeamName varchar(45) not null,
State varchar(50) not null,
City varchar(50) not null,
Division varchar(50) not null,
Arena varchar(70) not null,
Founded int,
ArenaCapacity int,
Rings int,
foreign key (`Division`) references `Conference`(`Division`)
on update cascade 
on delete cascade
);
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
  
  
  
-- -----------------------------------------------------
# Table `Game`
-- -----------------------------------------------------
create table if not exists Game 
(
GameId int(11) not null primary key,
Team1Id int(11) not null,
Team2Id int(11) not nulL,
ResultOfTeam1 int(11) not null,
URL varchar(80),
Date date not null,
#INDEX `Team1Id_idx` (`Team1Id` ASC),
#INDEX `Team2Id_idx` (`Team2Id` ASC),
foreign key (`Team1Id`) references `Team`(`TeamId`)
on update cascade 
on delete no action,
foreign key (`Team2Id`) references `Team`(`TeamId`)
on update cascade 
on delete no action)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



-- -----------------------------------------------------
# Table `Player`
-- -----------------------------------------------------
create table if not exists Player 
(
PlayerId int(11) not null primary key,
PlayerName varchar(30) not null
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



-- -----------------------------------------------------
# Table `Actions`
-- -----------------------------------------------------

create table if not exists Actions 
(
GameId int(11) not null,
TeamId int(11) not null,
PlayerId int(11) not null,
Minutes int(11) default 0,
FieldGoalsMade int(11) default NULL,
FieldGoalAttempts int(11) default NULL,
3PointsMade int(11) default NULL,
3PointAttempts int(11) default NULL,
FreeThrowsMade int(11) default NULL,
FreeThrowAttempts int(11) default NULL,
PlusMinus int(11) default NULL,
OffensiveRebounds int(11) default NULL,
DefensiveRebounds int(11) default NULL,
TotalRebounds int(11) default NULL,
Assists int(11) default NULL,
PersonalFouls int(11) default NULL,
Steals int(11) default NULL,
Turnovers int(11) default NULL,
BlockedShots int(11) default NULL,
BlocksAgainst int(11) default NULL,
Points int(11) default NULL,
Starter int(11) default 0,
primary key (GameId, PlayerId),
#INDEX `GameId_idx` (`GameId` ASC),
#INDEX `PlayerId_idx` (`PlayerId` ASC),
#INDEX `TeamId_idx` (`TeamId` ASC),

foreign key (`GameId`) references `Game`(`GameId`)
on update cascade 
on delete cascade,

foreign key (`PlayerId`) references `Player`(`PlayerId`)
on update cascade 
on delete no action,

foreign key (`TeamId`) references `Team`(`TeamId`)
on update cascade 
on delete no action
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



# Insert data into Conference table
insert into Conference (Division, Conference)
values
('Atlantic','Eastern'),
('Central','Eastern'),
('Southeast','Eastern'),
('Northwest','Western'),
('Pacific','Western'),
('Southwest','Western')
;




# Load data inside tables

LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/Data/Team.csv' 
INTO TABLE Team 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/Data/Player.csv' 
INTO TABLE Player 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/Data/Game.csv' 
INTO TABLE Game 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/Users/andreamarcocchia/Desktop/Data managment/Data/Actions.csv' 
INTO TABLE Actions 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



