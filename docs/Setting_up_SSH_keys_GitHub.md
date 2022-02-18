# Setting up SSH keys with GitHub

If you want to know more about SSH and GitHub, you can read about it [here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).

The following guide steps can also be found at GitHub's docs [here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

## How to generate a new SSH key:
1. Connect to your VM and open your terminal.
2. Paste and enter the following text into your command line, replacing the text in quotes with the email you use for your GitHub account:

   `ssh-keygen -t ed25519 -C "your_email@example.com"`

3. Next, you'll be prompted to select where to save the key:

   `Enter file in which to save the key (/home/student1/.ssh/id_ed25519):`

      Just press enter to save the key in the default location.

4. Next, you'll be prompted to enter a secure passphrase:

   `Enter passphrase (empty for no passphrase):`

   `Enter same passphrase again:`

      This passphrase is what you'll have to enter when you perform git actions, like push or pull, in order to be authenticated.

Your SSH key has now been generated!
Next, you'll have to add your SSH key to the ssh-agent, which is a manager for your SSH keys.

## Adding your SSH key to the ssh-agent:

1. In your VM terminal, enter the following to start the ssh-agent in the background:

   `eval "$(ssh-agent -s)"`

      You'll see some output like `Agent pid 59566`.

2. Next, enter the following to add your key to the agent:

   `ssh-add ~/.ssh/id_ed25519`

      You'll be prompted to enter the passphrase you previously assigned to this key.

Now your key has been added to the ssh-agent. Next, you can finally add the key to GitHub.

## Adding a new SSH key to your GitHub account:

1. Copy the SSH public key to your clipboard. To do this, you can enter the following command:

   `cat ~/.ssh/id_ed25519.pub`

      This shows you the contents of where you saved the SSH key you just created earlier. You can copy all of the contents of this file. You'll see a line that starts with "ssh-ed25519", followed by a long string of characters, followed by your GitHub email. (Copy all of it!)

2. Next, navigate to your account settings by clicking on your profile picture in the top right of the GitHub website, and then selecting "Settings" from the dropdown.

3. Navigate to the "SSH and GPG keys" page in the sidebar.

4. Select the "New SSH key" button.

5. In the "Title" field, add a descriptive label for the new key. This could be something like "SE Individual VM", if the key is on the VM you use for your individual project.

6. Paste your copied key into the "Key" field.

7. Select "Add SSH key". Then if prompted, enter your GitHub account password.

Now you're all set up with your SSH key! At this point, you can finally clone your repository using the SSH url.

## Cloning your repository using SSH

On the GitHub website, on your repository page, select the "Code" dropdown at the top of the page. Make sure to select "SSH" and not "HTTPS". Click the little clipboard to the right of the provided url to copy it.

Now, return to your terminal and enter the following command: `git clone <copied url>`

If you are told that the authenticity of the host 'github.com' can't be established, and asked if you want to continue connecting, enter "yes".

You'll be prompted to enter the passphrase you made earlier for your SSH key. After you enter that, the repository will be cloned to your VM.

Now, you can continue with the installation instructions [here](Installation_Guide.md#installing-dependencies)!
