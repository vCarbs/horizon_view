#
# Cookbook Name:: horizon_view
# Recipe:: default
#
# Copyright 2015, @vCarbs_
#
# All rights reserved - Do Not Redistribute
#

remote_file node['horizon']['sslLocalPath'] do
	source node['horizon']['sslPath']
end

powershell_script "Install_SSL" do
  ActivationFile = "C:\\chef\\ssl_installed.txt"
  code <<-EOH 
     	$FolderPath = "C:\\chef\\"

		If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

		{   
		$arguments = "& '" + $myinvocation.mycommand.definition + "'"
		Start-Process powershell -Verb runAs -ArgumentList $arguments
		Break
		}

		$pw = ConvertTo-SecureString -String "My_SSL_Password" -Force -AsPlainText
		Import-PfxCertificate -FilePath C:\\chef\\vdi.pfx Cert:\\LocalMachine\\My -Password $pw -Exportable
      	Echo "VDI Certificate Installed" >> $FolderPath\\ssl_installed.txt

    EOH
  not_if { File.exists?(ActivationFile) }
end

remote_file node['horizon']['installerLocal'] do
	source node['horizon']['installerPath']
end

windows_package "Horizon_View" do 
  package_name node['horizon']['package']
  source node['horizon']['installerLocal']
  options node['horizon']['options']
  installer_type :custom
  action :install
end

service "wsbroker" do
  action [ :enable, :start ]
end
