#!/bin/sh
while :; do :; done & kill -STOP $! && wait $!
