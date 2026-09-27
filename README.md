# Superstore Sales Analysis with SQL

An internship SQL project by **Balram Kumar**, completed during the Data Analyst internship at Renu Sharma Healthcare and Educational Foundation (24 August–24 September 2026).

## Questions
1. Which five customers have the highest total sales?
2. How do sales compare across regions?
3. What is the average value of an order?
4. Which three categories generate the most profit?
5. Which shipping mode is associated with the most distinct orders?

## Files and provenance
- `original/task_2_submission.sql`: unchanged internship submission.
- `analysis.sql`: revised portfolio version, prepared with AI assistance after the internship. It aligns table names, calculates average order value at order level, ranks categories by profit, and distinguishes orders from line items.

The original script's category query ranks sales, despite its profit heading. Its average uses sales rows rather than aggregated orders, and its shipping count counts rows. The revised script documents and corrects these definitions; original results should not be presented as results of the revised queries.

## Run locally
Use PostgreSQL and pgAdmin. Execute the table definition in `analysis.sql`, then import the original Superstore CSV into `superstore_sales` with a header and the same 18-column order as the table. Run the five analysis queries afterward. Use a new project database to avoid conflicts with existing tables.

**Dataset limitation:** the source CSV was not included in the supplied Task 2 folder. Obtain that exact CSV before attempting to reproduce results. The Task 1 Excel workbook is a different dataset and is not a replacement. No numeric results are claimed for the revised queries.

## Assumptions
Sales and profit are line-level amounts; an order may have several lines. Average order value excludes null order identifiers. Shipping counts distinct order identifiers within each mode; an order split across modes can appear in multiple groups. No shipment identifier exists, so these are not shipment counts. Do not infer a currency without the dataset documentation.

## Skills demonstrated
SQL aggregation, `GROUP BY`, sorting, `LIMIT`, common table expressions, and business metric definitions. This project does not establish professional SQL employment experience.
