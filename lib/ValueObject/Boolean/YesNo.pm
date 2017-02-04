package ValueObject::Boolean::YesNo;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::InvalidYesNo;
use base qw/ ValueObject::Boolean::Base /;

my @yes = (
    'y',
    'yes'
);

my @no = (
    'n',
    'no',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Boolean::Exception::InvalidYesNo->new($value))
        unless (grep { lc($_) eq lc($value) } @yes, @no);
    return 1;
}

sub boolean {
    my $self = shift;
    return (grep { $_ eq lc($self->value) } @yes)
        ? 1
        : 0;
}

1;

=head1 NAME

ValueObject::Boolean::YesNo - Boolean Value Object for yes/no values

=head1 SYNOPSIS

  use ValueObject::Boolean::YesNo;

  my $vo = ValueObject::Boolean::YesNo->new('yes');

=head1 DESCRIPTION

ValueObject::Boolean::YesNo provides Value Object for validation of boolean
values 'yes' and 'no' (Case insensitive)

Accepts values 'y', 'yes', 'n', 'no' lowercase and uppercase.

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Boolean::Exception::InvalidYesNo if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=item boolean()

Returns a boolean 0 or 1 for no/yes

=back

=head1 SEE ALSO

L<ValueObject::Boolean>

=cut
