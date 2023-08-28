# Petra Build System Tools Installation Guide
## Overview
This document guides you through the installation process of Petra Build System Tools. You can use the script below to download and install the required packages (m4, autoconf, automake, libtool).

## Prerequisites

Linux environment
Basic Linux utilities such as wget, tar, make must be installed

## Required Packages and Versions
The installation script will automatically download and install the following packages and versions:

m4: Version 1.4.18
autoconf: Version 2.69
automake: Version 1.16.1
libtool: Version 2.4.5
These versions are specified in the script, and you can modify the script to install different versions if needed.

## Requirements

To run this script, you need sudo permissions. It is recommended to choose an arbitrary directory under /usr/local for the installation path. For example, you could use /usr/local/petra_build_autotools.

```bash
$ sudo git clone https://github.com/sinsiway-official/petra-build-autotools.git /usr/local/petra_build_autotools 
$ cd /usr/local/petra_build_autotools 
$ sudo sh build_linux_x64_kernel_2.6.32.sh
```

If you encounter any issues during the installation, try cleaning up by running sudo sh clear.sh and then attempt the installation again.

## Post-Installation Steps

After running the script, you must add the printed environment variables to the .bash_profile of the account where you will be building the Petra source code. Then, you must apply the changes.

## Environment Variable Settings
Once the script execution is complete, you need to set the environment variables. To do this, add the following lines to your ~/.bash_profile or ~/.bashrc file.

```bash
# Petra Build System Tools Home 
export PBST_HOME=/usr/local/petra_build_system_tools
export PATH=$PBST_HOME/bin:$PATH
export ACLOCAL_PATH=$PBST_HOME/share/aclocal
export AUTOM4TE_CFG=$PBST_HOME/share/autoconf/autom4te.cfg
```

To apply the environment variables, either start a new shell session or run the following command:

```bash
source ~/.bash_profile  # 또는 source ~/.bashrc
```

## Troubleshooting

If any issues arise during the installation, check the error messages within the script.
If a required package is not already installed, the script will fail to install that package. In this case, manually install the package first and then try again.

## Contact

If you have any other questions, please feel free to contact us at rnd-cipher@sinsiway.com at any time.
