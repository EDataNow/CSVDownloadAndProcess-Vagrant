# CSVDownloadAndProcess-Vagrant
Creates a VM that automatically downloads Summaries and pushes the content to postgres

###Getting Started:

1. Download Vagrant [here](https://www.vagrantup.com/downloads.html)
2. Download VirtualBox [here](https://www.virtualbox.org/wiki/Downloads)
  * Alternately, both Vagrant and VirtualBox are available on most package managers such as Homebrew or apt-get
3. Install Git [here](https://git-scm.com/downloads)

Once the above installations are complete, open a command line and navigate to the directory in which you want the project to be installed. 

<details>
 <summary>If you have not yet installed this project on your machine</summary>
 > ~~~
 > git clone --recursive https://github.com/EDataNow/DaPr-CSVDownloadAndProcessUsingVagrant.git
 > ~~~
 > This will create a folder named DaPr-CSVDownloadAndProcessUsingVagrant in the chosen directory, which you can rename if desired. Once complete, navigate into the directory and move to the next step.  
</details>

<details>
 <summary>If you have already pulled the project from git</summary>
 > Navigate into the project directory (contains the Vagrantfile) and run the following commands:
 > ~~~
 > git submodule init
 > git submodule update
 > ~~~
 > This will update the ruby script to it's latest version.
</details>

A config.csv file must be provided containing AWS credentials, region, and language preferences. In most cases this will be provided along with the AWS credentials.

<details>
 <summary> Creating the config.csv </summary>

> The headers for the config.csv are as follows:

> > User Name,Access Key Id,Secret Access Key,Region,Server,Language,Processor

> The order of these columns does not matter

> ####Required
> - User Name : This is the AWS username, usually an integer matching the Lessee ID on EDataNow
> - Access Key Id : This is used to authenticate your connection to our AWS buckets. If you do not have this, please contact your site administrator or EDN Liaison for the proper credentials.
> - Secret Access Key : As above
> - Region : As above (default is us-east-1)
> - Server : Determines where data is being pulled from. This will match the url used to access your data within our web app (eg. service.edatanow.com)
> - Language : You can see a list of ISO 639-1 language codes here: https://www.loc.gov/standards/iso639-2/php/code_list.php. English is en

> ####Optional
> - Processor : We have provided a ruby script which will process the .csv summaries into the local database, but if you wish to override this with a custom script, you may do so by including it's path here.

> ####Example config.csv

> | User Name | Access Key Id | Secret Access Key | Region    | Server               | Language | Processor |
> |-----------|---------------|-------------------|-----------|----------------------|----------|-----------|
> | 3         | ABC123        | A1B2C3D4E5F6      | us-east-1 | service.edatanow.com | en       |           |
</details>

Once the config.csv is saved into the same directory as the Vagrantfile, simply call
~~~
vagrant up
~~~
For windows users, we have included a Start-Vagrant.bat file that can be run instead. It may also be added to the startup folder if desired.

<details>
<summary>Additional Post-Vagrant Options</summary>

> If the VirtualBox has stopped ('vagrant halt', machine shut down, or power loss) it can be turned back on with the 'vagrant up' command. No other steps are needed, provided the local data has not been altered.

> If you want to run the retrieval script outside the 30min schedule, the script can be called manually with
> ~~~
> vagrant ssh
> ruby /vagrant/script/dapr.rb
> ~~~
> Note: Windows users will have to use PuTTY or similar ssh service in place of the vagrant ssh call 

> To connect to the database using Excel/PowerBI/etc from a Windows machine, you will need the [psqlODBC driver](https://www.postgresql.org/ftp/odbc/versions/msi/). 
</details>
