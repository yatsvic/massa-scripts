#!/bin/bash

pushd `dirname ${0}` >/dev/null || exit 1
TIMESTAMP=$(date --iso-8601=seconds)
WALLET_INFO=$(./massa-client wallet_info)
WALLET_ADDRESS=$(echo "$WALLET_INFO" | grep "Address:"  | awk '{print $2}')
BALANCE=$(echo "$WALLET_INFO" | grep "Final balance:" | awk '{print $3}')
FILENAME=$(basename $0)
LOGFILE="${FILENAME%.*}.log"

if [ 1 -eq "$(echo "100.00 < $BALANCE" | bc)" ]
then
  echo "$TIMESTAMP ERR $WALLET_INFO" >> $LOGFILE	
  ./massa-client buy_rolls "$WALLET_ADDRESS" 1 0
else
  echo "$TIMESTAMP OK" >> $LOGFILE
fi

popd > /dev/null || exit 1

