# Resource Definiation for the VM Template
source "vsphere-iso" "vm-packer" {
  # vCenter connection settings 
  vcenter_server      = "192.168.220.102"
  username            = "administrator@vsphere.palladu38.me"
  password            = "Sdfgh123$"
  insecure_connection = true

  # VM general settings 
  vm_name = "Amad - Auto-Inst-Ubu"
  # folder  = "Temp"
  # cluster = ""
  host      = "37.187.132.7"
  datastore = "STORAGE_Amad"

  # CPU settings
  CPUs         = "2"
  CPU_hot_plug = true
  # cpu_cores    = "4"  
  
  # Memory settings
  RAM          = "8192"
  RAM_hot_plug = true

  # Network settings
  network_adapters {
    network = "Amad - DMZ"
    network_card = "vmxnet3"
  }
  
 # Hard disk settings 
  disk_controller_type = ["pvscsi"]
  storage {
    disk_size = 40960 
    disk_controller_index = 0
  }

  # ISO configuration
  iso_checksum = "5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
  iso_url      = "https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-live-server-amd64.iso"
  
  boot_command = [
    "<wait10s>c",
    "linux /casper/vmlinuz quiet ip=192.168.220.20::192.168.220.1:255.255.255.0::::192.168.220.2  autoinstall ds=nocloud-net\\;s=http://192.168.220.7/ ---<wait>",
    "<enter><wait10s>",
    "initrd /casper/initrd",
    "<enter><wait15s>",
    "<wait>boot<wait><enter>"
  ]  

  # boot                      = "c"
  boot_wait                 = "5s"
  ssh_host = "192.168.220.20"
  ssh_username = "amad" 
  ssh_password = "sdfgh"
  ssh_timeout               = "20m"
  ssh_clear_authorized_keys = true
  ssh_port                  = 22
  ssh_certificate_file      = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKTU4LbNRT7d441d9SA5yCzyUnSzveXs+aXUFgVcSN/TJ880HKoINpJGml1IoAIRbRIM5na8OUgNflPungvYHlY= user-ansible@ansible"
}

  # PACKER Boot Commands
  # Build Definition to create the VM Template
build {
  name    = "vm creation"
  sources = ["source.vsphere-iso.vm-packer"]

    # Add additional provisioning scripts here
  # ...
  provisioner "shell" {
    script       = "/home/amad/packer/script.sh"
    pause_before = "10s"
  }
}
