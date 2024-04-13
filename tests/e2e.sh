#!/bin/bash

set -e

tmp_file=$(mktemp)
chmod 666 "$tmp_file"

cleanup() {
        set +e
	rm -f "$tmp_file"
	kill "$server_pid"
	podman rmi "$image"
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
podman run --rm --net=host -v "$tmp_file:$tmp_file:z" "$image" -O "$tmp_file" "http://127.0.0.1:$port"
grep html "$tmp_file"

cleanup
