#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# Setup

require_ok('ValueObject::Geography::Continent');

my @valid_continents = (
    'antarctica',
    'africa',
    'asia',
    'australia',
    'europe',
    'north america',
    'south america'
);

my @invalid_continents = (
    undef,
    '',
    1,
    '3',
    '-5',
    'gadg',
);

my $valid_continent = $valid_continents[0];

my $valid_continent_vo = ValueObject::Geography::Continent->new($valid_continent);


# Instantiation Test

isa_ok($valid_continent_vo, 'ValueObject::Geography::Continent');



## Test return values

ok($valid_continent_vo->value() eq $valid_continent, "value function for object '$valid_continent'");
ok($valid_continent_vo eq $valid_continent, "stringify for object '$valid_continent'");

my $test_count = 4;

# Test valid/invalid examples

foreach my $test_valid_continent (@valid_continents) {
    $test_count++;
    isa_ok(ValueObject::Geography::Continent->new($test_valid_continent), 'ValueObject::Geography::Continent');
}

foreach my $test_invalid_continent (@invalid_continents) {
    $test_count++;
    throws_ok { ValueObject::Geography::Continent->new($test_invalid_continent) }
        'ValueObject::Geography::Continent::Exception::Invalid',
        'Invalid exception for ValueObject::Geography::Continent';
}


done_testing($test_count);
