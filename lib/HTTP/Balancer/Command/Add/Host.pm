package HTTP::Balancer::Command::Add::Host;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

has name => (
    is      => "rw",
    traits  => [ 'NoGetopt' ],
    default => sub { shift->argv(2) },
);

sub run {
    my ($self, ) = @_;
    $self->model("Host")
         ->new(name => $self->name)
         ->save;
}

1;
