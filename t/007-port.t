#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# Setup

my @invalids = qw/
	-1
	0
	65536
/;

my @valids = qw/
	1
	2
	65535
/;

require_ok('ValueObject::Inet::Port');

my $valid_port_number = 80;
my $test_valid_port = ValueObject::Inet::Port->new($valid_port_number);




# Instantiation Test

isa_ok($test_valid_port, 'ValueObject::Inet::Port');



# Test return values

ok($test_valid_port->value() eq $valid_port_number, "value function for object '$valid_port_number'");
ok($test_valid_port eq $valid_port_number, "stringify for object '$valid_port_number'");


# Test Exceptions

throws_ok { ValueObject::Inet::Port->new('sdfa') }
	'ValueObject::Inet::Port::Exception::Invalid',
	'Invalid string exception';

my $test_count = 5;



# Test validation

foreach my $valid (@valids) {
	ok(ValueObject::Inet::Port->new($valid), "valid port $valid");
	++$test_count;
}

foreach my $invalid (@invalids) {
	throws_ok { ValueObject::Inet::Port->new($invalid) }
		'ValueObject::Inet::Port::Exception::Invalid',
		"Invalid port $invalid";
	++$test_count;
}

done_testing($test_count);
