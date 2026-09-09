-- 1. Find all active users who have completed more than 10 rides and have a wallet balance greater than 100.
select 
	* 
from users 
where is_active = 1 
and total_rides > 10
and wallet_balance > 100;

-- 2. Find the top 10 completed rides with the highest total fare.
select 
	*
from rides
where ride_status = "Completed"
order by total_fare desc
limit 10;

-- 3. Find users whose names start with 'A' and whose preferred payment mode is either UPI or Wallet.
select 
	*
from users
where name like "A%"
and preferred_payment_mode in("UPI", "Wallet");

-- 4. Find the total number of rides, total revenue, average fare, minimum fare and maximum fare for completed rides.
select 
	count(*),
    sum(total_fare) as total_revenue,
    round(avg(total_fare)),
    min(total_fare) as minimum_fare,
    max(total_fare) as maximum_fare
from rides
where ride_status = "Completed";

-- 5. Find the number of completed rides and total revenue for each payment mode.
select 
	count(*),
    round(sum(total_fare),2) as total_revenue,
    payment_mode
from rides
where ride_status = "Completed"
group by payment_mode;

-- 6. Find cities having more than 3,000 completed rides.
select 
	count(*),
    city_id
from rides
where ride_status = "Completed"
group by city_id
having count(*) > 3000;

-- 7. Display each user's name in uppercase along with the length of their name.
select 
	user_id,
    upper(name),
    length(name)
from users;

-- 8. Find the number of rides completed in each year.
select 
	count(*),
    year(pickup_time)
from rides
where ride_status = "Completed"
group by year(pickup_time);

-- 9. Categorize rides based on total fare as Low, Medium or High.
select 
	ride_id,
    total_fare,
	CASE
		when total_fare < 100 then "Low"
		when total_fare between 100 and 300 then "Medium"
		else "High"
	end as fare_category
from rides;

-- 10. Find the average ride duration and average distance for each ride status.
select 
	round(avg(duration_min),2),
    round(avg(distance_km),2),
    ride_status
from rides
group by ride_status;

-- 11. Display each user's name along with the city name where they are registered.
select 
	users.user_id,
    users.name,
    cities.city_name
from users
join cities on
	users.city_id = cities.city_id;
    
-- 12. Display ride details along with the user's name and driver's name.
select
	rides.ride_id,
    users.name,
    drivers.name
from rides
join users on 
	rides.city_id = users.city_id
join drivers on 
	rides.driver_id = drivers.driver_id;
    
-- 13. Find the total number of completed rides and total revenue for each city.
select 
	round(sum(rides.total_fare)),2,
    cities.city_id,
    cities.city_name
from rides
join cities on
	rides.city_id = cities.city_id
where rides.ride_status = "Completed"
group by
	cities.city_id,
	cities.city_name;

-- 14. Display drivers along with their vehicle type, make, model and fuel type.
select
	drivers.driver_id,
    drivers.name,
    vehicles.vehicle_type,
    vehicles.make,
    vehicles.model,
    vehicles.fuel_type
from drivers
join vehicles on 
	drivers.driver_id = vehicles.driver_id;
    
-- 15. Find the top 5 cities based on average completed-ride fare.
select 
	cities.city_id,
    cities.city_name,
    round(sum(rides.total_fare),2)
from cities
join rides on
	cities.city_id = rides.city_id 
where rides.ride_status = "Completed"
group by 
	cities.city_id,
    cities.city_name
order by 
	round(sum(rides.total_fare),2)
limit 5;

-- 16. Display completed rides along with their payment status.
select 
	payments.payment_id,
    payments.payment_status,
    rides.ride_id
from payments
join rides on 
	payments.ride_id = rides.ride_id
where rides.ride_status = "Completed";

-- 17. Find the total discount amount applied for each campaign.
select 
	promotions.campaign_name,
    round(sum(promotions.discount_amt),2)
from promotions 
group by promotions.campaign_name;

-- 18. Find users whose total rides are greater than the average total rides of all users.
select
	user_id,
    name,
    total_rides
from users 
where total_rides > (
select avg(total_rides) 
from users);

-- 19. Find drivers whose rating is higher than the average rating of all drivers.
select
	driver_id,
    name,
    rating
from drivers 
where rating > (
select avg(rating)
from drivers);

-- 20. Find rides whose total fare is greater than the average fare of all completed rides.
select
	ride_id,
    total_fare
from rides
where total_fare > (
select avg(total_fare)
from rides
where ride_status = "Completed");

-- 21. Using a CTE, calculate the total completed rides and revenue for each city, then display cities generating more than 1,000,000 in revenue.
WITH city_stats AS (
    SELECT 
        city_id,
        COUNT(*) AS total_rides,
        SUM(total_fare) AS total_revenue
    FROM rides
    WHERE ride_status = 'completed'
    GROUP BY city_id
)
SELECT 
    c.city_name,
    cs.total_rides,
    ROUND(cs.total_revenue, 2) AS total_revenue
FROM city_stats cs
JOIN cities c
    ON cs.city_id = c.city_id
WHERE cs.total_revenue > 1000000
ORDER BY cs.total_revenue DESC;

-- 22. Create a view showing active drivers with a rating of 4.5 or above.
create view driver_details as
select
	driver_id,
    rating,
    city_id,
    linked_user_id
from drivers 
where rating >= 4.5
and is_active = 1;

select * from driver_details;

-- 23. Rank drivers within each city based on their rating.
select 
	driver_id,
    city_id,
    linked_user_id,
    rating,
    rank() over(
		partition by city_id) as city_rank
from drivers;

-- 24. Display each completed ride along with the previous completed ride's fare for the same user 
select 
	ride_id,
    user_id,
    pickup_time,
    total_fare,
    lag(total_fare) over(
		partition by user_id) as previous_completed_ride
from rides
where ride_status = "Completed";

-- 25. Assign a row number to drivers within each city based on their total completed rides.
select
	driver_id,
    city_id,
    name,
    total_rides_completed,
    row_number() over(
		partition by city_id) as total_rides_completed
from drivers;