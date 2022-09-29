#!/usr/bin/env bash


# list all of the folks offering SSH via mDNS on the network

dns-sd -B _ssh._tcp .