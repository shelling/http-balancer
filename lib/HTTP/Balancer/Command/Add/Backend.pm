package HTTP::Balancer::Command::Add::Backend;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

has to => (
    is       => "rw",
    isa      => "Str",
    required => 1,
);

sub run {
    my ($self, ) = @_;

    my $host = $self->model("Host")->find(name => $self->to);

    $self->model("Backend")
         ->new(
             address => $self->extra_argv->[2],
             host_id => $host->id,
         )
         ->save;
}

1;
