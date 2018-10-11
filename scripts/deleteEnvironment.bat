REM # The following environment variables should be set prior to running this
REM #   script.
REM
REM     AZURE_RESOURCE_GROUP_NAME

REM * Step 1 - Delete Resource Group and all contained resources
az group delete --name %AZURE_RESOURCE_GROUP_NAME% --yes
