package ValueObject::Inet::EmailAddress;

use strict;
use warnings;
use Carp;
use Email::Valid;
use ValueObject::Inet::EmailAddress::Exception::Invalid;
use base qw/ ValueObject::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    my $email_address = Email::Valid->address($value);
    croak (ValueObject::Inet::EmailAddress::Exception::Invalid->new($value))
        unless ($email_address);
    return 1;
}

1;

=head1 NAME

ValueObject::Inet::EmailAddress - Value object to represent an email address

=head1 SYNOPSIS

  use ValueObject::Inet::EmailAddress;

  my $vo = ValueObject::Inet::EmailAddress->new('email@example.com');

=head1 DESCRIPTION

ValueObject::Inet::EmailAddress provides Value Object for validation of an email
address. This uses Email::Valid to perform validation

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Inet::EmailAddress::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>, L<Email::Valid>

=cut
