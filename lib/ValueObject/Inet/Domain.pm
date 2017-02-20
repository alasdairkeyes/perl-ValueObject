package ValueObject::Inet::Domain;

use strict;
use warnings;
use Carp;
use ValueObject::Inet::Domain::Exception::Invalid;
use base qw/ ValueObject::Base /;
use Data::Validate::Domain qw/ is_domain /;


sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Inet::Domain::Exception::Invalid->new($value))
        unless (is_domain($value));
    return 1;
}

1;

=head1 NAME

ValueObject::Inet::Domain - Value object to represent a domain name

=head1 SYNOPSIS

  use ValueObject::Inet::Domain;

  my $vo = ValueObject::Inet::Domain->new('google.com');

=head1 DESCRIPTION

ValueObject::Inet::Domain provides Value Object for validation of a domain
name

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Inet::Domain::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
