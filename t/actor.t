use Modern::Perl;
use Test::More;
use Test::Exception;
use local::lib 'local';

BEGIN {
    use_ok 'HTTP::Balancer::Actor';
}

{
    package HTTP::Balancer::Actor::Foo;
    use Modern::Perl;
    use Moose;
    extends qw(HTTP::Balancer::Actor);
}

throws_ok (
    sub { HTTP::Balancer::Actor::Foo->start },
    qr{you do not implement the start\(\) for HTTP::Balancer::Actor::Foo},
    "die if not implement start()",
);

throws_ok (
    sub { HTTP::Balancer::Actor::Foo->stop },
    qr{you do not implement the stop\(\) for HTTP::Balancer::Actor::Foo},
    'die if not implement stop()',
);

done_testing;
