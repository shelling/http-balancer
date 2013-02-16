package HTTP::Balancer::Config;
use Modern::Perl;
use Moose;
use MooseX::Singleton;

sub pidfile {
    "/var/run/http-balancer.pid"
}

1;
__END__

=head1 NAME

HTTP::Balancer::Config - config loader

=head1 SYNOPSIS

    package HTTP::Balancer::Any;
    use Moose;
    with qw(HTTP::Balancer::Role);
    my $config = $self->config;

=cut
