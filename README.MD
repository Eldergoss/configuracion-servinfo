# 🖥️ Configuración de dominio `servinfo.local`

Este repositorio contiene scripts automatizados para implementar y configurar un dominio Windows Server llamado `servinfo.local`, incluyendo servicios como Active Directory, DNS y DHCP, así como la estructura organizativa y usuarios.

---

## 📁 Contenido del repositorio

| Archivo | Descripción |
|--------|-------------|
| `configuracion-inicial.bat` | Configura la IP estática, cambia el nombre del equipo a `SERVER1`, e instala los roles AD DS, DNS y DHCP. |
| `dominio-servinfo.ps1` | Promociona el servidor como controlador de dominio, crea la estructura de Unidades Organizativas, usuarios y carpetas compartidas. |

---

## 🔧 Requisitos previos

- Sistema: Windows Server 2016/2019/2022
- Acceso con permisos de administrador
- Interfaz de red llamada `Ethernet`
- Git instalado (opcional si se usa GitHub)
- PowerShell habilitado para ejecutar scripts (`Set-ExecutionPolicy RemoteSigned`)

---

## ⚙️ Descripción de scripts

### 🧩 `configuracion-inicial.bat`

Este script realiza:

1. Configura la interfaz `Ethernet` con IP estática:
   - IP: `192.168.1.10`
   - Máscara: `255.255.255.0`
   - Gateway: `192.168.1.1`
   - DNS: `192.168.1.10`

2. Cambia el nombre del servidor a `SERVER1`.

3. Instala los roles necesarios:
   - Active Directory Domain Services (AD DS)
   - DNS Server
   - DHCP Server
   - Incluye herramientas de administración

4. Reinicia el servidor para aplicar cambios.

---

### 🛠️ `dominio-servinfo.ps1`

Este script realiza:

1. Promociona el servidor a controlador de dominio con:
   - Nuevo bosque: `servinfo.local`
   - Nivel funcional predeterminado
   - Contraseña de DSRM: `Servinfo123*`

2. Crea la estructura de Unidades Organizativas (UO):
