#!/bin/bash -e
# 
# This hook is invoked by commands that rewrite commits (`git commit
# --amend`, 'git-rebase'; currently 'git-filter-branch' does 'not' call
# it!).  Its first argument denotes the command it was invoked by:
# currently one of `amend` or `rebase`.  Further command-dependent
# arguments may be passed in the future.
#
# The hook receives a list of the rewritten commits on stdin, in the
# format
#
#   <old-sha1> SP <new-sha1> [ SP <extra-info> ] LF
#
# The 'extra-info' is again command-dependent.  If it is empty, the
# preceding SP is also omitted.  Currently, no commands pass any
# 'extra-info'.
#
# The hook always runs after the automatic note copying (see
# "notes.rewrite.<command>" in linkgit:git-config[1]) has happened, and
# thus has access to these notes.
#
# The following command-specific comments apply:
#
# rebase::
# 	For the 'squash' and 'fixup' operation, all commits that were
# 	squashed are listed as being rewritten to the squashed commit.
# 	This means that there will be several lines sharing the same
# 	'new-sha1'.
# +
# The commits are guaranteed to be listed in the order that they were
# processed by rebase.