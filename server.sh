#/bin/bash
cd /tmp

case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'

     curl -s -L --output - "https://github.com/humbertodias/unity-netcode-helloworld/releases/download/v0.1/StandaloneOSX.zip" | bsdtar -xf-

     cd ./StandaloneOSX.app/Contents/MacOS
     chmod +x Unity-Netcode-Hello-World
     ./Unity-Netcode-Hello-World -mlapi server
     
     ;;

   Linux)
     echo 'Linux'

     curl -s -L "https://github.com/humbertodias/unity-netcode-helloworld/releases/download/v0.1/StandaloneLinux64.zip" --output StandaloneLinux64.zip
     unzip StandaloneLinux64.zip

     cd StandaloneLinux64
     chmod +x StandaloneLinux64
     ./StandaloneLinux64 -mlapi server

     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'MS Windows'
     ;;

   *)
     echo 'Unsupported OS' 
     ;;
esac