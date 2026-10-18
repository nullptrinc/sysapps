#!/bin/sh
# SPDX-License-Identifier: MIT
# Packs every app under apps/ into OUTDIR/<id>.apf, signed with KEY.
# usage: tools/build-apf.sh KEY OUTDIR [COSMIC]
# Platform signatures come on top, from the key on its card:
#   apf-sign-gpg --key <subkey> OUTDIR/<id>.apf
set -e
key=$1 out=$2 cosmic=${3:-cosmic}
[ -n "$key" ] && [ -n "$out" ] || { echo "usage: $0 KEY OUTDIR [COSMIC]" >&2; exit 2; }
root=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$out"
for app in "$root"/apps/*/; do
	id=$(sed -n 's/^ *"id": *"\([^"]*\)".*/\1/p' "$app/manifest.json")
	rm -f "$out/$id.apf"
	"$cosmic" pack "$app" "$out/$id.apf" -k "$key"
	echo "$out/$id.apf"
done
