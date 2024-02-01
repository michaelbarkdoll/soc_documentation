# ASA 204 Lab Documentation

## Virtual Box

### Public Windows 11 Image

There is a public windows 11 virtual machine image available on this machine which can be run inside virtualbox.  The image provides end-users with administrative access using the built-in vagrant user account.  The default username and password of this account is 'vagrant'.  You can spin up this public virtual machine from your account with the following procedure:

### Create a VM from a shared .box file

- Open a new powershell and create a directory where you'd like your virtual machine to reside:

Replace siu85xxxxxxx with your siu851234567 number.

```powershell
PS C:\Users\siu85xxxxxxx> mkdir C:\Users\siu85xxxxxxx\VMs
PS C:\Users\siu85xxxxxxx> mkdir C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx> cd C:\Users\siu85xxxxxxx\VMs\Win11
```

Add the vagrant box to use vagrant installation:
#vagrant box add <BOX_NAME> <PATH_TO_BOX_FILE>

Here we'll add a box named "win11" from F:\VMs\Win11\windows_11.box
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box add win11 F:\VMs\Win11\windows_11.box
vagrant box add win11 F:\VMs\Win11\windows_11.box
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'win11' (v0) for provider:
    box: Unpacking necessary files from: file:///F:/VMs/Win11/windows_11.box
    box:
==> box: Successfully added box 'win11' (v0) for ''!
```

Copy our custom VagrantFile
```
PS C:\Users\siu85xxxxxxx\VMs\Win11> cp F:\VMs\Win11\Vagrantfile C:\Users\siu85xxxxxxx\VMs\Win11\
```

Initialize the new vagrant environment for the box name that we created 'win11'
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant init win11
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```

Start the virtual machine
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'win11'...
Progress: 10%
Progress: 20%
...
Progress: 100%
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: Win11_default_1706820403037_28317
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection reset. Retrying...
    default: Warning: Connection aborted. Retrying...
```

### Vagrant box default admin credentials
Login to the computer with:
username: vagrant
password: vagrant

### Remove a vagrant box

You may choose to spin up the vm again directly from virtualbox or with the `vagrant up` command from the directory you ran `vagrant init`.  When you're done using the VM and would like to delete it from the local computer you can following the following procedure.

Make sure you change to the directory where you initially ran `vagrant init` to delete the vagrant virtual machine.

```powershell
PS C:\Users\siu85xxxxxxx> cd C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box list
win11 (virtualbox, 0)
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box remove win11
Removing box 'win11' (v0) with provider 'virtualbox'...
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box list
There are no installed boxes! Use `vagrant box add` to add some.
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Destroying VM and associated drives...
PS C:\Users\siu85xxxxxxx\VMs\Win11> 
```

