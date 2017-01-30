#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 23;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# TODO: Handle negative values??

# Setup

require_ok('ValueObject::Finance::Money::Comma');
require_ok('ValueObject::Finance::Money::Period');
require_ok('ValueObject::Finance::Money');
require_ok('ValueObject::Finance::Currency::Code');


my $valid_comma_money = '23,45';
my $valid_period_money = '57.45';
my $valid_currency_code = 'gbp';

my $direct_comma = ValueObject::Finance::Money::Comma->new($valid_comma_money);
my $direct_period = ValueObject::Finance::Money::Period->new($valid_period_money);
my $factory_comma = ValueObject::Finance::Money->new($valid_comma_money);
my $factory_period = ValueObject::Finance::Money->new($valid_period_money);
my $currency_code = ValueObject::Finance::Currency::Code->new($valid_currency_code);


# Instantiation Test

isa_ok($direct_comma, 'ValueObject::Finance::Money::Comma');
isa_ok($direct_comma, 'ValueObject::Finance::Money::Base');

isa_ok($direct_period, 'ValueObject::Finance::Money::Period');
isa_ok($direct_period, 'ValueObject::Finance::Money::Base');

isa_ok($factory_comma, 'ValueObject::Finance::Money::Comma');
isa_ok($factory_comma, 'ValueObject::Finance::Money::Base');

isa_ok($factory_period, 'ValueObject::Finance::Money::Period');
isa_ok($factory_period, 'ValueObject::Finance::Money::Base');

isa_ok($currency_code, 'ValueObject::Finance::Currency::Code');



## Test return values

ok($direct_comma->value() eq $valid_comma_money, "value function for object '$valid_comma_money'");
ok($direct_comma eq $valid_comma_money, "stringify for object '$valid_comma_money'");

ok($direct_period->value() eq $valid_period_money, "value function for object '$valid_period_money'");
ok($direct_period eq $valid_period_money, "stringify for object '$valid_period_money'");

ok($currency_code->value() eq $valid_currency_code, "value function for object '$valid_currency_code'");
ok($currency_code eq $valid_currency_code, "value function for object '$valid_currency_code'");



## Test Exceptions

throws_ok { ValueObject::Finance::Money::Period->new('sdfa') }
    'ValueObject::Finance::Money::Exception::InvalidPeriod',
    'Invalid string exception for Period Finance::Money';

throws_ok { ValueObject::Finance::Money::Comma->new('sdfa') }
    'ValueObject::Finance::Money::Exception::InvalidComma',
    'Invalid string exception for Comma Finance::Money';

throws_ok { ValueObject::Finance::Money->new('sdfa') }
    'ValueObject::Finance::Money::Exception::Invalid',
    'Invalid string exception for Finance::Money';

throws_ok { ValueObject::Finance::Currency::Code->new('sdfa') }
    'ValueObject::Finance::Currency::Exception::InvalidCode',
    'Invalid string exception for Finance::Currency::Code';

