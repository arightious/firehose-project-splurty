Mac Setup with Vagrant
==================

This will run you through the steps to configure your web development environment using the vagrant install process.

IMPORTANT: READ THIS!
---------

If you're running Parallels, VirtualBox, or VMWare to run Windows (for example to run Microsoft
Word inside Windows on your Mac) make sure to close Parrellels before going through these steps.  Parallels does not
play nicely with Vagrant.


Step 1: Create accounts if you haven't already
--------

**Note:** These websites may ask you if you want to also download the software programs to go along with the accounts (The Heroku ToolBelt, GitHub for Windows, or GitHub for Mac).  We won't be using these programs so you won't need to download them.  

### Part A

First go to [GitHub.com](http://github.com) and create an account.

### Part B

Then go to [Heroku.com](http://Heroku.com) and create an account there as well.


Step 2:  Get the files for your development environment
-----------

**Go get a Firehose Flash Drive**:  copy the vagrant folder onto your __Desktop__.


Step 3: Install the tools
-------

Go to your vagrant folder on your desktop and open it up. Inside the vagrant folder open up the programs folder and inside of it the mac folder (vagrant > programs > mac).

* Double click on VirtualBox.pkg and follow the instructions (you're clicking continue most of the time)
* Double click on Sublime Text 2.0.2.dmg and [drag the Sublime Text 2 program into the Applications folder](http://i.imgur.com/pgjF3WL.png), then launch the program by going into your _Launch Pad_ and finding "Sublime Text 2".  (Note: This may say that this is from an [unidentified developer and is unallowed, to continue](http://i.imgur.com/FNTYmyL.png) if this happens open Launch Pad > System Preferences > Security & Privacy and click [open Anyway](http://i.imgur.com/XPVpfRf.png). )  It will probably tell you ["Sublime Text" is an application downloaded from the internet. Are you sure you want to open it?](http://i.imgur.com/bjtmqkw.png)  Press **Open**.  This will launch the Sublime Text editor, and you'll be good.  If you need more help check out [this Sublime Text install video](https://vimeo.com/88292868) we made.
* Double click on Vagrant.pkg and follow the instructions (you're clicking continue most of the time)


Step 4: Add the Box
--------

Open up the **Terminal Window**: Hold Command+Spacebar, in the Spotlight type 'Terminal' and hit the enter key.

A terminal window will come up, and then run the following two commands:

```
cd ~/Desktop/vagrant
```

then run this next command, it may take a few moments to complete:

```
vagrant box add firehose firehose.box
```


Step 5: Turn on your Web Dev Environment
-------

In the terminal you've been using, type this command, again this may take a few moments to complete:

```
vagrant up
```

**NOTE:** If this comes back with an error message telling you to run `vagrant init` DO NOT DO THAT.  See this post [here](http://www.thefirehoseproject.com/comments/48) for details about how to fix this error message.


Step 6: Log into your dev environment
-----------

To log into your web-dev environment follow the following steps:

__First__:  double click the vagrant folder on your desktop:

![Vagrant folder](http://i.imgur.com/xX2q3qq.png)


__Second__: the finder window opens double click the `Launch Mac Web Dev
   Environment`.

![vagrant-folder](http://i.imgur.com/VMgxYn6.png)

__Third__: you may get prompted if you want to continue.  If this comes up for you, type `yes` and press enter.  If this does not come up, that's ok too.

![continue](http://i.imgur.com/gR34qy2.png)

__Fourth__: Then you'll be prompted with a terminal window inside your web
development environment that looks like this:

![web-dev-environment](http://i.imgur.com/UdZvZTj.png)

This brings you into your web dev environment ready to run commands.


Step 7: Accounts
------------

#### Generate SSH Key

 Inside the web development terminal window, where it says `[Web Dev]` in blue, run the following lines one by one. _important note: the command has backticks (`) not single-quotes ('), either copy and paste the command or if you type it use the key to the left of the 1 to type the backtick in the first line_:

```
eval `ssh-agent -s`
```
```
ssh-keygen -t rsa -C "Firehose Vagrant" -N '' -f ~/.ssh/id_rsa
```
```
ssh-add ~/.ssh/id_rsa
```

#### Configure Heroku with SSH Keys

This will prompt you for your heroku username and password.  Enter that here.

```
heroku login
```
```
heroku keys:add
```

#### Configure Github with SSH Keys

Then run this command.  Once this command runs it will prompt you for your GitHub username (note this is your username not your email address) and your password.  Enter these values and then press enter.  It should tell you "ok!".  If it gives you an error message you probably entered an invalid username and password (so try to run that command again).

```
curl "https://raw.githubusercontent.com/kenmazaika/firehose-vagrant/master/github-key.rb" > ~/.firehose-github.rb && ruby ~/.firehose-github.rb
```

Once the dollar-sign returns, run these commands and provide your name and email address inside the double quotes instead of the dummy data:

```
git config --global user.email "you@example.com"
```

And then run:

```
git config --global user.name "Your Name"
```

##Amazon AWS services##

_We need an amazon developer account for some image storage space on Amazons S3 service (this will cost you nothing)_

* Sign-up and create an account for [Amazon Web Services](http://aws.amazon.com/). Anything we'll do over the weekend will cost you nothing, so don't worry about your credit card being charged.


Step 8: Test
---------

 In the web development terminal window,  where it says `[Web Dev]` in blue, run this, _important note: after you run `rails s` it won't give you the prompt to continue to enter commands. This is by design, so move onto the next step even if it looks like it's just hanging_:

```
cd /vagrant/src/firehose-test-app
```
```
rails s
```


Open a web browser on your windows machine and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030)

Step 9: Stop your rails server
-------------

Now return to a window where you can enter commands in web development terminal window.  

**Find your web development terminal where you ran the `rails server` command and hold CTRL+C.**

This stops the webpage from working, but will allow you to enter new commands.


Step 10: Know your web development environment
---------------


Knowing and understanding how to connect to your web development environment when you want to start coding is pretty important.

**Go to our [FirehoseProject Vagrant Intro Guide](http://www.thefirehoseproject.com/cheat-sheets/vagrant-intro) and get comfortable with your web development environment.**
