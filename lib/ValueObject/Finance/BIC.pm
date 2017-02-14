package ValueObject::Finance::BIC;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::BIC::Exception::Invalid;
use ValueObject::Finance::BIC::Test;
use ValueObject::Finance::BIC::Passive;
use ValueObject::Finance::BIC::Reverse;
use ValueObject::Finance::BIC::Generic;
use base qw/ ValueObject::Finance::BIC::Base /;

sub new {
    my $class   = shift;
    my $value   = shift;

    my $bic_object;

    foreach my $bic_type (  'ValueObject::Finance::BIC::Test',
                            'ValueObject::Finance::BIC::Passive',
                            'ValueObject::Finance::BIC::Reverse',
                            'ValueObject::Finance::BIC::Generic') {
        $bic_object = eval {
            $bic_type->new($value);
        };
        if ($bic_object) {
            return $bic_object;
        }
    }

    croak (ValueObject::Finance::BIC::Exception::Invalid->new($value));
}

1;

=head1 NAME

ValueObject::Finance::BIC - BIC/SWIFT Value Object

=head1 SYNOPSIS

  use ValueObject::Finance::BIC;

  my $vo = ValueObject::Finance::BIC->new('ABBEGB22XXX');

=head1 DESCRIPTION

ValueObject::Finance::BIC provides Value Object for validation of BIC/SWIFT
codes

Returns one of
ValueObject::Finance::BIC::Test
ValueObject::Finance::BIC::Passive
ValueObject::Finance::BIC::Reverse
ValueObject::Finance::BIC::Generic

or Exception object ValueObject::Finance::BIC::Exception::Invalid

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::BIC::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=item Finance::BIC()

Returns a Finance::BIC 0 or 1 for no/yes

=back

=head1 SEE ALSO

L<ValueObject::Finance::BIC::OnOff>,
L<ValueObject::Finance::BIC::TrueFalse>
L<ValueObject::Finance::BIC::YesNo>

=cut
