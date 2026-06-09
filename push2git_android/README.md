# push2git_android

## Installation

1. Install Termux.

2. Copy the "push2git_android" folder to the root of internal storage.

3. Open Termux and run:

termux-setup-storage

(When prompted, allow Termux to access all files on your device storage.)

4. Start push2git:

bash ~/storage/shared/push2git_android/push2git.sh

(The script can be launched from any location in Termux.)

5. IMPORTANT:

Before first use, select:

9 = First-time Setup (before first use)

This step installs Git and prepares the environment.

The setup must be completed before using the application.

---

## Menu

When started, push2git.sh provides the following options:

1 = Set Username/Email (before first upload)

2 = Download from Repo

3 = Upload / Replace Repo

9 = First-time Setup (before first use)

0 = Exit

---

## First-time Setup

Select:

9 = First-time Setup

This will:

- Configure Termux storage access
- Update package lists
- Upgrade installed packages
- Install Git
- Configure Git safe.directory support

This step only needs to be performed once per device.

It can safely be run again later if needed.

---

## Private GitHub Email

GitHub allows you to hide your personal email address when creating commits.

To enable this feature:

GitHub

→ Settings

→ Emails

Enable:

Keep my email addresses private

GitHub will provide a private email address similar to:

USERNAME@users.noreply.github.com

or:

12345678+USERNAME@users.noreply.github.com

You can use this address when selecting:

1 = Set Username/Email

This allows commits to be linked to your GitHub account while keeping your personal email address private.

---

## GitHub Personal Access Token

GitHub passwords cannot be used with Git operations such as:

git push

A GitHub Personal Access Token is required.

To create one:

GitHub

→ Settings

→ Developer settings

→ Personal access tokens

→ Tokens (classic)

→ Generate new token

Enable:

- repo

Generate the token and save it somewhere safe.

When GitHub asks for:

Username:

Enter your GitHub username.

When GitHub asks for:

Password:

Paste your GitHub Personal Access Token instead of your GitHub password.

---

## Set Username/Email

Select:

1 = Set Username/Email (before first upload)

Enter:

USERNAME

GITHUB_EMAIL_ADDRESS

Example:

USERNAME: MyUsername

GITHUB_EMAIL_ADDRESS: USERNAME@users.noreply.github.com

These values are stored in Git and will be used when creating commits.

This step only needs to be performed before your first upload and can be changed at any time.

---

## Download from Repo

Select:

2 = Download from Repo

Enter:

REPO_USERNAME

REPO_NAME

Example:

REPO_USERNAME: octocat

REPO_NAME: Hello-World

You will then be asked:

1 = Use repository name as folder

2 = Choose folder name

### Option 1

Downloads the repository using its original repository name.

Example:

Hello-World/

### Option 2

Allows you to choose your own destination folder name.

Example:

MyProject/

Repositories are downloaded directly into internal storage and are immediately accessible from Android file managers and Termux.

---

## Upload / Replace Repo

Select:

3 = Upload / Replace Repo

Enter:

REPO_USERNAME

REPO_NAME

FOLDER_NAME

Example:

REPO_USERNAME: MyUsername

REPO_NAME: MyProject

FOLDER_NAME: MyProject

The selected folder will be:

- Initialized as a Git repository
- Committed automatically
- Connected to the specified GitHub repository
- Uploaded using a force push

Current behavior:

git add -A

git commit -m "Update"

git push --force origin main

This replaces the contents of the remote repository with the contents of the selected local folder.

Use this option carefully because files that exist only on the remote repository may be overwritten.

---

## Folder Location

push2git works directly with folders located in:

~/storage/shared/

Examples:

~/storage/shared/MyProject

~/storage/shared/MyProject2

~/storage/shared/AnotherProject

This allows repositories to be managed directly from Android internal storage.

---

## Notes

The required folders and configuration are automatically created during setup.

This project is designed to simplify GitHub repository management from Android through Termux.

It provides a simple menu-driven interface for:

- Configuring Git
- Downloading repositories
- Uploading repositories
- Replacing repository contents

No Git commands need to be entered manually during normal use.

Basic familiarity with GitHub repositories is recommended.

A GitHub Personal Access Token is required for repository uploads.

---

## Credits

Uses:

- Git
- GitHub
- Termux

This repository provides a simple Android/Termux workflow for downloading, uploading, and managing GitHub repositories directly from an Android device.
