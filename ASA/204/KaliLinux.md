# Run a Kali Linux Desktop on Windows 11 with Vagrant

This guide shows you how to create a Kali Linux virtual machine (VM) with Vagrant and use its desktop in a VirtualBox window on Windows 11. Windows is the host computer; Kali Linux runs inside the VM.

## Prerequisites

Install the following on your Windows 11 computer:

- VirtualBox
- Vagrant

You also need an internet connection to download the Kali Linux image. The configuration below assigns 4 GB of RAM and two virtual CPUs to the VM; make sure your computer has enough resources to run Windows and the VM together.

## Step 1: Initialize a Vagrant Environment in PowerShell

Open Windows PowerShell in the folder where you want to keep this project, then run:

```powershell
mkdir KaliLinuxVagrant
cd KaliLinuxVagrant
vagrant init kalilinux/rolling
```

The last command creates a file named `Vagrantfile` inside `KaliLinuxVagrant`. Keep PowerShell open in this folder for the remaining Vagrant commands.

## Step 2: Configure the Vagrantfile

Open the file in Notepad from the same PowerShell window:

```powershell
notepad .\Vagrantfile
```

Replace its contents with the following configuration, then save and close Notepad. Keep the filename `Vagrantfile`, with no `.txt` extension.

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "kalilinux/rolling"

  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.ssh.insert_key = true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true      # Show the VM in a VirtualBox window
    vb.memory = "4096" # Allocate 4 GB of RAM to the VM
    vb.cpus = 2        # Allocate two virtual CPUs to the VM
  end
end
```

## Step 3: Start the VM

In Windows PowerShell, from the `KaliLinuxVagrant` folder, run:

```powershell
vagrant up --provider=virtualbox
```

The first startup downloads the Kali Linux image and creates the VM, so it can take several minutes. Wait for Vagrant to finish and return to the PowerShell prompt. A VirtualBox window should open because `vb.gui` is set to `true`.

## Step 4: Log In to the Kali Linux Desktop

In the VirtualBox VM window, wait for the Kali Linux login screen. Log in with:

- **Username:** `vagrant`
- **Password:** `vagrant`

These are the [default credentials for Kali's Vagrant image](https://www.kali.org/docs/introduction/default-credentials/).

After login, you should see the Kali Linux desktop. You can now open applications inside that window. SSH is optional and is not required to use the desktop.

## Optional: Access a Kali Linux Terminal via SSH

To open a terminal session inside Kali Linux, run this from Windows PowerShell in the `KaliLinuxVagrant` folder:

```powershell
vagrant ssh
```

Commands entered in this session run inside Kali Linux. To end the SSH session and return to Windows PowerShell, run:

```bash
exit
```

Ending the SSH session leaves the VM running.

## Useful Commands

Run these commands in **Windows PowerShell**, from the `KaliLinuxVagrant` folder. If you are connected through SSH, run `exit` first. Choose the command for the action you need; these are not steps to run in sequence.

| Command | Purpose |
| --- | --- |
| `vagrant status` | Check whether the VM is running or stopped. |
| `vagrant halt` | Shut down the VM while keeping its files for next time. |
| `vagrant up` | Start the VM again after shutting it down. |
| `vagrant reload` | Restart the VM and apply changes to the Vagrantfile. Save your work inside Kali first. |

### Delete the VM When You No Longer Need It

**This deletes the VM and files stored only inside it.** Copy any work you want to keep to your Windows computer first. To delete the VM, run:

```powershell
vagrant destroy
```

Vagrant asks for confirmation before deleting the VM. Adding `-f` skips that confirmation, so it is omitted here. See the [Vagrant destroy documentation](https://developer.hashicorp.com/vagrant/docs/cli/destroy).

## Troubleshooting

Run the following commands in Windows PowerShell, not inside Kali Linux.

### The VM Window Does Not Appear

From the `KaliLinuxVagrant` folder, run `vagrant status`. If the VM is stopped, start it with `vagrant up`. If it is running, open VirtualBox Manager, select the Kali VM, and choose **Show** to open its window.

If startup failed, read the error shown by `vagrant up` before trying again.

### Check Whether VirtualBox Has Registered the VM

If you cannot find the Kali VM in VirtualBox Manager, list the registered VMs:

```powershell
VBoxManage list vms
```

The output lists VM names and their identifiers. Look for a name containing `KaliLinuxVagrant`; Vagrant normally uses the project folder name as part of the VM name. This list confirms registration, not whether a VM is running. Use `vagrant status` from the project folder to check its state.

If PowerShell reports that `VBoxManage` is not recognized, use its full path. For the default VirtualBox installation location:

```powershell
& "$env:ProgramFiles\Oracle\VirtualBox\VBoxManage.exe" list vms
```

Adjust the path if you installed VirtualBox elsewhere.

### VirtualBox Manager Remains Unresponsive

First save your work and shut down the Kali VM with `vagrant halt`. Shut down any other VirtualBox VMs as well, then try closing VirtualBox Manager normally.

Only if all VMs are stopped and VirtualBox Manager still will not close, use the following commands to force-close its interface and background service:

```powershell
taskkill /F /IM VirtualBox.exe
taskkill /F /IM VBoxSVC.exe
```

These commands affect matching VirtualBox processes, not just this Kali project. They are not a substitute for shutting down a VM. A "process not found" message means that process is already closed. Reopen VirtualBox Manager afterward and check whether it responds normally.
