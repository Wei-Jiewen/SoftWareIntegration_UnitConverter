Class HealthCare.Tests.UnitConverterTest
{

ClassMethod RunAllTests()
{

    Write "Running HealthCare Unit Converter Tests...", !

    Do ##class(%UnitTest.Manager).RunTest("HealthCare.Tests")

    Write "All tests completed.", !
}

}
