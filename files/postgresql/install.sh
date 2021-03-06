#!/usr/bin/env bash
if [ $(id -u) -ne 0 ]; then echo "Warning: need root privileges."; exit 1; fi

if [ ! -d /etc/zabbix/scripts ]; then
  mkdir -p /etc/zabbix/scripts
  cp -v ./scripts/pgsql.*.sh /etc/zabbix/scripts/
fi

if [ ! -d /etc/zabbix/zabbix_agentd.d ]; then
  mkdir -p /etc/zabbix/zabbix_agentd.d
  cp -v ./postgresql.conf /etc/zabbix/zabbix_agentd.d/
fi

chown zabbix: /etc/zabbix/scripts/pgsql.*.sh
chown zabbix: /etc/zabbix/zabbix_agentd.d/postgresql.conf
chmod 755 /etc/zabbix/scripts/pgsql.*.sh
chmod 644 /etc/zabbix/zabbix_agentd.d/postgresql.conf

echo "INFO: set ~zabbix/.pgpass auth parameters."
