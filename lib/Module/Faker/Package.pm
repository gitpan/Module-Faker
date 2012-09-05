package Module::Faker::Package;
{
  $Module::Faker::Package::VERSION = '0.011';
}
use Moose;
# ABSTRACT: a faked package in a faked module

use Moose::Util::TypeConstraints;

has name     => (is => 'ro', isa => 'Str', required => 1);
has version  => (is => 'ro', isa => 'Maybe[Str]');
has abstract => (is => 'ro', isa => 'Maybe[Str]');

has in_file  => (
  is       => 'ro',
  isa      => 'Str',
  lazy     => 1,
  default  => sub {
    my ($self) = @_;
    my $name = $self->name;
    $name =~ s{::}{/}g;
    return "lib/$name";
  },
);

subtype 'Module::Faker::Type::Packages'
  => as 'ArrayRef[Module::Faker::Package]';

coerce 'Module::Faker::Type::Packages'
  => from 'HashRef'
  => via  {
    my ($href) = @_;
    my @packages;

    my @pkg_names = do {
      no warnings 'uninitialized';
      sort { $href->{$a}{X_Module_Faker}{order} <=> $href->{$b}{X_Module_Faker}{order} } keys %$href;
    };

    for my $name (@pkg_names) {
      push @packages, __PACKAGE__->new({
        name    => $name,
        version => $href->{$name}{version},
        in_file => $href->{$name}{file},
      });
    }
    return \@packages;
  };

no Moose;
1;

__END__
=pod

=head1 NAME

Module::Faker::Package - a faked package in a faked module

=head1 VERSION

version 0.011

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

