use 5.012003;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my @exe_files = qw{bin/git-export};

WriteMakefile(
    NAME              => 'Git::Export',
    VERSION_FROM      => 'lib/Git/Export.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    'EXE_FILES'    => \@exe_files,
    ABSTRACT       => "git equivalent to 'svn export'",
    AUTHOR         => 'Casiano Rodriguez-Leon <casiano@ull.es>',
);
