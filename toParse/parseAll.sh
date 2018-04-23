#! /bin/bash


pathToDateFormater='/mnt/c/Users/lcabrera/Documents/LEPSE/PHIS/CSVtoTurtle/DateParser.py'
pathToCSVparser='/mnt/c/Users/lcabrera/Documents/LEPSE/PHIS/CSVtoTurtle/CSVparser.py'
pathToCsv='/mnt/c/Users/lcabrera/Documents/LEPSE/PHIS/CSVtoTurtle/toParse/csv'
pathToCsvParsed='/mnt/c/Users/lcabrera/Documents/LEPSE/PHIS/CSVtoTurtle/toParse/csv/parsed'
pathToTurtle='/mnt/c/Users/lcabrera/Documents/LEPSE/PHIS/CSVtoTurtle/toParse/turtle'
pathToConfig='/mnt/c/Users/lcabrera/Documents/LEPSE/PHIS/CSVtoTurtle/toParse/json'


# parse date

for file in $(ls $pathToCsv)
do
    if [[ $file != *parsed* ]]
    then
    fullPathFile=$pathToCsv/$file
    basename=$(basename $file .csv)
    $pathToDateFormater $fullPathFile
    fi
done


# parse csv to turtle

for file in $(ls $pathToCsvParsed)
do
    if [[ $file == *parsed* ]]
    then
    fullPathFile=$pathToCsvParsed/$file
    basename=$(basename $file .csv)
    echo "COMPUTING $pathToCSVparser -i $fullPathFile -o $pathToTurtle/$basename.ttl $pathToConfig/config_$basename.json"
    $pathToCSVparser -i $fullPathFile -o $pathToTurtle/$basename.ttl $pathToConfig/config_$basename.json
    fi
done
