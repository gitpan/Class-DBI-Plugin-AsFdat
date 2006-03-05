use strict;
use Test::More;
use lib qw(t/);
use CD;

BEGIN {
    eval "use DBD::SQLite;use DateTime";
    plan $@ ? (skip_all => 'needs DBD::SQLite, DateTime, and DateTime::Format::Strptime for testing') : (tests => 1);
}

Music::CD->has_a(
    reldate => 'DateTime',
    inflate => sub { DateTime->new(year => 2006, month => 3, day => 6) },
);
Music::CD->CONSTRUCT;
my $row = Music::CD->retrieve_all->first;
is_deeply $row->as_fdat, { 'cdid' => '1', 'artist' => 'foo', 'reldate' => '2006-03-06T00:00:00', 'title' => 'bar', 'year' => '2006', reldate_year => 2006, reldate_month => 3, reldate_day => 6, reldate_hour => 0, reldate_minute => 0, reldate_second => 0 }, 'as_fdat';
