# Dell-iDRAC
Script to change settings on multiple Dell iDRACs at one once

drac.sh - configures any setting of iDRAC
ip.txt -  list of IPs to configure

- download drac.sh and ip.txt on your local PC
- update <user>, <password> and <command> (example: racadm -u root -p calvin -r $line set idrac.NTPConfigGroup.NTPEnable Enabled)
- update ip.txt with list of IPs 
- run drac.sh
- check log.txt for the results
