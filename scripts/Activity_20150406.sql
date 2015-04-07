/* 
select * from comment;
*/	

with recursive nodes (id, comment, author, parent_comment_id, movie_id) as (
		select c.id, c.comment, c.author, c.parent_comment_id, c.movie_id
		from comment as c 
		where c.id = 32 -- Id to find.
	UNION ALL
		select c.id, c.comment, c.author, c.parent_comment_id, c.movie_id 
		from nodes ns
		join comment c on c.parent_comment_id = ns.id
)
select * from nodes order by id asc;
