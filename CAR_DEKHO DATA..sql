

use cars;

-- Reading Data--
		
        select * from car_dekho;

-- 1) What is the Count of Records --
		
        select count(*) as Total_records
		from car_dekho;

-- 2) How many cars will be available in 2023 
		
        select count(*) as car_count
        from car_dekho
		where year=2023

-- 3) How many cars will be available in 2020,2021,2022

		select count(*) as car_count
        from car_dekho
        where year between 2020 and 2022
		
-- 4) Print all the fuel cars (petrol, diesel,and CNG) come by all year 
		
        select name from car_dekho
		where fuel in ("petrol", "diesel", "CNG");

-- 5) Which year had more than 100 cars

		select year, count("name") as Total_cars
		from car_dekho
		group by year
		having Total_cars >100
        order by Total_cars desc;

-- 6) Get complete list of all cars count between 2015 and 2023 
		select year,count(*) from car_dekho
		where year>2015 and year<2023 
		group by year;

-- 7) Get all cars details between 2015 to 2023 full list 

		select * 
		from car_dekho
		where year between 2015 and 2023

-- 8) What is the minimum selling price of cars in the dataset?

		select min(selling_price) as min_price
		from car_dekho;

-- 9) What is the maximum engine size of cars in the dataset?

		select max(engine) as max_price
		from car_dekho;

-- 10) What is the minimum engine size of cars in the dataset?

		select min(engine) as min_size
        from car_dekho;

-- 11) What is the average power of cars in the dataset?

		select avg(max_power) as avg_size
		from car_dekho;

-- 12) What is the maximum power of cars in the dataset?

		select max(max_power) as max_power
		from car_dekho;

-- 13) What is the minimum power of cars in the dataset?

		select min(max_power) as min_power
        from car_dekho;

-- 14) How many cars in the dataset are of each fuel type?

		select fuel,count(*) as count_cars 
		from car_dekho 
		group by fuel

-- 15) How many cars in the dataset are being sold by each seller type?

		select seller_type,count(*) as count_cars 
		from car_dekho
		group by seller_type;

-- 16) How many cars in the dataset have each type of transmission?

		select transmission, count(*) as count_cars 
        from car_dekho
		group by transmission

-- 17) How many cars in the dataset have each number of seats?

		select seats,count(*) from car_dekho
		group by seats;
    
-- 18) What is the average selling price of cars with a certain fuel type?
		select fuel, avg(selling_price) as average_selling_price
		from car_dekho
		group by fuel;
    
-- 19) What is the average selling price of cars with a certain number of seats?

		select seats, avg(selling_price) as average_selling_price
		from car_dekho
		group by seats;
    
-- 20) What is the average selling price of cars with a certain transmission type?

		select transmission, avg(selling_price) as average_selling_price
		from car_dekho
		group by transmission;
    
-- 21) What is the average selling price of cars with a certain seller type? --

		select seller_type, avg(selling_price) as average_selling_price
		from car_dekho
		group by seller_type;

-- 22) What is the average selling price of cars for each year in the dataset?
	
		select year , avg(selling_price) as average_selling_price
		from car_dekho
		group by year;
    
-- 23) What is the average mileage of cars for each fuel type in the dataset?
	
		select fuel , avg(mileage) as average_selling_price
		from car_dekho
		group by fuel;
    
-- 24) What is the average power of cars for each transmission type in the dataset?
	
		select transmission, avg(max_power) as avg_power
		from car_dekho
		group by transmission
    
-- 25) What is the average selling price of cars for each seller type and fuel type combination in the dataset?
	
		select seller_type, fuel, avg(selling_price) as avg_sale
		from car_dekho
		group by seller_type,fuel;
        
	
-- 26) What is the average selling price of cars for each fuel type and number of seats combination in the dataset?
		
        select fuel,seats,avg(selling_price)
		from car_dekho
		group by fuel,seats
		order by seats;
    
-- 27) What is the average selling price of cars for each car model and fuel type combination in the dataset?

		select year ,fuel,avg(selling_price)
		from car_dekho
		group by fuel,year
		order by year;
				
-- 28) What is the average selling price of cars for each car model and torque combination in the dataset?

		select year ,fuel,avg(selling_price)
		from car_dekho
		group by fuel,year
		order by year;

