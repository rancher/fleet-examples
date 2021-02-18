#!/usr/bin/env bash
set -e

export COMMIT=fake

cd $(dirname $0)

rm -rf output

FLEET_PATH=fleet
if ! [ $(command -v fleet) ]; then
    printf "Not found in PATH: fleet\n"
    read -p "Specify path to fleet binary (leave blank to exit): " TEMP_FLEET_PATH
    if ! [ $TEMP_FLEET_PATH ]; then
        exit 0
    fi
    FLEET_PATH=$(realpath $TEMP_FLEET_PATH)
    printf "Path to fleet binary: $FLEET_PATH\n"
fi

for i in ../single-cluster/*; do
    if [ ! -d $i ]; then
        continue
    fi
    pushd $i
    for j in dev test prod; do
        mkdir -p ../../tests/output/garbage/${i}
        eval $FLEET_PATH test > ../../tests/output/garbage/${i}/${j}-output.yaml
        eval $FLEET_PATH apply -o - test > ../../tests/output/garbage/${i}/bundle.yaml
    done
    popd
done

for i in ../multi-cluster/*; do
    if [ ! -d $i ]; then
        continue
    fi
    pushd $i
    for j in dev test prod; do
        mkdir -p ../../tests/output/garbage/${i}
        eval $FLEET_PATH test -l env=${j} > ../../tests/output/garbage/${i}/${j}-output.yaml
        eval $FLEET_PATH apply -n fleet-default -o - test > ../../tests/output/garbage/${i}/bundle.yaml
    done
    popd
done

diff -iwqr output expected

echo All is OK
rm -rf output
