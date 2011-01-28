#!/bin/bash
echo "Trying to remove the r8192se_pci wireless module"
sudo modprobe -r r8192se_pci
echo "removed"
echo ""
echo ""
echo "Re-enabling the module now"
sudo modprobe r8192se_pci
echo "Seems good!"
