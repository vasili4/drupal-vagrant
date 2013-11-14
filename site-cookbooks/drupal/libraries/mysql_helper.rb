module MysqlHelper
	def self.dump_file_cmd(filename, node)
		"\"#{node['mysql']['mysql_bin']}\" -u root #{node['mysql']['server_root_password'].empty? ? '' : '-p' }\"#{node['mysql']['server_root_password']}\" < #{filename}"
	end
end