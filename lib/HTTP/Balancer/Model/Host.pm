package HTTP::Balancer::Model::Host;
use Modern::Perl;
use Moose;
use MooseX::Storage;
extends qw( HTTP::Balancer::Model );

with Storage(
    format  => 'YAML',
    io      => 'File',
);

has id => (
    is  => "rw",
    isa => "Num",
);

has name => (
    is  => "rw",
    isa => "Str",
);

sub backends {
    my ($self, ) = @_;
    $self->model("Backend")
         ->where(host_id => $self->id);
}

sub hash {
    my ($self, ) = @_;
    return {
        name        => $self->name,
        backends    => [map {$_->address} $self->backends],
    };
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
