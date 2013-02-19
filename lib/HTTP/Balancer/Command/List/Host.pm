package HTTP::Balancer::Command::List::Host;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

sub run {
    my ($self, ) = @_;

    my @columns = qw(
        id
        name
    );

    my $table = Text::Table->new(@columns);

    $table->load(
        $self->model("Host")->all(sub {
            my $host = shift;
            [ map { $host->$_ } @columns ]
        })
    );

    print $table;
}

1;
