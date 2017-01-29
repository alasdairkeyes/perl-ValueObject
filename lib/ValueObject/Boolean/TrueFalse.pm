package ValueObject::Boolean::TrueFalse;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::InvalidTrueFalse;
use base qw/ ValueObject::Boolean::Base /;

my @true = (
    't',
    'true'
);

my @false = (
    'f',
    'false',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
	croak (ValueObject::Boolean::Exception::InvalidTrueFalse->new($value))
        unless (grep { lc($_) eq lc($value) } @true, @false);
    return 1;
}

sub boolean {
	my $self = shift;
	return (grep { $_ eq lc($self->value) } @true)
		? 1
		: 0;
}

1;
