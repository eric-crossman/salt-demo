REM # The following environment variables should be set prior to running this
REM #   script.
REM
REM     AZURE_REGION
REM     AZURE_RESOURCE_GROUP_NAME
REM     AZURE_COMMON_TAGS
REM     AZURE_NSG_NAME
REM     AZURE_NSG_SOURCE_PREFIX
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

REM Step 3 - Create a network security group to limit protocol access
call az network nsg create --name %AZURE_NSG_NAME% --resource-group %AZURE_RESOURCE_GROUP_NAME% --location %AZURE_REGION%

REM Step 4 - Add NSG rule for incoming SSH access
call az network nsg rule create -g %AZURE_RESOURCE_GROUP_NAME% --nsg-name %AZURE_NSG_NAME% -n AllowSsh --priority 101 --source-address-prefixes %AZURE_NSG_SOURCE_PREFIX% --destination-port-ranges 22 --access Allow --protocol tcp --description "Allow SSH from UF network."

REM Step 4 - Create VM for Salt Master
call az vm create -n SaltMaster -g %AZURE_RESOURCE_GROUP_NAME% --image centos --vnet-name %AZURE_VNET_NAME% --subnet %AZURE_VNET_SUBNET_NAME% --nsg %AZURE_NSG_NAME% --public-ip-address SaltMasterPublicIp --ssh-key-value %AZURE_SSH_KEY_FILE%

REM Step 5 - Create VM for Minion/MediaWiki
call az vm create -n MediaWiki -g %AZURE_RESOURCE_GROUP_NAME% --image centos --vnet-name %AZURE_VNET_NAME% --subnet %AZURE_VNET_SUBNET_NAME% --nsg %AZURE_NSG_NAME% --public-ip-address MediaWikiPublicIp --ssh-key-value %AZURE_SSH_KEY_FILE%
