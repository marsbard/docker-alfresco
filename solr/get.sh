cd "`dirname $0`"

mkdir -p files/tmp

wget -c -O files/tmp/solr4.war https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco-solr4/5.0.d/alfresco-solr4-5.0.d-ssl.war
