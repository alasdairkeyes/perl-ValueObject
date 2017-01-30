#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 13;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";



# Setup

require_ok('ValueObject::Gender');

my $male_long = ValueObject::Gender->new('male');
my $male_short = ValueObject::Gender->new('m');
my $female_long = ValueObject::Gender->new('female');
my $female_short = ValueObject::Gender->new('f');



# Instantiation Test

isa_ok($male_long, 'ValueObject::Gender');



# Test return values

ok($male_long->value() eq 'male', "value function for object 'male'");
ok($male_long eq 'male', "stringify for object 'male'");

ok($male_short->value() eq 'm', "value function for object 'm'");
ok($male_short eq 'm', "stringify function for object 'm'");

ok($female_long->value() eq 'female', "value function for object 'female'");
ok($female_long eq 'female', "stringify for object 'female'");


ok($female_short->value() eq 'f', "value function for object 'f'");
ok($female_short eq 'f', "stringigy for object 'f'");



# Test Exceptions

throws_ok { ValueObject::Gender->new('sdfa') }
    'ValueObject::Gender::Exception::Invalid',
    'Invalid string exception';

throws_ok { ValueObject::Gender->new('') }
    'ValueObject::Gender::Exception::Invalid',
    'Empty string exception';

throws_ok { ValueObject::Gender->new(1111) }
    'ValueObject::Gender::Exception::Invalid',
    'Invalid number exception';
