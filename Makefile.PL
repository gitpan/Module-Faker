
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.020.
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker ;



my %WriteMakefileArgs = (
  "ABSTRACT" => "build fake dists for testing CPAN tools",
  "AUTHOR" => "Ricardo Signes <rjbs\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Module-Faker",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Module::Faker",
  "PREREQ_PM" => {
    "Archive::Any::Create" => 0,
    "CPAN::DistnameInfo" => 0,
    "CPAN::Meta" => "2.130880",
    "CPAN::Meta::Requirements" => 0,
    "Carp" => 0,
    "Encode" => 0,
    "File::Next" => 0,
    "File::Path" => 0,
    "File::Temp" => 0,
    "Moose" => "0.33",
    "Moose::Role" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "Parse::CPAN::Meta" => "1.4401",
    "Path::Class" => "0.06",
    "Text::Template" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Cwd" => 0,
    "Path::Class" => "0.06",
    "Test::More" => "0.96"
  },
  "VERSION" => "0.017",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Archive::Any::Create" => 0,
  "CPAN::DistnameInfo" => 0,
  "CPAN::Meta" => "2.130880",
  "CPAN::Meta::Requirements" => 0,
  "Carp" => 0,
  "Cwd" => 0,
  "Encode" => 0,
  "File::Next" => 0,
  "File::Path" => 0,
  "File::Temp" => 0,
  "Moose" => "0.33",
  "Moose::Role" => 0,
  "Moose::Util::TypeConstraints" => 0,
  "Parse::CPAN::Meta" => "1.4401",
  "Path::Class" => "0.06",
  "Test::More" => "0.96",
  "Text::Template" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



