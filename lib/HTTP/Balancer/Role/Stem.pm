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
__END__

=head1 NAME

HTTP::Balancer::Role::Stem - subcommand presenter for command handlers

=head1 SYNOPSIS

    package HTTP::Balancer::Command::Any::Foo;

    package HTTP::Balancer::Command::Any::Bar;

    package HTTP::Balancer::Command::Any;
    use Modern::Perl;
    use Moose;
    with qw( HTTP::Balancer::Role::Command
             HTTP::Balancer::Role::Stem );

    sub run {
    }

=head1 DESCRIPTION

    $ http-balancer any
    usage: http-balancer any [subcommands]
    Available subcommands:
        foo
        bar

=cut
