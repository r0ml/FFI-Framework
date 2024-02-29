#!/bin/zsh

if [[ $# -ne 1 ]];
    then echo "version number as a parameter is required"
    exit 2
fi

vers=$1

swift package compute-checksum libffi.xcframework.zip | xargs -I '{}' sed -I '' 's/\(checksum: "\).*\("\)/\1{}\2/' Package.swift
sed -I '' "s/releases\/download\/\(.*\)\//releases\/download\/$vers\//" Package.swift
