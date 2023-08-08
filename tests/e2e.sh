#!/bin/bash

set -e

cleanup() {
        set +e
	kill "$server_pid"
	podman rmi "$image"
	rm -f index.html* /tmp/index.html
}

trap "cleanup ; exit 1" ERR INT QUIT

get_random_port() {
        read -r port_low port_high < /proc/sys/net/ipv4/ip_local_port_range
        echo $((port_low + RANDOM % (port_high - port_low)))
}

port="$(get_random_port)"
image="xget$port"

python3 -m http.server --bind 127.0.0.1 "$port" &
server_pid=$!

podman build -t "$image" .
podman run --rm --net=host "$image" -O - "http://127.0.0.1:$port" | grep -q html

cleanup
