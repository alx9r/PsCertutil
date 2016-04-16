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
        $s = '2015-02-14 3:09 PM'

        $r = ConvertFrom-CuDateTime $s

        $r.Month | Should be 2
        $r.Day | Should be 14
        $r.Hour | Should be 15
        $r.Minute | Should be 9
        $r.Second | Should be 0
        $r.Year | Should be 2015
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
