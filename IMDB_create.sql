-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-11-21 14:09:13.629

-- tables
-- Table: actor
CREATE TABLE actor (
    act_id int  NOT NULL,
    act_fname varchar(25)  NOT NULL,
    act_lname varchar(25)  NOT NULL,
    act_gender char(6)  NOT NULL,
    CONSTRAINT actor_pk PRIMARY KEY  (act_id)
);

-- Table: director
CREATE TABLE director (
    dir_id int  NOT NULL,
    dir_fname varchar(25)  NOT NULL,
    dir_lname varchar(25)  NOT NULL,
    CONSTRAINT director_pk PRIMARY KEY  (dir_id)
);

-- Table: movie
CREATE TABLE movie (
    mov_id int  NOT NULL,
    mov_title varchar(25)  NOT NULL,
    mov_yr int  NOT NULL,
    mov_lang int  NOT NULL,
    director_dir_id int  NOT NULL,
    actor_act_id int  NOT NULL,
    CONSTRAINT movie_pk PRIMARY KEY  (mov_id)
);

-- Table: movie_cast
CREATE TABLE movie_cast (
    movie_mov_id int  NOT NULL,
    actor_act_id int  NOT NULL,
    director_dir_id int  NOT NULL,
    role varchar(20)  NOT NULL,
    CONSTRAINT movie_cast_pk PRIMARY KEY  (movie_mov_id)
);

-- Table: rating
CREATE TABLE rating (
    movie_mov_id int  NOT NULL,
    reviewer_rev_id int  NOT NULL,
    rev_stars int  NOT NULL,
    num_o_ratings int  NOT NULL,
    CONSTRAINT rating_pk PRIMARY KEY  (movie_mov_id)
);

-- Table: reviewer
CREATE TABLE reviewer (
    rev_id int  NOT NULL,
    rev_name int  NOT NULL,
    CONSTRAINT reviewer_pk PRIMARY KEY  (rev_id)
);

-- foreign keys
-- Reference: movie cast_actor (table: movie_cast)
ALTER TABLE movie_cast ADD CONSTRAINT movie cast_actor
    FOREIGN KEY (actor_act_id)
    REFERENCES actor (act_id);

-- Reference: movie cast_director (table: movie_cast)
ALTER TABLE movie_cast ADD CONSTRAINT movie cast_director
    FOREIGN KEY (director_dir_id)
    REFERENCES director (dir_id);

-- Reference: movie cast_movie (table: movie_cast)
ALTER TABLE movie_cast ADD CONSTRAINT movie cast_movie
    FOREIGN KEY (movie_mov_id)
    REFERENCES movie (mov_id);

-- Reference: movie_actor (table: movie)
ALTER TABLE movie ADD CONSTRAINT movie_actor
    FOREIGN KEY (actor_act_id)
    REFERENCES actor (act_id);

-- Reference: movie_director (table: movie)
ALTER TABLE movie ADD CONSTRAINT movie_director
    FOREIGN KEY (director_dir_id)
    REFERENCES director (dir_id);

-- Reference: rating_movie (table: rating)
ALTER TABLE rating ADD CONSTRAINT rating_movie
    FOREIGN KEY (movie_mov_id)
    REFERENCES movie (mov_id);

-- Reference: rating_reviewer (table: rating)
ALTER TABLE rating ADD CONSTRAINT rating_reviewer
    FOREIGN KEY (reviewer_rev_id)
    REFERENCES reviewer (rev_id);

-- End of file.

