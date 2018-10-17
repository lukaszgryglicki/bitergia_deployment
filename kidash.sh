#!/bin/bash
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git-dashboard.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github-dashboard.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git-sortinghat.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git-k8s.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git-k8s2.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github-k8s.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/Gerrit.json

kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/mbox-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/mailinglists.json

kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/jira-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/jira.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/jira_backlog.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/jira_timing.json

kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/confluence-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/confluence.json

kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git_areas_of_code-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/all_onion-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git_demographics.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/git_areas_of_code.json

kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/gerrit-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/gerrit.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/gerrit_backlog.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/gerrit_timing.json

kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/slack-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/slack.json

kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_issues-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_pull_requests.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_pull_requests_backlog.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_pull_requests_timing.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_issues-index-pattern.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_issues.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_issues_backlog.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --import dashboards/github_issues_timing.json
kidash --kibana-url http://127.0.0.1:5601 -e http://147.75.97.234:9200 --elastic_url-enrich http://147.75.97.234:9200 --list
