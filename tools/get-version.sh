#!/bin/bash

cat pubspec.yaml | grep "version: " | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+"
