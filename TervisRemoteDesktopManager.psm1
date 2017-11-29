function Invoke-CreateOracleLinuxRDMSessions {
    $OracleHosts = Get-TervisHostGroupCNAMEAndA -HostGroupName Oracle
    
    #$Hostname = "EBSDB-PRD"
    #$Environment = "Production"
    
    $RDMTemplate = Get-RDMTemplate | where name -eq "Linux Standard"
    $OracleHosts | %{
        $RDMSession = New-RDMSession -TemplateID $RDMTemplate.ID -Host $_.HostName -Name $_.HostName -Type putty -Group $_.EnvironmentName
        Set-RDMSession -Session $RDMSession 
        Update-RDMUI
        Set-RDMSessionProperty -ID $RDMSession.ID -Path MetaInformation -Property OS -Value Linux
    }
}

