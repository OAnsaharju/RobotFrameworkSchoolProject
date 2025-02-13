*** Settings ***
Library    validate.py
Library    String

*** Keywords ***
Check Amount From Invoice
    [Arguments]    ${totalSumFromHeaders}    ${totalSumFromRows}
    ${status}=    Set Variable    ${False}

    ${totalSumFromHeaders}=    Convert To Number    ${totalSumFromHeaders}
    ${totalSumFromRows}=    Convert To Number    ${totalSumFromRows}
    ${diff}=    Convert to Number    0.01

    ${status}=    Is Equal    ${totalSumFromHeaders}    ${totalSumFromRows}    ${diff}
    
    RETURN    ${status}

*** Keywords ***
Check IBAN
    [Arguments]    ${iban}

    ${lenght}=     Get Length    ${iban}

    ${iban}=    Remove String    ${iban}    ${SPACE}

    IF    $lenght == 18
        ${status}=    Set Variable    ${True}
    END

    ${status}=    Set Variable    ${False}

    RETURN    ${status}

*** Tasks ***
testi 
    ${sumStatus}=    Check Amount From Invoice    33.01    33

    IF    ${sumStatus}
        Log    ${sumStatus}
    ELSE
        Log    Summat eivät ole samat
    END

    ${ibanValue}=    Set Variable    FI12 3456 7890 1234 56

    ${ibanCheck}=    Check IBAN    ${ibanValue}

    IF    ${ibanCheck}
        Log    IBAN ok
    ELSE
        Log    IBAN pituus on virheellinen
    END


    