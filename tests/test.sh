#!/bin/bash
set -e

export COMMIT=fake

cd $(dirname $0)

rm -rf output

for i in ../single-cluster/*; do
    if [ ! -d $i ]; then
        continue
    fi
    pushd $i
    for j in dev test prod; do
        mkdir -p ../../tests/output/garbage/${i}
        fleet test > ../../tests/output/garbage/${i}/${j}-output.yaml
        fleet apply -o - test > ../../tests/output/garbage/${i}/bundle.yaml
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
        fleet test -l env=${j} > ../../tests/output/garbage/${i}/${j}-output.yaml
        fleet apply -o - test > ../../tests/output/garbage/${i}/bundle.yaml
    done
    popd
done

diff -iwqr output expected

echo All is OK
rm -rf output
