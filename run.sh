#/bin/bash

download_and_run(){
    OWNER=$1
    REPO=$2
    TYPE=$3
    TAG=$4

    echo "Downloading $TYPE with tag $TAG"

    case "$(uname -s)" in
    Darwin)
        echo 'Mac OS X'

        download_and_unzip $OWNER $REPO $TAG StandaloneOSX
        cd ./StandaloneOSX.app/Contents/MacOS
        chmod +x Unity-Netcode-Hello-World
        ./Unity-Netcode-Hello-World -mode $TYPE -logfile log-$TYPE.txt
        
        ;;

    Linux)
        echo 'Linux'
        download_and_unzip $OWNER $REPO $TAG StandaloneLinux64
        chmod +x StandaloneLinux64
        ./StandaloneLinux64 -mode $TYPE -logfile log-$TYPE.txt

        ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        echo 'MS Windows'

        download_and_unzip $OWNER $REPO $TAG StandaloneWindows
        ./StandaloneWindows.exe -mode $TYPE -logfile log-$TYPE.txt

        ;;

    *)
        echo 'Unsupported OS' 
        ;;
    esac

}

get_latest_release() {
  OWNER=$1
  REPO=$2
  curl --silent "https://api.github.com/repos/$OWNER/$REPO/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

download_and_unzip() {
    OWNER=$1
    REPO=$2
    TAG=$3
    ZIP_FILENAME=$4

    TMP_DIR="/tmp/$OWNER-$REPO-$TAG"
    if [ ! -d "$TMP_DIR" ]; then 
        echo "Creating $TMP_DIR"
        mkdir -p $TMP_DIR
    else
        echo "Directory $TMP_DIR already created"
    fi
    cd $TMP_DIR

    if ! [ -f "$TMP_DIR/${ZIP_FILENAME}.zip" ]; then
        URL="https://github.com/${OWNER}/${REPO}/releases/download/${TAG}/${ZIP_FILENAME}.zip"
        echo "Downloading ${URL}"
        curl -s -L -k "$URL" --output ${ZIP_FILENAME}.zip
        unzip $ZIP_FILENAME.zip
    else
        echo "File ${ZIP_FILENAME}.zip already downloaded"
    fi

}


TYPE="${1:-server}"
COUNT="${2:-1}"
OWNER="${3:-humbertodias}"
REPO="${4:-unity-netcode-helloworld}"
LATEST_TAG=$(get_latest_release $OWNER $REPO)

for (( i=1; i <= $COUNT; i++ ));
do 
  echo "Instance $i"
  download_and_run $OWNER $REPO $TYPE $LATEST_TAG &
done

