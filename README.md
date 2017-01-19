# CSVDownloadAndProcess-Vagrant
Creates a VM that automatically downloads Summaries and pushes the content to postgres

###Getting Started:

1. Download Vagrant [here](https://www.vagrantup.com/downloads.html)
2. Download VirtualBox [here](https://www.virtualbox.org/wiki/Downloads)
  * Alternately, both Vagrant and VirtualBox are available on most package managers such as Homebrew or apt-get
3. From the vagrant directory, use the following commands to pull the latest version of the ruby script

~~~
git submodule init
git submodule update
~~~

Once both of the above have been installed, a config.csv file must be created containing AWS credentials, region, and language preferences.

The headers for the config.csv are as follows:

> User Name,Access Key Id,Secret Access Key,Region,Server,Language,Processor

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

####Example config.csv

| User Name | Access Key Id | Secret Access Key | Region    | Server               | Language | Processor |
|-----------|---------------|-------------------|-----------|----------------------|----------|-----------|
| 3         | ABC123        | A1B2C3D4E5F6      | us-east-1 | service.edatanow.com | en       |           |

Once the config.csv is saved into the same directory as the Vagrantfile, simply call
~~~
vagrant up
~~~

###Post-Vagrant

If the VirtualBox has stopped ('vagrant halt', machine shut down, or power loss) it can be turned back on with the 'vagrant up' command. No other steps are needed, provided the local data has not been altered.

If you want to run the retrieval script outside the 30min schedule, the script can be called manually with
~~~
ruby /vagrant/script/dapr.rb
~~~