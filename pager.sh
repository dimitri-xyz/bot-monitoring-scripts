# pager.sh exit_code lock_identifier

echo "Running pager: $0 $1 $2"

if [ "$1" -eq 55 ]; then
    echo "Normal exit. No notification. Received exit code: $1"
else
    echo "Abnormal shutdown. Sending notification. Received exit code: $1"
    curl -X POST -sS --header 'Content-Type: application/json' -d"{
        \"service_key\": \"$PAGER_DUTY_KEY\",
        \"event_type\": \"trigger\", \"incident_key\":\"`ls | grep \"^remove-me-dir-$2-.\"`\",
        \"description\": \"Process running on lock `ls | grep \"^remove-me-dir-$2-.\"` has terminated.\"
        }" https://events.pagerduty.com/generic/2010-04-15/create_event.json

fi
