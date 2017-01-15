#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 6;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

use constant EXCEPTION_MESSAGE	=> 'message';
use constant EXCEPTION_VALUE	=> 'value';

require_ok('ValueObject::Base');
require_ok('ValueObject::Exception::Base');

throws_ok { ValueObject::Base->new('a') } qr/Invalid validator for/, 'ValueObject::Base validator exception' ;

my $base_exception = ValueObject::Exception::Base->new();
ok(ref($base_exception) eq 'ValueObject::Exception::Base', 'BaseException Object');

my $base_exception_arguments = ValueObject::Exception::Base->new(
	EXCEPTION_MESSAGE,
	EXCEPTION_VALUE
);

ok($base_exception_arguments->message eq EXCEPTION_MESSAGE,
	"Exception message");
ok($base_exception_arguments->value	eq EXCEPTION_VALUE,
	"Exception value");
