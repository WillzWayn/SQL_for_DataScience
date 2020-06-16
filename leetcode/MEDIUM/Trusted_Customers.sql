create table customers
	(customer_id int, customer_name varchar(50), email varchar(50))
    ;
    
Insert into customers
values
	(1, 'Alice', 'alice@leetcode.com'),
	(2, 'Bob',  'bob@leetcode.com'),
	(13, 'John', 'john@leetcode.com'),
	(6,  'Alex', 'alex@leetcode.com');
 
create table contacts
	(user_id int, contact_name varchar(50), contact_email varchar(50));
Insert into customers
values
	(1, 'Bob', 'bob@leetcode.com'),
	(2, 'Bob',  'bob@leetcode.com'),
	(1, 'John', 'john@leetcode.com'),
    (1, 'Jal', 'jal@leetcode.com'),
    (2, 'Omar', 'omar@leetcode.com'),
    (2, 'Meir', 'meir@leetcode.com'),
	(6,  'Alice', 'alice@leetcode.com')
    ;
    
create table invoice
	(invoice_id int, price int, user_id int)
    ;
    
Insert into invoice
values
	(77, 100, 1),
    (88, 200, 1),
    (99, 300, 2),
    (66, 400, 2),
    (55, 500, 13),
    (44, 60, 6)
    ;


select invoice.invoice_id, customer_name, price, 
count(contacts.user_id) as contacts_cnt,
sum(case when contacts.contact_name in (select customer_name from customers) then 1 else 0 end) as trusted_contacts_cnt
from invoice inner join customers on invoice.user_id = customers.customer_id
left join contacts on customers.customer_id = contacts.user_id
group by invoice.invoice_id, customer_name, price
order by invoice.invoice_id