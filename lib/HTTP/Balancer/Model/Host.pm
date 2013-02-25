package HTTP::Balancer::Model::Host;
use Modern::Perl;
use Moose;
use MooseX::Storage;
extends qw( HTTP::Balancer::Model );

with Storage(
    format  => 'YAML',
    io      => 'File',
);

has [qw(id port)] => (
    is  => "rw",
    isa => "Num",
);

has [qw(name fullname address)] => (
    is  => "rw",
    isa => "Str",
);

has forward => (
    is  => "rw",
    isa => "Str",
);

has ssl => (
    is  => "rw",
    isa => "HashRef[Str]",
);

before remove => sub {
    my $self = shift;
    map { $_->remove } @{$self->backends};
};

sub backends {
    my ($self, ) = @_;
    [$self->model("Backend")
         ->where(host_id => $self->id)];
}

1;
__END__

=head1 NAME

HTTP::Balancer::Model::Host

=head1 SYNOPSIS

    use Moose;
    with qw(HTTP::Balancer::Role);
    $self->model("Host")

=cut
