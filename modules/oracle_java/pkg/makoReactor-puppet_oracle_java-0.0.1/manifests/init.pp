# Class: oracle_java
#
# Installs Oracle JDK or JRE 1.6 or 1.7. Main java directories will be install in /usr/lib/jvm.
#
# Params:
# ---------
#	$type 		- jdk or jre
#	$arc		- i586 or x64
#	$version	- version of java package
#	$os			- should only be linux for now
#
# It is import that you match the params with the java package you downloaded from oracle.
#
# For example, if you downloaded the ‘jdk-7u21-linux-x64.tar.gz’, your params should be:
#
# type		=> “jdk”
# arc 		=> “x64“
# version	=> “7u21“
# os		=> “linux”
#
# Usage:
# --------
# class { "oracle_java":
#	type 		=> "<type>",
#	arc 		=> "<arc>,
#	version		=> "<version>",
#	os			=> "linux",
# }

class oracle_java (
	$type 		= "jdk",
	$arc 		= "x64",
	$version	= "7u21",
	$os			= "linux"
	)
{
	require oracle_java::params

	file { "$oracle_java::params::jvm_path":
		ensure 	=> directory,
		mode	=> '755',
		owner	=> 'root',
	}

	file { "${oracle_java::params::jvm_path}/${oracle_java::params::java_file}":
		ensure 	=> present,
		source	=> "puppet:///modules/oracle_java/${oracle_java::params::java_file}",
		require	=> File[ $oracle_java::params::jvm_path ],
	}

	exec { "untar_jdk":
		command	=> $oracle_java::params::unrar_command,
		path 	=> "/bin:/sbin:/usr/bin:/usr/sbin",
		unless	=> "test -e ${oracle_java::params::jvm_path}/${oracle_java::params::java_dir}",
		cwd		=> $oracle_java::params::jvm_path,
		require => File[ "${oracle_java::params::jvm_path}/${oracle_java::params::java_file}" ],
	}

	exec {'java_link':
		command	=> $oracle_java::params::exec_javalink,
		path 	=> "/bin:/sbin:/usr/bin:/usr/sbin",
		require	=> Exec [ "untar_jdk" ]
	}

	exec {'javaws_link':
		command	=> $oracle_java::params::exec_javawslink,
		path 	=> "/bin:/sbin:/usr/bin:/usr/sbin",
		require	=> Exec [ "untar_jdk" ]
	}

	exec {'javac_link':
		command	=> $oracle_java::params::exec_javaclink,
		path 	=> "/bin:/sbin:/usr/bin:/usr/sbin",
		require	=> Exec [ "untar_jdk" ]
	}


}