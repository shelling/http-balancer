package HTTP::Balancer::Role::Command;

use Modern::Perl;

use Moose::Role;

use Namespace::Dispatch;

with qw( HTTP::Balancer::Role
         MooseX::Getopt::Dashes );

=head1 NAME

HTTP::Balancer::Role::Command - the mixin for command handlers

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

=head2 command_name

class and instance method

returns the last name of current command, lowercase, separated with whitespace.

=cut

sub command_name {
    my ($self, ) = @_;
    my $ref = ref($self) || $self;
    $ref =~ s{HTTP::Balancer::Command::}{};
    $ref =~ s{::}{ }g;
    return lc($ref);
}

=head2 argv($position)

helper.

return the ordinary argument at $position or exit with help text.

=cut

sub argv {
    my ($self, $position) = @_;
    $self->extra_argv->[$position] or do {
        print $self->usage;
        exit;
    }
}

no Moose::Role;

1;
