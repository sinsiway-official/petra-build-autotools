petra_tools_home=$(pwd)
petra_tools_source_dir=$petra_tools_home/src
petra_tools_install_dir=$petra_tools_home/install
petra_tools_binary_dir=$petra_tools_home/bin
petra_tools_share_dir=$petra_tools_home/share

[[ -d $petra_tools_source_dir ]] && rm -rf $petra_tools_source_dir
[[ -d $petra_tools_install_dir ]] && rm -rf $petra_tools_install_dir
[[ -d $petra_tools_binary_dir ]] && rm -rf $petra_tools_binary_dir
[[ -d $petra_tools_share_dir ]] && rm -rf $petra_tools_share_dir