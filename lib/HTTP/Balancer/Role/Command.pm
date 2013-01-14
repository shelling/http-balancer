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

=head2 model()

given the last name of a model, returns the whole name of the model, and requires this model.

=cut

sub model {
    my ($self, $name) = @_;
    my $model = "HTTP::Balancer::Model::$name";
    eval qq{use $model};
    return $model;
}

no Moose::Role;

1;
