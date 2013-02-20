package HTTP::Balancer::Command::List::Backend;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

sub run {
    my ($self, ) = @_;

    my @columns = (
        "id",
        "name",
        "host",
        grep {!/^(id|name|host_id)$/} $self->model("Backend")->columns,
    );

    my $table = Text::Table->new(@columns);

    $table->load(
        $self
        ->model("Backend")
        ->all(sub { [ shift->slice(@columns) ] })
    );

    print $table;
}

1;
