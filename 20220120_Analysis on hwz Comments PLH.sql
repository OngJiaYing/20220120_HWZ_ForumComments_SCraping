-- Adjust the date and time of comments 

drop view if exists plh_tenyear_mop_time cascade;

create view plh_tenyear_mop_time as 

select comment_word, userid, date(date_of_comment) as date, date_trunc('hour',date_of_comment::time) as time_hour
from plh_tenyear_mop;

-- Overall most used words 
drop view if exists most_used_ranking cascade;

create view most_used_ranking as (
select count(comment_word) as use_number, comment_word, rank() over (order by count(comment_word) desc) as ranking
from plh_tenyear_mop_time
group by comment_word
order by use_number desc);

select *
from most_used_ranking
where ranking <=20;

-- Top 20 most used words by day 
with use_words_day as ( 
select count(comment_word) as use_number, comment_word, date, rank() over (partition by date order by count(comment_word) desc) as ranking
from plh_tenyear_mop_time
group by comment_word, date)

select * 
from use_words_day 
where ranking <= 20;

-- Joined tables to create sankey chart 
-- top 20 most used words
select ptmt.comment_word, ptmt.userid, ptmt.date, ptmt.time_hour, myr.use_number, myr.ranking  
from plh_tenyear_mop_time  as ptmt
left join most_used_ranking as myr 
on ptmt.comment_word = myr.comment_word
where ranking <= 20 and ptmt.comment_word = 'buy' and ptmt.userid=560301;

