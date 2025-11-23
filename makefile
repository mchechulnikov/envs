include init.makefile
include nix.makefile
include docker.makefile
include dev.go.makefile
include dev.haskell.makefile
include wg.makefile

.DEFAULT_GOAL = help

help:		# prints this help
	@ echo Available targets are:
	@ grep -h -E "^[^\#].+:\s+\#\s+.+$$" ./*.makefile ./makefile

myip:		# show external IP
	@ dig @resolver4.opendns.com myip.opendns.com +short

dev:		# run devbox shell
	devbox shell
