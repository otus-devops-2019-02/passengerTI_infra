#!/usr/bin/perl

# Travis flag
# 1 - For Travis verify
# 0 - For teacher verify
my $isTravis = 1;

my($app_ip,$db_ip);

if($isTravis){
    ($app_ip,$db_ip) = ("34.76.98.231","35.241.228.18");
}
else{
    my @hosts = `gcloud compute instances list | awk '{print $1}'`;

    for(my $i = 1; $i <= $#hosts; $i++){

	    $hosts[$i] =~ /^reddit-(\w+)/;
	    my $group = $1;
	    $hosts[$i] =~ /(\d+.\d+.\d+.\d+)\s+\bRUNNING/;
	    my $ip = $1;
	
	    if($group eq 'app'){
		$app_ip = $ip;
	    }
	    if($group eq 'db'){
		$db_ip = $ip;
	    }
	}
}


	print qq*
	{
	    "_meta": {
	        "hostvars": {
	            "appserver": {
	                "ansible_host": "$app_ip"
	            },
	            "dbserver": {
	                "ansible_host": "$db_ip"
	            }
	        }
	    },
	    "all": {
	        "children": [
	            "app",
	            "db"
	        ]
	    },
	    "app": {
	        "hosts": [ "appserver" ]
	    },
	    "db": {
	        "hosts": [ "dbserver" ]
	    }
	}
	*;




