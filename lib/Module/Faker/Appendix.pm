package Module::Faker::Appendix;
{
  $Module::Faker::Appendix::VERSION = '0.014';
}
use Moose::Role;
# ABSTRACT: a thing that appends

has append => (
  is => 'ro',
  isa => 'ArrayRef',
  default => sub {[]},
);

around as_string => sub {
  my ($orig, $self) = (shift, shift);
  my $string = $self->$orig(@_);
  $string .= join("\n", @{$self->append});
};

1;

__END__

=pod

=head1 NAME

Module::Faker::Appendix - a thing that appends

=head1 VERSION

version 0.014

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
