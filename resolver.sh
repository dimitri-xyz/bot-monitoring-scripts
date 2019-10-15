# resolver.sh lock_indetifier
# Signal resolution to pager duty upon fixing
# check for fixed incident
if [ -e "`ls | grep \"^fixed-remove-me-dir-$1-.\"`" ]
then
    #signal resolution and remove file
    curl -X POST -sS --header 'Content-Type: application/json' -d"{ \"service_key\": \"$PAGER_DUTY_KEY\", \"event_type\": \"resolve\", \"incident_key\":\"`ls | grep \"^fixed-remove-me-dir-$1-.\" | sed 's/^.\{6\}//' `\", \"description\": \"Fixed incident: `ls | grep \"^fixed-remove-me-dir-$1-.\"`\"}" https://events.pagerduty.com/generic/2010-04-15/create_event.json
    echo "Incident `ls | grep \"^fixed-remove-me-dir-$1-.\"` resolved"
    if rmdir "`ls | grep \"^fixed-remove-me-dir-$1-.\"`";
    then
        echo "fixed lock file removed"
    fi
else
    echo "No incident to resolve."
fi


