provider "google" {
    project = "symbolic-pipe-457709-n9"
    zone = "us-west1-a"
  
}
resource "google_compute_instance" "instance" {
    name= "instance-1"
    machine_type = "e2-standard-2"
    boot_disk {
      initialize_params {
        image = "centos-stream-9"
      }
    }
    network_interface {
      network = "default"
      access_config {
        
      }
    }
  
}

output "vm_external_ip" {
  value = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
}
