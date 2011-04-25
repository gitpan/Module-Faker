
use strict;
use warnings;

BEGIN { require 5.10.0; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'build fake dists for testing CPAN tools',
  'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.96'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Module-Faker',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Module::Faker',
  'PREREQ_PM' => {
    'Archive::Any::Create' => '0',
    'CPAN::DistnameInfo' => '0',
    'Carp' => '0',
    'File::Next' => '0',
    'File::Path' => '0',
    'File::Temp' => '0',
    'Moose' => '0.33',
    'Moose::Role' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'Parse::CPAN::Meta' => '1.4401',
    'Path::Class' => '0',
    'Text::Template' => '0'
  },
  'VERSION' => '0.009',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



