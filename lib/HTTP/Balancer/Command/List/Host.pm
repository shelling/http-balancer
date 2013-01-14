package HTTP::Balancer::Command::List::Host;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

sub run {
    my ($self, ) = @_;
    map {
        say $_->name;
    } $self->model("Host")->all;
}

1;
