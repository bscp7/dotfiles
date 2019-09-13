#!/bin/sh

hello() {
  echo 'hello...'
}

encode64() {
    echo -ne "$1" | base64
}

decode64() {
    echo -ne "$1" | base64 --decode
}

zprof() {
    for i in $(seq 1 10);
    do
        /usr/bin/time /bin/zsh -i -c exit; 
    done;
}

pcat() {
    pygmentize -f terminal256 -O style=native -g
}


wimi() {
  ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
  echo ${ip} | pbcopy
  echo ${ip} "<<ip copied to to the clipboard >>"
}

# Switch Azure subscription
az-dev() {
  echo "Switching to Mojio Development Subscription"
  az account set --subscription "76a754b2-2fb4-43f0-8bb4-80258e8cd539"
  az account show
}

az-prod() {
  echo "Switching to Mojio Production Subscription"
  az account set --subscription "9fd76bc7-4936-413a-8c51-5080abd62dbe"
  az account show
}

az-cost() {
  echo "Switching to Mojio Cost Subscription"
  az account set --subscription "e02f1b57-6a2a-4fb2-afdb-ab3d15070027"
  az account show
}

az-rg-lock() {
  echo "Adding lock with name 'failsafe' on resource group " $1
  az group lock create --name failsafe --lock-type CanNotDelete --resource-group $1
}

az-rg-unlock() {
  echo "Deleting lock named as 'failsafe' from resource group " $1
  az group lock delete --name failsafe --resource-group $1
}


# Thycotic shortcuts
t-client(){
  python ThycoticHelper.py $*
}

t-cf-apikey() {
  python ThycoticHelper.py --secret "CloudFlare-GlobalAPIKey" --copy
}

t-cf-cakey() {
  python ThycoticHelper.py --secret "CloudFlare-OriginCAKey" --copy
}

t-cloudvm() {
  python ThycoticHelper.py --secret "PersonalCloudDesktop" --copy
}

show-service() {
  name=$1
  domain='moj.io'
  outputfile=$(mktemp)
  echo -e 'output file: ' $outputfile
  urls=(api identity push tcu services web mss ccportal)
  for url in ${urls};
  do
    fqdn=${name}-${url}.${domain}
    # dig
    out1=$(dig +short ${fqdn} | head -n1)

    if [[ ${url} == 'api' || ${url} == 'identity' || ${url} == 'push' ]]; then
      # curl
      curloutput=$(curl -s https://${fqdn} --connect-timeout 10)
      curlversion=$(echo ${curloutput} | jq -r '.Version')
      curlstatus=$(echo ${curloutput} | jq -r '.Status')
      echo $fqdn ' -> ' $out1 ' [' $curlversion ' / ' $curlstatus ']' >> $outputfile
    else
      echo $fqdn ' -> ' $out1  >> $outputfile
    fi
    
    echo -n '!'
  done
  echo '\n'
  cat ${outputfile}
}

internal_delete_alert() {
  alertId=$1
  resourceGroup=$2
  echo "Alert:" ${alertId}
  echo "ResourceGroup:" ${resourceGroup}
  az-rg-unlock ${resourceGroup}
  echo "\tDeleting:" ${alertId}
  output=$(az monitor metrics alert delete --ids ${alertId})
  echo ${output}
  az-rg-lock ${resourceGroup}
}

az-alert-delete() {
  alertName=$1
  echo "Searching alert ${alertName}"
  output=$(az monitor metrics alert list --query "[?starts_with(name, '$alertName')].[id, resourceGroup]" --output tsv)
  alertId=$(echo $output | cut -d$'\t' -f1)
  resourceGroup=$(echo $output | cut -d$'\t' -f2)
  [[ -n ${alertId} ]] && internal_delete_alert ${alertId} ${resourceGroup} || echo "Alert not found"
}

az-uploadfile() {
  filename=$1
  filesharename='bhaveshpfileshare'
  filesharepath='files'
  az storage file upload --share-name $filesharename --path $filesharepath --source $filename
}

az-downloadfile() {
  filesharepath=$1
  filesharename='bhaveshpfileshare'
  az storage file download --share-name $filesharename --path $filesharepath
}
