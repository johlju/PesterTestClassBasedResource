# PesterTestClassBasedResource

This is a mockup for testing a PowerShell DSC class-based resource

## 1. Clone the repository

To run this example, do the following.

```powershell
git clone https://github.com/johlju/PesterTestClassBasedResource
cd PesterTestClassBasedResource
```

## 2. Run the Pester test

### First run

```powershell
Invoke-Pester .\MyDscResource.Tests.ps1
```

Gives expected successful result.

```plaintext
Executing all tests in .\MyDscResource.Tests.ps1

Executing script .\MyDscResource.Tests.ps1

  Describing MyDscResource\Get()

    Context When the Get method is called
      [+] Should not throw an error 1.13s
Tests completed in 1.13s
Tests Passed: 1, Failed: 0, Skipped: 0, Pending: 0, Inconclusive: 0
```

### Second run

```powershell
Invoke-Pester .\MyDscResource.Tests.ps1
```

The test throws an error.

```plaintext
Executing all tests in .\MyDscResource.Tests.ps1

Executing script .\MyDscResource.Tests.ps1

  Describing MyDscResource\Get()

    Context When the Get method is called
      [-] Should not throw an error 179ms
        Expected: the expression not to throw an exception. Message was {Test-HelperFunction throw an error!}
            from V:\Source\_Random\PesterTestClassBasedResource\HelperFunctions.psm1:6 char:5
            +     throw 'Test-HelperFunction throw an error!'
            +     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        at <ScriptBlock>, V:\Source\_Random\PesterTestClassBasedResource\MyDscResource.Tests.ps1: line 17
        17:                 { $databaseMembershipClass.Get() } | Should Not Throw
```
