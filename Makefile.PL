use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my @exe_files = qw{bin/git-export};

WriteMakefile(
    NAME              => 'Git::Export',
    VERSION_FROM      => 'bin/git-export', # finds $VERSION
    PREREQ_PM         => { 'File::Path' => 0, 'File::Copy::Recursive' => 0, }, # e.g., Module::Name => 1.1
    'EXE_FILES'    => \@exe_files,
    ABSTRACT       => "git equivalent to 'svn export'",
    AUTHOR         => 'Casiano Rodriguez-Leon <casiano@ull.es>',
);

sub MY::postamble {
  return << "EOS"
myinstall:
	perl Makefile.PL; make; sudo make install
EOS
}
