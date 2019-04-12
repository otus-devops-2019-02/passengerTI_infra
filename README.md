# passengerTI_infra
passengerTI Infra repository

## ДЗ №5: terraform-1
 Определена input переменная для приватного ключа
 Определена input переменная для задания зоны
 Отформатированны все конфигурационные файлы с помощь terramorm fmt
 Добавлен файл terraform.tfvars.example

## ДЗ №4: packer-base
 Установлен packer v.1.3.5
 Установлен ADC
 Создан packer template
 Выполнен packer build
 Образ VM успешно создан

## ДЗ #3: cloud-testapp
 testapp_IP = 35.187.118.194
 testapp_port = 9292

gcloud compute instances create reddit-app \
	--boot-disk-size=10GB \
	--image-family ubuntu-1604-lts \
	--image-project=ubuntu-os-cloud \
	--machine-type=g1-small \
	--tags puma-server \
	--metadata startup-script=startup_script.sh
	--restart-on-failure

gcloud compute firewall-rules create default-puma-server  \
 	--network default \
    --action allow \
    --direction ingress \
    --rules tcp:9292 \
    --source-ranges 0.0.0.0/0 \
    --priority 1000 \
    --target-tags puma-server

gcloud compute firewall-rules delete default-puma-server

## ДЗ №2: cloud-bastion

Servers

 bastion_IP = 104.155.3.193
 someinternalhost_IP = 10.132.0.5

One-line connect to someinternalhost

 ssh -t -i ~/.ssh/appuser -A appuser@104.155.3.193 ssh 10.132.0.5

Alias connect to someinteralhost

 ~/.ssh/config

 Host bastion
   User appuser
   HostName 104.155.3.193
   ForwardAgent yes
   IdentityFile ~/.ssh/appuser

 Host someinternalhost
   User appuser
   HostName 10.132.0.5
   Port 22
   ProxyCommand ssh bastion nc -w 120 %h %p
   ForwardAgent yes
   IdentityFile ~/.ssh/appuser
