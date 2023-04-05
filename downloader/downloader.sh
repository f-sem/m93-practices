#!/bin/bash

read -p "Enter your url for download: " url
echo $url >> log.txt
wget -p $url