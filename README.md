# CSVDownloadAndProcess-Vagrant
Creates a VM that automatically downloads Summaries and pushes the content to postgres

###Getting Started:

1. Download Vagrant [here](https://www.vagrantup.com/downloads.html)
2. Download VirtualBox [here](https://www.virtualbox.org/wiki/Downloads)

Alternately, both Vagrant and VirtualBox are available on most package managers such as Homebrew or apt-get

Once both of the above have been installed, a .csv file must be created containing AWS credentials, region and language preferences, and GitHub credentials (optional, but does reduce user action).

The headers for the .csv are as follows:

> User Name,Access Key Id,Secret Access Key,Region,Server,Language,Script,Processor,Git Username,Git Password

The order of these columns does not matter

####Required
- User Name : This is the AWS username, usually an integer matching the Lessee ID on EDataNow
- Access Key Id : This is used to authenticate your connection to our AWS buckets. If you do not have this, please contact your site administrator or EDN Liaison for the proper credentials.
- Secret Access Key : As above
- Region : As above (default is us-east-1)
- Server : Determines where data is being pulled from. This will match the url used to access your data within our web app (eg. service.edatanow.com)
- Language : You can see a list of ISO 639-1 language codes here: https://www.loc.gov/standards/iso639-2/php/code_list.php. English is en

####Optional
- Processor : We have provided a ruby script which will process the .csv summaries into the local database, but if you wish to override this with a custom script, you may do so by including it's path here.
- Git Username : If Git credentials are provided, they will be used to clone our repository as part of the provisioning process. If left blank, refer to the post-vagrant section below for remaining steps.
- Git Password : As above

####Example .csv

| User Name | Access Key Id | Secret Access Key | Region    | Server               | Language | Git Username  | Git Password |
|-----------|---------------|-------------------|-----------|----------------------|----------|---------------|--------------|
| 3         | <Key>         | <Secret-Key>      | us-east-1 | service.edatanow.com | en       | ExampleUser99 | password1    |

Once the .csv is saved into the same directory as the Vagrantfile, simply call
~~~
vagrant up
~~~

###Post-Vagrant

If you do not wish to include your git credentials in the .csv, you will have to manually pull our repo using
~~~
vagrant ssh
~~~

Once in the ubuntu virtual machine, do the following
~~~
cd /vagrant/
git clone https://github.com/EDataNow/CSVDownloadAndProcess-Ruby.git
cd CSVDownloadAndProcess-Ruby/
bundle install
~~~

###Upkeep
If the VirtualBox has stopped ('vagrant halt', machine shut down, or power loss) it can be turned back on with the 'vagrant up' command. No other steps are needed, provided the local data has not been altered.