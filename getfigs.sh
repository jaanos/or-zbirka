#!/bin/bash

for NALOGA in $(ls tex/0*.tex | sort | xargs cat | grep izpisiNalogo | sed -r "s/.*\{(.*)\}/\1/"); do
    for FIG in $(grep pgfslika naloge/${NALOGA}.tex | sed -r "s/.*\[(.*)\]/\1/"); do
        if [ "${FIG}" = "\pgfslika" ]; then
            FIG=${NALOGA};
        fi;
        echo "pgf/${FIG}.pdf"
    done
done
