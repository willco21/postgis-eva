SELECT
  ST_AStext(ST_Transform(ST_MakeLine(h.human_coordinates ORDER BY timestamp),2451)) AS union_geom
FROM human_location_line_test as h
WHERE 
  timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 18:14:18'
  AND human_coordinates_id = 10
  ;

SELECT
  h.human_coordinates_id,
  ST_Intersects(
    ST_MakeLine(h.human_coordinates order by "timestamp" ),
    'SRID=2451;LINESTRING Z(3 5 1, 3 50000 1)')
FROM human_location_line_test as h
WHERE 
  h.timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 18:14:18'
group by h.human_coordinates_id
  ;

SELECT
  h.human_coordinates_id
FROM human_location_line_test as h
WHERE 
  h.timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 18:14:18'
group by h.human_coordinates_id
having ST_Intersects(
    ST_MakeLine(h.human_coordinates order by "timestamp" ),
    'SRID=2451;LINESTRING Z(3 5 1, 3 50000 1)')
  ;

SELECT
  h.human_coordinates_id
FROM human_location_line_test as h
WHERE 
  h.timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 06:10:31'
group by h.human_coordinates_id
having ST_Crosses(
    ST_MakeLine(h.human_coordinates order by "timestamp" ),
    'SRID=2451;LINESTRING(100 -977.5191563512244 1,100 423.02452446834593 1)')
  ;