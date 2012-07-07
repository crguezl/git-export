package Git::Export;

use 5.012003;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Git::Export ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.

our @EXPORT = qw(
	git_export
);

our $VERSION = '0.01';


# Preloaded methods go here.

use File::Basename;
use File::Path qw{remove_tree};

sub git_export {
  my $url = shift or die "Usage:\n  $0 repository\n";
  my $basename = basename($url, '.git');
  die "Directory $basename already exists. Remove it first" if -d  $basename;
  my $out = `git clone --depth 1 $url 2>&1`;
  die "Errors while cloning $url: $!" if $?;
  die "Can't create directory $basename" unless -d  $basename;
  chdir($basename) or die "Can't change to dir $basename";
  remove_tree('.git') or die "Can't remove .git directory";
}

1;
