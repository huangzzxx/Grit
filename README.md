**Grit** is a helper library for the **git** version control system

The helper modules are called **pebbles** and can be executed this way

	$ grit <pebble> <pebble-args>
	
For instance the command
	
	$ grit revnum
	
would output the svn-like revision number for the provided commit.
If no commit hash is provided (as above), Revnum assumes HEAD.

# Pebbles
* **revnum**: prints an svn-like revision number for the given commit hash
* **purge**: purges a file from the repository's history