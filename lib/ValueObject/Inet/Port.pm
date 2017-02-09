package ValueObject::Inet::Port;

use strict;
use warnings;
use Carp;
use ValueObject::Inet::Port::Exception::Invalid;
use base qw/ ValueObject::Base /;

my $min_port = 0;
my $max_port = 65535;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Inet::Port::Exception::Invalid->new($value))
        unless (
            $value =~ /^\d+$/ &&
            $value >= $min_port &&
            $value <= $max_port
        );
    return 1;
}

1;

=head1 NAME

ValueObject::Inet::Port - Value object to represent an IP port

=head1 SYNOPSIS

  use ValueObject::Inet::Port;

  my $vo = ValueObject::Inet::Port->new(80);

=head1 DESCRIPTION

ValueObject::Inet::Port provides Value Object for validation a port number

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Inet::Port::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
