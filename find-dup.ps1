
#=====================================================================
# 
# Script:      find-dup.ps1
#
# Author:      Brett van Gennip
#
# Description: AD CLEANUP - Finds duplicate suffixes in AD.  Facilitating a cleaner AD that is migrating from win7 to win10.  Splitting on the dash "-"
#				An example:  win7-<service tag> and win10-<Service tag>
#				
# Disclaimer:     Use at own risk.  Not responsible for any damages.
#
#======================================================================#

# Requires AD Powershell module to work - load in all computernames from AD Computers OU

$a=get-adcomputer -filter * -searchbase "<SUB IN YOUR DN in AD>" | select name

#split on the -
$xxx=$(foreach($aa in $a){$aa.name.split("-")[1]})
#foreach servicetag count occurances
$xxx| group-object | where { $_.count -ne 1 } | format-table -auto -prop name,count
