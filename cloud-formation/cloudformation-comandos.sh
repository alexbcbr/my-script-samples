#!/bin/bash
# init
function pause(){
   read -p "$*"
}
 
# ...
# call it
pause 'Pressione [Enter] para continuar com o processo de cloudformation...'
aws cloudformation validate-template --template-body file:///Users/alexbcbr/Desktop/create-bucket.json

pause 'criar o stack'
aws cloudformation create-stack --stack-name alexcxs --template-body file:///Users/alexbcbr/Desktop/create-bucket.json \
 						     --parameters ParameterKey=NomeDoBucket,ParameterValue=alex1234a

pause 'apagar stack'
aws cloudformation delete-stack --stack-name alexcxs

pause 'listar stacks'
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE

pause 'fim'
