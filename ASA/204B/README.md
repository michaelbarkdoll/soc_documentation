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

Here we'll add a box named "win11" from F:\VMs\Win11\windows11.box
```powershell
PS C:\Users\siu85xxxxxxx> cd C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box add win11 F:\VMs\Win11\windows11.box
```

Initialize the new vagrant environment
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> cd C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant init
```

Start the virtual machine
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> cd C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant up
```

### Vagrant box default admin credentials
Login to the computer with:
username: vagrant
password: vagrant

### Remove a vagrant box

```powershell
PS C:\Users\siu85xxxxxxx> cd C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx> vagrant box list
win11_test3 (virtualbox, 0)
PS C:\Users\siu85xxxxxxx> vagrant box remove win11_test3
Removing box 'win11_test3' (v0) with provider 'virtualbox'...
PS C:\Users\siu85xxxxxxx> vagrant box list
There are no installed boxes! Use `vagrant box add` to add some.
PS C:\Users\siu85xxxxxxx>
```

