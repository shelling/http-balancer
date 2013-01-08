use inc::Module::Install;

name            'HTTP-Balancer';
all_from        'lib/HTTP/Balancer.pm';
author          'shelling <navyblueshellingford@gmail.com>';
license         'MIT';
perl_version    '5.010';

install_script  'bin/http-balancer';

requires        'Modern::Perl';
requires        'Moose';
requires        'MooseX::Getopt';
requires        'MooseX::Singleton';
requires        'Namespace::Dispatch'   => '0.04';

test_requires   'Test::More';

tests           't/*.t';
author_tests    'xt';

auto_include;
WriteAll;
