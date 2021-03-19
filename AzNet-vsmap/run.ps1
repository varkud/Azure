######################################################################################################################################
##
## Script purpose is to create map of vnets in one tenant. Author Dalius Varkulevicius. https://github.com/varkud
##
## v0.1 - get vnets, get vnet peerings, create map, using gojs demo library, type: basic/auto
## in dev: 
## v0.1.1 - restructure internal tree
## v0.2 - Subnets as function to add -skipSubnets switch
## v0.3 - Mark vNet as having FWs and GWs
## v0.4 - UDRs???
## v0.5 - VPNs???
## v0.6 - ER???
##
######################################################################################################################################

Param
    (
    [Parameter(Mandatory=$true)]  [String]$tenant        #tenant ID is required
    )

#clear content of map
Write-Output "" > netmap1.5.html
Write-Output "" > netmap2.5.html
$tid = ""

#get subscriptions
$subscriptions = Get-AzSubscription -tenant $tenant | Where-Object { $_.state -ne 'Disabled' }

#parse through vnets
foreach ($sub in $subscriptions) {
    $subscription = Select-AzSubscription -subscriptionid $sub.id -tenant $tenant
    $vnets = Get-AzVirtualNetwork
    foreach ($net in $vnets) {
        #enumerate nodes -> vnet/subnets     # making like: # { key: "Alpha", group: "AlphaG", name: "lightblue", Address : "0.0.0.0/0\n1.1.1.1/1", Subnets : "Default 10.0.0.0/8,\nDefault 10.0.0.0/8", info: "SubsID(_4): 0000,\nRG: somerg"}, { key: "AlphaG", isGroup: true },
        $wrapper = "{ key: $([char]34)$($net.ResourceGuid)$([char]34), isGroup: true }," #just making bigger gaps between nodes
        $node = "{ key: $([char]34)$($net.id)$([char]34), group: $([char]34)$($net.ResourceGuid)$([char]34), name: $([char]34)$($net.name)$([char]34), Address : $([char]34)$("$($net.AddressSpace.AddressPrefixes)".replace(" ","\n"))$([char]34), Subnets : $([char]34)$($("$($net.subnets | foreach-object { "$($_.name) $($_.AddressPrefix)  " })").trim().replace("   ","\n"))$([char]34), info: $([char]34)$($sub.name)\n$($net.resourcegroupname)$([char]34)}, "
        Write-Output "$wrapper $node" >> netmap1.5.html
        #enumerate links -> peerings    # making like: # { from: "Alpha", to: "Beta" },
        foreach ($peer in $net.VirtualNetworkPeerings) {
            $link = "{ from: $([char]34)$($net.id)$([char]34), to: $([char]34)$($peer.RemoteVirtualNetwork.id)$([char]34) },"
            Write-Output "$link" >> netmap2.5.html
        }

    }

}
#tenant ID left(4)
$tid =  "$($tenant.Substring(32))"
#create map file
Get-Content netmap1.html | Set-Content "netmap-$tid.html" -Encoding Ascii
Get-Content netmap1.5.html | Add-Content "netmap-$tid.html" -Encoding Ascii
Get-Content netmap2.html | Add-Content "netmap-$tid.html" -Encoding Ascii
Get-Content netmap2.5.html | Add-Content "netmap-$tid.html" -Encoding Ascii
Get-Content netmap3.html | Add-Content "netmap-$tid.html" -Encoding Ascii

Write-Output "map created please run: .\netmap-$tid.html"
