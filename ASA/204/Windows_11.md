# ASA 204 Lab Documentation

## VirtualBox

### Public Windows 11 Image

There is a public Windows 11 virtual machine image available on this machine which can be run inside VirtualBox. The image provides end-users with administrative access using the built-in `vagrant` user account. The default username and password of this account is `vagrant`. You can spin up this public virtual machine from your account with the following procedure.

Type or paste the commands shown under **Type in PowerShell**. Blocks labeled **Example output** show responses you may see; do not type them. PowerShell prompts are omitted from command blocks so you can copy the commands directly.

### Create a VM from a shared .box file

Open a new PowerShell window and create a directory where you'd like your virtual machine to reside.

Replace `siu85xxxxxxx` in the commands below with your SIU account name, such as `siu851234567`.

**Type in PowerShell:**

```powershell
mkdir C:\Users\siu85xxxxxxx\VMs
mkdir C:\Users\siu85xxxxxxx\VMs\Win11
cd C:\Users\siu85xxxxxxx\VMs\Win11
```

Add the Vagrant `.box` file to your Vagrant installation.

General syntax: `vagrant box add <BOX_NAME> <PATH_TO_BOX_FILE>`. Replace `<BOX_NAME>` with the name to assign to the box and `<PATH_TO_BOX_FILE>` with the path to the `.box` file.

Here we'll add a box named `win11` from `C:\VMs\Win11\windows_11.box` if it is not already installed. First, check the installed boxes.

**Type in PowerShell:**

```powershell
vagrant box list
```

**Example output (if no boxes are installed):**

```text
There are no installed boxes! Use `vagrant box add` to add some.
```

If `win11` is not listed, add it.

**Type in PowerShell:**

```powershell
vagrant box add win11 C:\VMs\Win11\windows_11.box
```

**Example output:**

```text
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'win11' (v0) for provider:
    box: Unpacking necessary files from: file:///C:/VMs/Win11/windows_11.box
    box:
==> box: Successfully added box 'win11' (v0) for ''!
```

Copy our custom `Vagrantfile` to your VM directory. Replace `siu85xxxxxxx` with your SIU account name.

**Type in PowerShell:**

```powershell
cp C:\VMs\Win11\Vagrantfile C:\Users\siu85xxxxxxx\VMs\Win11\
```

Start the virtual machine from base box `win11`. Run this command from the VM directory you created above, which now contains the `Vagrantfile`.

**Type in PowerShell:**

```powershell
vagrant up
```

**Example output:**

```text
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

The VirtualBox application should automatically show the running virtual machine GUI, but you can also right-click the associated virtual machine inside VirtualBox and select **Show** to open its console.

#### Vagrant box default admin credentials

Log in to the computer with:

**Username:** `vagrant`

**Password:** `vagrant`

### Shutdown VM

Run this command from your VM directory, which contains the `Vagrantfile`.

**Type in PowerShell:**

```powershell
vagrant halt
```

### Restarting the VM

You can start the VM again directly from VirtualBox or use `vagrant up` from the directory containing the `Vagrantfile`. Replace `siu85xxxxxxx` with your SIU account name.

**Type in PowerShell:**

```powershell
cd C:\Users\siu85xxxxxxx\VMs\Win11
vagrant up
```

### Remove Windows 11 virtual machine from VirtualBox

When you're done using the VM, you can optionally choose to delete the virtual machine from VirtualBox with the following procedure.

Change to the directory containing the `Vagrantfile` associated with the virtual machine you want to delete. Replace `siu85xxxxxxx` with your SIU account name.

**Type in PowerShell:**

```powershell
cd C:\Users\siu85xxxxxxx\VMs\Win11
vagrant destroy
```

**Example output (confirmation prompt):**

```text
    default: Are you sure you want to destroy the 'default' VM? [y/N]
```

To confirm deletion, type `y` and press **Enter**.

**Example output (after confirmation):**

```text
==> default: Destroying VM and associated drives...
```

If you don't plan on starting a fresh virtual machine from the `win11` box, you can delete the box entirely.

### Delete the associated `win11` box

List the installed boxes.

**Type in PowerShell:**

```powershell
vagrant box list
```

**Example output:**

```text
win11 (virtualbox, 0)
```

Remove the `win11` box.

**Type in PowerShell:**

```powershell
vagrant box remove win11
```

**Example output:**

```text
Removing box 'win11' (v0) with provider 'virtualbox'...
```

List the boxes again to verify removal.

**Type in PowerShell:**

```powershell
vagrant box list
```

**Example output (if no other boxes are installed):**

```text
There are no installed boxes! Use `vagrant box add` to add some.
```

### Create your own `.box` (optional for advanced users)

General syntax: `vagrant package --base <VM_NAME> --output windows_11.box`. Replace `<VM_NAME>` with the name of the virtual machine inside VirtualBox.

For example, to package a VM named `Windows_11`, use the command below. Replace `siu85xxxxxxx` with your SIU account name.

**Type in PowerShell:**

```powershell
vagrant package --base Windows_11 --output C:\Users\siu85xxxxxxx\Boxes\windows_11.box
```

**Example output:**

```text
==> Windows_11: Exporting VM...
==> Windows_11: Compressing package to: C:/Users/siu85xxxxxxx/Boxes/windows_11.box
```