-- 29) What is the average selling price of cars for each car model and transmission type and fuel type combination in the dataset?
				
		select transmission,fuel,year,avg(selling_price)
		from car_dekho
		group by transmission,fuel,year
		order by year;

-- 30) Write a query to find the top 5 car models with the highest selling price in the dataset.
				
		select *
		from car_dekho
		order by selling_price desc
		limit 5;
        
-- 31) Find the cars with a mileage higher than the maximum mileage of cars with an engine capacity of 1000 CC.
		
		SELECT *
		FROM car_dekho
		WHERE mileage > (
		SELECT MAX(mileage)
		FROM car_dekho
		WHERE engine > '1000 CC');
            
-- 32) Find the cars with a selling price higher than the average selling price.
            
		select name, selling_price
		from car_dekho e1
		where selling_price >
		(
		select avg(selling_price)
		from car_dekho e2
		where e2.name=e1.name
		)
        
--  33) Retrieve the cars with a mileage greater than the maximum mileage of cars owned by individuals.

        Select *
		from car_dekho 
		where mileage >(
		select max(mileage)
		from car_dekho 
		where seller_type="individual")
        
-- 34) Retrieve the car names and their selling prices, along with the average selling price across all cars.

		select name ,selling_price, avg(selling_price) over(partition by name)
        from car_dekho
       
-- 35) Find the cumulative sum of selling prices for the cars.

		SELECT Name, selling_price, SUM(selling_price) OVER (ORDER BY Name) AS CumulativeSum
		fROM car_dekho;

		
-- 36) Write a query to find the average selling price of cars for each year and owner combination,and then rank the results by the highest average selling price.--

		Select year,owner, avg(selling_price) as avg_price
		from car_dekho
		group by  year,owner
		order by avg_price desc

-- 37) Write a query to find the top 10 car models with the highest power-to-weight ratio in the dataset.

		SELECT Name,(CAST(SUBSTRING_INDEX(max_power, 'bhp', 1) AS DECIMAL(10, 2)) /(CAST(SUBSTRING_INDEX(mileage, ' kmpl', 1) AS DECIMAL(10, 2)) * 0.45359237)) AS power_to_weight_ratio
		FROM car_dekho
		ORDER BY power_to_weight_ratio DESC
		limit 10

-- 38) Write a query to find the average selling price of cars for each car model and fuel type combination, and then calculate the percentage difference in selling price between the highest and lowest selling price for each combination.

		select concat(name," ",fuel) as model,avg(selling_price) as avg_sale,((max(selling_price)-min(selling_price))/min(selling_price)) * 100 as perc_sale
		from car_dekho
		group by model
		order by perc_sale desc

-- 39) Write a query to find the top 5 car models with the highest torque in the dataset.

		select Name,max(torque) as max_torque
		from car_dekho
		group by Name
		order by max_torque desc
		limit 5
            			
-- 40) Write a query to find the top 10 car models with the highest horsepower in the dataset.

		select Name,max(max_power) as horse_power
		from car_dekho
		group by Name
		order by horse_power desc
		limit 10
            
-- 41) Write a query to find the average selling price of cars for each car model and transmission type combination,and then calculate the standard deviation of the selling price for each combination.

		select concat(concat(name," ",fuel)," ",transmission) as model, std(selling_price) as selling_price_std
		from car_dekho
		group by model
		order by selling_price_std desc
            
-- 42) Write a query to find the average selling price of cars for each car model and year combination, and then calculate the percentage change in selling price from the previous year for each combination.
			
		select concat(name," ",year) as model, avg(selling_price) as avg_selling_price
		from car_dekho
		group by model
		order by avg_selling_price desc
        
-- 43) Write a query to find all cars with "Audi" in their name with greater than 5 seater

		select * 
        from car_dekho
        where name like "%audi%" and seats > 5
        
-- 44) Create a view that displays the car names, selling prices, and fuel types for all cars.
		
        CREATE VIEW CarDetails AS
		SELECT Name, selling_price, fuel
		FROM car_dekho;
        
	-- Accesing Table created during view
        select * from carDetails
        
-- 45) Company wants to label the cars sold status as premium,mid-range and economy as per their selling price range

		select *,
        CASE
        when selling_price >=500000 then "Premium"
        when selling_price <500000 and selling_price >2500000 then "Mid_range"
        else "Economy"
        END  as category
        from car_dekho
        

			