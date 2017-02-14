package ValueObject::Finance::BIC::Base;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::BIC::Exception::InvalidFormat;
use ValueObject::Finance::BIC::Exception::InvalidCountry;
use ValueObject::Geography::Country::Codes::2Character;
use base qw/ ValueObject::Base /;

my $validation_regex = qr/^([a-z]{4})([a-z]{2})([a-z0-9]{2})([a-z0-9]{3})?$/i;

sub validate_format {
    my $self = shift;
    my $value = shift || '';

    if ($value =~ m/$validation_regex/) {
        my ($bank, $country, $location, $branch) = ($1, $2, $3, $4);
        eval{
            ValueObject::Geography::Country::Codes::2Character->new($country);
        } || croak (ValueObject::Finance::BIC::Exception::InvalidCountry->new($value));

        return {
            bank        => $bank,
            country     => $country,
            location    => $location,
            branch      => ($branch || undef)
        };
    }
    croak (ValueObject::Finance::BIC::Exception::InvalidFormat->new($value));
}

1;

=head1 NAME

ValueObject::Finance::BIC::Base - Base object for all Finance::BIC Value Objects

=head1 SYNOPSIS

  use base qw/ ValueObject::Finance::BIC::Base /;

  sub validate {
    my $self    = shift;
    my $value   = shift || '';

    # if $value validates
    #     return 1
    # else
    #     Throw exception on failer
  }

=head1 DESCRIPTION

ValueObject::Finance::BIC::Base is a base class from which all
ValueObject::Finance::BIC ValueObjects extend.
The validate() sub routine needs overriding

=head1 METHODS

=over 4

=item validate()

Called during instantiation to validate $value

=item validate_format()

Can be called by inheriting classes to validate the format and country code
part of the BIC

Returns 1 on success

Can throw ValueObject::Finance::BIC::Exception::InvalidCountry
ValueObject::Finance::BIC::Exception::InvalidFormat

=back

=head1 SEE ALSO

L<Carp>,
L<ValueObject::Finance::BIC::Base>

=cut
