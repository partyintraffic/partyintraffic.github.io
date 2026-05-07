#!/bin/bash
# Usage: ./new-post.sh "my post title"
# Creates a new draft post with the right filename format.

if [ -z "$1" ]; then
  echo "Usage: ./new-post.sh \"post title\""
  exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)
# slugify: lowercase, replace spaces with hyphens, strip non-alphanumeric
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g')
FILENAME="content/posts/${DATE}-${SLUG}.md"

hugo new "posts/${DATE}-${SLUG}.md"

echo ""
echo "Created: $FILENAME"
echo "Open it, write, set draft: false when ready, then: git add . && git commit -m \"post: $TITLE\" && git push"
