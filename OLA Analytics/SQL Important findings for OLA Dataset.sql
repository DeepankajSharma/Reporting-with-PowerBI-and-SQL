create database ola1;
use ola1;

create table ola(
date1 datetime,
time1 time,
booking_id varchar(20),
booking_status varchar(30),
customer_id varchar(20),
vehicle_type varchar(15),
pickup_loc varchar(100),
drop_loc varchar(100),
v_tat int,
c_tat int,
cancel_ride_by_customer varchar(50),
cancel_ride_by_driver varchar(50),
incomplete_ride varchar(5),
incomplete_ride_reason varchar(30),
booking_value float,
payment_method varchar(30),
ride_distance int,
driver_rating float,
customer_rating float
);
select * from ola;
# SQL Questions:
# 1. Retrieve all successful bookings:
select * from ola;

# 2. Find the average ride distance for each vehicle type:
select vehicle_type ,round(avg(ride_distance),2) as avg_ride_distance from ola group by vehicle_type order by avg_ride_distance desc;

# 3. Get the total number of cancelled rides by customers:
select cancel_ride_by_customer,count(booking_id) as count_by_cancel_ride  from ola group by cancel_ride_by_customer;

# 4. List the top 5 customers who booked the highest number of rides:
select customer_id,count(booking_id) as booking_count from ola group by customer_id order by booking_count desc limit 5;


# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select  cancel_ride_by_driver,count(booking_id) from ola where cancel_ride_by_driver!="Personal & Car related issue" group by cancel_ride_by_driver ;
select   count(*) from ola where cancel_ride_by_driver!="Personal & Car related issue"   ;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(driver_rating) as max_driver_ratings, min(driver_rating) as min_driver_ratings from ola where vehicle_type ="Prime Sedan";


# 7. Retrieve all rides where payment was made using UPI:
select count(*) from ola where payment_method="UPI";

# 8. Find the average customer rating per vehicle type:
select vehicle_type ,round(avg(customer_rating),2) as avg_customer_rating from ola group by vehicle_type order by avg_customer_rating desc;

# 9. Calculate the total booking value of rides completed successfully:

select incomplete_ride, sum(booking_value) as total_booking_value from ola group by incomplete_ride;
select   sum(booking_value) as total_booking_value from ola  where booking_status="Success";

# 10. List all incomplete rides along with the reason:
select * from ola;
select booking_id,incomplete_ride_reason from ola where incomplete_ride="Yes";



select count(*) from ola;