package HTTP::Balancer::Actor;
use Modern::Perl;
use Moose;
use Path::Tiny;

with qw(HTTP::Balancer::Role);

our @PATH = qw(
    /usr/local/bin
    /usr/local/sbin
    /usr/bin
    /usr/sbin
);

sub start {
    my $class = shift;
    die "you do not implement the start() for $class";
}

sub stop {
    my $class = shift;
    die "you do not implement the stop() for $class";
}

sub executable {
    my $class = ref($_[0]) ? ref(shift) : shift;
    my $name;
    {
        no strict "refs";
        $name = ${ $class . "::NAME" } or die $class . "::NAME not defined yet";
    }
    for (@PATH) {
        return path($_)->child($name)->stringify if path($_)->child($name)->exists;
    }
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