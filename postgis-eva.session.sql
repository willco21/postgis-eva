SELECT
  human_coordinates_id, trajectory_id, matter_id, timestamp,
  ST_Astext(ST_Transform(human_coordinates, 2451))
FROM human_location
WHERE ST_3DDWithin(
        human_coordinates,
        ST_GeomFromText('POLYGON((1 5 1, 5 1 1, 9 3 1, 9 6 1, 5 10 1, 1 5 1))', 2451),
        126.8
    );
