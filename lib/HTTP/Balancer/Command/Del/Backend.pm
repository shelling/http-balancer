package HTTP::Balancer::Command::Del::Backend;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

has name => (
    is      => "rw",
    traits  => [ 'NoGetopt' ],
    default => sub {
        my $self = shift;
        $self->extra_argv->[2] or do {
            print $self->usage;
            exit;
        }
    },
);

sub run {
    my ($self, ) = @_;

    my $backend = $self->model("Backend")->find(name => $self->name);
    $backend ? $backend->remove : say "not found";
}


1;
