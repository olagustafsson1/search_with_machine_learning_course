#!/bin/sh
stop_logstash () {
    PIDTEMP=`ps ux | grep logstash | grep java | awk '{ print $2 }'`
    if [ "x$PIDTEMP" = "x" ]; then
        echo "Logstash not found"
    else
         echo "Killing logstash processes ..."
         kill -9 $PIDTEMP
    fi

    echo "Removing logstash data files ..."
    rm /workspace/logstash/logstash-7.13.2/products_data/plugins/inputs/file/.sincedb_*

}


stop_logstash