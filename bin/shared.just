# list
@list:
	just --justfile {{justfile()}} --list # --unsorted

# what justfile's running?
@which:
	echo "{{justfile()}}"

# absolute pathname to this project's root folder
@root:
	echo "{{parent_directory(parent_directory(justfile_directory()))}}"

# absolute pathname to this project's bin folder
@bin:
	echo "{{justfile_directory()}}"

# forward a recipe to a subcommand e.g. 'pj start'
@_forward suffix *args:
        just --justfile "{{justfile()}}-{{suffix}}" {{args}}

        

justdoc := "https://just.systems/man/en/"
justdoc:
	xdg-open "{{justdoc}}"

