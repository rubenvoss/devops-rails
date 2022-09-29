# Bash 'run' script
Everytime we want to run a command inside of our docker container, we have do type in 'docker exec -it container_name COMMAND'. This is not very DRY, so let's write a script to automate this command. The Goal is, to type in 'run' instead of 'docker exec -it container_name'.
<br>

**Old way:**
```
docker exec -it rails_development_server rails c
```
**New way:**
```
run rails c
```
<br>

## 1. Write the script
Add a file with the name 'run' to your Repository, with this code in it(replace rails_development_server with your container name):
```
#!/bin/bash
docker exec -it rails_development_server $@
```
The ```$@``` takes all of the command you pass in after putting 'run' in your terminal and adds them to the script. In 'run rails c banana' the ```$@``` = 'rails c banana'.
<br>
  
## 2. Give permission to execute to the script
if you type './run' into your terminal, right now you will get a permissions error. That is because the file is not executable yet. We have to mark it as such.
```
chmod +x run
```
Now you should be able to run your script with either 'bash run' or './run'.
<br>
  
## 3. Add an alias for run
If you do not want to have to type in the ./ every time before typing in run, you have to add an alias. If you use zsh, open the .aliases file with:
```
code ~/.aliases
```
There should be some aliases inside, the only thing you have to do, is to add this line:
```
alias run="./run"
```
Now, reload zsh with:
```
exec zsh
```
And check if your alias is working with:
```
run
```
<br>

So now, whenever you add a script to your repo, it will be instantly available to you via the terminal. 
