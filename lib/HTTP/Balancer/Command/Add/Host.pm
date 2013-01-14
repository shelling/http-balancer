package HTTP::Balancer::Command::Add::Host;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

sub run {
    my ($self, ) = @_;
    $self->model("Host")
         ->new(name => $self->extra_argv->[2])
         ->save;
}

1;
