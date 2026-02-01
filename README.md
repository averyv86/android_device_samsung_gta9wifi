# Device Tree for Samsung Galaxy Tab A9 WiFi (gta9wifi)

## Device Information

**Device:** Samsung Galaxy Tab A9 WiFi  
**Model:** SM-X110  
**Codename:** gta9wifi  
**Manufacturer:** Samsung Electronics

## Device Specifications

### Processor (MediaTek Helio G99)
- **SoC:** MediaTek Helio G99 (MT6789 / MT8781)
- **Process:** 6nm TSMC
- **CPU:** Octa-core
  - 2x ARM Cortex-A76 @ 2.2 GHz (performance cores)
  - 6x ARM Cortex-A55 @ 2.0 GHz (efficiency cores)
- **GPU:** ARM Mali-G57 MC2

### Display
- **Type:** TFT LCD
- **Size:** 8.7 inches
- **Resolution:** 1340 x 800 pixels
- **Aspect Ratio:** 16:10

### Memory & Storage
- **RAM:** 4GB / 8GB LPDDR4X
- **Internal Storage:** 64GB / 128GB
- **Expandable:** microSD card support (up to 1TB)

### Battery
- **Capacity:** 5,100 mAh (non-removable)
- **Charging:** 15W wired fast charging

### Operating System
- **OS:** Android 13
- **UI:** One UI 5.1

### Connectivity
- **WiFi:** 802.11 a/b/g/n/ac, dual-band
- **Bluetooth:** 5.2
- **USB:** USB Type-C 2.0
- **Audio:** 3.5mm headphone jack
- **Note:** WiFi only model - no cellular connectivity

### Camera
- **Rear Camera:** 8 MP, AF
- **Front Camera:** 2 MP

### Sensors
- Accelerometer
- Hall sensor (for cover detection)

## Building LineageOS/AOSP

### Prerequisites
- Linux build environment (Ubuntu 20.04 or newer recommended)
- Android build tools installed
- At least 200GB free disk space
- 16GB RAM minimum (32GB recommended)

### Sync Device Tree

```bash
mkdir -p device/samsung
cd device/samsung
git clone https://github.com/averyv86/android_device_samsung_gta9wifi.git gta9wifi
```

### Sync Vendor Files

```bash
mkdir -p vendor/samsung
cd vendor/samsung
# Clone vendor repository when available
# git clone https://github.com/[vendor-repo]/android_vendor_samsung_gta9wifi.git gta9wifi
```

### Sync Kernel

```bash
mkdir -p kernel/samsung
cd kernel/samsung
# Clone kernel repository when available
# git clone https://github.com/[kernel-repo]/android_kernel_samsung_gta9wifi.git gta9wifi
```

### Build LineageOS

```bash
. build/envsetup.sh
lunch lineage_gta9wifi-userdebug
mka bacon
```

### Build AOSP

```bash
. build/envsetup.sh
lunch aosp_gta9wifi-userdebug
m -j$(nproc --all)
```

## Extracting Proprietary Files

The device requires proprietary blobs from Samsung's stock firmware. To extract these:

1. Download the stock firmware from Samsung
2. Extract the system partition
3. Connect the device with ADB enabled or mount the system partition
4. Run the extraction script:

```bash
./extract-files.sh
```

## Important Warnings

⚠️ **CRITICAL WARNING** ⚠️

This device uses a **MediaTek Helio G99 (MT6789)** processor, NOT Qualcomm Snapdragon!

- **DO NOT** flash ROMs built for Qualcomm/Snapdragon devices
- **DO NOT** use Snapdragon-based device trees
- **DO NOT** flash kernels built for other chipsets

**Flashing incorrect firmware can brick your device!**

Always verify:
- Device model: SM-X110
- Platform: MediaTek MT6789 (Helio G99)
- Codename: gta9wifi

## Device Tree Structure

```
android_device_samsung_gta9wifi/
├── AndroidProducts.mk          # Product definitions
├── BoardConfig.mk              # Board/hardware configuration
├── device.mk                   # Device-specific packages and properties
├── lineage_gta9wifi.mk         # LineageOS product configuration
├── README.md                   # This file
├── extract-files.sh            # Script to extract proprietary files
├── setup-makefiles.sh          # Script to generate makefiles
├── proprietary-files.txt       # List of proprietary files needed
├── overlay/                    # Device-specific overlay resources
├── configs/                    # Device-specific configuration files
└── rootdir/                    # Root filesystem files (init scripts, etc.)
```

## Status

- [x] Initial device tree setup
- [ ] Kernel source integration
- [ ] Vendor blobs extraction
- [ ] Hardware support verification
- [ ] Camera HAL integration
- [ ] Audio HAL integration
- [ ] WiFi/Bluetooth testing
- [ ] Sensor support
- [ ] Power management optimization

## References

- [GSMArena - Samsung Galaxy Tab A9](https://www.gsmarena.com/samsung_galaxy_tab_a9-12616.php)
- [Device Specifications](https://www.devicespecifications.com/en/model/7c385dff)
- [MediaTek Helio G99 Specifications](https://www.mediatek.com/products/smartphones-2/mediatek-helio-g99)

## Credits

- Samsung Electronics for the device
- LineageOS Team
- Android Open Source Project (AOSP)
- MediaTek for the Helio G99 platform

## License

Apache License 2.0 (unless otherwise specified)
