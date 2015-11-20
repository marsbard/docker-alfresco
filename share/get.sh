cd "`dirname $0`"

mkdir -p files/tmp
wget -c -O files/tmp/share.war https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/share/5.0.d/share-5.0.d.war

