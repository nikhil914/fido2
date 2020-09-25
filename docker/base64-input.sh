#!/bin/bash
###############################################################
# /**
# * Copyright StrongAuth, Inc. All Rights Reserved.
# *
# * Use of this source code is governed by the GNU Lesser General Public License v2.1
# * The license can be found at https://github.com/StrongKey/fido2/blob/master/LICENSE
# */
###############################################################

DB_URL='fido-docker.cluster-c9iyctxcjygt.us-west-1.rds.amazonaws.com'
DB_USER='admin'
DB_PASS='Abcd1234!'
MARIA_SKFSDBUSER_PASSWORD='AbracaDabra'

LDAP_URLPORT='ldap://3.236.203.121:389'
LDAP_TYPE='AD'
LDAP_BINDDN='Administrator@strongkey.com'
LDAP_PASS='dne(!nPCiVJ'
LDAP_DNPREFIX='cn='
LDAP_DNSUFFIX=',ou=users,ou=v2,ou=SKCE,ou=StrongAuth,ou=Applications,dc=strongkey,dc=com'
LDAP_BASEDN='dc=strongkey,dc=com'
LDAP_GROUPSUFFIX=',ou=groups,ou=v2,ou=SKCE,ou=StrongAuth,ou=Applications,dc=strongkey,dc=com'

# Steps to clustering:
# 1. Add *container* hostname entries to servers table in db, taking note of which serverid belongs to which hostname
# 2. Set $CLUSTER to true
# 3. Change $HOSTS and $SERVERID variables appropriately
CLUSTER=false
HOSTS='54.183.213.1 fido01.strongkey.com%18.144.34.248 fido02.strongkey.com'	# /etc/hosts file entries delimited by '%'
SERVERID=1	# Same as serverid in db for this container

if [ $CLUSTER = true ]
then
	echo $(echo "$DB_URL;$DB_USER;$DB_PASS;$MARIA_SKFSDBUSER_PASSWORD;$LDAP_URLPORT;$LDAP_TYPE;$LDAP_BINDDN;$LDAP_PASS;$LDAP_DNPREFIX;$LDAP_DNSUFFIX;$LDAP_BASEDN;$LDAP_GROUPSUFFIX;$HOSTS;$SERVERID"| base64 --wrap=0)
else
	echo $(echo "$DB_URL;$DB_USER;$DB_PASS;$MARIA_SKFSDBUSER_PASSWORD;$LDAP_URLPORT;$LDAP_TYPE;$LDAP_BINDDN;$LDAP_PASS;$LDAP_DNPREFIX;$LDAP_DNSUFFIX;$LDAP_BASEDN;$LDAP_GROUPSUFFIX"| base64 --wrap=0)
fi
