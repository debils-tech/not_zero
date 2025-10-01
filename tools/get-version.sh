#!/bin/bash

cat apps/not_zero_app/pubspec.yaml | grep "version: " | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+"
