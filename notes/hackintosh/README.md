# Hackintosh

## Parts List

- Motherboard: [Gigabyte H270-Gaming 3 (Rev 1.0)](http://www.gigabyte.us/Motherboard/GA-H270-Gaming-3-rev-10)
    - Sound: ALC 1220
    - Network: Killer E2500
- CPU: [Intel Core i5-7500](https://ark.intel.com/products/97123/Intel-Core-i5-7500-Processor-6M-Cache-up-to-3_80-GHz)
- GPU: [Sapphire Pulse RX 580 8G G5](https://www.sapphiretech.com/en/consumer/pulse-rx-580-8g-g5)
- Memory: [G.SKILL Ripjaws V Series 16GB (2 x 8GB)](http://www.gskill.com/en/product/f4-2400c15d-16gvr)
- SSD: [Samsung 850 EVO](https://www.samsung.com/us/computing/memory-storage/solid-state-drives/ssd-850-evo-2-5-sata-iii-250gb-mz-75e250b-am/)

## BIOS Settings

- Save & Exit -> Load Optimized Defaults
- Chipset -> VT-d: `Disabled`
- Chipset -> Internal Graphics: `Disabled`
- BIOS -> Windows 8/10 Features: `Other OS`
- Peripherals -> SW Guard Extensions (SGX): `Disabled`
- Peripherals -> Initial Display Output -> `PCIe 1 Slot`
- Peripherals -> Super IO Configuration -> Serial Port: `Disabled`
- Peripherals -> USB Configuration -> XHCI Hand-off: `Enabled`

### OpenCore Settings (`config.plist`)

- Platform: Kaby Lake
- SMBIOS: `iMac18,3`
- AppleALC layout id: `11`

## Additional Drivers

- Canon PIXMA iP3000: `brew install gutenprint`
- 8BitDo SN30 Pro: https://github.com/360Controller/360Controller

## References

- https://dortania.github.io
