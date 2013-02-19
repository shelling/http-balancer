# HTTP::Balancer

[![Build Status](https://travis-ci.org/shelling/http-balancer.png?branch=master)](https://travis-ci.org/shelling/http-balancer)

HTTP::Balancer is a abstract layer to manage your http load balancers. It
stores your configurations, launches the arbitrary implementation of balancers
on demand, and switches between implementations without extra effort.

## INSTALLATION

You are recommanded to install HTTP::Balancer with App::cpanminus

    # cpanm HTTP::Balancer

## Usage

Before everything, you must initialize HTTP::Balancer.

    # http-balancer init

Add your virtual hosts and backends

    # http-balancer add host www

    # http-balancer add backend web1 --address 192.168.1.1 --host www

List your hosts and backends

    # http-balancer list host

    # http-balancer list backend

Fire the balancer up

    # http-balancer start

Stop the balancer

    # http-balancer stop

## Authors

shelling <navyblueshellingford@gmail.com>

## License

MIT X11 License

