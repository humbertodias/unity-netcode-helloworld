#/bin/bash

function download_and_run(){

    TYPE="${1:-server}"
    TAG="${2:-v0.1}"

    tmp_dir=$(mktemp -d -t ci-XXXXXXXXXX)
    cd $tmp_dir

    case "$(uname -s)" in

    Darwin)
        echo 'Mac OS X'

        curl -s -L --output - "https://github.com/humbertodias/unity-netcode-helloworld/releases/download/${TAG}/StandaloneOSX.zip" | bsdtar -xf-

        cd ./StandaloneOSX.app/Contents/MacOS
        chmod +x Unity-Netcode-Hello-World
        ./Unity-Netcode-Hello-World -mlapi $TYPE
        
        ;;

    Linux)
        echo 'Linux'

        curl -s -L "https://github.com/humbertodias/unity-netcode-helloworld/releases/download/${TAG}/StandaloneLinux64.zip" --output StandaloneLinux64.zip
        unzip StandaloneLinux64.zip
        rm StandaloneLinux64.zip
        chmod +x StandaloneLinux64
        ./StandaloneLinux64 -mlapi $TYPE

        ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        echo 'MS Windows'

        curl -s -L -k "https://github.com/humbertodias/unity-netcode-helloworld/releases/download/${TAG}/StandaloneWindows.zip" --output StandaloneWindows.zip
        unzip StandaloneWindows.zip
        rm StandaloneWindows.zip
        ./StandaloneWindows.exe -mlapi $TYPE

        ;;

    *)
        echo 'Unsupported OS' 
        ;;
    esac

    rm -rf $tmp_dir

}

download_and_run server v0.2