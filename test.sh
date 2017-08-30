#!/bin/bash

docker run        \
 -it              \
 -v $(pwd):/thenv \
 dock0/arch       \
 bash -c "/thenv/thenv && /thenv/thenv"

docker run        \
 -it              \
 -v $(pwd):/thenv \
 ubuntu:16.10     \
 bash -c "apt update && /thenv/thenv && /thenv/thenv"

docker run        \
 -it              \
 -v $(pwd):/thenv \
 debian:stretch   \
 bash -c "apt update && /thenv/thenv && /thenv/thenv"

docker run        \
 -it              \
 -v $(pwd):/thenv \
 centos:latest    \
 bash -c "yum install -y epel-release && /thenv/thenv && /thenv/thenv"

