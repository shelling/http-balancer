package HTTP::Balancer::Actor::Nginx;
use Modern::Perl;
use Moose;
extends qw(HTTP::Balancer::Actor);

our $NAME = "nginx";

sub start {

}

sub stop {

}

1;

=pod

=head1 NAME

HTTP::Balancer::Actor::Nginx - the Nginx actor

=head1 SYNOPSIS

    HTTP::Balancer::Actor::Nginx->start;

=cut

__DATA__

http {

    upstream backend {
        : for $hosts -> $host {
        server <: $host :>;
        : }
    }

    server {
        listen 80;

        location / {
            try_files $uri @balancer;
            expires max;
        }

        localhost @balancer {
            proxy_pass http//backend;
        }
    }

}
