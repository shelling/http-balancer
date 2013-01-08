use inc::Module::Install;
name 'HTTP-Balancer';
all_from 'lib/HTTP/Balancer.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
