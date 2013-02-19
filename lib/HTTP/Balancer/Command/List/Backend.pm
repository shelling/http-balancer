package HTTP::Balancer::Command::List::Backend;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

sub run {
    my ($self, ) = @_;

    my @columns = (
        "id",
        "name",
        "address",
        "host_id",
    );

    my $table = Text::Table->new(@columns);

    $table->load(
        $self->model("Backend")->all(sub {
            my $backend = shift;
            [ map { $backend->$_ } @columns]
        })
    );

    print $table;
}

1;
