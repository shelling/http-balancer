package HTTP::Balancer::Role::Stem;
use Modern::Perl;
use Moose::Role;

with qw( HTTP::Balancer::Role );

around run => sub {
    my $orig = shift;
    my $self = shift;

    $self->$orig(@_);

    my $handler = $self->command_name;
    say "usage: http-balancer $handler [subcommands]";

    say "Available subcommands:";
    for (@{ref($self)->leaves}) {
        say "       ", $_;
    }
};

no Moose::Role;

1;
