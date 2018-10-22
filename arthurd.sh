#!/bin/bash
# arthurd -h 127.0.0.1 -d http://127.0.0.1:6379 --es-index http://localhost:9200/items --log-path logs_arthud --no-archive
arthurd -h 127.0.0.1 -d http://127.0.0.1:6379 --es-index http://127.0.0.1:9200/items --log-path arthurd_logs --no-archive
