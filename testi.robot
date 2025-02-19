*** Settings ***
Library    CSVLibrary

*** Variables ***
${CSV FILE}    ./invoice-data.csv

    
*** Test Cases ***
Read CSV Data
    ${data}=    Read Csv File To Associative    ${CSV FILE}
    Log    ${data}