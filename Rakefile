HOST = 'localhost'
MASTER_PORT = '2200'
CL1_PORT = '2201'
CL2_PORT = '2202'
CL3_PORT = '2203'
USER = 'root'
SSH = "ssh -t -A "
SCP = "scp -r "


task :deploy do
	sh "ssh -p #{MASTER_PORT} -i ~/.ssh/id_puppettest #{USER}@#{HOST} 'rm -rf /etc/puppet/modules/oracle_java'"
	sh "#{SCP} -P #{MASTER_PORT} -i ~/.ssh/id_puppettest ~/projects/puppet/puppet-oracle-java #{USER}@#{HOST}:/etc/puppet/modules/oracle_java"
	sh "#{SCP} -P #{MASTER_PORT} -i ~/.ssh/id_puppettest site.pp #{USER}@#{HOST}:/etc/puppet/manifests/"
end

task :client1 do
	sh "ssh -p #{CL1_PORT} #{USER}@#{HOST} 'puppet agent --server puppetmaster --test'" do | ok,
		status|
		puts case status.exitstatus
			when 0 then "Client is up to date."
			when 1 then "Client couldn't complete manifest."
			when 2 then "Puppet made changes."
			when 4 then "Puppet found errors."
		end
	end
end

task :client2 do
	sh "ssh -p #{CL2_PORT} #{USER}@#{HOST} 'puppet agent --server puppetmaster --test'" do | ok,
		status|
		puts case status.exitstatus
			when 0 then "Client is up to date."
			when 1 then "Client couldn't complete manifest."
			when 2 then "Puppet made changes."
			when 4 then "Puppet found errors."
		end
	end
end

task :client3 do
	sh "ssh -p #{CL3_PORT} #{USER}@#{HOST} 'puppet agent --server puppetmaster --test'" do | ok,
		status|
		puts case status.exitstatus
			when 0 then "Client is up to date."
			when 1 then "Client couldn't complete manifest."
			when 2 then "Puppet made changes."
			when 4 then "Puppet found errors."
		end
	end
end

task :clients do
	sh "ssh -p #{CL1_PORT} #{USER}@#{HOST} 'puppet agent --server puppetmaster --test'" do | ok,
		status|
		puts case status.exitstatus
			when 0 then "Client is up to date."
			when 1 then "Client couldn't complete manifest."
			when 2 then "Puppet made changes."
			when 4 then "Puppet found errors."
		end
	end
	sh "ssh -p #{CL2_PORT} #{USER}@#{HOST} 'puppet agent --server puppetmaster --test'" do | ok,
		status|
		puts case status.exitstatus
			when 0 then "Client is up to date."
			when 1 then "Client couldn't complete manifest."
			when 2 then "Puppet made changes."
			when 4 then "Puppet found errors."
		end
	end
	sh "ssh -p #{CL3_PORT} #{USER}@#{HOST} 'puppet agent --server puppetmaster --test'" do | ok,
		status|
		puts case status.exitstatus
			when 0 then "Client is up to date."
			when 1 then "Client couldn't complete manifest."
			when 2 then "Puppet made changes."
			when 4 then "Puppet found errors."
		end
	end
end