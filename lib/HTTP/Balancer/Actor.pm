package HTTP::Balancer::Actor;
use Modern::Perl;
use Moose;

with qw(HTTP::Balancer::Role);

sub start {
    my $class = shift;
    die "you do not implement the start() for $class";
}

sub stop {
    my $class = shift;
    die "you do not implement the stop() for $class";
}

1;
__END__

=head1 NAME

HTTP::Balancer::Actor - the base class of actors of HTTP::Balancer

=head1 SYNOPSIS

    package HTTP::Balancer::Actor;
    use Modern::Perl;
    use Moose;
    extends qw(HTTP::Balancer::Actor);

    sub start { ... }
    sub stop  { ... }

=head1 DESCRIPTION

The Actor in HTTP::Balancer stands for the process manager of implementations of http balancer.

Each subclass of HTTP::Balancer::Actor will be mapped to one implementation such as Perlbal or Nginx.

=cut
