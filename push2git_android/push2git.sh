#!/data/data/com.termux/files/usr/bin/bash

while true; do
clear

echo
echo "push2git_android"
echo
echo "1) Set Username/Email"
echo "2) Download from Repo"
echo "3) Upload / Replace Repo"
echo "9) First-time Setup"
echo "0) Exit"
echo

read -p "Select an option: " choice

case "$choice" in

    1)
        clear

        echo "Set Username/Email"
        echo

        read -p "Enter USERNAME: " username
        read -p "Enter GITHUB_EMAIL_ADDRESS: " email

        git config --global user.name "$username"
        git config --global user.email "$email"

        echo
        echo "Git username and email updated."
        echo
        read -p "Press Enter to continue..."
        ;;

    2)
        clear

        echo "Download from Repo"
        echo

        read -p "Enter REPO_USERNAME: " username
        read -p "Enter REPO_NAME: " repo

        echo
        echo "1) Use repository name as folder"
        echo "2) Choose folder name"
        echo

        read -p "Select an option: " folder_choice

        cd ~/storage/shared || continue

        if [ "$folder_choice" = "2" ]; then
            read -p "Enter FOLDER_NAME: " folder
            git clone "https://github.com/$username/$repo.git" "$folder"
        else
            git clone "https://github.com/$username/$repo.git"
        fi

        echo
        read -p "Press Enter to continue..."
        ;;

    3)
        clear

        echo "Upload / Replace Repo"
        echo

        read -p "Enter REPO_USERNAME: " username
        read -p "Enter REPO_NAME: " repo
        read -p "Enter FOLDER_NAME: " folder

        cd ~/storage/shared/"$folder" || {
            echo
            echo "Folder not found."
            echo
            read -p "Press Enter to continue..."
            continue
        }

        git init
        git config --global --add safe.directory '*'
        git add -A
        git commit -m "Update"
        git branch -M main
        git remote remove origin 2>/dev/null
        git remote add origin "https://github.com/$username/$repo.git"
        git push --force origin main

        echo
        read -p "Press Enter to continue..."
        ;;

    9)
        clear

        echo "First-time Setup"
        echo

        if [ ! -d ~/storage/shared ]; then
            termux-setup-storage
        else
            echo "Storage is already configured."
        fi
        pkg update -y
        pkg install git -y
        git config --global --add safe.directory '*'

        echo
        echo "Setup completed."
        echo
        read -p "Press Enter to continue..."
        ;;

    0)
        clear
        exit 0
        ;;

    *)
        echo
        echo "Invalid option."
        sleep 1
        ;;
esac

done
