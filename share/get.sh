cd "`dirname $0`"

mkdir -p files/tmp/keystore

wget -c -O files/tmp/share.war https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/share/5.0.d/share-5.0.d.war




for file in browser.p12 generate_keystores.sh keystore keystore-passwords.properties \
	ssl-keystore-passwords.properties ssl-truststore-passwords.properties ssl.keystore ssl.truststore
do
  wget -c -O files/tmp/keystore/$file http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/$file
done

