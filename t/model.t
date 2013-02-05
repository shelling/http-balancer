use Modern::Perl;
use Test::More;
use local::lib 'local';

BEGIN {
    use_ok 'HTTP::Balancer::Model';
}

$HTTP::Balancer::Model::dbpath = "/tmp";

{
    package HTTP::Balancer::Model::Foo;
    use Modern::Perl;
    use Moose;
    use MooseX::Storage;
    extends qw(HTTP::Balancer::Model);
    with Storage(
        format  => 'YAML',
        io      => 'File',
    );

    has id => (
        is  => 'rw',
        isa => 'Num',
    );

    has bar => (
        is  => 'rw',
        isa => 'Str',
    );
}

my $foo = HTTP::Balancer::Model::Foo->new( bar => "blah" );

is (
    $foo->model_name,
    "foo",
    "model_name is the lowercase last package name",
);

is (
    $foo->model_dir,
    "/tmp/foo",
    "model_dir is dbpath followed with model_name",

);

done_testing;
