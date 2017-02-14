package ValueObject::Finance::IBAN;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::IBAN::Exception::Invalid;
use ValueObject::Geography::Country::Codes::2Character;
use Math::BigInt;
use base qw/ ValueObject::Base /;

my $iban_regex = qr/^([A-Z]{2})(\d{2})([A-Z0-9]{10,30})$/i;
my $iban_character_offset = 55;

sub validate {
    my $self    = shift;
    my $value   = shift || '';

    if ($value =~ /$iban_regex/) {
        my ($country, $checksum, $account_number) = ($1, $2, $3);

            ## Check country
        eval{
            ValueObject::Geography::Country::Codes::2Character->new($country);
        } || croak (ValueObject::Finance::IBAN::Exception::Invalid->new($value));

            ## Rearrange into order for checksum
        my $number_to_validate = join('',
            map { $self->convert_character_to_integer($_) } (
                split(//, $account_number),
                split(//, $country)
            )
        ) . $checksum;

            ## Convert to BigInt object
        $number_to_validate = Math::BigInt->new($number_to_validate);
        my $modulus = $number_to_validate % 97;

        return 1
            if ($modulus == 1);
    }

        ## Else fail
    croak (ValueObject::Finance::IBAN::Exception::Invalid->new($value));
}

sub convert_character_to_integer {
    my $self = shift;
    my $character = shift;

        ## return character as is, if not alphabetic
    return $character
        unless ($character =~ /^[A-Z]$/);

        ## Expand string to number
    return ord($character) - $iban_character_offset;
}

1;

=head1 NAME

ValueObject::Finance::IBAN - Value object to represent IBAN numbers

=head1 SYNOPSIS

  use ValueObject::Finance::IBAN;

  my $vo = ValueObject::Finance::IBAN->new('GB15MIDL40051512345678');

=head1 DESCRIPTION

ValueObject::Finance::IBAN provides Value Object for validation of IBAN
numbers (Case insensitive)

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::IBAN::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
