#!/usr/bin/expect

set domain [lindex $argv 0]
set password [lindex $argv 1]
set timeout -1

spawn asadmin create-domain --savelogin $domain

expect -exact "Enter admin user name \[Enter to accept default \"admin\" / no password\]>"
send -- "admin\r"

expect -exact "\r\nEnter the admin password \[Enter to accept default of no password\]> "
send "$password\r"

expect -exact "\r\nEnter the admin password again>"
send "$password\r"

expect eof
exit
