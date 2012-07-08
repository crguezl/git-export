# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Git-Export.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Git::Export') };

#########################

SKIP: {
     skip("Developer test", 1) unless ($ENV{DEVELOPER}  eq 'casiano');

     my $output = `perl -w bin/git-export -r e2a5280 git\@github.com:crguezl/sinatra-up-and-running.git 2>&1`;
     ok(-d 'sinatra-up-and-running', 'directory created');
     system('rm -fR sinatra-up-and-running');
}

