#create Directory
file {'/home/projects':
	ensure => directory,
	owner => "vagrant",
	group => "vagrant",
	mode => "750", 
	
}


#--------------------------------------------------------------------


#installing things

############################# Apache ######################################
class{'apache':
	
}

apache::vhost{'192.168.121.132':
	port => '80',
	docroot => '/var/www/',
	ssl => true ,

}


##################################### MySQL #########################
class { '::mysql::server':
  root_password    => 'nojoke',
  override_options => { 'mysqld' => { 'max_connections' => '1024' } }
}



##########################################changes