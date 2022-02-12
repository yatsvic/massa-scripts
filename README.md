# massa-scripts
To help with Massa test node

* Place `ensure-rolls.sh` near the binary `massa-client`
* Add to cron
  `crontab -e`
  Add line to check and buy rolls every 15 minutes:
  `*/15 * * * * /path/to/ensure-rolls.sh`
* To controll see `ensure-rolls.log`

