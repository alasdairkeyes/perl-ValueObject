#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";



# Setup

my @valid_2_character_codes = (
    'gb',
    'GB',
    'gB',
);

my @valid_3_character_codes = (
    'gbr',
    'GBR',
    'gBr',
);

my @invalid_codes = (
    '',
    1241,
    undef,
    'g',
);

my @invalid_2_character_codes = (
    'XX'
);

my @invalid_3_character_codes = (
    'XXX'
);

require_ok('ValueObject::Geography::Country::Codes::2Character');
require_ok('ValueObject::Geography::Country::Codes::3Character');
my $valid_2_character_code = 'GB';
my $valid_3_character_code = 'GBR';

my $object_2_character = ValueObject::Geography::Country::Codes::2Character->new($valid_2_character_code);
my $object_3_character = ValueObject::Geography::Country::Codes::3Character->new($valid_3_character_code);

# Instantiation Test

isa_ok($object_2_character, 'ValueObject::Geography::Country::Codes::2Character');
isa_ok($object_2_character, 'ValueObject::Geography::Country::Codes::Base');

isa_ok($object_3_character, 'ValueObject::Geography::Country::Codes::3Character');
isa_ok($object_3_character, 'ValueObject::Geography::Country::Codes::Base');

# Test return values

ok($object_2_character->value() eq $valid_2_character_code, "value function for object '$valid_2_character_code'");
ok($object_2_character eq $valid_2_character_code, "stringify for object '$valid_2_character_code'");

ok($object_3_character->value() eq $valid_3_character_code, "value function for object '$valid_3_character_code'");
ok($object_3_character eq $valid_3_character_code, "stringify for object '$valid_3_character_code'");

my $test_count = 11;


# Test validation

foreach my $valid (@valid_2_character_codes) {
    ok(ValueObject::Geography::Country::Codes::2Character->new($valid), "valid ISO-3166 alpha-2 code $valid");
    ++$test_count;
}

foreach my $valid (@valid_3_character_codes) {
    ok(ValueObject::Geography::Country::Codes::3Character->new($valid), "valid ISO-3166 alpha-3 code $valid");
    ++$test_count;
}

foreach my $invalid (@invalid_codes, @invalid_2_character_codes) {
    my $print_invalid = defined($invalid)
        ? $invalid
        : '<undef>';
    throws_ok { ValueObject::Geography::Country::Codes::2Character->new($invalid) }
        'ValueObject::Geography::Country::Codes::Exception::Invalid2Character',
        "Invalid ISO-3166 alpha-2 code '$print_invalid'";
    ++$test_count;
}

foreach my $invalid (@invalid_codes, @invalid_3_character_codes) {
    my $print_invalid = defined($invalid)
        ? $invalid
        : '<undef>';
    throws_ok { ValueObject::Geography::Country::Codes::3Character->new($invalid) }
        'ValueObject::Geography::Country::Codes::Exception::Invalid3Character',
        "Invalid ISO-3166 alpha-3 code '$print_invalid'";
    ++$test_count;
}

# Test Exceptions

throws_ok { ValueObject::Geography::Country::Codes::2Character->new('sdfa') }
    'ValueObject::Geography::Country::Codes::Exception::Invalid2Character',
    'Invalid string exception';

done_testing($test_count);
