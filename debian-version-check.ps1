$hosts = Get-Content ".\debian_hosts.txt"
$result = @()

foreach ($machine in $hosts) {
    try {
        # Pobieramy krótką wersję Debiana z /etc/debian_version
        $versionRaw = & ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$machine "cat /etc/debian_version"
        
        # Usuwamy białe znaki
        $version = $versionRaw.Trim()

        $result += [PSCustomObject]@{
            Host    = $machine
            Version = $version
        }
    }
    catch {
        $err = $_
        Write-Warning "Błąd połączenia z ${machine}: ${err}"
        $result += [PSCustomObject]@{
            Host    = $machine
            Version = "Błąd połączenia"
        }
    }
}

# Eksport do CSV
$result | Export-Csv "debian_versions.csv" -NoTypeInformation
