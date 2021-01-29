echo "Removing server/ directory"
rm -rf server &&

echo "Creating fresh server/ directory"
mkdir server &&

if [ ! -f "spigot-*.jar" ]
then
    echo "Could not find spigot-*.jar"
    echo "Running ./update-server.sh"
    ./update-server
fi

echo "Copying spigot JAR into server/spigot.jar"
cp spigot-*.jar server/spigot.jar &&

echo "Starting server for first time..."
cd server &&
java -jar spigot.jar &&

echo "DONE"