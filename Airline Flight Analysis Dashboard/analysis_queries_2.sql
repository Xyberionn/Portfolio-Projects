CREATE TABLE airline_summary AS
SELECT AIRLINE AS airline,
       COUNT(*) AS total_flights,
       AVG(DEP_DELAY) AS avg_dep_delay,
       AVG(ARR_DELAY) AS avg_arr_delay,
       SUM(CANCELLED) AS total_cancelled
FROM flights
GROUP BY AIRLINE;

SELECT * FROM airline_summary;

CREATE TABLE airport_summary AS
SELECT ORIGIN AS airport,
       COUNT(*) AS total_departures,
       AVG(DEP_DELAY) AS avg_dep_delay,
       SUM(CANCELLED) AS total_cancelled
FROM flights
GROUP BY ORIGIN;

SELECT * FROM airport_summary;

CREATE TABLE monthly_delay AS
SELECT DATE_FORMAT(FL_DATE, '%Y-%m') AS month,
       AVG(DEP_DELAY) AS avg_dep_delay,
       AVG(ARR_DELAY) AS avg_arr_delay,
       SUM(CANCELLED) AS total_cancelled
FROM flights
GROUP BY month
ORDER BY month;

SELECT * FROM monthly_delay;

CREATE TABLE delay_breakdown AS
SELECT AIRLINE,
       SUM(DELAY_DUE_CARRIER) AS carrier_delay,
       SUM(DELAY_DUE_WEATHER) AS weather_delay,
       SUM(DELAY_DUE_NAS) AS nas_delay,
       SUM(DELAY_DUE_SECURITY) AS security_delay,
       SUM(DELAY_DUE_LATE_AIRCRAFT) AS late_aircraft_delay
FROM flights
GROUP BY AIRLINE;

SELECT * FROM delay_breakdown;

CREATE TABLE top_airports AS
SELECT ORIGIN AS airport,
       COUNT(*) AS total_departures,
       AVG(DEP_DELAY) AS avg_dep_delay,
       AVG(ARR_DELAY) AS avg_arr_delay,
       SUM(CANCELLED) AS total_cancelled
FROM flights
GROUP BY ORIGIN
ORDER BY total_departures DESC
LIMIT 20;

SELECT * FROM top_airports;

CREATE TABLE route_summary AS
SELECT ORIGIN, DEST,
       COUNT(*) AS total_flights,
       AVG(DEP_DELAY) AS avg_dep_delay,
       AVG(ARR_DELAY) AS avg_arr_delay,
       SUM(CANCELLED) AS total_cancelled
FROM flights
GROUP BY ORIGIN, DEST
ORDER BY total_flights DESC;

SELECT * FROM route_summary;

CREATE TABLE seasonal_delay AS
SELECT DATE_FORMAT(FL_DATE, '%m') AS month,
       AVG(DEP_DELAY) AS avg_dep_delay,
       AVG(ARR_DELAY) AS avg_arr_delay,
       SUM(CANCELLED) AS total_cancelled
FROM flights
GROUP BY month
ORDER BY month;

SELECT * FROM seasonal_delay;
