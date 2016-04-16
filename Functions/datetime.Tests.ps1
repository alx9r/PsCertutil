Import-Module PsCertutil -Force

Describe 'Test-CuDateTime' {
    It 'correctly matches sample dates' {
        $dates = "$($PSCommandPath | Split-Path -Parent)\..\Resources\dateTimeSamples.txt" |
            Resolve-Path |
            Get-Content

        foreach ( $date in $dates )
        {
            if ( -not (Test-CuDateTime $date) )
            {
                throw $date
            }
        }
    }
}
Describe 'ConvertFrom-CuDateTime' {
    It 'correctly converts' {
        $s = 'Sat Mar 05 02:03:31 2016'

        $r = ConvertFrom-CuDateTime $s

        $r.Month | Should be 3
        $r.Day | Should be 5
        $r.Hour | Should be 2
        $r.Minute | Should be 3
        $r.Second | Should be 31
        $r.Year | Should be 2016
    }
    It 'converts sample dates without throwing' {
        $dates = "$($PSCommandPath | Split-Path -Parent)\..\Resources\dateTimeSamples.txt" |
            Resolve-Path |
            Get-Content

        foreach ( $date in $dates )
        {
            ConvertFrom-CuDateTime $date
        }
    }
}
