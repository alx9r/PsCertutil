function Test-CuDateTime
{
    [CmdletBinding()]
    param
    (
        [Parameter(Position = 1,
                   ValueFromPipeline = $true,
                   ValueFromPipelineByPropertyName = $true,
                   Mandatory = $true)]
        [string]
        $DateString
    )
    process
    {
        if ( $DateString -eq 'EMPTY' )
        {
            return $true
        }
        try
        {
            [datetime]::Parse($DateString)
        }
        catch
        {
            return $false
        }
        return $true
    }
}
function ConvertFrom-CuDateTime
{
    [CmdletBinding()]
    [OutputType([DateTime])]
    param
    (
        [Parameter(Position = 1,
                   ValueFromPipeline = $true,
                   ValueFromPipelineByPropertyName = $true,
                   Mandatory = $true)]
        [string]
        $DateString
    )
    process
    {
        if ( $DateString -eq 'EMPTY' )
        {
            return
        }

        [datetime]::Parse($DateString)
    }
}
