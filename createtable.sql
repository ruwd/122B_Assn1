CREATE TABLE movies ( 
id int not null  AUTO_INCREMENT, 
title varchar(100) not null, 
year int not null, 
director varchar(100) not null, 
banner_url varchar(200), 
trailer_url varchar(200), 
Primary key (id)
);

CREATE TABLE stars ( 
id int not null  AUTO_INCREMENT, 
first_name varchar(50) not null, 
last_name varchar(50) not null, 
dob date, 
photo_url varchar(200), 
Primary key (id)
);

CREATE TABLE stars_in_movies( 
star_id int not null, 
movie_id int not null, 
FOREIGN KEY (star_id) REFERENCES stars(id) ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE, 
Primary key (star_id, movie_id)
);


CREATE TABLE genres( 
id int not null AUTO_INCREMENT, 
name varchar(32) not null, 
Primary key (id)
);


CREATE TABLE genres_in_movies( 
genre_id int not null, 
movie_id int not null, 
FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE, 
Primary key (genre_id, movie_id)
);

CREATE TABLE creditcards ( 
id varchar(20) not null, 
first_name varchar(50) not null, 
last_name varchar(50) not null, 
expiration date  not null, 
Primary key(id)
);

CREATE TABLE customers( 
id int not null AUTO_INCREMENT, 
first_name varchar(50)  not null, 
last_name varchar(50) not null, 
cc_id varchar(20) not null, 
address varchar(200) not null, 
email varchar(50) not null, 
password varchar(20) not null, 
FOREIGN KEY (cc_id) REFERENCES creditcards(id) ON DELETE CASCADE ON UPDATE CASCADE, 
Primary key (id)
);

CREATE TABLE sales ( 
id int not null AUTO_INCREMENT, 
customer_id int not null, 
movie_id int not null, 
sale_date date not null, 
FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE, 
Primary key(id)
);

