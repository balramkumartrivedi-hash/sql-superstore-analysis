# Original internship results

These screenshots preserve the original Task 2 submission. They do not show execution of the revised `analysis.sql` queries.

## Top five customers by total sales
![Original top five customers query and result](Query_1_Top_5_Customers.png.png)

## Regional sales
The original result shows West with the highest sales (725,457.93) and South with the lowest (391,721.90). Currency was not specified in the source folder.
![Original regional sales query and result](Query_2_Total_Sales_by_Region.png.png)

## Average sales per row
The original heading calls this average order value, but AVG(sales) measures the average line value (229.86 in the screenshot). The revised query first aggregates rows into orders.
![Original average sales query and result](Query_3_Average_Order_Value.png.png)

## Categories ranked by sales
The original heading says profitable categories, but SUM(sales) ranks revenue: Technology, Furniture, then Office Supplies. The revised query uses SUM(profit).
![Original category sales query and result](Query_4_Top_3_Most_Profitable_Product_Categories.png.png)

## Shipping mode by row count
Standard Class has 5,968 rows in the original result. Without shipment identifiers, this is not proof of 5,968 shipments. The revised version counts distinct orders per mode.
![Original shipping mode query and result](Query_5_The_Most_Frequently_Used_Shipping_Mode.png.png)
