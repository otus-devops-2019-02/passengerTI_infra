# passengerTI_infra
passengerTI Infra repository

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
