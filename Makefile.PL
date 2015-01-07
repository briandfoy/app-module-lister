require 5.008;
use strict;
use warnings;


my $github    = 'https://github.com/briandfoy/';
my $main_file = 'lib/';

my %WriteMakefile = (
	'NAME'	        => 'App::Module::Lister',
	'ABSTRACT_FROM' => 'lib/App/Module/Lister.pm',
	'VERSION_FROM'  => 'lib/App/Module/Lister.pm',
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'Test::More' => '0.95',
		},

	'META_MERGE' => {
        'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => 'git@github.com:briandfoy/app-module-lister.git',
				web  => 'https://github.com/briandfoy/app-module-lister',
				},
			},
		},

	clean  => { FILES    => q|App-Module-Lister-* *.old *.bak| },

	);

sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version" || die "Could not load $MM_version: $@";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
