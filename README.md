# 🐧 debian-version-check

PowerShell script to remotely download Debian versions from multiple hosts via SSH and export the results to a CSV file.

## 📌 Description

Manually checking system versions on dozens of machines is a waste of time.  
This simple script automates the whole process - it remotely connects to a list of hosts and downloads the contents of the `/etc/debian_version` file.

## ⚙️ Requirements

- PowerShell 5.1 or later (also works in PowerShell 7)
- Access to remote hosts from Debian via SSH (e.g. keys or password)
- List of hosts in `debian_hosts.txt` file.


## 🚀 Startup

1 Type the hosts in the `debian_hosts.txt` file (one IP address or hostname per line):

`192.168.1.10`

`192.168.1.11`

`debian-server.local`

2 Run the script:

`.\debian-version-check.ps1`

When the script finishes, the data will be saved in `debian_versions.csv`.

