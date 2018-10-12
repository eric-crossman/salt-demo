REM *** Utility script to stop all virtual machines for Salt Demo
REM *** NOTE: The following environment variables should be set
REM       AZURE_RESOURCE_GROUP_NAME

REM *** Stop VM 1 - SaltMaster
call az vm stop --resource-group %AZURE_RESOURCE_GROUP_NAME% --name SaltMaster

REM *** Stop VM 2 - MediaWiki
call az vm stop --resource-group %AZURE_RESOURCE_GROUP_NAME% --name MediaWiki
