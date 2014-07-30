# Dorker tt-ruby

Prepare image which is used by tt-ruby app server to check
scripts

## Usage

You can use this image for your project soon.
It's uploaded docker.io, [fs/tt-ruby-docer](https://github.com/fs/tt-ruby-docker).

```
docker build -t fs/tt-ruby https://github.com/fs/tt-ruby-docker.git
```

Run it !

```
docker run -i -t fs/tt-ruby bash -l -c 'ruby ...'
```

### OS X

Use Vagrant for VM running docker. Vagrant 1.4 has a Docker provisioner.
Download it [here](http://www.vagrantup.com/downloads.html).

After installed.

```
vagrant up
```

And login to VM.

```
vagrant ssh
```

Now you can use docker in VM.

### Build image

```
docker build -t TAG .
```

Dockerfile execute belows;

- Pull base image (this time centos)
- Install packages which are needed to build ruby
- Clone [rbenv](https://github.com/sstephenson/rbenv)
- Clone [ruby-build](https://github.com/sstephenson/ruby-build)
- Install ruby 2.1
- Install Bundler for ruby 2.1

## Reference

- [docker-plenv-vanilla](https://github.com/miyagawa/docker-plenv-vanilla)
- [Using Docker and Vagrant on Mac OS X with a Ruby on Rails application](http://blog.powpark.com/2013/11/11/using-docker-and-vagrant-on-mac-osx-for-a-ruby-on-rails-app/)
