REM # The following environment variables should be set prior to running this
REM #   script.
REM
REM     AZURE_REGION
REM     AZURE_RESOURCE_GROUP_NAME
REM     AZURE_COMMON_TAGS
REM     AZURE_VNET_NAME
REM     AZURE_VNET_PREFIX
REM     AZURE_VNET_SUBNET_NAME
REM     AZURE_VNET_SUBNET_PREFIX

REM - ** IMPORTANT ** - Note that the above AZURE_COMMON_TAGS must NOT be
REM     quoted in order for the CLI call to be properly parsed.

REM Step 1 - Create a Resource Group to contain our VM objects
call az group create --location %AZURE_REGION% --name %AZURE_RESOURCE_GROUP_NAME% --tags %AZURE_COMMON_TAGS%

REM Step 2 - Create a virtual network with a specific subnet range
call az network vnet create -g %AZURE_RESOURCE_GROUP_NAME% -n %AZURE_VNET_NAME% --address-prefix %AZURE_VNET_PREFIX% --subnet-name %AZURE_VNET_SUBNET_NAME% --subnet-prefix %AZURE_VNET_SUBNET_PREFIX%
