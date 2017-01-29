#/usr/bin/bash

cd /mod_redis_source
pushd $HIREDIS_HOME; make; popd
apxs -c -I $HIREDIS_HOME $HIREDIS_HOME/libhiredis.a mod_redis.c
apxs -i -a mod_redis.la