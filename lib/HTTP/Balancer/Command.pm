package HTTP::Balancer::Command;

use Modern::Perl;

use Moose;

with qw( HTTP::Balancer::Role::Command );

sub run {
    my ($self, ) = @_;
}

1;
