package HTTP::Balancer::Role::Command;

use Modern::Perl;

use Moose::Role;

use Namespace::Dispatch;

with qw( HTTP::Balancer::Role
         MooseX::Getopt::Dashes );

=head1 NAME

=head1 SYNOPSIS

    package HTTP::Balancer::Command::SomeCommand;
    use Moose;
    with qw( HTTP::Balancer::Role::Command );

=head1 METHODS

=head2 prepare()

the instance method called before running.

the method is here to be hooked with 'around' keyword of Moose.

=cut

sub prepare {
    my ($self, ) = @_;
    return $self;
}

no Moose::Role;

1;
