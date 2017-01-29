package ValueObject::Boolean::YesNo;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::InvalidYesNo;
use base qw/ ValueObject::Boolean::Base /;

my @yes = (
    'y',
    'yes'
);

my @no = (
    'n',
    'no',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
	croak (ValueObject::Boolean::Exception::InvalidYesNo->new($value))
        unless (grep { lc($_) eq lc($value) } @yes, @no);
    return 1;
}

sub boolean {
	my $self = shift;
	return (grep { $_ eq lc($self->value) } @yes)
		? 1
		: 0;
}

1;
