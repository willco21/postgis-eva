-- TODO SRID は何を選択するか
-- http://www.jurigis.me/2015/02/05/about-srid/
-- https://landhere.jp/blog/a79.html

TRUNCATE public.matter_info;
insert into public.matter_info(matter_id, origin_coordinates)
select
  i,
  ST_GeomFromText(format('POINT(%s %s %s)', (random() * 10), (random() * 10), (random() * 10)),2451)
from
  generate_series(1, 10) as i
;


TRUNCATE public.human_location;
insert into public.human_location(human_coordinates_id, trajectory_id, matter_id, timestamp, human_coordinates)
select
  (random() * 100), 
  (random() * 100),
  (random() * 10),
  (TIMESTAMP '2021-03-15 06:00:00' + trunc(random() * 50000) * '1 second'::interval),
  ST_GeomFromText(format('POINT(%s %s %s)', (random() * 10), (random() * 10), (random() * 10)),2451)
from
  generate_series(1, 1000000) as i
;

TRUNCATE public.human_location_line_test;
insert into public.human_location_line_test(human_coordinates_id, trajectory_id, matter_id, timestamp, human_coordinates, pass_line_vertical)
select
  (random() * 100), 
  (random() * 100),
  (random() * 10),
  (TIMESTAMP '2021-03-15 06:00:00' + i * '1 second'::interval),
  ST_GeomFromText(format('POINT(%s %s %s)', (i + random()), 5, 1),2451),
  ST_GeomFromText(format('LINESTRING(%s %s %s, %s %s %s)', 100,(-1 * 1000 * random()),1, 100,(1000 * random()),1),2451)
from
  generate_series(1, 1000000) as i
;

TRUNCATE public.pass_line_test;
insert into public.pass_line_test(pass_line_vertical,pass_line_horizontal,pass_line_ramdom)
select
  ST_GeomFromText(format('LINESTRING(%s %s %s, %s %s %s)', 3,1,1, 3,(10000 * random()),1),2451),
  ST_GeomFromText(format('LINESTRING(%s %s %s, %s %s %s)', 1,3,1, (10000 * random()),3,1),2451),
  ST_GeomFromText(format('LINESTRING(%s %s %s, %s %s %s)', 1,3,1, (10000 * random()),(10000 * random()),(10000 * random())),2451)
from
  generate_series(1, 10) as i
;