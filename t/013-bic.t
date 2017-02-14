#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 30;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# Setup

require_ok('ValueObject::Finance::BIC');
require_ok('ValueObject::Finance::BIC::Test');
require_ok('ValueObject::Finance::BIC::Passive');
require_ok('ValueObject::Finance::BIC::Reverse');
require_ok('ValueObject::Finance::BIC::Generic');


my $test_bic = 'ABBEGB20XXX';
my $passive_bic = 'ABBEGB21XXX';
my $reverse_bic = 'ABBEGB22XXX';
my $generic_bic = 'ABBEGB24XXX';


my $test_bic_vo = ValueObject::Finance::BIC::Test->new($test_bic);
my $passive_bic_vo = ValueObject::Finance::BIC::Passive->new($passive_bic);
my $reverse_bic_vo = ValueObject::Finance::BIC::Reverse->new($reverse_bic);
my $generic_bic_vo = ValueObject::Finance::BIC::Generic->new($generic_bic);
my $bic_vo = ValueObject::Finance::BIC->new($generic_bic);


# Instantiation Test

isa_ok($test_bic_vo, 'ValueObject::Finance::BIC::Test');
isa_ok($test_bic_vo, 'ValueObject::Finance::BIC::Base');

isa_ok($passive_bic_vo, 'ValueObject::Finance::BIC::Passive');
isa_ok($passive_bic_vo, 'ValueObject::Finance::BIC::Base');

isa_ok($reverse_bic_vo, 'ValueObject::Finance::BIC::Reverse');
isa_ok($reverse_bic_vo, 'ValueObject::Finance::BIC::Base');

isa_ok($generic_bic_vo, 'ValueObject::Finance::BIC::Generic');
isa_ok($generic_bic_vo, 'ValueObject::Finance::BIC::Base');

isa_ok($bic_vo, 'ValueObject::Finance::BIC::Generic');
isa_ok($bic_vo, 'ValueObject::Finance::BIC::Base');


## Test return values

ok($test_bic_vo->value() eq $test_bic, "value function for object '$test_bic'");
ok($test_bic_vo eq $test_bic, "stringify for object '$test_bic'");

ok($passive_bic_vo->value() eq $passive_bic, "value function for object '$passive_bic'");
ok($passive_bic_vo eq $passive_bic, "stringify for object '$passive_bic'");

ok($reverse_bic_vo->value() eq $reverse_bic, "value function for object '$reverse_bic'");
ok($reverse_bic_vo eq $reverse_bic, "stringify for object '$reverse_bic'");

ok($generic_bic_vo->value() eq $generic_bic, "value function for object '$generic_bic'");
ok($generic_bic_vo eq $generic_bic, "stringify for object '$generic_bic'");

ok($bic_vo->value() eq $generic_bic, "value function for object '$generic_bic'");
ok($bic_vo eq $generic_bic, "stringify for object '$generic_bic'");



## Test Exceptions

throws_ok { ValueObject::Finance::BIC::Test->new('ABBEGB29XXX') }
    'ValueObject::Finance::BIC::Exception::InvalidTest',
    'Invalid Test exception for ValueObject::Finance::BIC::Test';

throws_ok { ValueObject::Finance::BIC::Passive->new('ABBEGB29XXX') }
    'ValueObject::Finance::BIC::Exception::InvalidPassive',
    'Invalid Passive exception for ValueObject::Finance::BIC::Passive';

throws_ok { ValueObject::Finance::BIC::Reverse->new('ABBEGB29XXX') }
    'ValueObject::Finance::BIC::Exception::InvalidReverse',
    'Invalid Reverse exception for ValueObject::Finance::BIC::Reverse';

throws_ok { ValueObject::Finance::BIC::Generic->new('ABBEGB20X') }
    'ValueObject::Finance::BIC::Exception::InvalidFormat',
    'Invalid Format exception for ValueObject::Finance::BIC::Generic';

throws_ok { ValueObject::Finance::BIC::Generic->new('ABBEXX20XXX') }
    'ValueObject::Finance::BIC::Exception::InvalidCountry',
    'Invalid Country exception for ValueObject::Finance::BIC::Generic';
