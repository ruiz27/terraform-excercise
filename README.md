# 🚀 Despliegue de AWS con Terraform

---

## 📝 Descripción del Proyecto

Este proyecto es un **ejercicio práctico** y una plantilla inicial (**boilerplate**) para aprender y practicar el despliegue de infraestructura en **Amazon Web Services (AWS)** utilizando **Terraform**.

El objetivo principal es:

* Aprender los comandos básicos de Terraform (`init`, `plan`, `apply`, `destroy`).
* Configurar el proveedor de **AWS**.
* Desplegar un conjunto simple de recursos (ej: una VPC, subredes, o una instancia EC2) para una prueba funcional.

---

## ⚙️ Prerrequisitos

Antes de empezar, asegúrate de tener instalado lo siguiente:

* **Terraform CLI** (versión 1.0.0 o superior recomendada).
* **AWS CLI** configurado en tu máquina local con las credenciales de acceso adecuadas.
* Una cuenta de **AWS** activa.

> **Nota:** Se recomienda configurar el acceso a AWS utilizando **perfiles de AWS** para evitar exponer credenciales directamente en el código.

---

## Inicializar Terraform
Ejecuta el comando de inicialización para descargar los plugins del proveedor de AWS.

```bash

terraform init
```

## Revisar y Modificar Variables
Revisa el archivo variables.tf para entender los valores configurables. Puedes ajustar estos valores en el archivo terraform.tfvars (si existe) o pasarlos por línea de comandos.

Ejemplo de variables comunes: aws_region, project_name, instance_type.

## Planificar el Despliegue
Genera un plan de ejecución para ver qué acciones realizará Terraform sin modificar la infraestructura.

```bash

terraform plan
```

## Aplicar el Despliegue
Si el plan es satisfactorio, aplica los cambios para crear los recursos en AWS.

```bash

terraform apply
```
Se te pedirá que confirmes la acción escribiendo yes.

## Obtener Salidas (Outputs)
Una vez completado el despliegue, puedes ver información relevante sobre los recursos creados.

```bash

terraform output
```

## 🗑️ Limpieza de Recursos (Destruir)
Para evitar cargos innecesarios, destruye toda la infraestructura creada al finalizar el ejercicio. ¡Úsalo con precaución!

```bash

terraform destroy
```
Deberás confirmar escribiendo yes.

## 📂 Estructura del Proyecto
La estructura de archivos sigue las mejores prácticas de un proyecto Terraform simple:

```
terraform-excercise/
├── main.tf              # Define los recursos a desplegar.
├── variables.tf         # Define las variables de entrada del módulo.
├── outputs.tf           # Define los valores de salida del despliegue.
├── providers.tf         # Configuración de los proveedores (ej: AWS).
├── terraform.tfvars     # (Opcional) Archivo para asignar valores a variables.
└── README.md            # Este archivo.
```

## 🔗 Referencias
Este proyecto está basado en el repositorio de ejemplo de:

https://github.com/antmordel/terraform-infraestructura-como-codigo