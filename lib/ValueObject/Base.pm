package ValueObject::Base;


use strict;
use warnings;
use Carp;
use overload
    fallback    => 1,
    '""'        => \&value;

sub new {
    my $class   = shift;
    my $value   = shift;

    my $vars    = {
        value   => $value
    };

    my $self = bless $vars, $class;
    $self->validate($value);
    return $self;
}

sub validate {
    my $self = shift;
    croak "Invalid validator for " . ref($self);
}

sub value {
    my $self = shift;
    return $self->{ value };
}

1;

=head1 NAME

ValueObject::Base - Base object for all value objects

=head1 SYNOPSIS

  use base qw/ ValueObject::Base /;

  sub validate {
    my $self    = shift;
    my $value   = shift || '';
    
    # if $value validates
    # 	return 1
    # else
    # 	Throw exception on failer
  }

=head1 DESCRIPTION

ValueObject::Base is a base class from which all ValueObjects extend.
Only the validate() sub routine needs defining when writing a custom ValueObject

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<Carp>

=cut
