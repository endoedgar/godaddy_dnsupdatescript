# godaddy_dnsupdatescript
A Docker based solution for updating hostname IPs from godaddy.

Steps to use this docker script.

Requirements
- Docker
- Docker compose

Once you have the requirements, follow these steps:

1. You have to create a .env file in the same folder with the following structure:
```ini
GODADDY_DNS_DOMAIN=sampledomain.com
GODADDY_DNS_HOSTNAME=hostname
GODADDY_DNS_HOSTNAME_TYPE=A
GODADDY_DNS_TTL=3600
GODADDY_KEY=your_godaddy_key
GODADDY_SECRET=your_godaddy_secret
```
   * For more information on how to get your Godaddy key and secret go to this link: https://developer.godaddy.com/getstarted

2. After creating that file, just run the following command:

```sh
docker compose run script
```

Everything should work correctly out of the box.
