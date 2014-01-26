# Base Virtual Machine

This system utilizes [packer](http://packer.io) to create a base virtual machine
image to use with Vagrant and VirtualBox.

## Quickstart

1. Install Packer, VirtualBox, and Vagrant
1. Run:

    ```bash
    $ ./create_box 
    ```
1. Watch the magic 

## Using with Vagrant

Onces you have created the base box you can use it with Vagrant.  Do something
similar to this:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "base"
end
```

**Version 0.1**

