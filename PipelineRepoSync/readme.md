## Some history
A requirement to implement synchronization of source/dev repo to customers repos. Only one Folder was needed to be precise.

## Steps 

## Prep Azure DevOps

#### DevOps Organization
I think it is obvious but please do experiments not on production...
SO just create or use your own personal organization

#### DevOps Projects
Create Source project (in my case named as Docs)
Create Mid project, for code and storing backup (Named as Code)
Create Target project (Named as Customer)

#### Project - Source
Create repo named 'KeeperGit', name does not matter just so you know my code and names..
Create Folder\file named 'SyncedFolder\SyncedFolder.md'
Put some symbols...

#### Project - Mid
Create repo named 'code'
Create Folder/file for pipeline code keep - 'pipecode'
Create Folder/file for cache/sync/files keep - 'temp'

#### Project - Target
Create repo named 'KeeperShow'


## AP
