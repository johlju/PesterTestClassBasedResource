Import-Module '.\MyDscResource.psm1' -Global -Force

InModuleScope 'MyDscResource' {
    Describe 'MyDscResource\Get()' {
        BeforeAll {
            Mock -CommandName Test-HelperFunction -Verifiable
        }

        BeforeEach {
            $databaseMembershipClass = [MyDscResource]::New()
            $databaseMembershipClass.DatabaseName = 'Database1'
            $databaseMembershipClass.SqlServer = 'Server1'
        }

        Context 'When the Get method is called' {
            It 'Should not throw an error' {
                { $databaseMembershipClass.Get() } | Should Not Throw

                Assert-MockCalled -CommandName Test-HelperFunction -Scope It -Times 1 -Exactly
            }
        }
    }
}

