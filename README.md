# Data Analysis with PostgreSQL

22 SQL scripts that build from basic queries to advanced analytics: joins, CTEs, subqueries and **window functions** (ranking, running aggregates, `NTILE`, `LAG`/`LEAD`, `FIRST_VALUE`/`LAST_VALUE`). Each script answers concrete business questions, with comments explaining the approach.

**Tech:** PostgreSQL · SQL
**Sample databases:** `hr` (employees, departments, countries) · `travels` (bookings) · `northwind` (orders)

---

## 📚 Scripts

### Querying fundamentals
| # | Topic |
|---|---|
| 01 | [SELECT & FROM](0001_Select_From.sql) |
| 02 | [Exploring tables](0002_TableDiscovery.sql) |
| 03 | [ORDER BY](0003_orderby.sql) |
| 04 | [String functions](0004_String_Functions.sql) |
| 05 | [CASE WHEN](0005_Case_When.sql) |
| 06 | [Handling NULL values](0006_HandlingNullValue.sql) |
| 10 | [DISTINCT](0010_Distinct.sql) |

### Aggregation & filtering
| # | Topic |
|---|---|
| 07 | [Aggregate functions](0007_Aggregate_Functions.sql) |
| 08 | [Aggregate functions II](0008_Aggregate_Functions_2.sql) |
| 09 | [WHERE vs. HAVING](0009_where_having.sql) |

### Joins, CTEs & data types
| # | Topic |
|---|---|
| 11 | [Intro to JOINs](0011_last.sql) |
| 12 | [INNER JOIN](0012_Inner_Join.sql) |
| 13 | [LEFT JOIN](0013_Left_Join.sql) |
| 14 | [CTEs & subqueries](0014_CTE_and_Subquery.sql) |
| 15 | [Casting data types](0015_Changing_DataTypes.sql) |
| 16 | [Date & time functions](0016_Time_Functions.sql) |

### Window functions
| # | Topic |
|---|---|
| 17 | [Window functions with aggregates](0017_Window_Funtions.sql) |
| 18 | [ROW_NUMBER, RANK, DENSE_RANK](0018_RowNumber_Rank.sql) |
| 19 | [NTILE](0019_NTILE.sql) |
| 20 | [LAG & LEAD](0020_LAG_LEAD.sql) |
| 21 | [FIRST_VALUE & LAST_VALUE](0021_First_Last_Value.sql) |

### Exercise
| # | Topic |
|---|---|
| 22 | [Each customer's last order and its freight cost](0022_FunctionExercise_1.sql) |

---

## 💡 Example: department average with a window function

```sql
SELECT
    first_name,
    department_id,
    salary,
    AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary
FROM hr.employees;
```

The same result as a CTE + `LEFT JOIN`, in a single pass and without collapsing rows. See [0017](0017_Window_Funtions.sql) for the side-by-side comparison.
