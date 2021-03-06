CREATE TABLE IF NOT EXISTS public.matter_info (
	matter_id serial
);

CREATE TABLE IF NOT EXISTS public.human_location (
	human_coordinates_id serial,
	trajectory_id int,
	matter_id serial,
	timestamp timestamp
);

SELECT AddGeometryColumn ('public','matter_info','origin_coordinates',4326,'POINT',3);
TRUNCATE public.matter_info;
insert into public.matter_info(matter_id, origin_coordinates)
select
  i,
  ST_GeomFromText(format('POINT(%s %s %s)', (random() * 10), (random() * 10), (random() * 10)),4326)
from
  generate_series(1, 1000000) as i
;


SELECT AddGeometryColumn ('public','human_location','human_coordinates',4326,'POINT',3);
TRUNCATE public.human_location;
insert into public.human_location(human_coordinates_id, trajectory_id, matter_id, timestamp, human_coordinates)
select
  (random() * 100), 
  (random() * 100),
  (random() * 10),
  (now() + trunc(random() * 50000) * '1 second'::interval),
  ST_GeomFromText(format('POINT(%s %s %s)', (random() * 10), (random() * 10), (random() * 10)),4326)
from
  generate_series(1, 1000000) as i
;
