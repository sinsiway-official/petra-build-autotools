# Petra Build Autotools

This repository contains scripts for building the Autotools required for building the Petra source code. The Autotools include the m4, autoconf, automake, and libtool packages.

## Requirements

These scripts require sudo permissions to run. It is recommended to choose an arbitrary directory under `/usr/local` for the installation path. For example, you could use `/usr/local/petra_build_autotools`.

```bash
$ sudo git clone https://github.com/sinsiway-official/petra-build-autotools.git /usr/local/petra_build_autotools
$ cd /usr/local/petra_build_autotools
$ sudo sh build_linux_x64_kernel_2.6.32.sh
```

If you encounter any issues during the installation, please try cleaning up by running `sudo sh clear.sh`` and then attempt the installation again.

## Post-Installation Steps

After running the script, you must add the printed environment variables to the **.bash_profile** of the account where you will be building the Petra source code. Then, you must apply the changes.

## Contact

If you have any other questions, please feel free to contact us at rnd-cipher@sinsiway.com at any time.