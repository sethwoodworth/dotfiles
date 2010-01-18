#!/bin/bash
sqlite3 ../phil.cdc.sql .dump | python dump_for_mysql.py > dump.sql
