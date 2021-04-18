#!/bin/sh

function add_config_value() {
  local key=${1}
  local value=${2}
  # local config_file=${3:-/etc/postfix/main.cf}
  [ "${key}" == "" ] && echo "ERROR: No key set !!" && exit 1
  [ "${value}" == "" ] && echo "ERROR: No value set for ${key}!!" && exit 1

  echo "Setting configuration option ${key} with value: ${value}"
  postconf -e "${key} = ${value}"
}

add_config_value "virtual_alias_domains" ${ALIAS_DOMAINS}
add_config_value "virtual_alias_maps" "texthash:${ALIAS_FILE}"

#Start services

# If host mounting /var/spool/postfix, we need to delete old pid file before
# starting services
rm -f /var/spool/postfix/pid/master.pid

exec supervisord -c /etc/supervisord.conf
