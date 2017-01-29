#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# Setup

my @invalids = qw/
	00:00:00:00:00:0G
	01:23-45:67:89:ab
	01:23-45:67:89:a
	01:23-45:67:89
	01:23-45:67:89:ab:cd
/;

my @valids = qw/
	01:23:45:67:89:ab
	01-23-45-67-89-ab
	00:00:00:00:00:00
	ff:ff:ff:ff:ff:ff
	AB:CD:EF:01:23:45
/;

require_ok('ValueObject::Inet::MacAddress');

my $valid_mac = '01:02:03:04:05:06';
my $test_valid_mac = ValueObject::Inet::MacAddress->new($valid_mac);




# Instantiation Test

isa_ok($test_valid_mac, 'ValueObject::Inet::MacAddress');



# Test return values

ok($test_valid_mac->value() eq $valid_mac, "value function for object '$valid_mac'");
ok($test_valid_mac eq $valid_mac, "stringify for object '$valid_mac'");


# Test Exceptions

throws_ok { ValueObject::Inet::MacAddress->new('sdfa') }
	'ValueObject::Inet::MacAddress::Exception::Invalid',
	'Invalid string exception';

my $test_count = 5;



# Test validation

foreach my $valid (@valids) {
	ok(ValueObject::Inet::MacAddress->new($valid), "valid MAC address $valid");
	++$test_count;
}

foreach my $invalid (@invalids) {
	throws_ok { ValueObject::Inet::MacAddress->new($invalid) }
		'ValueObject::Inet::MacAddress::Exception::Invalid',
		"Invalid MAC address $invalid";
	++$test_count;
}

done_testing($test_count);
