package HTTP::Balancer::Command::Add::Backend;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

sub run {
    my ($self, ) = @_;
    $self->model("Backend")
         ->new(address => $self->extra_argv->[2])
         ->save;
}

1;
