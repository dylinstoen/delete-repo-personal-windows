#!/usr/bin/env bash
#
# Generate a plain text (or CSV) list of all repos owned by a user.
# Usage: ./generate-user-repos.sh <github-username> > repos.csv

if [ -z "$1" ]; then
  echo "Usage: $0 <github-username>"
  exit 1
fi

login="$1"

gh api graphql --paginate \
  -F user="$login" \
  -f query='
    query($user: String!, $endCursor: String) {
      user(login: $user) {
        repositories(first: 100, after: $endCursor, ownerAffiliations: OWNER) {
          pageInfo {
            hasNextPage
            endCursor
          }
          nodes {
            owner { login }
            name
          }
        }
      }
    }' \
  --template '{{range .data.user.repositories.nodes}}{{printf "%s/%s\n" .owner.login .name}}{{end}}' \
  > "${login}-repos.csv"

echo "Saved to ${login}-repos.csv"
