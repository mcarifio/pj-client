# recursive find of files by pattern
# call rwildcard $(root), $(pattern) # => list of pathnames
rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))


.PSEUDO: targets variables check

# list all targets in this Makefile
targets:
	@echo $(makefile) $@: >&2
	@make -f $(makefile) -qp | awk -F':' '/^[a-zA-Z0-9][^$$#\/\t=]*:([^=]|$$)/ {split($$1,A,/ /);for(i in A)print A[i]}' >&2

# list all variables from this Makefile
variables:
	@(( $(MAKELEVEL) < 1 )) && make -f $(makefile) -qp $@ | grep '^[a-zA-Z][a-zA-Z0-9_]* *:=' >&2

check:
	@for c in $(cmds); do type -p $$c &> /dev/null || echo "command $$c not on PATH" >&2; done
