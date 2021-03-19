## Description
Script purpose is to create map of vnets in one tenant. Author Dalius Varkulevicius. https://github.com/varkud

## Version history
v0.1 - get vnets, get vnet peerings, create map, using gojs demo library, type: basic/auto

## Requirements to run
- Powershell 5+
- Logged in to corect tenant

## List of files for execution
- 'run.ps1' script will execute scanning of provided tenant via command line like: ./run.ps1 -tenant 'xx-xx-xx-xx'
- Static files 'netmap1.html','netmap2.html','netmap3.html' ( files that will be ussed for creating final file, plit into 3 file for esier handling...)

## List of files for viewing
- 'go.js' (suplementary 3rd party software, no rights i hold please refer to vendor for newer version here: https://github.com/NorthwoodsSoftware/GoJS)
- 'netmap-xxxx.html' (file generated for viewing your network map, where xxxx is tenant last 4 letters)

## Output Example
