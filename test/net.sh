#!/bin/bash

host="8.8.8.8"


test_connection() {
    if ping -c 3 -W 2 $host > /dev/null 2>&1; then
        echo ""
        echo "INFO: The Internet is working stably!"
        echo ""
        
    else
        echo ""
        echo "ERROR: Internet problems, check your connection.."
        echo ""
        exit
    fi
}

test_connection

