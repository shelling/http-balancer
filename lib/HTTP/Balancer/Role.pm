package HTTP::Balancer::Role;

use Modern::Perl;

use Moose::Role;

=head2 model()

given the last name of a model, returns the whole name of the model, and requires this model.

=cut

sub model {
    my ($self, $name) = @_;
    my $model = "HTTP::Balancer::Model::$name";
    eval qq{use $model};
    return $model;
}

=head2 config()

return the singleton of the configuration.

=cut

use HTTP::Balancer::Config;
sub config {
    return HTTP::Balancer::Config->instance;
}

no Moose::Role;

1;

=pod

=head1 NAME

HTTP::Balancer::Role - base of all roles of HTTP::Balancer

=head1 SYNOPSIS

    package HTTP::Balancer::Role::Foo;
    use Moose::Role;
    with qw( HTTP::Balancer::Role );

=cut
