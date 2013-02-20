package HTTP::Balancer::Command::Init;

use Modern::Perl;

use Moose;

with qw( HTTP::Balancer::Role::Command );

use Path::Tiny;

sub run {
    my ($self, ) = @_;

    $self->mkpath($self->config->dbpath);
}

sub mkpath {
    my ($self, $path) = @_;

    $path = path($path);

    if ($path->exists) {
        say "$path has existed.";
    } else {
        say "create $path";
        $path->mkpath;
    }

    $self;
}

1;
__END__

=head1 NAME

HTTP::Balancer::Command::Init - prepare the environment for HTTP::Balancer

=head1 SYNOPSIS

    # http-balancer init

=cut
