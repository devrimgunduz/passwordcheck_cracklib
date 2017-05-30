passwordcheck_cracklib
======================

The `passwordcheck_cracklib` is like the regular PostgreSQL passwordcheck 
extension, except it is built with cracklib. Unlike the original 
module, this one has more strict password checks. The 
`passwordcheck_cracklib` module checks users' passwords whenever they are 
set with `CREATE ROLE` or `ALTER ROLE`. If a password is considered too 
weak, it will be rejected and the command will terminate with an error. 


Installing with YUM
-------------------

If you are already using PostgreSQL YUM repository, you can install it 
via

```
yum install passswordcheck_cracklib10 (for PostgreSQL 10)
yum install passswordcheck_cracklib96 (for PostgreSQL 9.6)
yum install passswordcheck_cracklib95 (for PostgreSQL 9.5)
yum install passswordcheck_cracklib94 (for PostgreSQL 9.4)
```
Please replace yum with dnf on Fedora.


Installing by compiling source code
-----------------------------------

To build it, just do this:

```
USE_PGXS=1 make
USE_PGXS=1 make install
```

If you encounter an error such as:

```
make: pg_config: Command not found
```

Be sure that you have pg_config installed and in your path. If you used 
a package management system such as RPM to install PostgreSQL, be sure 
that the -devel package is also installed. If necessary tell the build 
process where to find it. Edit Makefile, and change PG_CONFIG variable:

```
PG_CONFIG=/path/to/pg_config
```

followed by the

```
USE_PGXS=1 make
USE_PGXS=1 make install
```

Using the module
----------------

To enable this module, add '$libdir/`passwordcheck_cracklib`' to 
shared_preload_libraries in postgresql.conf, then restart the server.

More information
----------------

For more details, please read the manual of the original module:

https://www.postgresql.org/docs/devel/static/passwordcheck.html
