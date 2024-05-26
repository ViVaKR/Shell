#! /opt/homebrew/bin/awk -f

BEGIN { print "- Start -"}
{ print $1, "\t", $5}
END { print "- DONE -"}
