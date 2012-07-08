# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Git-Export.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 4;
BEGIN { use_ok('Git::Export') };

#########################

SKIP: {
     skip("Developer test", 3) unless ($ENV{DEVELOPER}  eq 'casiano');

     my $outputrep = `perl -w bin/git-export -r e2a5280 git\@github.com:crguezl/sinatra-up-and-running.git 3>&1`;
     ok(-d 'sinatra-up-and-running', 'directory with copy of rep created');
     system('rm -fR sinatra-up-and-running');

     my $outputdir = `perl -w bin/git-export -r e2a5280 git\@github.com:crguezl/sinatra-up-and-running.git/chapter1 2>&1`;
     ok(-d 'rockpaperscissors', 'directory chapter1 created');
     system('rm -fR rockpaperscissors');

     my $outputfile = `perl -w bin/git-export -v -r e2a5280 git\@github.com:crguezl/sinatra-up-and-running.git/chapter1/rockpaperscissors/Rakefile 2>&1`;
     ok(-f 'Rakefile', 'file Rakefile  created');
     system('rm -fR Rakefile');
}

