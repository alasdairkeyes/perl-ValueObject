package ValueObject::Exception::Base;

use strict;
use warnings;
use Carp;

sub new {
	my $class = shift;
	my $message = shift || '';
	my $value = shift;

	$value = (defined($value))
		? $value
		: 'undef';

	return bless {
		message	=> $message,
		value	=> $value,
	}, $class;
}

sub message {
	my $self = shift;
	return $self->{ message };
}

sub value {
	my $self = shift;
	return $self->{ value };
}

1;
