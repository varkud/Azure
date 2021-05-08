## Some history
A requirement to implement synchronization of source/dev repo to customers repos. Only one Folder was needed to be precise.<br>

## Notes
You need some understanding about DevOps and Azure DevOps...<br>
This is Lab so everything is in main.

## Steps 

### Prep Azure DevOps

#### DevOps Organization
I think it is obvious but please do experiments not on production...<br>
SO just create or use your own personal organization

#### DevOps Projects
Create Source project (in my case named as Docs)<br>
Create Mid project, for code and storing backup (Named as Code)<br>
Create Target project (Named as Customer)<br>

#### Project - Source
Create repo named 'KeeperGit', name does not matter just so you know my code and names..<br>
Create Folder\file named 'SyncedFolder\SyncedFolder.md'<br>
Put some symbols...

#### Project - Mid
Create repo named 'codesync'<br>
Create Folder/file for pipeline code keep - 'pipecode'<br>
Create Folder/file for cache/sync/files keep - 'temp'<br>

#### Project - Target
Create repo named 'KeeperShow'


### AP
