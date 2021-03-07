CREATE TABLE IF NOT EXISTS public.matter_info (
	matter_id serial NULL,
	origin_coordinates geometry(POINT) NULL
);

CREATE TABLE IF NOT EXISTS public.human_location (
	human_coordinates_id serial,
	trajectory_id int,
	matter_id serial,
	timestamp timestamp
);


/*INSERT INTO matter_info values (5, ST_MakePoint(1, 2,1.5));*/
/*ALTER TABLE public.matter_info DROP COLUMN origin_coordinates;*/
/*SELECT AddGeometryColumn ('public','matter_info','origin_coordinates',4326,'POINT',3);*/
TRUNCATE public.matter_info
\COPY matter_info FROM 'docker-entrypoint-initdb.d/Hitonavi-PostGIS-testTable-matter_info.csv' WITH csv header

/*SELECT AddGeometryColumn ('public','human_location','human_coordinates',4326,'POINT',3);*/
TRUNCATE public.human_location
\COPY human_location FROM 'docker-entrypoint-initdb.d/Hitonavi-PostGIS-testTable-human_location.csv' WITH csv header
