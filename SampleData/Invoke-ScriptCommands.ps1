# ## Test Update Schema
# .'.\src\Push-CsvToAzureADProvisioning.ps1' `
#     -Path '.\SampleData\csv-with-1000-records.csv' `
#     -TenantId 'saziatestaad.onmicrosoft.com' `
#     -ServicePrincipalId '995aed29-05e3-4f1a-883e-f17b023d5c81' `
#     #-ClientId 'e57a5d25-7fd7-4988-b185-f575eea5d1a9' -ClientCertificate (Get-ChildItem 'Cert:\CurrentUser\My\A5C63F1E5C07F6C20A3BA85513D0B82EF53E1925') `
#     -UpdateSchema
# exit

# ## Test Generation
# .'.\src\Push-CsvToAzureADProvisioning.ps1' `
#     -Path '.\SampleData\csv-with-1000-records.csv' `
#     -AttributeMapping @{
#         externalId = 'WorkerID'
#         name       = @{
#             familyName = 'LastName'
#             givenName  = 'FirstName'
#         }
#         active     = { $_.'WorkerStatus' -eq 'Active' }
#         userName   = 'UserID'
#     }
# exit

## Test Generation and Send Request to Azure AD
$AttributeMapping = Import-PowerShellDataFile '.\SampleData\AttributeMapping.psd1'
.'.\src\Push-CsvToAzureADProvisioning.ps1' `
    -Path '.\SampleData\csv-with-1000-records.csv' `
    -TenantId 'saziatestaad.onmicrosoft.com' `
    -ServicePrincipalId '995aed29-05e3-4f1a-883e-f17b023d5c81' `
    -AttributeMapping $AttributeMapping
exit