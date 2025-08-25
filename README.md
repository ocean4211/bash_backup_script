This Bash script automates the process of backing up all files modified in the last 24 hours from a target directory into a compressed .tar.gz archive, and moves the archive to a destination directory.

Example usage:
```
./backup.sh /home/user/project /home/user/backups
```

This will:

Find all files in /home/user/project modified in the last 24 hours.

Create a tarball like backup-1766673894.tar.gz.

Move it to /home/user/backups.

To run this backup script once per day using cron, you'll need to add an entry to your crontab that schedules it at a specific time daily (e.g., 2:00 AM).

Open crontab:
```
crontab -e
```

Add this line at the bottom:
```
0 2 * * * /full/path/to/backup.sh /path/to/source /path/to/destination
```
Also should give the script execute permission.
Without it, cron will silently fail to run it.

Make the script executable:
```
chmod +x /path/to/file/backup.sh
```

