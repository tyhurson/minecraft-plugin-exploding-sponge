if ! command -v java &> /dev/null
then
    echo "java: command not found"
    echo "Ensure that you have Java installed on this machine before running this script"
    exit
fi

echo "Creating build/ directory"
mkdir -p build &&

echo "Copying BuildTools.jar to build/BuildTools.jar"
cp BuildTools.jar build &&

echo "Running BuildTools.jar. This may take several minutes."
cd build/ &&
java -jar BuildTools.jar --rev latest -o build &&
cd .. &&

echo "Copying spigot JAR to current directory"
cp build/build/spigot-*.jar . &&

echo "Moving spigot JAR to server/spigot.jar"
mkdir -p server &&
cp spigot-*.jar server/spigot.jar &&

echo "Installing spigot JAR into internal Maven repository"
export JAR_FILE=$(ls spigot-*.jar)
rm -rf lib &&
mkdir lib &&
mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file -Dfile=$JAR_FILE -DgroupId=org.spigotmc -DartifactId=spigot-api -Dversion=1.0 -Dpackaging=jar -DlocalRepositoryPath=lib &&

echo "DONE"