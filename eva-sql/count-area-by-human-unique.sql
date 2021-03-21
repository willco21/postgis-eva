SELECT
  human_coordinates_id, trajectory_id, matter_id, timestamp,
  ST_Astext(ST_Transform(human_coordinates, 2451))
FROM human_location
WHERE ST_Contains(
    ST_Transform(
      ST_GeomFromText('POLYGON((2 6 1, 3 5 1, 4 5 1, 3 7 1, 2 6 1, 2 6 1))', 2451),
      2451
    ),
    human_coordinates
  )
  AND timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 18:14:18';

SELECT
  DISTINCT human_coordinates_id
FROM human_location
WHERE ST_Contains(
    ST_Transform(
      ST_GeomFromText('POLYGON((2 6 1, 3 5 1, 4 5 1, 3 7 1, 2 6 1, 2 6 1))', 2451),
      2451
    ),
    human_coordinates
  )
  AND timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 18:14:18';

-- by ST_Within

SELECT
  human_coordinates_id, trajectory_id, matter_id, timestamp,
  ST_Astext(ST_Transform(human_coordinates, 2451))
FROM human_location
WHERE ST_Within(
    human_coordinates,
    ST_Transform(
      ST_GeomFromText('POLYGON((2 6 1, 3 5 1, 4 5 1, 3 7 1, 2 6 1, 2 6 1))', 2451),
      2451
    )
  )
  AND timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 18:14:18';

SELECT
  DISTINCT human_coordinates_id
FROM human_location
WHERE ST_Within(
    human_coordinates,
    ST_Transform(
      ST_GeomFromText('POLYGON((2 6 1, 3 5 1, 4 5 1, 3 7 1, 2 6 1, 2 6 1))', 2451),
      2451
    )
  )
  AND timestamp BETWEEN '2021-03-15 06:00:00' AND '2021-03-15 18:14:18';