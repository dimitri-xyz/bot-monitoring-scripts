# bot-monitoring-scripts
Start long running processes and send Page Duty notifications if/when they terminate with errors. Only one process is started per lock-file.

The script `once.sh` starts the chain. It has been used as:
once.sh lock-name finally.sh pager.sh clear-fixed.sh $EXECUTABLE $ARG1 $ARG2 ...

These scripts will try to obtain the corresponding (time-stamped) lock directory. If the lock is clear (i.e. non-existent), the executable will start, otherwise we assume that either there is a process already running or that there was an issue that still needs to be resolved. In either case, we abort and do not start any processes.

If the executable quits with an exit code different from 55 standing from "5uccessful 5hutdown", then the scripts will send a Pager Duty notification of the failure. Sorry, I could not guarantee the reliability of error code zero here and decided to use 55 for a safe default.

If A corresponding `FIXED-lock-name` prefixed directory exists upon lock acquisition, the scripts will clear any corresponding notifications already sent by pager duty. This means that once any errors have been cleared all that is needed to re-enable the mechanism is to rename the lock-name directory to FIXED-lock-name and the corresponding notification will be resolved (but only once the new executable starts).
