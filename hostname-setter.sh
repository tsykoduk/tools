#!/usr/bin/env bash

#Use to set all of the hostnames on a mac to the same thing.

# Set your HOSTNAME to what you want your hostname to be
HOSTNAME="caliburn"


#let's look
scutil --get HostName 
scutil --get LocalHostName 
scutil --get ComputerName

#let's change
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo scutil --set ComputerName $HOSTNAME


#let's verify
scutil --get HostName 
scutil --get LocalHostName 
scutil --get ComputerName
