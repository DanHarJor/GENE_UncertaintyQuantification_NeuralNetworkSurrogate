loading the module and logging in for access
module load lumio
lumio-conf

uploading/downloading
`rclone <subcommand> <options> source:path dest:path`

source for project you logged in with
lumi-o or lumi-pub
source for any project:
lumi-<project_number>-public
lumi-<project_number>-private

**Both sources can see all buckets. Buckets added to public will have more open permissions to those added to private. SO don't worry if you see your private buckets in the public source. If you added them to private they are still private**


