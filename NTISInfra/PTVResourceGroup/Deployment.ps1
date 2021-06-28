
$paramObjectStorage = @{
  'storageAccountName' = 'sauksdevptvconfig'
  'storageAccountType'  = 'Standard_LRS'
  'storageAccountKind' = 'StorageV2'  
  'location' = 'uksouth'
}

$paramObjectVNet = @{
  'vnetName' = 'vnet-uks-dev-ptv'
  'subnetName'  = 'snet-uks-dev-ptv'
  'location' = 'uksouth'
  'networkSecurityGroupName' = 'vm-uks-dev-ptv-nsg'
  'networkSecurityGroupRules' = @()
}

$paramObjectVM = @{
  'networkInterfaceName' = 'vm-uks-dev-ptvas'
  'networkSecurityGroupName' = 'vm-uks-dev-ptvas-01-nsg'
  'networkSecurityGroupRules' = ''
  'subnetName'= 'snet-uks-dev-ptv'
  'virtualNetworkName'= 'vnet-uks-dev-ptv'
  'addressPrefixes'= '["172.20.20.0/23"]'
  'subnets'= '[{"name":"snet-uks-dev-ptv","properties":{"addressPrefix":"172.20.20.0/24"}}]'
  'publicIpAddressName'='vm-uks-dev-ptvas-01-ip'
  'publicIpAddressType' = 'Static'
  'publicIpAddressSku' = 'Standard'
  'virtualMachineName'= 'vm-uks-dev-ptvas-01'
  'virtualMachineComputerName' = 'vmuksdevptvas'
  'osDiskType'= 'Premium_LRS'
  'virtualMachineSize'= 'Standard_F8s_v2'
  'adminUsername' = 'ntis-admin'
  'adminPassword'= 'R1verside&!#'
  'instanceNumber' = "2"
}


  New-AzResourceGroupDeployment `
  -Name 'VMDeploymentAS' `
  -ResourceGroupName 'rg-uks-dev-ptv' `
  -TemplateFile 'PTVResourceGroup\az.VirtualMachineAS.json' `
  -TemplateParameterFile 'PTVResourceGroup\az.VirtualMachineAS.parameters.json' 
  

  New-AzResourceGroupDeployment `
  -Name 'VMDeploymentDB' `
  -ResourceGroupName 'rg-uks-dev-ptv' `
  -TemplateFile 'PTVResourceGroup\az.VirtualMachineDB.json' `
  -TemplateParameterFile 'PTVResourceGroup\az.VirtualMachineDB.parameters.json'
 
  New-AzResourceGroupDeployment `
  -Name 'VMDeploymentTRE' `
  -ResourceGroupName 'rg-uks-dev-ptv' `
  -TemplateFile 'PTVResourceGroup\az.VirtualMachineTRE.json' `
  -TemplateParameterFile 'PTVResourceGroup\az.VirtualMachineTRE.parameters.json'