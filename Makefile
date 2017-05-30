# contrib/passwordcheck_cracklib/Makefile

MODULE_big = passwordcheck_cracklib
OBJS = passwordcheck_cracklib.o $(WIN32RES)
PGFILEDESC = "passwordcheck_cracklib - strengthen user password checks"

# uncomment the following two lines to enable cracklib support
PG_CPPFLAGS = -DUSE_CRACKLIB '-DCRACKLIB_DICTPATH="/usr/lib/cracklib_dict"'
SHLIB_LINK = -lcrack

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/passwordcheck_cracklib
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
