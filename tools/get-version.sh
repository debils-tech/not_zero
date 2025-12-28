#!/bin/bash

(grep "version: " | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+") < apps/not_zero_app/pubspec.yaml
