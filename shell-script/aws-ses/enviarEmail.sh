#!/bin/bash
echo teste | mail -v -s "testando o smtp" -u $1 $1

