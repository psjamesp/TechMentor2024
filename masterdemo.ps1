Get-ExecutionPolicy 

Set-ExecutionPolicy Unrestricted -Force

.\demo1.ps1

.\demo2.ps1

#remove it if we need to
remove-item Cert:\CurrentUser\my\ 

.\demo3_MakeCert.ps1

#Check for certs
Get-ChildItem cert:\CurrentUser\my -codesigning

#Signs the cert
.\SignCode.ps1 -File .\demo2.ps1

code .\demo2.ps1

.\demo2.ps1

#Remoting using Winrm
invoke-command -ComputerName srv01,srv02 -ScriptBlock {get-service bits}
Enter-PSSession -ComputerName srv01 -Credential

#remoting using SSH
invoke-command -HostName srv01,srv02 -ScriptBlock {get-service bits}   
Enter-PSSession -HostName srv01 -UserName

#JEA
Just enough administration