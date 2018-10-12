#!/bin/bash
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git-dashboard.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github-dashboard.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git-sortinghat.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/Gerrit.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --list
