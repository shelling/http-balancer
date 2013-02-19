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
        map {
            my $host = $_;
            [map { $host->$_ } @columns]
        } $self->model("Host")->all
    );

    print $table;
}

1;
