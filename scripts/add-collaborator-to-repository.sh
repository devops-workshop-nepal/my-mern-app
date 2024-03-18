#!/bin/bash

permissions=("pull" "triage" "push" "maintain" "admin")

# if [ $# -ne 4 ]
#   then
#     echo "usage: $(basename $0) <org> <repo> <login> <role>"
#     exit 1
# fi

org=${1-devops-workshop-nepal}
repo=${2-my-mern-app}
user=$3
role=${4-push}

# if [[ ! " ${permissions[*]} " =~  ${role}  ]]
#   then
#     echo "permission must be one of: ${permissions[*]}"
#     exit 1
# fi

# https://docs.github.com/en/rest/collaborators/collaborators?apiVersion=2022-11-28#add-a-repository-collaborator
while read user
do
gh api --method PUT "repos/$org/$repo/collaborators/$user" -f permission="push"
done< COLLABORATOR.txt