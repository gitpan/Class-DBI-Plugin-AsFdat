use inc::Module::Install;

all_from 'lib/Class/DBI/Plugin/AsFdat.pm';

requires 'Test::More'      => 0.32;
requires 'Class::DBI'      => '3.0.11';
requires 'DateTime'        => 0.2901;
requires 'Exporter'        => 5.62;

test_requires 'Test::More';
test_requires 'YAML';

author_tests 'xt';
use_test_base;
auto_include;
auto_install;
WriteAll;

