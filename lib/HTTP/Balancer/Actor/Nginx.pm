package HTTP::Balancer::Actor::Nginx;
use Modern::Perl;
use Moose;
extends qw(HTTP::Balancer::Actor);

use Path::Tiny;

our $NAME = "nginx";

sub start {
    my ($self, %params) = @_;
    my $tempfile = Path::Tiny->tempfile(TEMPLATE => "http-balancer-XXXX");
    $tempfile->spew($self->render(%params));
    system $self->executable . " -c " . $tempfile->stringify;
}

sub stop {
    my ($self, $pidfilename) = @_;
    my $pidfile = path($pidfilename);
    $pidfile->exists ? $self->kill($pidfile->slurp) : say "not running";
}

1;

=pod

=head1 NAME

HTTP::Balancer::Actor::Nginx - the Nginx actor

=head1 SYNOPSIS

    HTTP::Balancer::Actor::Nginx->start;

=cut

__DATA__
worker_processes  1;

pid <: $pidfile :>;

events {
    worker_connections  1024;
}

http {

    access_log off;
    error_log  off;

    sendfile        on;

    keepalive_timeout  65;
    tcp_nodelay        on;

    gzip  on;
    gzip_disable "MSIE [1-6]\.(?!.*SV1)";

    upstream backend {
        : for $hosts -> $host {
        server <: $host :>;
        : }
    }

    server {
        listen <: $port :>;

        location / {
            try_files $uri @balancer;
            expires max;
        }

        location @balancer {
            proxy_pass http://backend;
        }
    }

}