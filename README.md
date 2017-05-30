passwordcheck_cracklib

This is the regular PostgreSQL passwordcheck extension, built with cracklib. Unlike the original module, this one has more strict password checks. The passwordcheck_cracklib module checks users' passwords whenever they are set with CREATE ROLE or ALTER ROLE. If a password is considered too weak, it will be rejected and the command will terminate with an error. 


To build it, just do this:

make
make install

If you encounter an error such as:

make: pg_config: Command not found

Be sure that you have pg_config installed and in your path. If you used a package management system such as RPM to install PostgreSQL, be sure that the -devel package is also installed. If necessary tell the build process where to find it:

env PG_CONFIG=/path/to/pg_config make && make install

To enable this module, add '$libdir/passwordcheck_cracklib' to shared_preload_libraries in postgresql.conf, then restart the server.

For more details, please read the manual of the original module:

https://www.postgresql.org/docs/devel/static/passwordcheck.html
