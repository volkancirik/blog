#!/bin/bash

# Switch to main branch
git checkout main

# Make sure we have latest changes
git pull origin main

# Merge gh-pages into main
git merge gh-pages

# Check if merge was successful
if [ $? -eq 0 ]; then
    echo "Successfully merged gh-pages into main"
    
    # Delete local gh-pages branch
    git branch -d gh-pages
    
    # Delete remote gh-pages branch
    git push origin --delete gh-pages
    
    # Push changes to main
    git push origin main
    
    echo "Successfully deleted gh-pages branch locally and remotely"
else
    echo "Merge failed. Please resolve conflicts and try again"
    exit 1
fi
