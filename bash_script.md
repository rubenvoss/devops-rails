# Bash 'run' script
Everytime we want to run a command inside of our docker container, we have do type in 'docker exec -it container_name COMMAND'. This is not very DRY, so let's write a script to automate this command. The Goal is, to type in 'run' instead of 'docker exec -it container_name'.
**Old way:**
```
docker exec -it rails_development_server rails c
```
**New way:**
```
run rails c
```
# Write the script
Add a file with the name 'run' to your Repository, with this code in it(replace rails_development_server with your container name):
```
#!/bin/bash
docker exec -it rails_development_server $@
```
The $@ takes all of the command you pass in after putting 'run' in your terminal. In 'run rails c' the $@ = 'rails c'.
# Give permission to execute to the script
if you type './run' into your terminal, right now you will get a permissions error. That is because the file is not executable yet. We have to mark it as such.
```
chmod +x run
```
Now you should be able to run your script with either 'bash run' or './run'.
# Add your repo to your $PATH
If you do not want to have to type in the ./ every time before typing in run, you have to add your Repository to your $PATH. If you use zsh, open the .zshrc file with:
```
code ~/.zshrc
```
There should be a bunch of stuff inside, the only thing you have to do, is to add this line:
```
export PATH="$PATH:~/THE/FILE/PATH/TO/YOUR/REPO"
```
to the file and save. Replace the filepath with the filepath to your repo obviously ;). **Do not** add the path to your 'run' file, instead add the path to your Repository Folder.
<br>

Now, reload your source with:
```
source ~/.zshrc
```
And check if your script is working with:
```
run
```
<br>

So now, whenever you add a script to your repo, it will be instantly available to you via the terminal. Careful with naming though, if there is another program with the same name, it will come before your script. So test the naming of your script.
