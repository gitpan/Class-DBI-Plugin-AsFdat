use strict;
use Test::More;
use lib qw(t/);
use CD;

BEGIN {
    eval "use DBD::SQLite";
    plan $@ ? (skip_all => 'needs DBD::SQLite for testing') : (tests => 1);
}

Music::CD->CONSTRUCT;
my $row = Music::CD->retrieve_all->first;
is_deeply $row->as_fdat, { 'cdid' => '1', 'artist' => 'foo', 'reldate' => '2006-01-01', 'title' => 'bar', 'year' => '2006' }, 'as_fdat';
