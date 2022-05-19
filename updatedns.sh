#!/bin/sh
set -u
     
authorizationHeader="Authorization: sso-key $GODADDY_KEY:$GODADDY_SECRET"

apiResult=$(wget -O - -q --header="$authorizationHeader" "https://api.godaddy.com/v1/domains/$GODADDY_DNS_DOMAIN/records/$GODADDY_DNS_HOSTNAME_TYPE/$GODADDY_DNS_HOSTNAME")
currentDnsIp=$(echo $apiResult | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
echo "DNS IP: $currentDnsIp"

apiResult=$(wget -O - -q "http://ipinfo.io/json")
currentRouterIp=$(echo $apiResult | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")

echo "Current Router IP: $currentRouterIp"

if [ "$currentDnsIp" != "$currentRouterIp" ]; then
    echo "Hostname needs to be updated."
    curl -X PUT "https://api.godaddy.com/v1/domains/$GODADDY_DNS_DOMAIN/records/$GODADDY_DNS_HOSTNAME_TYPE/$GODADDY_DNS_HOSTNAME" \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "$authorizationHeader" \
    -d "[ { \"data\": \"$currentRouterIp\", \"port\": 1, \"priority\": 0, \"protocol\": \"string\", \"service\": \"string\", \"ttl\": $GODADDY_DNS_TTL, \"weight\": 1 } ]"  
else
    echo "No changes needed."
fi