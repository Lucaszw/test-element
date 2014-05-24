lanilabs
========

#Installation steps
1. Configuration
```
$ git clone git@github.com:lanilabs/lani.git
$ bundle
```
2. configure database.yml
```
rake db:create
rake db:migrate
```
3. change directory to /lani/internal/
4. Install Slic3r dependancies:
```
git clone git://github.com/alexrj/Slic3r
cd Slic3r
sudo cpan App::cpanminus
sudo perl Build.PL
sudo perl Build.PL --gui
```
