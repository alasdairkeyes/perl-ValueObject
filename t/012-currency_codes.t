#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 5;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# TODO: Handle negative values??

# Setup

require_ok('ValueObject::Finance::Currency::Code');


my $valid_currency_code = 'gbp';

my $currency_code = ValueObject::Finance::Currency::Code->new($valid_currency_code);


# Instantiation Test

isa_ok($currency_code, 'ValueObject::Finance::Currency::Code');



## Test return values

ok($currency_code->value() eq $valid_currency_code, "value function for object '$valid_currency_code'");
ok($currency_code eq $valid_currency_code, "value function for object '$valid_currency_code'");


## Test Exceptions

throws_ok { ValueObject::Finance::Currency::Code->new('sdfa') }
    'ValueObject::Finance::Currency::Exception::InvalidCode',
    'Invalid string exception for Finance::Currency::Code';
