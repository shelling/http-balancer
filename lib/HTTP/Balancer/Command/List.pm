package HTTP::Balancer::Command::List;
use Modern::Perl;
use Moose;
with qw( HTTP::Balancer::Role::Command
         HTTP::Balancer::Role::Stem );

sub run {
    my ($self, ) = @_;
}

1;
