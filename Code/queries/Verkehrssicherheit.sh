#!/bin/bash
twarc2 search --start-time 2011-06-15 --end-time 2021-06-15 --archive '(Verkehrssicherheit OR Verkehrsunfall OR Verkehrsunfälle OR Verkehrsopfer OR Straßenverkehrssicherheit OR Fahrzeugsicherheit) -is:retweet' > /media/s/Linux_storage/Analyse_Verkehrswende_Transformation/Data/Verkehrssicherheit.jsonl
