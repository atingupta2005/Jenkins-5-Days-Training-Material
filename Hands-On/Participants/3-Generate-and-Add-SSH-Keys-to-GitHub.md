# Generate ssh key for Jenkins user
 - If you want to access a private Git repo, for example at GitHub, you need to generate an ssh key-pair
 - Create a SSH key with the following command.
## Check if you have a key, you can run this command
 ```
 ssh-add -l
 ```

## Create the SSH key (If you don't have the key)

 - Open the terminal app on your computer
 - Enter the following command
 ```
 ssh-keygen -t rsa -b 4096 -C "<youremailaddress>"
 ```

 - Press Enter to accept the default file location
 - Enter a secure passphrase and Press Enter
 - Enter this command to display the contents of your public key
 ```
 cat .ssh/id_rsa.pub
 ```

 - Copy the contents of your key to your clipboard (we will need it later)


## Add an SSH Key to your Github Account
 - Open Settings from Top Right on your Avatar
 - Select SSH and GPG keys
 - Click New SSH key
 - Enter a title in the field
 - Paste your public key into the Key field
 - Click Add SSH key

## Test SSH Key
 ```
 ssh -T git@github.com
 ```

## Add SSH Remote
 - ----Warning: Make sure to take SSH URL from GitHub Repo and replace in command below ----
 ```
 git remote set-url origin <git@github.com:username/your-repository.git>
 ```

## Push
 ```
 git push
 ```
