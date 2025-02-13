*** Settings ***
Library    DatabaseLibrary


*** Variables ***
${dbname}    rpakurssi
${dbuser}    robotuser
${dbpass}    password
${dbhost}    localhost
${dbport}    3306


*** Keywords ***
Make Connection
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpass}    ${dbhost}    ${dbport}


*** Tasks ***
Select Data From db
    Make Connection
    ${InvoiceStatusList}=    Query     select * from invoicestatus;

    FOR    ${element}    IN    @{InvoiceStatusList}
        Log    ${element}
        Log    ${element}[0]
        Log    ${element}[1]
    END
    Disconnect From Database

*** Tasks ***
Insert Data To db
    Make Connection

    ${insertStmt}=    Set Variable    insert into invoicestatus (id, name) values (100, 'testi');

    Log    ${insertStmt}

    Execute Sql String    ${insertStmt}

    Disconnect From Database



