
# libtool-2.4.5.tar.gz
# m4-1.4.18.tar.gz
# automake-1.16.1.tar.gz

petra_tools_home=$(pwd)
petra_tools_source_dir=$petra_tools_home/src
petra_tools_install_dir=$petra_tools_home/install
petra_tools_binary_dir=$petra_tools_home/bin
petra_tools_library_dir=$petra_tools_home/lib
petra_tools_share_dir=$petra_tools_home/share

PATH=$petra_tools_binary_dir:$PATH
export PATH


[[ ! -d $petra_tools_source_dir ]] && mkdir $petra_tools_source_dir
[[ ! -d $petra_tools_install_dir ]] && mkdir $petra_tools_install_dir
[[ ! -d $petra_tools_binary_dir ]] && mkdir $petra_tools_binary_dir
[[ ! -d $petra_tools_library_dir ]] && mkdir $petra_tools_library_dir
[[ ! -d $petra_tools_share_dir ]] && mkdir $petra_tools_share_dir

download_package(){
    local package_name=$1
    local package_download_url=$2\
    
    wget --force-directories --no-check-certificate -O package.tar.gz $package_download_url
    
    
    local unzip_dir=$(tar tf package.tar.gz | head -1)
    tar xvf package.tar.gz
    [[ -f "package.tar.gz" ]] && rm -rf package.tar.gz
    [[ -d $petra_tools_source_dir/$package_name ]] && rm -rf $petra_tools_source_dir/$package_name
    mv $unzip_dir $petra_tools_source_dir/$package_name
        
}

#
# Install m4 tools
#
install_package_m4(){
    cd $petra_tools_home
    
    local package_version=1.4.18
    local package_name=m4-$package_version
    # https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz
    download_package $package_name https://ftp.gnu.org/gnu/m4/m4-$package_version.tar.gz
    cd $petra_tools_source_dir/$package_name
    
    # m4 configure
    ./configure --prefix=$petra_tools_install_dir/$package_name
    
    make
    make install

    bin_file_list="m4"

    for bin_file in $bin_file_list; do
        if [ ! -f "$petra_tools_install_dir/$package_name/bin/$bin_file" ]; then
            echo "not found $petra_tools_install_dir/$package_name/bin/$bin_file"
            echo "Error: Failed to build 'm4' tool."
            return 1
        fi
    done
    
    [[ -d $petra_tools_install_dir/$package_name/bin ]] && ln -sf $petra_tools_install_dir/$package_name/bin/* $petra_tools_binary_dir
    [[ -d $petra_tools_install_dir/$package_name/share ]] && cp -r $petra_tools_install_dir/$package_name/share/* $petra_tools_share_dir
    
    return 0    
}

#
# Install autoconf tools
#
install_package_autoconf(){
    cd $petra_tools_home
    
    local package_version=2.69
    local package_name=autoconf-$package_version
    # https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
    download_package $package_name https://ftp.gnu.org/gnu/autoconf/autoconf-$package_version.tar.gz
    cd $petra_tools_source_dir/$package_name
    
    # m4 configure
    ./configure --prefix=$petra_tools_install_dir/$package_name
    
    make
    make install

    bin_file_list="autoconf autoreconf autoheader autom4te"

    for bin_file in $bin_file_list; do
        if [ ! -f "$petra_tools_install_dir/$package_name/bin/$bin_file" ]; then
            echo "not found $petra_tools_install_dir/$package_name/bin/$bin_file"
            echo "Error: Failed to build 'automake' tool."
            return 1
        fi
    done
    
    [[ -d $petra_tools_install_dir/$package_name/bin ]] && ln -sf $petra_tools_install_dir/$package_name/bin/* $petra_tools_binary_dir
    [[ -d $petra_tools_install_dir/$package_name/share ]] && cp -r $petra_tools_install_dir/$package_name/share/* $petra_tools_share_dir
    
    return 0
}

#
# Install automake tools
#
install_package_automake(){
    cd $petra_tools_home
    
    local package_version=1.16.1
    local package_name=automake-$package_version
    # http://ftp.vim.org/ftp/gnu/automake/automake-1.16.1.tar.gz
    download_package $package_name http://ftp.vim.org/ftp/gnu/automake/automake-$package_version.tar.gz
    cd $petra_tools_source_dir/$package_name
    
    # m4 configure
    ./configure --prefix=$petra_tools_install_dir/$package_name
    
    make
    make install

    bin_file_list="automake aclocal"

    for bin_file in $bin_file_list; do
        if [ ! -f "$petra_tools_install_dir/$package_name/bin/$bin_file" ]; then
            echo "not found $petra_tools_install_dir/$package_name/bin/$bin_file"
            echo "Error: Failed to build 'automake' tool."
            return 1
        fi
    done
    
    [[ -d $petra_tools_install_dir/$package_name/bin ]] && ln -sf $petra_tools_install_dir/$package_name/bin/* $petra_tools_binary_dir
    [[ -d $petra_tools_install_dir/$package_name/share ]] && cp -r $petra_tools_install_dir/$package_name/share/* $petra_tools_share_dir
    
    return 0
}

#
# Install libtool tools
#
install_package_libtool(){
    cd $petra_tools_home
    
    local package_version=2.4.5
    local package_name=libtool-$package_version
    # https://ftp.gnu.org/gnu/libtool/libtool-2.4.5.tar.gz
    download_package $package_name https://ftp.gnu.org/gnu/libtool/libtool-$package_version.tar.gz
    cd $petra_tools_source_dir/$package_name
    
    # m4 configure
    ./configure --prefix=$petra_tools_install_dir/$package_name
    
    make
    make install

    bin_file_list="libtool libtoolize"

    for bin_file in $bin_file_list; do
        if [ ! -f "$petra_tools_install_dir/$package_name/bin/$bin_file" ]; then
            echo "not found $petra_tools_install_dir/$package_name/bin/$bin_file"
            echo "Error: Failed to build 'automake' tool."
            return 1
        fi
    done
    
    [[ -d $petra_tools_install_dir/$package_name/bin ]] && ln -sf $petra_tools_install_dir/$package_name/bin/* $petra_tools_binary_dir
    [[ -d $petra_tools_install_dir/$package_name/lib ]] && ln -sf $petra_tools_install_dir/$package_name/lib/* $petra_tools_library_dir
    [[ -d $petra_tools_install_dir/$package_name/share ]] && cp -r $petra_tools_install_dir/$package_name/share/* $petra_tools_share_dir


    return 0
}

function print_guide() {
    # Print out the guide
    echo
    echo
    echo "Petra Build System Tools has been installed successfully!"
    echo "You now need to set the environment variables. Please copy the following lines and paste them into your ~/.bash_profile file:"
    echo
    echo "**************************************************************************************************"
    echo
    echo "# Petra Build System Tools Home"
    echo "export PBST_HOME=/usr/local/petra_build_system_tools"
    echo "export PATH=\$PBST_HOME/bin:\$PATH"
    echo "export export ACLOCAL_PATH=\$PBST_HOME/share/aclocal"
    echo "export export AUTOM4TE_CFG=\$PBST_HOME/share/autoconf/autom4te.cfg"
    echo
    echo "**************************************************************************************************"
    echo
    echo "After adding these lines, start a new shell session or run the following command:"
    echo "source ~/.bash_profile"
}

main(){
    install_package_m4
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install 'm4' tool."
        return 1
    fi

    install_package_autoconf
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install 'autoconf' tool."
        return 1
    fi

    install_package_automake
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install 'automake' tool."
        return 1
    fi

    install_package_libtool
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install 'libtool' tool."
        return 1
    fi
    
    print_guide
}

main