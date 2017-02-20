package ValueObject::Inet::Hostname;

use strict;
use warnings;
use Carp;
use ValueObject::Inet::Hostname::Exception::Invalid;
use base qw/ ValueObject::Base /;
use Data::Validate::Domain qw/ is_hostname /;


sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Inet::Hostname::Exception::Invalid->new($value))
        unless (is_hostname($value, { domain_allow_underscore => 1 }));
    return 1;
}

1;

=head1 NAME

ValueObject::Inet::Hostname - Value object to represent a Hostname

=head1 SYNOPSIS

  use ValueObject::Inet::Hostname;

  my $vo = ValueObject::Inet::Hostname->new('something.google.com');

=head1 DESCRIPTION

ValueObject::Inet::Hostname provides Value Object for validation of a Hostname

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Inet::Hostname::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
