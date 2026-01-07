# NVMe Native Driver Toggle for Windows 11

Herramienta simple para **habilitar, revertir o respaldar la clave del registro asociada al uso del controlador NVMe (`nvmedisk.sys`) en Windows 11**, evitando el stack heredado (`disk.sys` / StorPort SCSI).
Aumenta las velocidades notoriamente.

---

## ⚙️ Requisitos

- Windows 11
- SSD NVMe compatible
- Ejecutar **como Administrador**
---

## 🚀 Uso

1. Descarga `nvme-auto.bat`
2. Click derecho → **Ejecutar como administrador**
3. Sigue las ventanas de confirmación
4. Reinicia el sistema si realizas cambios

---

## 🔄 Cambios que aplica (si el usuario acepta)

### Habilitar NVMe nativo

```reg
HKLM\SYSTEM\CurrentControlSet\Services\stornvme
  Start = 0

HKLM\SYSTEM\CurrentControlSet\Control\StorPort
  EnableNVMeMode = 1

```

Articulo original
https://scpc.live/tiktok/806-nvme-nativo-en-windows-11/#%F0%9F%94%93-%C2%BFqu%C3%A9-hace-este-%E2%80%9Ctruco%E2%80%9D-con-regedit
