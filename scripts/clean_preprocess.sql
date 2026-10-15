use amazon_sales;
drop table if exists amazon_sales_report;
create table if not exists amazon_sales_report (
     indax int,
     order_id text,
     order_status text,
     fulfillment text,
     sales_channel text,
     ship_service_level text,
     style text,
     SKU text,
     category text,
     size text,
     ASIN text,
     courier_status text null,
     quantity int ,
     currency text null,
     amount double null,
     ship_city text null,
     ship_state text null,
     ship_postal_code double null,
     ship_country text null,
     promotion_ids text null,
     b2b text null,
     fulfilled_by text null,
     unnamed text null,
     months text 
);

select * from amazon_sales_report;

SET sql_mode = '';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/amazon_sales_report.csv'
INTO TABLE amazon_sales_report
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from amazon_sales_report;

ALTER TABLE amazon_sales_report 
DROP COLUMN `indax`,
DROP COLUMN `ASIN`,
DROP COLUMN `currency`,
DROP COLUMN `fulfilled_by`,
DROP COLUMN `promotion_ids`,
DROP COLUMN `unnamed`;

select * from amazon_sales_report;

select count(order_id) from amazon_sales_report;

ALTER TABLE amazon_sales_report 
CHANGE COLUMN `order_id` `order_id` VARCHAR(50),
CHANGE COLUMN `sales_channel` `sales_channel` VARCHAR(50),
CHANGE COLUMN `fulfillment` `fulfillment` VARCHAR(50),
CHANGE COLUMN `ship_service_level` `ship_service_level` VARCHAR(50),
CHANGE COLUMN `courier_status` `courier_status` VARCHAR(50),
CHANGE COLUMN `ship_city` `ship_city` VARCHAR(100),
CHANGE COLUMN `ship_state` `ship_state` VARCHAR(100),
CHANGE COLUMN `ship_country` `ship_country` VARCHAR(50);

UPDATE amazon_sales_report 
SET ship_state = UPPER(TRIM(ship_state)),
    ship_city = UPPER(TRIM(ship_city));
    
UPDATE amazon_sales_report 
SET ship_city = 'unknown', ship_state = 'unknown', ship_postal_code = 'unknown', ship_country = 'unknown'
WHERE ship_city = '';

UPDATE amazon_sales_report 
SET courier_status = 'unknown' 
WHERE courier_status = '';

UPDATE amazon_sales_report 
SET ship_state = 'RAJASTHAN'
WHERE ship_state IN ('RJ', 'RAJSTHAN');

UPDATE amazon_sales_report 
SET ship_state = 'ODISHA'
WHERE ship_state = 'ORISSA';

UPDATE amazon_sales_report 
SET ship_state = 'PUDUCHERRY'
WHERE ship_state = 'PONDICHERRY';

UPDATE amazon_sales_report 
SET ship_state = 'NAGALAND'
WHERE ship_state = 'NL';

UPDATE amazon_sales_report 
SET ship_state = 'PUNJAB'
WHERE ship_state LIKE 'PUN%';

UPDATE amazon_sales_report 
SET ship_state = 'PUNJAB'
WHERE ship_state LIKE 'PB%';

UPDATE amazon_sales_report 
SET ship_state = 'ANDHRA PRADESH'
WHERE ship_state = 'APO';

UPDATE amazon_sales_report 
SET ship_state = 'ARUNACHAL PRADESH'
WHERE ship_state = 'AR';

UPDATE amazon_sales_report 
SET ship_state = 'DELHI'
WHERE ship_state = 'NEW DELHI';

select * from amazon_sales_report;

ALTER TABLE amazon_sales_report 
ADD COLUMN net_revenue double ;

update amazon_sales_report
set net_revenue = 0.00 
where order_status = 'Cancelled';

update amazon_sales_report
set net_revenue = amount
where order_status != 'Cancelled';