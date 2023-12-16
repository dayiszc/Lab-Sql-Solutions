use bank;
select client_id from client where district_id = 1 order by client_id limit 5;  -- QUERY 1
select client_id from client where district_id = 72 order by client_id desc limit 1; -- QUERY 2
select amount from loan order by amount limit 3; -- QUERY 3
select distinct status from loan order by status; -- QUERY 4
select loan_id from loan order by amount desc limit 1;-- QUERY 5 in this exercise my output is not the same as in the lab output
select account_id, amount from loan order by amount limit 5;-- QUERY 6 revisar
select account_id, min(amount) as lowest_amount from loan group by account_id order by lowest_amount limit 5;-- revisar
select account_id, min(amount) as lowest_amount from loan where duration = 60 group by account_id order by lowest_amount limit 5; -- QUERY 7
select distinct k_symbol from `order`; -- QUERY 8
select order_id from `order` where account_id = 34; -- QUERY 9
select distinct account_id from bank.order where order_id between 29540 and 29560; -- QUERY 10
select amount from bank.order where account_to = 30067122; -- QUERY 11
select trans_id, date, type, amount from bank.trans where account_id =793 order by date desc limit 10; -- QUERY 12
select district_id, count(*) as num_clients from bank.client where district_id <10 group by district_id order by district_id asc; -- QUERY 13
select type, count(*) as num_cards from bank.card group by type order by num_cards desc; -- QUERY 14
select account_id, sum(amount) as total_loan_amount from bank.loan group by account_id order by total_loan_amount desc limit 10; -- QUERY 15
select date, count(*) as num_loans from bank.loan where date< 930907 group by date order by date desc; -- QUERY 16
select date, duration, count(*) as num_loans from bank.loan where date >=971201 and date <=971231 group by date, duration order by date asc, duration asc; -- QUERY 17
select account_id, type, sum(amount) as total_amount from trans where account_id =396 group by account_id, type order by type asc; -- QUERY 18
select -- QUERY 19
account_id, case when type = 'VYDAJ' THEN 'OUTGOING' when type = 'PRIJEM' THEN ' INCOMING' else type end as transaction_type, 
floor(sum(amount)) as total_amount from trans where account_id = 396 group by account_id, type order by transaction_type asc;
select -- QUERY 20 
    account_id,
    FLOOR(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END)) AS incoming_amount,
    FLOOR(SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END)) AS outgoing_amount,
    FLOOR(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END) - SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END)) AS difference
from trans
where account_id = 396
group by account_id;

select account_id, -- QUERY 21
FLOOR(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END) - SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END)) AS difference
from trans group by account_id order by difference desc limit 10;

