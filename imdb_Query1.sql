
insert into movie values(121,'lost in jungle',1990,'english',45,11);

insert into actor values(11,'johnson','kane','m');

update movie set director_dir_id=200 where mov_id=121;

update actor set act_lname='mony' where act_id=11;

delete from movie where mov_id=121;

select * from movie;

select dir_id, dir_fname, mov_title from director inner join movie on dir_id=director_dir_id;

select * from reviewer;
