function Sample_1_Generate_Gost3410_2012_KeyPair {
    param (
        [parameter(Mandatory=$false)] [System.String] $PrKFilePath = "prk.pem",
        [parameter(Mandatory=$false)] [System.String] $PbKFilePath = "pbk.pem"
    )

    openssl genpkey -outform PEM -algorithm gost2012_256 -pkeyopt paramset:TCA -out $PrKFilePath
    openssl req -new -key $PrKFilePath -subj "/" -noout -pubkey -outform PEM -out $PbKFilePath
}

function Sample_3_Sign_And_Export_RawSignature_ToFile {
    param (
        [parameter(Mandatory=$false)] [System.String] $PrKFilePath = "prk.pem",
        [parameter(Mandatory=$false)] [System.String] $ToBeSignedFilePath = "to_be_signed.txt",
        [parameter(Mandatory=$false)] [System.String] $RAWSigFilePath = "to_be_signed.txt.sig"
    )

    openssl dgst -sign $PrKFilePath -md_gost12_256 -binary -out $RAWSigFilePath $ToBeSignedFilePath
}

function Sample_4_Verify_RawSignature_ToFile {
    param (
        [parameter(Mandatory=$false)] [System.String] $PbKFilePath = "pbk.pem",
        [parameter(Mandatory=$false)] [System.String] $ToBeSignedFilePath = "to_be_signed.txt",
        [parameter(Mandatory=$false)] [System.String] $RAWSigFilePath = "to_be_signed.txt.sig"
    )

    $ans = openssl dgst -verify $PbKFilePath -md_gost12_256 -signature $RAWSigFilePath $ToBeSignedFilePath
    switch ($ans) {
        "Verified OK" {
            Write-Host -ForegroundColor Green -Object "Signature Verified"
        }

        default {
            Write-Host -ForegroundColor Red -Object "Signature NOT Verified"
        }
    }
}

function Sample_5_GenerateCertRequest {
    #TODO
}

function Sample_6_GenerateSelfSignedCertificate {
    #TODO
}

function Sample_7_ExportPfx {
    #TODO
}

function Sample_8_ImportPfx {
    #TODO
}

function Sample_9_SignCertRequest {
    #TODO
}

function Sample_10_Create_Attached_CAdES_BES {
    #TODO
}

function Sample_11_Verify_Attached_CAdES_BES {
    #TODO
}

function Sample_12_BuildCertChain {
    #TODO
}

function Sample_13_SignCRL {
    #TODO
}

function Sample_14_CreateOCSPResponse {
    #TODO
}

Sample_1_Generate_Gost3410_2012_KeyPair
#Sample_2 is not necessary / второй пример с чтением открытого/закрытого ключа, на мой взгляд, не нужен. Если очень нужно, можно воспользоваться cat prk.pem
Sample_3_Sign_And_Export_RawSignature_ToFile
Sample_4_Verify_RawSignature_ToFile