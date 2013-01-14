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

1;