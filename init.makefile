init:		# install Nix, software, init variables and aliases
	@ make nix.install nix.install.deps init.devbox init.vars init.func

init.devbox:	# install devbox and set global env variables
	@ bash scripts/init-devbox.sh

init.vars:	# init variables
	@ bash scripts/init-vars.sh