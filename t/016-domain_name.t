#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# Setup

require_ok('ValueObject::Inet::Domain');

my @valid_domains = (
    'google.com',
    'google.co.uk',
    'google.biz',
    'google.voyage',
    'google.xn--80akhbyknj4f',
    'subdomain.google.com',
    'g-oogle.com'
);

my @invalid_domains = (
    undef,
    '',
    1,
    '3',
    '-5',
    'gadg',
    'g_oogle.com',
    'google.com.',
    '.google.com',
    '-google.com',
    'google-.com',
    'google.com-',
);

my $valid_domain = $valid_domains[0];

my $valid_domain_vo = ValueObject::Inet::Domain->new($valid_domain);


# Instantiation Test

isa_ok($valid_domain_vo, 'ValueObject::Inet::Domain');



## Test return values

ok($valid_domain_vo->value() eq $valid_domain, "value function for object '$valid_domain'");
ok($valid_domain_vo eq $valid_domain, "stringify for object '$valid_domain'");

my $test_count = 4;

# Test valid/invalid examples

foreach my $test_valid_domain (@valid_domains) {
    $test_count++;
    isa_ok(ValueObject::Inet::Domain->new($test_valid_domain), "ValueObject::Inet::Domain",  $test_valid_domain);
}

foreach my $test_valid_domain (@invalid_domains) {
    $test_count++;
    my $print_test_valid_domain = defined($test_valid_domain)
        ? $test_valid_domain
        : '<undef>';

    throws_ok { ValueObject::Inet::Domain->new($test_valid_domain) }
        'ValueObject::Inet::Domain::Exception::Invalid',
        "Invalid exception for ValueObject::Inet::Domain ($print_test_valid_domain)";
}


done_testing($test_count);
