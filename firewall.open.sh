#!/bin/bash

HOST="labs.iacono.io"
COMMENT="fromHome"

log() {
  logger -t firewall-open.sh "$1"
}

# Get current IP for host
CURRENT_IP=$(dig +short A "$HOST" 2>/dev/null)

if [ -z "$CURRENT_IP" ]; then
  log "ERROR cannot resolve $HOST"
  exit 1
fi

# Get the current rule
existing_rule() {
  ufw status numbered | grep "fromHome"
}

EXISTING_IP=$(existing_rule | awk '{print $6}')
EXISTING_RULE_N=$(existing_rule | awk -F'[][]' '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2); print $2}')

# Check if the rule already exists and if the IP is updated
if [ -n "$EXISTING_IP" ] && [ "$EXISTING_IP" == "$CURRENT_IP" ]; then
  log "INFO rule already exists from $HOST ($CURRENT_IP)."
else
  # Delete rule if present and not updated
  if [ -n "$EXISTING_IP" ]; then
    log "INFO Removing rule from host $HOST ($EXISTING_IP)"
    ufw --force delete $EXISTING_RULE_N
  fi

  # Add new rule
  log "INFO Adding rule from host $HOST ($CURRENT_IP)"
  ufw allow from "$CURRENT_IP"/32 comment "$COMMENT"
fi

exit 0