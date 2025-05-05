Claro, aquí tienes un `README.md` completo y bien documentado para tu repositorio `configuracion-servinfo`. Incluye explicación de ambos scripts, estructura del dominio y requisitos:

---

```markdown
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
```

SERVINFO
├── GERENCIA
├── PROYECTOS
├── RRHH
├── CONTABILIDAD
└── INFORMATICA

```

3. Crea usuarios con nombres y contraseñas como:

| UO | Usuarios | Contraseña |
|----|----------|------------|
| GERENCIA | gerencia1–4 | `Gerencia123*` |
| PROYECTOS | proyecto1–4 | `Proyecto123*` |
| RRHH | rrhh1–4 | `RRHH123*` |
| CONTABILIDAD | conta1–4 | `Conta123*` |
| INFORMATICA | info1–4 | `Info123*` |

4. Crea carpetas compartidas por unidad en `D:\SERVINFO\`.

5. Asigna permisos NTFS para que solo cada grupo tenga acceso a su carpeta.

---

## 📌 Notas adicionales

- La política de grupo (GPO) para fondo de pantalla, mapeo de unidades y bloqueo del Panel de Control debe configurarse desde la consola **GPMC**.
- Puedes usar scripts adicionales o plantillas `.xml` para automatizar GPOs.

---

## 📄 Licencia

Uso educativo y académico. Puedes modificar los scripts para tus necesidades.

