package HTTP::Balancer::Model;
use Modern::Perl;
use Moose;
use File::Spec;

our $dbpath = "/tmp/";

sub model_name {
    my ($self, ) = @_;
    my $ref = ref($self);
    $ref =~ s{HTTP::Balancer::Model::}{};
    return lc($ref);
}

sub path {
    my ($self, ) = @_;
    File::Spec->catfile(
        $dbpath,
        $self->model_name,
        $self->id
    );
}

sub save {
    my ($self, ) = @_;

    my @glob = glob($self->path . "*");
    my ($vol, $dir, $num) = File::Spec->splitpath(
        [@glob]->[-1]
    ) if scalar @glob;
    $num //= 0;

    $self->id($num+1) unless $self->id;
    $self->store($self->path);
}

1;
