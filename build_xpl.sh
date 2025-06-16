#!/bin/bash

# CDDL HEADER START
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#
# CDDL HEADER END

# Copyright 2022 Saso Kiselkov. All rights reserved.


CMAKE_OPTS_COMMON="-DCMAKE_BUILD_TYPE=Release"



while getopts "fh" o; do
	case "${o}" in
	f)
		if [[ $(uname) = "Darwin" ]]; then
			full=1
		else 
			echo "option ignored, compiling from linux host"
		fi
		
		;;
	h)
		cat << EOF
Usage: $0 [-nh]
    -f : (macOS-only) Cross-compile to linux and window
         using the docker image provided by docker-compose.yml.
         See README-docker.md for more information.
    -h : show this help screen and exit.
EOF
		exit
		;;
	*)
		echo "Unknown option $o. Try $0 -h for help." >&2
		exit 1
		;;
	esac
done


set -e

./build_xpl_common.sh

if [ -n "$full" ]; then
	docker compose run --rm win-lin-build bash -c "cd BetterPusbackMod && ./build_xpl_common.sh"
fi

set +e
