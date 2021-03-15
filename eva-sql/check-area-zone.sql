SELECT
  h.human_coordinates_id, h.trajectory_id, h.matter_id, h.timestamp,
  ST_AStext(ST_Transform(h.human_coordinates, 2451)),
  CASE
    WHEN ST_Within(h.human_coordinates,zone1) THEN 'zone1'
    WHEN ST_Within(h.human_coordinates,zone2) THEN 'zone2'
    WHEN ST_Within(h.human_coordinates,zone3) THEN 'zone3'
    WHEN ST_Within(h.human_coordinates,zone4) THEN 'zone4'
  END AS area_zone
FROM human_location as h,
    (SELECT 
    ST_GeomFromText('POLYGON((1 2 1, 2 1 1, 2 3 1, 3 1 1, 3 2 1, 1 2 1))', 2451) AS zone1,
    ST_GeomFromText('POLYGON((2 6 1, 3 5 1, 4 5 1, 3 7 1, 2 6 1, 2 6 1))', 2451) AS zone2,
    ST_GeomFromText('POLYGON((8 3 1, 9 2 1, 10 3 1, 9 4 1, 8 4 1, 8 3 1))', 2451) AS zone3,
    ST_GeomFromText('POLYGON((4 9 1, 5 8 1, 6 8 1, 6 9 1, 5.5 10 1, 4 9 1))', 2451) AS zone4
) AS foo
WHERE h.timestamp BETWEEN '2021-03-14 09:17:48' AND '2021-03-14 09:20:48'
AND (
  ST_Within(h.human_coordinates,zone1) 
  OR ST_Within(h.human_coordinates,zone2)
  OR ST_Within(h.human_coordinates,zone3)
  OR ST_Within(h.human_coordinates,zone4)
)
;