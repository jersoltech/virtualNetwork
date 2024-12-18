
#Creating a resource group and a virtual network in Azure using PowerShell

#Create a resource group named abcofcloud-rg in the eastus region
$rg = @{ 

    Name = 'abcofcloud-rg' 

    Location = 'eastus' 

} 

New-AzResourceGroup @rg 

  
#create a virtual network named vnet-abcofcloud in the abcofcloud-rg resource group
$vnet = @{ 

    Name = 'vnet-abcofcloud' 

    ResourceGroupName = 'abcofcloud-rg' 

    Location = 'eastus' 

    AddressPrefix = '10.0.0.0/16' 

} 

$virtualNetwork = New-AzVirtualNetwork @vnet 

#adding a subnet to the virtual network

$subnet = @{ 

    Name = 'abcofcloud-Subnet' 

    VirtualNetwork = $virtualNetwork 

    AddressPrefix = '10.0.1.0/24' 

} 

$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet 

  
$virtualNetwork | Set-AzVirtualNetwork 