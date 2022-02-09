# Create Resource Group 
az group create -l EastUS2 -n rg-postit-dev-eus2-001 

# Deploy template with in-line parameters 
az deployment group create -g rg-postit-dev-eus2-001  --template-file "C:\Projs\3M\AKS\bicep\main.bicep" --parameters \
	resourceName=aks-postit-dev-eus2 \
	upgradeChannel=stable \
	AksPaidSkuForSLA=true \
	agentCountMax=20 \
	custom_vnet=true \
	bastion=true \
	enable_aad=true \
	AksDisableLocalAccounts=true \
	enableAzureRBAC=true \
	adminprincipleid=$(az ad signed-in-user show --query objectId --out tsv) \
	registries_sku=Premium \
	acrPushRolePrincipalId=$(az ad signed-in-user show --query objectId --out tsv) \
	azureFirewalls=true \
	privateLinks=true \
	kvIPAllowlist="[\"49.205.209.144/32\"]" \
	omsagent=true \
	retentionInDays=30 \
	networkPolicy=azure \
	azurepolicy=deny \
	availabilityZones="[\"1\",\"2\",\"3\"]" \
	enablePrivateCluster=true \
	ingressApplicationGateway=true \
	appGWcount=0 \
	appGWsku=WAF_v2 \
	appGWmaxCount=10 \
	appgwKVIntegration=true \
	azureKeyvaultSecretsProvider=true \
	createKV=true \
	kvOfficerRolePrincipalId=$(az ad signed-in-user show --query objectId --out tsv)