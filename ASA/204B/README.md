# ASA 204 Lab Documentation

## Virtual Box
A public windows 11 virtual machine that provides end-users with administrative access is available with the following procedure:

### Create a VM from a shared .box file

- Provide them the network path to the shared `.box` file.
- Open a new powershell and create a directory where you'd like you virtual machine to reside:

```shell
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

