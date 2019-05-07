#!/bin/bash

PRIVATE_DIR=/etc/pki/tls/private
CERTS_DIR=/etc/pki/tls/certs

missing_count=0

cd $PRIVATE_DIR
while read pemfile; do
	alias=${pemfile%%.pem}
	if ! test -r $CERTS_DIR/$alias.cert ; then
		echo $alias.cert is missing
		missing_count=$((missing_count + 1))
	fi
done < <(find . -name \*.pem)

if test $missing_count -eq 0 ; then
	exit 0
else
	exit 1
fi
