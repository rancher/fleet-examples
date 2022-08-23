#!/usr/bin/env bash
set -e

export COMMIT=fake

cd "$(dirname "$0")"

rm -rf output

fleet -v

for fixture in ./expected/single-cluster/*; do
    case=${fixture#./expected/}
    pushd "../$case"
    for env in dev test prod; do
        mkdir -p ../../tests/output/"${case}"
        fleet test > "../../tests/output/${case}/${env}-output.yaml"
        fleet apply -o - test > "../../tests/output/${case}/bundle.yaml"
    done
    popd
done

for fixture in ./expected/multi-cluster/*; do
    case=${fixture#./expected/}
    pushd "../$case"
    for env in dev test prod; do
        mkdir -p ../../tests/output/"${case}"
        fleet test -l env="${env}" > "../../tests/output/${case}/${env}-output.yaml"
        fleet apply -n fleet-default -o - test > "../../tests/output/${case}/bundle.yaml"
    done
    popd
done

diff -iwqr output expected

echo All is OK
rm -rf output
