#repo 

##repo init -u http://...*.manifest 

##repo sync 
<=> git remote update & git rebase origin/branch
git rebase(local commit, https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

##repo start => git checkout -b 
all branchs checkout -b new-feature

##repo status
<=> git diff-index || git diff-files
A:add M:modify D:delete R:rename C:copy U:union

##repo checkout branchename

##repo branches (./git/refs) 

##repo diff

##repo stage -i <=> git add -interactive (can select what you want to add)

##repo upload => git push (代码审核)

##repo download => git fetch refs/changes/changedid/patchset (download changes)

##repo rebase => git rebase

##repo prune => git branch -d (delete merged)

##repo abandon => git branch -D (direct delete,not check if merged)

##repo grep => git grep

##repo manifest

##repo selfupdate





