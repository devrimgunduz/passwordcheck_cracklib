passwordcheck_cracklib
======================

The `passwordcheck_cracklib` is like the regular PostgreSQL passwordcheck 
extension, except it is built with cracklib. Unlike the original 
module, this one has more strict password checks. The 
`passwordcheck_cracklib` module checks users' passwords whenever they are 
set with `CREATE ROLE` or `ALTER ROLE`. If a password is considered too 
weak, it will be rejected and the command will terminate with an error. 


Installing with DNF / Zypper
------------------------------

If you are already using PostgreSQL RPM repository, you can install it 
via

```
dnf install passswordcheck_cracklib_17 (for PostgreSQL 17)
dnf install passswordcheck_cracklib_16 (for PostgreSQL 16)
dnf install passswordcheck_cracklib_15 (for PostgreSQL 15)
dnf install passswordcheck_cracklib_14 (for PostgreSQL 14)
dnf install passswordcheck_cracklib_13 (for PostgreSQL 13)

```
Please replace dnf with `zypper` on SLES 15.


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

`pg_config` is usually under `/usr/pgsql-17/bin/pg_config` on 
RHEL/Rocky/AlmaLinux/Fedora. Replace 17 with your major PostgreSQL version.

Using the module
----------------

To enable this module, add '$libdir/`passwordcheck_cracklib`' to 
shared_preload_libraries in postgresql.conf, then restart the server.

More information
----------------

For more details, please read the manual of the original module:

https://www.postgresql.org/docs/current/static/passwordcheck.html
