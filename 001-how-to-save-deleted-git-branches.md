Title: How to save deleted git branches
Date: 2012-01-25 15:25
Tags: git
Category: tech
Slug: how-to-save-deleted-git-branches
Author: Ivan Tolstosheyev
Summary: You can delete branch, do not see it, but have access to commits it contains.


Reply-to: http://stackoverflow.com/questions/8988240/what-to-do-with-experimental-non-merged-git-branches

Usually I create a lot of branches working with git repository. 
Some of those branches are merged into master branch, some of them don't.
At some point of lifetime of repo you can see picture of having hundreds of abandoned branches, and only couple of active.
You don't want to remove this branches, cause you alse loose all commits they are pointing at.
You can easily fix this, without loosing any data. I solve this problem for myself with the following way:

* I created branch named `haven` (You can call it whatever you like, IMHO `abandoned-end` is a good choise)
This branch can be done anywhere.
* I merged all branches I want to delete to haven branch with git strategy ours.

You don't have any annoying branches. And you don't loose your data.

Simple code snippet of script that I have now at `haven` branch:

```
#!/usr/bin/env bash

BRANCH=${1}

git checkout "${BRANCH}" && \
git checkout haven && \
git merge --no-ff -s ours "${BRANCH}" && \
git push origin HEAD && \
git push origin :${BRANCH} && \
git branch -d ${BRANCH} && \
echo "Moved ${BRANCH} to haven"
```
