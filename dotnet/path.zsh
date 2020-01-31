export PATH="$PATH:/Users/bhavesh/.dotnet/tools"

SONAR_LOGIN="<set sonarqube api key here>"

dot-scan() {
    PROJECT=$1
    dotnet-sonarscanner begin /k:"$PROJECT" /d:sonar.host.url="http://localhost:9000" /d:sonar.login="$SONAR_LOGIN"
}

dot-rebuild() {
    msbuild /t:Rebuild
}

dot-endscan() {
    dotnet-sonarscanner end /d:sonar.login="$SONAR_LOGIN"
}