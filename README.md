Taken from [Scrip to delete repos by Josh-ops](https://josh-ops.com/posts/github-script-to-delete-repos/) but slightly edited for non-org users
1. check if u have git cli installed by running `gh` in command terminal
      - if not install gh cli here [git cli](https://cli.github.com/)
      - then authorize gh cli by running `gh auth login` in command terminal
2. check if delete_repo is installed by running `gh auth status --show-token` in command terminal and see if 'delete_repo' is in the 'Token Scope'
      - if not run `gh auth refresh -h github.com -s delete_repo` in command terminal to install it
3. run 'generate-repositories-list' script by running `./generate-repositories-list.sh dylinstoen` in command terminal where dylinstoen is your username
4. edit the generated csv file removing any repos u dont want deleted
5. run 'generate-repositories-list' script by running `./delete-repositories-from-list.sh dylinstoen-repos.csv ` in command terminal where dylinstoen is your username
