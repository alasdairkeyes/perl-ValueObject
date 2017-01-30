#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;
use Getopt::Long;

use FindBin qw($Bin);
use lib "$Bin/../lib";



# Setup

my ($valid_filename, $invalid_filename) = ('','');

GetOptions ("valid=s"    => \$valid_filename,
            "invalid=s" => \$invalid_filename);

my $valid_postcodes = [
    'B1 1BG',
    'B11 4HR',
    'AB1 0BE',
    'AB11 5BA',
    'E1W 1AD',
    'EC1A 1AL',
];

my $invalid_postcodes = [
    undef,
    '',
    0,
    '4573547',
    'dfsgsdf',
    ' ',
    'AA1AA 1AA',
    'AA11A 1AA',
    'AA1 11A',
    'AA1 1A',
    'AA1 AAA',
    'AA1 A1',
    'AA1 A11',
    'AA1 111',
    'AA1 1',
];



# Instantiation tests

require_ok('ValueObject::PostCode');

isa_ok(ValueObject::PostCode->new($$valid_postcodes[0]), 'ValueObject::PostCode');

my $test_count = 2;



# Test return values

foreach my $valid_postcode (@$valid_postcodes) {
    $test_count++;
    my $pc = ValueObject::PostCode->new($valid_postcode);
    ok($pc->value eq $valid_postcode, "Accept valid value '$valid_postcode'");
    
}



# Test Exceptions

foreach my $invalid_postcode (@$invalid_postcodes) {
    $test_count++;
    my $error_value = defined($invalid_postcode)
        ? $invalid_postcode
        : 'undef';

    my $error_class = 'ValueObject::PostCode::Exception::Invalid';

    throws_ok { ValueObject::PostCode->new($invalid_postcode) }
    $error_class,
    "Invalid value '$error_value' generates '$error_class'";
}



# Extra Files

test_file($valid_filename, 'valid')
    if ($valid_filename);

test_file($invalid_filename, 'invalid')
    if ($invalid_filename);

done_testing($test_count);



# Test contents of file for validity

sub test_file {
    my $filename = shift;
    my $type = shift;

    print "\nTesting file '$filename'\n";
    open (my $fh, '<', $filename)
        || die "Cannot open file '$filename', tests aborted";
    
    my $line     = 0;
    my $success = 0;
    my $failure = 0;

    while (<$fh>) {
        my $post_code = $_;
        chomp($post_code);
        $line++;
        eval {
            ValueObject::PostCode->new($post_code);
        };

        if ($type eq 'valid') {
            if ($@) {
                print "\nValue '$post_code' on line $line fails'\n";
                $failure++;
            }  else {
                $success++;
            }
        } else {
            if ($@) {
                $success++;
            }  else {
                print "\nValue '$post_code' on line $line fails'\n";
                $failure++;
            }
            
        }

        print "Testing Line $line             \r";
    }
    print "\nTested  : $filename\n";
    print "Total   : $line\n";
    print "Valid   : $success\n";
    print "Invalid : $failure\n\n";

    $test_count++;
    ok($failure == 0, "File '$filename' generated no errors");
}

