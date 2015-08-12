-- keep function named asbinary for compatibility
CREATE OR REPLACE FUNCTION public.asbinary(geometry)
  RETURNS bytea AS
'$libdir/postgis-2.1', 'LWGEOM_asBinary'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;
ALTER FUNCTION public.st_asbinary(geometry)
  OWNER TO postgres;
