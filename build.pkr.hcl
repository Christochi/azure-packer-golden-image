# build calls the source block and uses the 
# information returned to make the packer build
build {

  sources = ["source.azure-arm.azure-image"]

  # install packages using ansible provisioner
  provisioner "ansible" {

    playbook_file = var.playbook-dir

  }

}