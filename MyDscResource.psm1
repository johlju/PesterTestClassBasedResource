Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath 'HelperFunctions.psm1') -Force

[DscResource()]
class MyDscResource
{
    [DscProperty(Mandatory)]
    [System.String[]]
    $DatabaseName

    [DscProperty(Key)]
    [System.String]
    $SQLServer

    [MyDscResource] Get()
    {
        Test-HelperFunction

        return $null
    }

    [Void] Set()
    {
    }

    [Bool] Test()
    {
        return $true
    }
}
