package ValueObject::Finance::Money;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::Money::Period;
use ValueObject::Finance::Money::Comma;
use ValueObject::Finance::Money::Exception::Invalid;
use base qw/ ValueObject::Base /;

sub new {
    my $class   = shift;
    my $value   = shift;

    my $currency_object;

    foreach my $currency_type ('ValueObject::Finance::Money::Period', 'ValueObject::Finance::Money::Comma') {
        $currency_object = eval {
            $currency_type->new($value);
        };
        if ($currency_object) {
            return $currency_object;
        }
    }

    croak (ValueObject::Finance::Money::Exception::Invalid->new($value));
}

1;

=head1 NAME

ValueObject::Finance::Money - Value object to represent money amounts

=head1 SYNOPSIS

  use ValueObject::Finance::Money;

  my $vo = ValueObject::Finance::Money->new(35.65);

=head1 DESCRIPTION

ValueObject::Finance::Money provides Value Object for validation of money
amounts

Returns one of 
ValueObject::Finance::Money::Comma
ValueObject::Finance::Money::Period

or Exception object ValueObject::Finance::Money::Exception::Invalid

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::Money::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=item boolean()

Returns a boolean 0 or 1 for no/yes

=back

=head1 SEE ALSO

L<ValueObject::Finance::Money::Comma>,
L<ValueObject::Finance::Money::Period>

=cut
