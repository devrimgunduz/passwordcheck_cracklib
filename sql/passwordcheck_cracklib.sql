SET md5_password_warnings = off;
LOAD 'passwordcheck_cracklib';

CREATE USER regress_passwordcheck_user1;

-- ok
ALTER USER regress_passwordcheck_user1 PASSWORD 'Xk9#mQ2$vL7!pR4z';

-- error: too short (the minimum length is 8)
ALTER USER regress_passwordcheck_user1 PASSWORD 'tooshrt';

-- error: contains user name
ALTER USER regress_passwordcheck_user1 PASSWORD 'xyzregress_passwordcheck_user1';

-- error: contains only letters
ALTER USER regress_passwordcheck_user1 PASSWORD 'alessnicelongpassword';

-- error: easily cracked (cracklib rejects it; the reason only goes to the log)
ALTER USER regress_passwordcheck_user1 PASSWORD 'password123';

-- encrypted ok (password is "secret")
ALTER USER regress_passwordcheck_user1 PASSWORD 'md592350e12ac34e52dd598f90893bb3ae7';

-- error: password is user name
ALTER USER regress_passwordcheck_user1 PASSWORD 'md507a112732ed9f2087fa90b192d44e358';

DROP USER regress_passwordcheck_user1;
