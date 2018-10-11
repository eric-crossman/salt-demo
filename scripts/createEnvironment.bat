REM # The following environment variables should be set prior to running this
REM #   script.
REM
REM     AZURE_REGION
REM     AZURE_RESOURCE_GROUP_NAME
REM     AZURE_COMMON_TAGS

REM - ** IMPORTANT ** - Note that the above AZURE_COMMON_TAGS must NOT be
REM     quoted in order for the CLI call to be properly parsed.

REM * Step 1 - Create a Resource Group to contain our VM objects
az group create --location %AZURE_REGION% --name %AZURE_RESOURCE_GROUP_NAME% --tags %AZURE_COMMON_TAGS%
