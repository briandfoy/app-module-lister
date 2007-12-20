# $Id: Makefile.PL,v 1.4 2004/07/04 17:04:17 comdog Exp $
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'	       => 'App::Module::Lister',
	'ABSTRACT'     => 'List all of the installed modules with just Perl5.004 code',
	'VERSION_FROM' => 'lib/Lister.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'Test::More' => '0',
		},

	'PM'           => {
		'lib/Lister.pm'         => '$(INST_LIBDIR)/Lister.pm',
		},

	'MAN3PODS'     => {
		'lib/Lister.pm' => '$(INST_MAN3DIR)/App::Module::Lister.3',
		},

	clean  => { FILES    => q|App-Module-Lister-* *.old *.bak| },

	);
