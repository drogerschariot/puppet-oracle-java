# Class: oracle_java::params
#
# Declares distro specific variables for oracle_java class. 

class oracle_java::params {

	$java_dir = "${type}-${version}"
	$jvm_path = "/usr/lib/jvm"

	if $version =~ /^[6][a-z0-9_-]{2,10}$/ {
		$java_file = "${type}-${version}-${os}-${arc}.bin"
		$unrar_command = "chmod +x ${java_file} && ./${java_file} && mv ${type}1.6* ${java_dir}"
	}
	elsif $version =~ /^[7][a-z0-9_-]{2,10}$/ {
		$java_file = "${type}-${version}-${os}-${arc}.tar.gz"
		$unrar_command = "mkdir ${java_dir} && tar -zxf ${java_file} -C ${java_dir} --strip-components 1"
	}
	else {
		fail("Not a supported verion of Java. \$version needs to be 1.6 or 1.7! ")
	}
	

	case $::operatingsystem {
		Ubuntu, Debian, CentOS: {
			$exec_javalink = "update-alternatives --install /usr/bin/java java ${jvm_path}/${java_dir}/bin/java 1 && update-alternatives --set java ${jvm_path}/${java_dir}/bin/java"
			$exec_javawslink = "update-alternatives --install /usr/bin/javaws javaws ${jvm_path}/${java_dir}/bin/javaws 1 && update-alternatives --set javaws ${jvm_path}/${java_dir}/bin/javaws"
			$exec_javaclink = "update-alternatives --install /usr/bin/javac javac ${jvm_path}/${java_dir}/bin/javac 1 && update-alternatives --set javac ${jvm_path}/${java_dir}/bin/javac"
		}
		default: {
			# nothing for now...
		}
	}
}
