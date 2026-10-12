CREATE DATABASE RESTAURANT ;
USE RESTAURANT ;

-- TABLE 1
create table customers (
customer_id int primary key ,
customer_name varchar(50),
city varchar(50));

-- TABLE 2
create table restaurants (
restaurant_id int primary key,
restaurant_name varchar(150),
cuisine varchar(50),
location varchar(50));

-- TABLE 3
create table orders (
    order_id int primary key,
    customer_id int,
    restaurant_id int,
    order_date date,
    delivery_time int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (restaurant_id) references restaurants(restaurant_id)
);

-- TABLE 4
create table ratings (
rating_id int primary key ,
order_id int,
rating decimal(2,1),
foreign key (order_id) references orders(order_id)
);

-- table 1 values
insert into customers (customer_id, customer_name, city) values
(101, 'Arun Kumar', 'Chennai'),
(102, 'Priya Sharma', 'Mumbai'),
(103, 'Rahul Verma', 'Delhi'),
(104, 'Sneha Reddy', 'Hyderabad'),
(105, 'Karthik Raj', 'Coimbatore'),
(106, 'Anjali Singh', 'Pune'),
(107, 'Vikram Patel', 'Ahmedabad'),
(108, 'Deepa Nair', 'Kochi'),
(109, 'Suresh Babu', 'Madurai'),
(110, 'Neha Gupta', 'Jaipur'),
(111, 'Manoj Kumar', 'Bengaluru'),
(112, 'Lakshmi Devi', 'Mysuru'),
(113, 'Rohit Jain', 'Indore'),
(114, 'Pooja Kapoor', 'Lucknow'),
(115, 'Ganesh Ravi', 'Trichy'),
(116, 'Meera Iyer', 'Salem'),
(117, 'Ajay Das', 'Kolkata'),
(118, 'Swathi Rao', 'Vijayawada'),
(119, 'Nitin Agarwal', 'Nagpur'),
(120, 'Keerthana S', 'Tirunelveli');

-- table 2 values 
insert into  restaurants (restaurant_id, restaurant_name, cuisine, location) values
(201, 'Spice Garden', 'Indian', 'Chennai'),
(202, 'Pizza Palace', 'Italian', 'Mumbai'),
(203, 'Dragon Wok', 'Chinese', 'Delhi'),
(204, 'Tandoori Treat', 'North Indian', 'Hyderabad'),
(205, 'Dosa Corner', 'South Indian', 'Bengaluru'),
(206, 'Burger Hub', 'Fast Food', 'Pune'),
(207, 'The Curry House', 'Indian', 'Ahmedabad'),
(208, 'Seafood Delight', 'Seafood', 'Kochi'),
(209, 'BBQ Nation', 'Barbecue', 'Kolkata'),
(210, 'Royal Biryani', 'Mughlai', 'Lucknow'),
(211, 'Mexican Fiesta', 'Mexican', 'Jaipur'),
(212, 'Sushi World', 'Japanese', 'Chennai'),
(213, 'Green Leaf', 'Vegetarian', 'Coimbatore'),
(214, 'Punjabi Dhaba', 'Punjabi', 'Amritsar'),
(215, 'Pasta Paradise', 'Italian', 'Surat'),
(216, 'Arabian Nights', 'Middle Eastern', 'Hyderabad'),
(217, 'Food Junction', 'Multi Cuisine', 'Madurai'),
(218, 'Grill Masters', 'Barbecue', 'Nagpur'),
(219, 'Taste of Thailand', 'Thai', 'Mysuru'),
(220, 'Urban Kitchen', 'Continental', 'Vijayawada');

-- table 3 values
insert into orders (order_id, customer_id, restaurant_id, order_date, delivery_time) values
(1001, 101, 201, '2024-01-05', 30),
(1002, 102, 202, '2024-01-06', 25),
(1003, 103, 203, '2024-01-07', 40),
(1004, 104, 204, '2024-01-08', 35),
(1005, 105, 205, '2024-01-09', 20),
(1006, 106, 206, '2024-01-10', 28),
(1007, 107, 207, '2024-01-11', 32),
(1008, 108, 208, '2024-01-12', 45),
(1009, 109, 209, '2024-01-13', 38),
(1010, 110, 210, '2024-01-14', 27),
(1011, 111, 211, '2024-01-15', 33),
(1012, 112, 212, '2024-01-16', 50),
(1013, 113, 213, '2024-01-17', 22),
(1014, 114, 214, '2024-01-18', 36),
(1015, 115, 215, '2024-01-19', 31),
(1016, 116, 216, '2024-01-20', 42),
(1017, 117, 217, '2024-01-21', 29),
(1018, 118, 218, '2024-01-22', 34),
(1019, 119, 219, '2024-01-23', 26),
(1020, 120, 220, '2024-01-24', 39);


-- table 4 values
insert into ratings (rating_id, order_id, rating) values
(1, 1001, 4.5),
(2, 1002, 3.8),
(3, 1003, 4.2),
(4, 1004, 4.9),
(5, 1005, 3.5),
(6, 1006, 4.0),
(7, 1007, 4.7),
(8, 1008, 3.9),
(9, 1009, 4.1),
(10, 1010, 4.8),
(11, 1011, 3.7),
(12, 1012, 4.6),
(13, 1013, 4.3),
(14, 1014, 3.6),
(15, 1015, 4.4),
(16, 1016, 5.0),
(17, 1017, 4.2),
(18, 1018, 3.9),
(19, 1019, 4.7),
(20, 1020, 4.0);

SELECT * FROM CUSTOMERS;

SELECT * FROM RESTAURANTS;

SELECT * FROM ORDERS;

SELECT * FROM RATINGS;


-- questios --

-- 1 -- Which restaurants receive the most orders?

select r.restaurant_id, r.restaurant_name,
COUNT(o.order_id) as total_orders from restaurants r
join orders o on r.restaurant_id = o.restaurant_id
group by  r.restaurant_id
order by total_orders desc;

-- 2 -- Which cuisine has the highest average rating?
 
select r.cuisine, round(avg(rt.rating), 2) as avg_rating from restaurants r
join orders o on r.restaurant_id = o.restaurant_id
join ratings rt on o.order_id = rt.order_id
group by r.cuisine
order by avg_rating desc;

-- 3 -- Which city or area has the highest demand?

select r.location as city, 
count(o.order_id) as total_orders from restaurants r
join orders o on r.restaurant_id = o.restaurant_id
group by r.location
order by total_orders desc;

-- 4 --  What is the average delivery time?

select round(avg(delivery_time), 2) as avg_delivery_time from orders;

-- 5 -- Which restaurants have high orders but low ratings?

select r.restaurant_name,
count(o.order_id) as total_orders,
round(avg(rt.rating), 2) as avg_rating from restaurants r
join orders o on r.restaurant_id = o.restaurant_id
join ratings rt on o.order_id = rt.order_id
group by r.restaurant_id
having avg(rt.rating) < 4.0
order by avg_rating asc;

