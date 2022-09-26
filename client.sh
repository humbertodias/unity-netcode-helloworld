#/bin/bash
cd /tmp
curl -s -L --output - "https://github.com/humbertodias/unity-netcode-helloworld/releases/download/v0.1/StandaloneOSX.zip" | bsdtar -xf-


case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
     
     cd ./StandaloneOSX.app/Contents/MacOS
     chmod +x Unity-Netcode-Hello-World
     ./Unity-Netcode-Hello-World -mlapi client
     
     ;;

   Linux)
     echo 'Linux'
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'MS Windows'
     ;;

   *)
     echo 'Unsupported OS' 
     ;;
esac