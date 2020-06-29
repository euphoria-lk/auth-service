$pwd = ConvertTo-SecureString -String "euphoria" -AsPlainText

$cert = New-SelfSignedCertificate -Type Custom -KeyUsageProperty Sign -KeyUsage DigitalSignature -KeyAlgorithm RSA -KeyLength 2048 -Subject "Euphoria DigitalSignature" -KeyFriendlyName "Euphoria" -KeyDescription "Digital Signature to sign tokens for Euphoria" -CertStoreLocation "Cert:\CurrentUser\My"

Export-Certificate -Cert $cert -FilePath .\euphoria-public.cer

Export-PfxCertificate -Cert $cert -FilePath .\euphoria-private.pfx -Password $pwd