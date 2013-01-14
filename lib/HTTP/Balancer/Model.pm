package HTTP::Balancer::Model;
use Modern::Perl;
use Moose;
use File::Spec;

with qw(HTTP::Balancer::Role);

=head1 NAME

HTTP::Balancer::Model - the base class of models of HTTP::Balancer

=head1 SYNOPSIS

    package HTTP::Balancer::Model::Foo;
    use Modern::Perl;
    use Moose;
    extends qw(HTTP::Balancer::Model);

=cut

our $dbpath = "/tmp/";

=head1 FUNCTIONS AND METHODS

=head2 model_name

class method and instance method

returns lowercase of last name of current model

=cut

sub model_name {
    my ($self, ) = @_;
    my $ref = ref($self) || $self;
    $ref =~ s{HTTP::Balancer::Model::}{};
    return lc($ref);
}

=head2 model_dir

class method and instance method

returns the directory store the entities of current model

=cut

sub model_dir {
    my ($self, ) = @_;
    File::Spec->catdir(
        $dbpath,
        $self->model_name
    );
}

=head2 path

instance method

returns the path for storing current object

=cut

sub path {
    my ($self, ) = @_;
    File::Spec->catfile(
        $self->model_dir,
        $self->id
    );
}

=head2 glob

class method

returns all entities stored in model_dir, sorted with id.

=cut

sub glob {
    my ($self, ) = @_;
    sort {
        pop [File::Spec->splitpath($a)] <=> pop [File::Spec->splitpath($b)]
    }
    glob(File::Spec->catfile($self->model_dir, "*"));
}

=head2 save

instance method

save current object into model_dir, named as its id.

generate auto-incremented id for new object not on disk yet.

=cut

sub save {
    my ($self, ) = @_;

    unless ($self->id) {
        my $last = pop [$self->glob];
        my $num = $last ? pop [File::Spec->splitpath($last)] : 0;
        $self->id($num+1)
    }

    $self->store($self->path);
}

=head2 all

class method

returns all object restored from disk

=cut

sub all {
    my ($self, ) = @_;
    map { $self->load($_) } $self->glob;
}

=head2 find($attr => $value)

class method

returns the first object satisfying the condition from disk.

=cut

sub find {
    my ($self, $attr, $value) = @_;
    for ($self->all) {
        return $_ if $_->$attr eq $value;
    }
}

1;
