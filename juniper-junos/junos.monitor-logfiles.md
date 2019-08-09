# JUNOS: MONITOR LOG FILES

When working with JUNOS Switches etc. you may want to monitor the logs over a period of time without loading them every few minutes and scrolling to the bottom?
Well these few commands show you how to do this.

In order to start the monitoring run the following command:  
`monitor start <log-file-name>`

Here is an example command:  
`monitor start messages`

Any changes to the log file will automatically be posted to your screen.

If you want to filter the logs to only show records with certain words then use the following command:  
`monitor start messages | match error`

In order to stop the logs:  
`monitor stop`


[source](https://spottedhyena.co.uk/junos-monitor-log-files/)