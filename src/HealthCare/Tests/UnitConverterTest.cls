Class HealthCare.UnitConverterTest Extends %UnitTest.TestCase
{

ClassMethod RunAllTests()
{
        // Run all test methods
        Write "Running HealthCare Unit Converter Tests...",!
        Do ##class(HealthCare.TemperatureConverterTest).RunAllTests()
        Do ##class(HealthCare.WeightConverterTest).RunAllTests()
        Do ##class(HealthCare.LengthConverterTest).RunAllTests()
        Do ##class(HealthCare.LabConverterTest).RunAllTests()
        Do ##class(HealthCare.AdditionalTest).RunAllTests()
        Do ##class(HealthCare.MainRoutingTest).RunAllTests()
        Do ##class(HealthCare.InputValidationTest).RunAllTests()
        Write "All tests completed.",!
}

}
