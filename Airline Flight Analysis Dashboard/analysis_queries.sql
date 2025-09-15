WITH monthly_avg AS (
    SELECT AIRLINE,
           DATE_FORMAT(FL_DATE, '%Y-%m') AS month,
           AVG(DEP_DELAY) AS avg_dep_delay
    FROM flights
    GROUP BY AIRLINE, month
)
SELECT *,
       avg_dep_delay - AVG(avg_dep_delay) OVER(PARTITION BY AIRLINE) AS diff_from_airline_avg
FROM monthly_avg;

WITH route_delays AS (
    SELECT ORIGIN, DEST,
           AVG(DEP_DELAY) AS avg_dep_delay,
           COUNT(*) AS total_flights
    FROM flights
    GROUP BY ORIGIN, DEST
)
SELECT ORIGIN, DEST, avg_dep_delay, total_flights,
       RANK() OVER(ORDER BY avg_dep_delay DESC) AS rank_by_delay
FROM route_delays
WHERE total_flights > 100
LIMIT 10;

-- View ile tüm veriyi tek tablo hâline getiriyoruz
CREATE VIEW airline_dashboard_view AS
WITH monthly_avg AS (
    SELECT AIRLINE,
           DATE_FORMAT(FL_DATE, '%Y-%m') AS month,
           AVG(DEP_DELAY) AS avg_dep_delay
    FROM flights
    GROUP BY AIRLINE, month
),
route_summary AS (
    SELECT ORIGIN, DEST, AVG(DEP_DELAY) AS avg_dep_delay_route
    FROM flights
    GROUP BY ORIGIN, DEST
)
SELECT f.FL_DATE, f.AIRLINE, f.ORIGIN, f.DEST,
       f.DEP_DELAY, f.ARR_DELAY, f.CANCELLED,
       m.avg_dep_delay, r.avg_dep_delay_route
FROM flights f
LEFT JOIN monthly_avg m ON f.AIRLINE = m.AIRLINE AND DATE_FORMAT(f.FL_DATE, '%Y-%m') = m.month
LEFT JOIN route_summary r ON f.ORIGIN = r.ORIGIN AND f.DEST = r.DEST;