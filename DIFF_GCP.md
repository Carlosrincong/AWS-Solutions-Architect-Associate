
- VPC 
En AWS son por region, en GCP son VPC globales
- Subnet 
En AWS son por AZ, en GCP son por Region
En AWS son publicas por defecto, en GCP son privadas por defecto
- Cantidad de subnet por region (GCP) o por AZ (AWS)
En ambos servicios puede haber mas de una subnet por Region en GCP o por AZ en AWS.
- Routes
Route tables por subnet en AWS, Routes manejadas a nivel de VPC en GCP 
- Internal routes
Deben ser definidas manualmente en AWS, en GCP son creadas automaticamente
- Public subnet con acceso a Internet
en AWS la subnet debe tener conexion al IGW con route tables
En GCP la subnet se debe crear la ruta al default internet gateway
- Private subnet con acceso a Internet
En AWS La subnet debe tener una ruta en su route table hacia un NAT Gateway (que usa una Elastic IP) o un NAT Instance para acceso a Internet sin IP pública.
En GCP Se debe crear un Cloud Router y configurar un Cloud NAT, para acceso a Internet sin IP pública.
- Consumo de servicios privados entre VPCs
PrivateLink en AWS, Private Service Connect en GCP. Ambos usan endpoints privados en las subnet de la VPC.
- Administracion centralizada de una red
En AWS con AWS RAM se puede usar Sharing VPC para compartir subnets de la VPC a otras cuentas
En GCP con Shared VPC se puede compartir el acceso a toda la VPC a otros proyectos. 
- Peering entre dos VPCs sin transitividad
En AWS con VPC Peering permite peering regional e interregional. 
En GCP con VPC Peering permite solo peering regional. 
- Peering entre VPCs con transitividad (hub-and-spoke)
En AWS se usa Transit Gateway
En GCP se usa network connectivity center
