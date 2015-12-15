
default['horizon']['home'] = "#{ENV['SYSTEMDRIVE']}\\Program Files\\VMware\\VMware View\\Server"
default['horizon']['options'] = '/s /v"/qn VDM_SERVER_INSTANCE_TYPE=1 FWCHOICE=1 VDM_SERVER_RECOVERY_PWD=MY_Recovery_Password VDM_SERVER_RECOVERY_PWD_REMINDER=PW"'
default['horizon']['package'] = "VMware-viewconnectionserver-x86_64-6.2.0-3005368.exe"
default['horizon']['installerPath'] = "\\\\path\\to\\installer\\VMware-viewconnectionserver-x86_64-6.2.0-3005368.exe"
default['horizon']['installerLocal'] = "c:\\Chef\\VMware-viewconnectionserver-x86_64-6.2.0-3005368.exe"
default['horizon']['sslPath'] = "\\\\path\\to\\ssl cert\\vdi.pfx"
default['horizon']['sslCert'] = "vdi.pfx"
default['horizon']['sslLocalPath'] = "c:\\Chef\\vdi.pfx"
default['horizon']['pfx_password'] = "My_SSL_Password"


