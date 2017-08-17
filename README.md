# JHipster Console

[![Build Status][travis-image]][travis-url]
[![Join the chat at https://gitter.im/jhipster/jhipster-console](https://badges.gitter.im/jhipster/jhipster-console.svg)](https://gitter.im/jhipster/jhipster-console?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is the [JHipster](http://jhipster.github.io/) Console, based on the [ELK Stack](https://www.elastic.co/products). It provides a default configuration to get started with logs and metrics monitoring with ELK as well as some nice dashboards.

Please refer to the [JHipster Monitoring Documentation](http://jhipster.github.io/monitoring) for instructions on how to set up the JHipster Console.

[travis-image]: https://travis-ci.org/jhipster/jhipster-console.svg?branch=master
[travis-url]: https://travis-ci.org/jhipster/jhipster-console

## Quick Start

Start everything by running `docker-compose up -d` in the `bootstrap/` directory, then access Kibana at [localhost:5601](http://localhost:5601) and Zipkin at [localhost:9411](http://localhost:9411).

## Contributing

PRs are welcome ! When contributing, make sure you force build and restart everything with `docker-compose down && docker-compose build --no-cache && docker-compose up`.

