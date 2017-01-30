#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 56;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";



# Setup

require_ok('ValueObject::Boolean::TrueFalse');
require_ok('ValueObject::Boolean::YesNo');
require_ok('ValueObject::Boolean::OnOff');
require_ok('ValueObject::Boolean');


my $true_long = ValueObject::Boolean::TrueFalse->new('true');
my $true_short = ValueObject::Boolean::TrueFalse->new('t');
my $false_long = ValueObject::Boolean::TrueFalse->new('false');
my $false_short = ValueObject::Boolean::TrueFalse->new('f');
my $false_short_upper = ValueObject::Boolean::TrueFalse->new('F');

my $yes_long = ValueObject::Boolean::YesNo->new('yes');
my $yes_short = ValueObject::Boolean::YesNo->new('y');
my $no_long = ValueObject::Boolean::YesNo->new('no');
my $no_short = ValueObject::Boolean::YesNo->new('n');

my $on = ValueObject::Boolean::OnOff->new('on');
my $off = ValueObject::Boolean::OnOff->new('off');

my $boolean_off = ValueObject::Boolean->new('on');
my $boolean_false = ValueObject::Boolean->new('false');


# Instantiation Test

isa_ok($true_long, 'ValueObject::Boolean::TrueFalse');
isa_ok($true_long, 'ValueObject::Boolean::Base');

isa_ok($yes_long, 'ValueObject::Boolean::YesNo');
isa_ok($yes_long, 'ValueObject::Boolean::Base');

isa_ok($on, 'ValueObject::Boolean::OnOff');
isa_ok($on, 'ValueObject::Boolean::Base');

isa_ok($boolean_off, 'ValueObject::Boolean::OnOff');
isa_ok($boolean_false, 'ValueObject::Boolean::TrueFalse');


# Test return values

ok($true_long->value() eq 'true', "value function for object 'true'");
ok($true_long eq 'true', "stringify for object 'true'");

ok($true_short->value() eq 't', "value function for object 't'");
ok($true_short eq 't', "stringify function for object 't'");

ok($false_long->value() eq 'false', "value function for object 'false'");
ok($false_long eq 'false', "stringify for object 'false'");

ok($false_short->value() eq 'f', "value function for object 'f'");
ok($false_short eq 'f', "stringigy for object 'f'");

ok($false_short_upper->value() eq 'F', "value function for object 'F'");
ok($false_short_upper eq 'F', "stringigy for object 'F'");

ok($true_long->boolean() == 1, "boolean() function for object 'true'");
ok($true_short->boolean() == 1, "boolean() function for object 't'");
ok($false_long->boolean() == 0, "boolean() function for object 'false'");
ok($false_short->boolean() == 0, "boolean() function for object 'f'");



ok($yes_long->value() eq 'yes', "value function for object 'yes'");
ok($yes_long eq 'yes', "stringify for object 'yes'");

ok($yes_short->value() eq 'y', "value function for object 'y'");
ok($yes_short eq 'y', "stringify function for object 'y'");

ok($no_long->value() eq 'no', "value function for object 'no'");
ok($no_long eq 'no', "stringify for object 'no'");

ok($no_short->value() eq 'n', "value function for object 'n'");
ok($no_short eq 'n', "stringigy for object 'n'");

ok($yes_long->boolean() == 1, "boolean() function for object 'yes'");
ok($yes_short->boolean() == 1, "boolean() function for object 'y'");
ok($no_long->boolean() == 0, "boolean() function for object 'no'");
ok($no_short->boolean() == 0, "boolean() function for object 'n'");


ok($on->value() eq 'on', "value function for object 'on'");
ok($on eq 'on', "stringify for object 'on'");

ok($off->value() eq 'off', "value function for object 'off'");
ok($off eq 'off', "stringify for object 'off'");

ok($on->boolean() == 1, "boolean() function for object 'on'");
ok($off->boolean() == 0, "boolean() function for object 'off'");


# Test Exceptions

throws_ok { ValueObject::Boolean::TrueFalse->new('sdfa') }
    'ValueObject::Boolean::Exception::InvalidTrueFalse',
    'Invalid string exception for TrueFalse';

throws_ok { ValueObject::Boolean::TrueFalse->new('') }
    'ValueObject::Boolean::Exception::InvalidTrueFalse',
    'Empty string exception for TrueFalse';

throws_ok { ValueObject::Boolean::TrueFalse->new(1111) }
    'ValueObject::Boolean::Exception::InvalidTrueFalse',
    'Invalid number exception for TrueFalse';


throws_ok { ValueObject::Boolean::YesNo->new('sdfa') }
    'ValueObject::Boolean::Exception::InvalidYesNo',
    'Invalid string exception for YesNo';

throws_ok { ValueObject::Boolean::YesNo->new('') }
    'ValueObject::Boolean::Exception::InvalidYesNo',
    'Empty string exception for YesNo';

throws_ok { ValueObject::Boolean::YesNo->new(1111) }
    'ValueObject::Boolean::Exception::InvalidYesNo',
    'Invalid number exception for YesNo';


throws_ok { ValueObject::Boolean::OnOff->new('sdfa') }
    'ValueObject::Boolean::Exception::InvalidOnOff',
    'Invalid string exception for OnOff';

throws_ok { ValueObject::Boolean::OnOff->new('') }
    'ValueObject::Boolean::Exception::InvalidOnOff',
    'Empty string exception for OnOff';

throws_ok { ValueObject::Boolean::OnOff->new(1111) }
    'ValueObject::Boolean::Exception::InvalidOnOff',
    'Invalid number exception for OnOff';


throws_ok { ValueObject::Boolean->new('sdfa') }
    'ValueObject::Boolean::Exception::Invalid',
    'Invalid string exception for Boolean';

throws_ok { ValueObject::Boolean->new('') }
    'ValueObject::Boolean::Exception::Invalid',
    'Empty string exception for Boolean';

throws_ok { ValueObject::Boolean->new(1111) }
    'ValueObject::Boolean::Exception::Invalid',
    'Invalid number exception for Boolean';
