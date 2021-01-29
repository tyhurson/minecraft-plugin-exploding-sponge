if ! command -v java &> /dev/null
then
    echo "java: command not found"
    echo "Ensure that you have Java installed on this machine before running this script"
    exit
fi

if [ ! -d server ]
then
    echo "Creating server/ directory"
    mkdir server

    if [ ! -f "spigot-*.jar" ]
    then
        echo "Could not find spigot-*.jar"
        echo "Running ./update-server.sh for the first time"
        ./update-server
    else
        cp spigot-*.jar server/spigot.jar
    fi
fi

echo "Starting server"
cd server &&
java -jar spigot.jar &&

echo "DONE"