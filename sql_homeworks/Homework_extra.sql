create table authors (id int, name varchar(50), country varchar(50))
create table books (id int, title varchar(50), author_id int)
insert into authors values (1, 'J.K. Rowling', 'United Kingdom'), (2, 'George Orwell', 'United Kingdom'),
(3, 'Mark Twain', 'United States')
insert into books values (1, 'Harry Potter', 1), (2, '1984', 2), (3, 'The Adventures of Tom Sawyer', 3)
select * from authors
select * from books

--1

select title from books
where author_id in (
select id from authors
where country = 'United Kingdom')
