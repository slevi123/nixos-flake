{ pkgs, ... } : {
	services.cron = {
		enable = true;
		systemCronJobs = [
			"*/5 * * * * root /nixos-config/scripts/dns-update.sh"
			"00 00 13 */3 * root certbot certonly --webroot -w /root/certbot/www -d leswell.crabdance.com --email simofilevente@gmail.com --agree-tos --force-renewal"
		];
	};
}
