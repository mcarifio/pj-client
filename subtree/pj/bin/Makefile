# makefile, the pathname of this makefile e.g. 'Makefile'
makefile := $(lastword $(MAKEFILE_LIST))
# here, the directory of $(makefile)
here := $(shell dirname $(realpath $(makefile)))
# PROOT, the top of this project. This makefile assumes it's 3 directories up.
# Use -e PROOT=some/path to override this.
PROOT := $(shell realpath $(here)/../../..)
# Commands to check for. Unfortunately bootstrapping requires some of these.
# The `check` target will check for these.
cmds := node npm tsc webstorm bun deno gjs just awk gpp	realpath ln curl

# Adds very generic targets `targets`, `variables` and `check`
include $(makefile).mk
.PSEUDO: bootstrap generate lift clean

bootstrap: generate lift
	echo $@ complete.

# Lift (copy) pertinent config files from here to project root
lifted := $(PROOT)/.envrc $(PROOT)/.gitignore
lift: $(lifted)
$(PROOT)/.envrc: $(here)/.envrc
	cp -v $< $@
$(PROOT)/.gitignore: $(here)/.gitignore
	cp -v $< $@


# Some configuration is generated.
generate: $(here)/.gitignore
$(here)/.gitignore: 
	curl --silent --no-progress-bar --show-error --location -o $@ https://www.toptal.com/developers/gitignore/api/bash,git,linux,node,deno,bun,javascript,ecmascript,typescript
	echo .envrc >> $@

clean: $(lifted)
	xz --force $<
	@echo "make -f $(makefile) bootstrap ## next" >&2





