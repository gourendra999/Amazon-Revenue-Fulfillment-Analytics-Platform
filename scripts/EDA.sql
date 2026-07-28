SELECT * FROM amazon_sales.amazon_sales_report;

select count(order_id) from amazon_sales_report;

select count(distinct order_id) from amazon_sales_report;

select category, sum(amount) as revenue from amazon_sales_report
group by category
order by revenue desc;

select category, count(order_id) as orders, avg(amount) from amazon_sales_report
group by category
order by orders desc;

select distinct size from amazon_sales_report;

select category, count(distinct style) as styles from amazon_sales_report
group by category
order by styles desc;

select count(courier_status) from amazon_sales_report
where courier_status = '';

select distinct courier_status from amazon_sales_report;

select courier_status from amazon_sales_report
where quantity = 0
group by courier_status;

select order_status, count(amount) from amazon_sales_report
where amount = 0
group by order_status;

select count(order_status) from amazon_sales_report
where order_status = '';

select order_status, count(courier_status) from amazon_sales_report
where courier_status = ''
group by order_status;

select order_status, sum(amount) from amazon_sales_report
group by order_status;

select sales_channel, sum(amount) from amazon_sales_report
group by sales_channel;

select fulfillment, order_status , sum(amount) from amazon_sales_report
where order_status = 'Cancelled'
group by fulfillment;

select count(ship_city) from amazon_sales_report
where ship_city = '';

select count(ship_state) from amazon_sales_report
where ship_state = '';

select ship_state, count(ship_city) from amazon_sales_report
where ship_city = 'unknown'
group by ship_state;

select ship_state, count(distinct ship_city) as cities from amazon_sales_report
group by ship_state
order by cities desc;

select ship_state, count(order_id) from amazon_sales_report
group by ship_state
order by count(order_id) desc;

select ship_city, count(order_id) as orders from amazon_sales_report
group by ship_city
order by orders desc
limit 10;

select ship_state, count(ship_country) from amazon_sales_report
where ship_country = 'unknown'
group by ship_state;

select distinct ship_state from amazon_sales_report;

select ship_state,count(ship_postal_code) from amazon_sales_report
where ship_postal_code = 'unknown'
group by ship_state;

select count(distinct b2b) from amazon_sales_report;

select count(b2b) from amazon_sales_report
where b2b = '';

select order_date, quantity from amazon_sales_report
where quantity = 1 ;