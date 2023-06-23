use ig_clone;
show tables from ig_clone;


#----------#

# Q2 We want to reward the user who has been around the longest, find the 5 oldest users.
select * from users order by created_at asc limit 5;

#----------#

# Q3 To understand when to run the ad campaign, figure out the day of the week most users register on?

select id, username, dayname(created_at) as day_name, count(*) as day_name from users
group by day_name;

#----------#

# Q4 To target inactive users in an email ad campaign, find the users who have never posted a photo

select u.id, p.user_id, u.username from users u
join photos p on u.id=p.id where p.id not in (select user_id from photos);

#----------#

# Q5 Suppose you are running a contest who got most likes on a photo. Find out who won

select p.id, p.user_id ,u.username, count(*) as likes
from likes l join photos p on p.id=l.photo_id
join users u on u.id=l.user_id group by p.id order by 
likes desc;

#----------#

# Q6 Investors want to know many times does an avg user post?

select round((select count(*) from photos)/(select count(*) from users),1) as Avg_post;

#----------#

# Q7 A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.

select t.id, t.tag_name, count(tag_name) as total from photo_tags pt join 
tags t on pt.tag_id=t.id group by tag_id order by total desc limit 5;

#----------#

# Q8 To find out if there are bots, find out who have liked every single photo on the site.

select u.id, u.username, count(u.id) as most_likes
from users u join likes l on u.id=l.user_id group by u.id 
having most_likes=(select count(*) from photos);

#----------#

# Q9 To know who the celebrities are, find users who have never commented on a photo.

select c.id, p.user_id, u.username from photos p
join comments c on p.id=c.id join users u on c.id=u.id
where u.id not in(select user_id from comments) 
group by u.id;

#----------#

# Q 10 Find both of them together, find the users who have never commented on any photo or have commented on every photo.

# never commented on a photo
select c.id, p.user_id, u.username from photos p
join comments c on p.id=c.id join users u on c.id=u.id
where u.id not in(select user_id from comments) 
group by u.id;

# commented on every photo
select c.id, p.user_id, u.username from photos p
join comments c on p.id=c.id join users u on c.id=u.id
where u.id in(select user_id from comments) 
group by u.id;

