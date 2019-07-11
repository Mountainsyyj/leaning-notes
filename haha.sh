#!/bin/bash
echo "*/1 * * * * sh /root/shell/crontab/start.sh" > /root/shell/crontab/test.now
crontab /root/shell/crontab/test.now
