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

Add the vagrant .box to your vagrant installation:

vagrant box add <BOX_NAME> <PATH_TO_BOX_FILE>

Here we'll add a box named "win11" from C:\VMs\Win11\windows_11.box if it previously doesn't exist on the machine.
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box list
There are no installed boxes! Use `vagrant box add` to add some.
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box add win11 C:\VMs\Win11\windows_11.box
vagrant box add win11 C:\VMs\Win11\windows_11.box
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'win11' (v0) for provider:
    box: Unpacking necessary files from: file:///C:/VMs/Win11/windows_11.box
    box:
==> box: Successfully added box 'win11' (v0) for ''!
```

Copy our custom VagrantFile to our vagrant vm environment directory
```
PS C:\Users\siu85xxxxxxx\VMs\Win11> cp C:\VMs\Win11\Vagrantfile C:\Users\siu85xxxxxxx\VMs\Win11\
```

Start the virtual machine from base box 'win11'
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'win11'...
Progress: 10%
Progress: 20%
...
Progress: 100%
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: Win11_default_1706821228142_9999
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 5985 (guest) => 55985 (host) (adapter 1)
    default: 5986 (guest) => 55986 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: WinRM address: 127.0.0.1:55985
    default: WinRM username: vagrant
    default: WinRM execution_time_limit: PT2H
    default: WinRM transport: negotiate
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Mounting shared folders...
    default: /vagrant => C:/Users/siuadmin/VMs/Win11
```

Open VirtualVox application and right click the assocated virtual machine and select access the running virtual machine.

#### Vagrant box default admin credentials

Login to the computer with:

**username: vagrant**

**password: vagrant**

### Shutdown VM
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant down
```

### Restarting the VM

You may choose to spin up the vm again directly from virtualbox or with the `vagrant up` command from the directory that has the Vagrantfile (C:\Users\siu85xxxxxxx\VMs\Win11).  Alternatively, you can start the VM again from VirtualBox.
```powershell
PS C:\Users\siu85xxxxxxx> cd C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx> vagrant up
```

### Remove Windows 11 virtual machine from virtual box

When you're done using the VM you can optionally choose to delete the virtual machine from virtual box with the following procedure:

Make sure you change to the directory where your Vagrantfile associated with the virtual machine resides to delete the associated vagrant virtual machine.

```powershell
PS C:\Users\siu85xxxxxxx> cd C:\Users\siu85xxxxxxx\VMs\Win11
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Destroying VM and associated drives...
PS C:\Users\siu85xxxxxxx\VMs\Win11>
```

If you don't plan on started a new fresh virtual machine from the 'win11' box you can delete the box entirely.

### Delete the associated 'win11' box 
```powershell
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box list
win11 (virtualbox, 0)
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box remove win11
Removing box 'win11' (v0) with provider 'virtualbox'...
PS C:\Users\siu85xxxxxxx\VMs\Win11> vagrant box list
There are no installed boxes! Use `vagrant box add` to add some.
```


### Create your own .box (optional for advanced users)

Replace <VM_NAME> with the name of the virtualmachine inside VirtualBox

vagrant package --base <VM_NAME> --output windows_11.box

```powershell
PS C:\Users\siu85xxxxxxx> vagrant package --base Windows_11 --output C:\Users\siu85xxxxxxx\Boxes\windows_11.box
==> Windows_11: Exporting VM...
==> Windows_11: Compressing package to: C:/VMs/Win11/windows_11.box
PS C:\VMs\Win11>
```

