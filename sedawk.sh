#!/bin/bash

#a. Create copy of passwd file to passwd_new. :exclamation: Do all modifications on passwd_new file
cp passwd passwd_new
#b. Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
awk 'BEGIN {FS = OFS = ":"} {if ($1 == "saned") $7 = "/bin/bash"} {print $0}' passwd |
#c. Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED
sed '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/g' |
#d. Save only 1-st 3-th 5-th 7-th columns of each string based on : delimiter
awk 'BEGIN {FS = OFS = ":"} {print $1,$3,$5,$7}' |
#e. Remove all lines from file containing word daemon
sed '/daemon/d' |
#f. Change shell for all users with even UID to /bin/zsh
awk 'BEGIN {FS = OFS = ":"} {if ($2 % 2 == 0) $4 = "/bin/zsh"} {print $0}' > passwd_new 
