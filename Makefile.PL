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
requires        'MooseX::Storage';
requires        'Namespace::Dispatch'   => '0.07';
requires        'YAML::Any';
requires        'Path::Tiny';

test_requires   'Test::More';
test_requires   'local::lib';

tests           't/*.t t/*/*.t';
author_tests    'xt';

auto_include;
WriteAll;
