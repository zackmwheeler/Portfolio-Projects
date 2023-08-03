--Dataset: Online Retail DataSet
--Source: https://www.kaggle.com/datasets/siddharththakkar26/online-retail-dataset

Select *
From OnlineRetail..RetailDataset


-- Find the number of orders that were fullfilled by country

Select	Country
	,	Count(InvoiceNo) as CountofOrders
From OnlineRetail..RetailDataset
Group by Country
Order by CountofOrders DESC

-- Shows UK has an overwelming number of orders compared to all others combined

-- Now lets Find the SUM of all money Spent in Each Country

Select	Country
	,	SUM(TotalPrice) as TotalSpent
From OnlineRetail..RetailDataset
Group by Country
Order by TotalSpent DESC

-- Again, UK has overwhelming number spent, but the rest jumped around, so lets see the TotalSpent and the CountofOrders side by side to break it down

Select	Country
	,	Count(InvoiceNo) as CountofOrders
	,	SUM(TotalPrice) as TotalSpent
From OnlineRetail..RetailDataset
Group by Country
Order by TotalSpent DESC

-- Now we see that Netherlands have 1/3 or less of the next few but they spent more money

-- Let's look to see the biggest spenders(CustomerID), where they're from and how much they've spent

Select	CustomerID
	,	Country
	,	Count(InvoiceNo) as CountofOrders
	,	SUM(TotalPrice) as TotalSpent
From OnlineRetail..RetailDataset
Where CustomerID is NOT NULL
Group by CustomerID, Country
Order by TotalSpent DESC

-- Shows the customers that are 
-- Let's look at the 100 Best Selling Products

Select	TOP(100)
		Description
	,	Count(Description) as Count
From OnlineRetail..RetailDataset
Group by Description
Order by Count DESC