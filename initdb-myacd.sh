#!/bin/bash

psql -h localhost -d kkm -f initdb-myacd.sql
psql -h localhost -d kkm -f insert-acddistrict.sql
psql -h localhost -d kkm -f insert-acdlocality.sql
psql -h localhost -d kkm -f insert-people.sql
psql -h localhost -d kkm -f insert-acd-profile.sql
psql -h localhost -d kkm -f insert-acd-activity.sql
psql -h localhost -d kkm -f insert-hso.sql
psql -h localhost -d kkm -f insert-sampel.sql

