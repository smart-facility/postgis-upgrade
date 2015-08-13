#!/usr/bin/env bash
FILES=*.backup
for f in $FILES
do
	f=`basename $f .backup`
	createdb -h localhost -U postgres $f
	psql -h localhost -U postgres -f /usr/share/postgresql/9.3/contrib/postgis-2.1/postgis.sql $f
	psql -h localhost -U postgres -f /usr/share/postgresql/9.3/contrib/postgis-2.1/topology.sql $f
	psql -h localhost -U postgres -f /usr/share/postgresql/9.3/contrib/postgis-2.1/rtpostgis.sql $f
	/usr/share/postgresql/9.3/contrib/postgis-2.1/postgis_restore.pl $f.backup | psql -h localhost -U postgres $f
	psql -h localhost -U postgres -f asbinary.sql $f
done
