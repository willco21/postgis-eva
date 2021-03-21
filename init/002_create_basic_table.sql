CREATE TABLE IF NOT EXISTS public.matter_info (
	matter_id serial
);
SELECT AddGeometryColumn ('public','matter_info','origin_coordinates',2451,'POINT',3);

CREATE TABLE IF NOT EXISTS public.human_location (
	human_coordinates_id serial,
	trajectory_id int,
	matter_id serial,
	timestamp timestamp
);
SELECT AddGeometryColumn ('public','human_location','human_coordinates',2451,'POINT',3);

CREATE TABLE IF NOT EXISTS public.human_location_line_test (
	human_coordinates_id serial,
	trajectory_id int,
	matter_id serial,
	timestamp timestamp
);
SELECT AddGeometryColumn ('public','human_location_line_test','human_coordinates',2451,'POINT',3);
SELECT AddGeometryColumn ('public','human_location_line_test','pass_line_vertical',2451,'LINESTRING',3);

CREATE TABLE IF NOT EXISTS public.pass_line_test();
SELECT AddGeometryColumn ('public','pass_line_test','pass_line_vertical',2451,'LINESTRING',3);
SELECT AddGeometryColumn ('public','pass_line_test','pass_line_horizontal',2451,'LINESTRING',3);
SELECT AddGeometryColumn ('public','pass_line_test','pass_line_ramdom',2451,'LINESTRING',3);
