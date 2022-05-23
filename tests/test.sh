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

for fixture in ./expected/single-cluster/*; do
    case=${fixture#./expected/}
    pushd ../$case
    for env in dev test prod; do
        mkdir -p ../../tests/output/${case}
        eval $FLEET_PATH test > ../../tests/output/${case}/${env}-output.yaml
        eval $FLEET_PATH apply -o - test > ../../tests/output/${case}/bundle.yaml
    done
    popd
done

for fixture in ./expected/multi-cluster/*; do
    case=${fixture#./expected/}
    pushd ../$case
    for env in dev test prod; do
        mkdir -p ../../tests/output/${case}
        eval $FLEET_PATH test -l env=${env} > ../../tests/output/${case}/${env}-output.yaml
        eval $FLEET_PATH apply -n fleet-default -o - test > ../../tests/output/${case}/bundle.yaml
    done
    popd
done

diff -iwqr output expected

echo All is OK
rm -rf output
