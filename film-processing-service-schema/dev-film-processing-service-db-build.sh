#!/bin/bash

mysql -u[name] -p[password] -hlocalhost -e 'set @env:='_dev'; source film-processing-service-db.sql';
