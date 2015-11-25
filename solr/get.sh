cd "`dirname $0`"

function echo2 {
	echo [$*]
}
mkdir -p files/tmp/keystore

echo2 solr4.war
wget -q -c -O files/tmp/solr4.war https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco-solr4/5.0.d/alfresco-solr4-5.0.d-ssl.war

echo2 alfresco-solr4-config-ssl
wget -q -c -O files/tmp/alfresco-solr4-config-ssl.zip https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco-solr4/5.0.d/alfresco-solr4-5.0.d-config-ssl.zip


echo2 ssl stuff
for file in browser.p12 generate_keystores.sh keystore keystore-passwords.properties \
	ssl-keystore-passwords.properties ssl-truststore-passwords.properties ssl.keystore ssl.truststore
do
  wget -q -c -O files/tmp/keystore/$file http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/$file
done

