New-AzResourceGroupDeployment `
-Name 'VMDeploymentDC' `
-ResourceGroupName 'rg-uks-mgmt-dom' `
-TemplateFile 'MgmtResourceGroup\az.VirtualMachineDC.json' `
-TemplateParameterFile 'MgmtResourceGroup\az.VirtualMachineDC.parameters.json'