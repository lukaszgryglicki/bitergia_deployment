#!/bin/bash
kidash --kibana-url http://localhost:5601 --elastic_url-enrich http://localhost:9200 --import dashboards/git-dashboard.json
kidash --kibana-url http://localhost:5601 --elastic_url-enrich http://localhost:9200 --import dashboards/github-dashboard.json
