Class HealthCare.UnitConverterTest Extends %UnitTest.TestCase
{

ClassMethod RunAllTests()
{
        // Run all test methods
        Do ##class(HealthCare.TemperatureConverterTest).RunAllTests()
        Do ##class(HealthCare.WeightConverterTest).RunAllTests()
        Do ##class(HealthCare.LengthConverterTest).RunAllTests()
        Do ##class(HealthCare.LabConverterTest).RunAllTests()
        Do ##class(HealthCare.AdditionalTest).RunAllTests()
        Do ##class(HealthCare.MainRoutingTest).RunAllTests()
        Do ##class(HealthCare.UnitConverterTest).RunAllTests()
}

}
