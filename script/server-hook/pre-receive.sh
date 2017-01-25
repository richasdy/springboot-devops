#!/bin/bash -e
#
# This hook is invoked by 'git-receive-pack' on the remote repository,
# which happens when a 'git push' is done on a local repository.
# Just before starting to update refs on the remote repository, the
# pre-receive hook is invoked.  Its exit status determines the success
# or failure of the update.
#
# This hook executes once for the receive operation. It takes no
# arguments, but for each ref to be updated it receives on standard
# input a line of the format:
#
#   <old-value> SP <new-value> SP <ref-name> LF
#
# where `<old-value>` is the old object name stored in the ref,
# `<new-value>` is the new object name to be stored in the ref and
# `<ref-name>` is the full name of the ref.
# When creating a new ref, `<old-value>` is 40 `0`.
#
# If the hook exits with non-zero status, none of the refs will be
# updated. If the hook exits with zero, updating of individual refs can
# still be prevented by the <<update,'update'>> hook.
#
# Both standard output and standard error output are forwarded to
# 'git send-pack' on the other end, so you can simply `echo` messages
# for the user.
#
# The number of push options given on the command line of
# `git push --push-option=...` can be read from the environment
# variable `GIT_PUSH_OPTION_COUNT`, and the options themselves are
# found in `GIT_PUSH_OPTION_0`, `GIT_PUSH_OPTION_1`,...
# If it is negotiated to not use the push options phase, the
# environment variables will not be set. If the client selects
# to use push options, but doesn't transmit any, the count variable
# will be set to zero, `GIT_PUSH_OPTION_COUNT=0`.