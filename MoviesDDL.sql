
create database Movies_Database
go
use Movies_Database
go
--===================
create table Movies
(
	id int primary key,
	title char(50),
	[year] int,
	[time] int,
	[language] char(50),
	date_release datetime2,
	release_country char(5)
)
go
create table Genres
(
	id int primary key,
	title char(20)
)
go
create table Actors
(
	id int primary key,
	f_name char(20),
	l_name char(20),
	gender char(1)
)
go
create table Directors
(
	id int primary key,
	f_name char(20),
	l_name char(20)
)
go
create table Reviewers
(
	id int primary key,
	[name] char(30)
)
go
--------
-- i understood that 
-- Directors -- M:M -- Movies
-- so [Movie_Director] table is generated from M:M relationship
create table Movies_Directors
(
	movie_id int foreign key references Movies(id),
	director_id int foreign key references Directors(id),
	primary key(movie_id , director_id),
	
)
go
create table Movies_Cast
(
	actor_id int foreign key references Actors(id),
	movie_id int foreign key references Movies(id),
	primary key(actor_id , movie_id)
)
go
create table Movies_Geners
(
	movie_id int foreign key references Movies(id),
	genra_id int foreign key references Genres(id),
	primary key(movie_id , genra_id)
)
go
create table Rating
(
	movie_id int foreign key references Movies(id),
	reviewer_id int foreign key references Reviewers(id),
	reviewer_stars int,
	num_of_ratings int,
	primary key(movie_id , reviewer_id)
)
go




