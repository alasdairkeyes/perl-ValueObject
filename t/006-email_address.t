#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 5;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# No testing of validation as that's performed by 3rd party module

# Setup

require_ok('ValueObject::Inet::EmailAddress');

my $email = ValueObject::Inet::EmailAddress->new('a@a.com');



# Instantiation Test

isa_ok($email, 'ValueObject::Inet::EmailAddress');



# Test return values

ok($email->value() eq 'a@a.com', "value function for object 'a\@.com'");
ok($email eq 'a@a.com', "stringify for object 'a\@a.com'");


# Test Exceptions

throws_ok { ValueObject::Inet::EmailAddress->new('sdfa') }
	'ValueObject::Inet::EmailAddress::Exception::Invalid',
	'Invalid string exception';
