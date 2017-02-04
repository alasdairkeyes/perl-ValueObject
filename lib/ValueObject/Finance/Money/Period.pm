package ValueObject::Finance::Money::Period;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::Money::Exception::InvalidPeriod;
use base qw/ ValueObject::Finance::Money::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Finance::Money::Exception::InvalidPeriod->new($value))
        unless ($value =~ /^\d+(\.\d{1,2})?$/);
    return 1;
}

sub full_value {
	my $self = shift;
	return sprintf('%.2f', $self->value());
}

1;

=head1 NAME

ValueObject::Finance::Money::Period - Value Object for period separated money amounts

=head1 SYNOPSIS

  use ValueObject::Finance::Money::Period

  my $vo = ValueObject::Finance::Money::Period->new(45.23);

=head1 DESCRIPTION

Provides Value Object for validation of monetary amounts using periods.

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::Money::Exception::InvalidPeriod if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Finance::Money::Base>

=cut
