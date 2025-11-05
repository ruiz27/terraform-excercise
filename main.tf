# main.tf

#####################################
# 1. Configuración del Proveedor
#####################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Reemplaza con la región de tu preferencia (ej. "us-east-1", "eu-west-1")
  region = "us-east-1"
}

#####################################
# 2. Búsqueda de la AMI (Amazon Linux 2)
#####################################

# Este bloque de datos busca la última ID de la Amazon Machine Image (AMI)
# de Amazon Linux 2 (kernel 64-bit). Esto garantiza que siempre uses
# la imagen más reciente para el despliegue.
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    # Patrón común para Amazon Linux 2 (cambia si usas otra versión)
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#####################################
# 3. Recurso EC2 (Instancia)
#####################################

resource "aws_instance" "servidor_linux" {
  # Usa la ID de la AMI que encontramos en el bloque 'data'
  ami           = data.aws_ami.amazon_linux_2.id
  
  # Tipo de instancia (t2.micro está en el nivel gratuito)
  instance_type = "t2.micro"

  # Clave SSH: Reemplaza "mi-clave-ssh" con el nombre de tu par de claves existente en AWS.
  # Si no especificas key_name, NO podrás acceder por SSH.
  # key_name      = "mi-clave-ssh" 

  # Etiquetas para identificar el recurso
  tags = {
    Name    = "Servidor_Linux_Terraform"
    Project = "Demo"
  }

  # Configuración adicional:
  # - security_groups/vpc_security_group_ids: Si no se especifica, usa el grupo de seguridad por defecto de la VPC.
  # - subnet_id: Si no se especifica, usa la subred por defecto de la zona.

  # Opcional: Script de inicialización (User Data)
  # user_data = <<-EOF
  #               #!/bin/bash
  #               echo "Hola desde Terraform" > /tmp/userdata.log
  #               EOF
}

#####################################
# 4. Salida (Output)
#####################################

# Muestra la IP pública de la instancia después del despliegue
output "ip_publica_ec2" {
  description = "La IP pública para acceder a la instancia EC2."
  value       = aws_instance.servidor_linux.public_ip
}
