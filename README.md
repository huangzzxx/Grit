# Usage
**Grit** is a helper library for the **git** version control system.

The helper modules are called **pebbles** and can be executed this way

	$ grit <pebble> <pebble-args>
	
For instance the command
	
	$ grit revnum HEAD^^
	
would output the svn-like revision number for the provided commit.
If no commit hash is provided, revnum assumes HEAD.

To make using **Grit** more efficient, use the *symlink* pebble to create a symlink to your *grit.rb*.

	$ ruby grit.rb symlink

This command will put a symlink named *grit* in */usr/local/bin*. You can change that by providing a custom path like so

	$ ruby grit.rb symlink /my/custom/path
	
To remove the symlink again type the following (if you used a custom path put it before 'remove')

	$ ruby grit.rb symlink remove
	
If you need help executing a pebble type the pebble name followed by *?* or *help*.

	$ grit <pebble-name> help
	
# Pebbles
* **revnum**: prints an svn-like revision number for the given commit hash
* **purge**: purges a file from the repository's history
* **symlink**: symlinks grit to specified directory (default: /usr/local/bin)

# Extend
To extend **Grit** simply write a custom pebble and put it in the *pebbles* directory.