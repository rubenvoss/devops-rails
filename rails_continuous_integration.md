# Setting up a CI Pipeline with Github Actions
We'll set up automated testing that is going to happen on Githubs servers. Maybe you know this: sometimes, when you add a feature you forget to test it yourself. Or you find out later that the code you added made some other part of your application buggy, that you didn't test, because it was somewhere else...
With this setup, everytime someone opens a pull request to merge to master, tests will be run on the Github servers.
### Why not run tests on my local machine?
If we run tests on the Github server with Docker containers, the environment will be the same **every single time** - some bugs are only visible for certain machines and not reproducable on another machine. Another benefit is, that it's impossible to forget running the tests.
# Setup Githb actions
On your Repository page, click on Actions. Search for the Rails Action and add it. Now there is a new file in your repository, under .github/workflows/rubyonrails.yml
