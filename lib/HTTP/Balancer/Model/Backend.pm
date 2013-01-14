package HTTP::Balancer::Model::Backend;
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

has address => (
    is  => "rw",
    isa => "Str",
);

has host_id => (
    is  => "rw",
    isa => "Str",
);

1;
