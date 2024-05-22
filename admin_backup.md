Source: https://www.w3resource.com/mysql/mysql-backup-and-restore.php

Ο χρήστης root έχει τα δικαιώματα να κάνει logical backup με τον τρόπο που αναφέρεται στην παραπάνω πηγή με τις εξής εντολές:

1) Backup: ```mysqldump -u root -p mydb > mydb_backup.sql```
2) Restore: ```mysql -u root -p mydb < mydb_backup.sql``` 
