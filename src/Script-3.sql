create table customers(
	customer_id integer primary key,
	name text,
	email text
);

create table orders(
	order_id integer primary Key, 
	customer_id integer,
	order_date date,
	total_amount numeric(10,4),
	foreign key(customer_id) references customers(customer_id) on delete cascade
);

create table products(
	product_id integer primary key,
	product_name text, 
	price numeric(10,4)
);

create table order_items(
	order_item_id integer primary Key,
	order_id integer, 
	product_id integer,
	quantity integer,
	foreign key(order_id) references orders(order_id) on delete cascade,
	foreign key(product_id) references products(product_id) on delete cascade
);

create table categories(
	category_id integer primary Key,
	category_name text
);

INSERT INTO customers (customer_id, name, email) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
(3, 'Alice Johnson', 'alice.johnson@example.com'),
(4, 'Bob Brown', 'bob.brown@example.com'),
(5, 'Carol Davis', 'carol.davis@example.com'),
(6, 'David Wilson', 'david.wilson@example.com'),
(7, 'Emily Clark', 'emily.clark@example.com'),
(8, 'Frank Harris', 'frank.harris@example.com'),
(9, 'Grace Lewis', 'grace.lewis@example.com'),
(10, 'Hannah Walker', 'hannah.walker@example.com');

select*from customers;

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2024-08-01', 250.00),
(2, 2, '2024-08-02', 150.50),
(3, 3, '2024-08-03', 99.99),
(4, 4, '2024-08-04', 299.90),
(5, 5, '2024-08-05', 189.75),
(6, 6, '2024-08-06', 349.20),
(7, 7, '2024-08-07', 129.45),
(8, 8, '2024-08-08', 89.99),
(9, 9, '2024-08-09', 499.99),
(10, 10, '2024-08-10', 75.00),
(11, 1, '2024-08-11', 400.50),
(12, 2, '2024-08-12', 220.00),
(13, 3, '2024-08-13', 105.25),
(14, 4, '2024-08-14', 215.30),
(15, 5, '2024-08-15', 310.00);

select*from orders;

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 999.99),
(2, 'Smartphone', 499.99),
(3, 'Headphones', 89.99),
(4, 'Keyboard', 45.99),
(5, 'Mouse', 25.99),
(6, 'Monitor', 199.99),
(7, 'Printer', 129.99),
(8, 'Tablet', 349.99),
(9, 'Webcam', 59.99),
(10, 'External Hard Drive', 129.99);

select*from products;

INSERT INTO order_items (order_item_id, order_id, product_id,
quantity) VALUES
(1, 1, 1, 1), -- 1 Laptop
(2, 1, 3, 2), -- 2 Headphones
(3, 2, 2, 1), -- 1 Smartphone
(4, 2, 5, 1), -- 1 Mouse
(5, 3, 4, 1), -- 1 Keyboard
(6, 4, 6, 2), -- 2 Monitors
(7, 5, 7, 1), -- 1 Printer
(8, 6, 8, 1), -- 1 Tablet
(9, 7, 9, 1), -- 1 Webcam
(10, 8, 3, 1), -- 1 Headphones
(11, 9, 10, 1), -- 1 External Hard Drive
(12, 10, 2, 1), -- 1 Smartphone
(13, 11, 1, 1), -- 1 Laptop
(14, 12, 6, 1), -- 1 Monitor
(15, 13, 4, 1), -- 1 Keyboard
(16, 14, 8, 1), -- 1 Tablet
(17, 15, 5, 2); -- 2 Mice

select*from order_items;

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Computers'),
(4, 'Office Supplies'),
(5, 'Mobile Devices');

select*from categories;

--qn30
create or replace view view_orders as select o.order_id,o.customer_id,c.name as customer_name,oi.product_id ,p.product_name, oi.quantity ,o.order_date,o.total_amount from orders o inner join customers c on c.customer_id=o.customer_id inner join order_items oi on oi.order_id=o.order_id inner join products p on p.product_id =oi.product_id ;
select*from view_orders;

--qn29
select c.customer_id ,c.name as customer_name,o.order_id as latest_order_id,o.order_date as latest_order_date from customers c inner join orders o on o.customer_id =c.customer_id inner join(select customer_id,max(order_date) as latest_orderDate from orders group by customer_id)latest_order on latest_order.customer_id=o.customer_id and latest_order.latest_orderDate=o.order_date ; 

--qn28
select*from products;
alter table products add column category_id integer;
alter table products add constraint fk foreign key(category_id) references categories(category_id) on delete cascade;
1-4
2-5
3-2
4-1
5-1
6-3
7-4
8-2
9-2
10-1
update products set category_id=4 where product_id=1;
update products set category_id=5 where product_id=2;
update products set category_id=2 where product_id=3;
update products set category_id=1 where product_id=4;
update products set category_id=1 where product_id=5;
update products set category_id=3 where product_id=6;
update products set category_id=4 where product_id=7;
update products set category_id=2 where product_id=8;
update products set category_id=2 where product_id=9;
update products set category_id=1 where product_id=10;

select*from products;

select c.category_id ,c.category_name,sum(p.price) as total_sales_amount from categories c inner join products p on c.category_id=p.category_id group by c.category_id ;

--qn27
select*from orders;
select c.customer_id ,c.name as customer_name from customers c inner join orders o on o.customer_id =c.customer_id group by c.customer_id having count(o.order_id)>5;

--qn26
select*from products;
alter table products add column discount_price numeric(10,4);
update products set discount_price=(price-(price*0.1));

--qn25
delete from products where product_id not in (select oi.product_id from products p left join order_items oi on oi.product_id =p.product_id) ;

--qn24
select*from orders where total_amount >(select avg(total_amount) from orders) ; 

--qn22
select c.category_id ,c.category_name,p.product_name,p.price from categories c inner join products p on p.category_id=c.category_id inner join (select category_id,max(price)as max_price from products group by category_id)grouped on grouped.category_id=p.category_id and p.price =grouped.max_price;

--qn21
create index order_date_index on orders(order_date);

--qn20
select *from customers;
select*from orders;
select customer_id ,name as customer_name from customers where customer_id not in(select c.customer_id from customers c left join orders o on o.customer_id =c.customer_id );

--qn17
select*from order_items;
select*from products;
select p.product_id ,p.product_name,sum(oi.quantity*p.price) as total_amount from order_items oi inner join products p on p.product_id =oi.product_id group by p.product_id order by total_amount desc limit(5);

--qn16
select*from customers;
select*from orders;
select o.order_id ,o.customer_id ,c.name as customer_name from orders o inner join customers c on c.customer_id=o.customer_id where o.order_date >=(current_date - interval '5 days'); 
