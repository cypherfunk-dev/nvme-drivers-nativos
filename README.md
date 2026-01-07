# NVMe Native Driver Toggle for Windows 11

Herramienta simple para **detectar, habilitar o revertir el uso del controlador NVMe nativo (`nvmedisk.sys`) en Windows 11**, evitando el stack heredado (`disk.sys` / StorPort SCSI).

El script **detecta el driver realmente cargado**, no se basa únicamente en claves de registro.

---

## 📌 ¿Qué hace?

- Detecta si el sistema está usando:
  - ✅ `nvmedisk.sys` → NVMe nativo activo
  - ❌ `disk.sys` → modo heredado
- Si **NO está activo**:
  - Pregunta si deseas habilitar NVMe nativo
- Si **YA está activo**:
  - Informa el estado
  - Ofrece volver al modo por defecto
- Aplica cambios solo si el usuario confirma
- Muestra ventanas de estado
- Se cierra automáticamente al finalizar

---

## ⚙️ Requisitos

- Windows 11
- SSD NVMe compatible
- Ejecutar **como Administrador**
- PowerShell disponible  
  (usado solo para UI y detección, no para modificar el sistema)

---

## 🚀 Uso

### Opción 1: Script `.bat`

1. Descarga `nvme-auto.bat`
2. Click derecho → **Ejecutar como administrador**
3. Sigue las ventanas de confirmación
4. Reinicia el sistema si realizas cambios

### Opción 2: Ejecutable `.exe`

Si usas la versión compilada:

1. Doble click
2. Acepta UAC
3. Sigue las instrucciones en pantalla

---

## 🔍 ¿Cómo detecta el estado real?

El script consulta el driver cargado para los dispositivos `DiskDrive` mediante PnP.

- Si el stack incluye **`nvmedisk.sys`**, se considera NVMe nativo activo
- Esto es más confiable que revisar solo el registro, ya que:
  - Windows puede activar NVMe nativo sin mantener la clave
  - El registro no siempre refleja el estado real del driver

---

## 🔄 Cambios que aplica (si el usuario acepta)

### Habilitar NVMe nativo

```reg
HKLM\SYSTEM\CurrentControlSet\Services\stornvme
  Start = 0

HKLM\SYSTEM\CurrentControlSet\Control\StorPort
  EnableNVMeMode = 1
