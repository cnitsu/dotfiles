#!/bin/sh

# Set the proxy env

is_proxy_on() {
	if [[ -n "$http_proxy" || -n "$https_proxy" || -n "$all_proxy" ]]; then
		return 0
	else
		return 1
	fi
}

case "$1" in
	on)
		export http_proxy=http://127.0.0.1:1081
		export https_proxy=http://127.0.0.1:1081
		export all_proxy=socks5://127.0.0.1:1080
		echo "Proxy enabled!"
		;;
	off)
		unset http_proxy https_proxy all_proxy
		echo "Proxy disabled!";
		;;
	state|status)
		if is_proxy_on; then
			echo "Proxy is currently ON!"
		else
			echo "Proxy is currently OFF!"
		fi
		;;
	*)
		echo "Usage: source proxy.sh [on|off|state]"
		;;
esac
