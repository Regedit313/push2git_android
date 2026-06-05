# GitHub + Termux - Simple Storage Guide

## One Time Setup

Bash

termux-setup-storage

pkg update -y

pkg install git -y

git config --global user.name "USERNAME"

git config --global user.email "GITHUB_EMAIL_ADDRESS"


## Private GitHub Email

Do not use your personal email.

Use your GitHub private email:

GitHub → Settings → Emails

Enable:

- Keep my email addresses private

Use the email shown by GitHub.


## GitHub Token

GitHub password does not work with Git.

Create a token here:

GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)

Enable:

- repo

When Git asks for password, paste the token.


## Download a Repository to the Phone

Bash

cd ~/storage/shared

git clone https://github.com/USERNAME/REPO_NAME.git

*Note:

You can choose the destination folder name.

Bash

git clone https://github.com/USERNAME/REPO_NAME.git FOLDER_NAME


## Upload / Replace a Repository

Use this when your local folder is the final version and must replace GitHub.

Bash

cd ~/storage/shared/FOLDER_NAME

git init

git config --global --add safe.directory '*'

git add -A

git commit -m "Update"

git branch -M main

git remote remove origin 2>/dev/null

git remote add origin https://github.com/USERNAME/REPO_NAME.git

git push --force origin main


## Useful Checks

### Show current folder:

Bash

pwd

### Show GitHub repository target:

Bash

git remote -v

### Show changed files:

Bash

git status


## Notes

This guide uses GitHub as a simple way to publish, update, and share projects and software files.

The local folder is considered the final version.

Uploading with:

Bash

git push --force origin main

replaces the GitHub repository with the current local folder.
