ALTER TABLE public.ways ADD COLUMN source integer;
ALTER TABLE public.ways ADD COLUMN target integer;

ALTER TABLE public.ways RENAME COLUMN geom TO the_geom;
ALTER TABLE public.ways RENAME COLUMN gid TO id;


-- SELECT pgr_createTopology('ways', 0.00000001)
