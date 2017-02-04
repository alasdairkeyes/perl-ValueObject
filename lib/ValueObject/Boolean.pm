package ValueObject::Boolean;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::Invalid;
use ValueObject::Boolean::YesNo;
use ValueObject::Boolean::TrueFalse;
use ValueObject::Boolean::OnOff;
use base qw/ ValueObject::Base /;

sub new {
    my $class   = shift;
    my $value   = shift;

    my $boolean_object;

    foreach my $boolean_type ('ValueObject::Boolean::YesNo','ValueObject::Boolean::TrueFalse','ValueObject::Boolean::OnOff') {
        $boolean_object = eval {
            $boolean_type->new($value);
        };
        if ($boolean_object) {
            return $boolean_object;
        }
    }

    croak (ValueObject::Boolean::Exception::Invalid->new($value));
}

1;

=head1 NAME

ValueObject::Boolean - Boolean Value Object

=head1 SYNOPSIS

  use base ValueObject::Boolean;

  my $vo = ValueObject::Boolean->new('yes');

=head1 DESCRIPTION

ValueObject::Boolean provides Value Object for validation of boolean
values.

Returns one of 
ValueObject::Boolean::OnOff
ValueObject::Boolean::TrueFalse
ValueObject::Boolean::YesNo

or Exception object ValueObject::Boolean::Exception::Invalid

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Boolean::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=item boolean()

Returns a boolean 0 or 1 for no/yes

=back

=head1 SEE ALSO

L<ValueObject::Boolean::OnOff>,
L<ValueObject::Boolean::TrueFalse>
L<ValueObject::Boolean::YesNo>

=cut
