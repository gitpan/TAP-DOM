
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "TAP::DOM - TAP as Document Object Model.",
  "AUTHOR" => "Steffen Schwigon <ss5\@renormalist.net>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "TAP-DOM",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "TAP::DOM",
  "PREREQ_PM" => {
    "Class::XSAccessor" => "1.05",
    "Data::Dumper" => 0,
    "Exporter" => 0,
    "TAP::Parser" => 0,
    "TAP::Parser::Aggregator" => 0,
    "Test::Harness" => "3.0",
    "YAML::Syck" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.88"
  },
  "VERSION" => "0.11",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



