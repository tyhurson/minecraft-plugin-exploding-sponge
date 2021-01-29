if ! command -v mvn &> /dev/null
then
    echo "mvn: command not found"
    echo "Ensure that you have Apache Maven installed on this machine before running this script"
    exit
fi

mkdir -p server/plugins

echo "Building project..."
mvn package &&

echo "Copying plugin JAR to server/plugins/"
cp target/minecraft-plugin-exploding-sponge-*.jar server/plugins &&

echo "DONE"