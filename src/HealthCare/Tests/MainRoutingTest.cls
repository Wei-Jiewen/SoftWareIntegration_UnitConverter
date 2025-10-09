Class HealthCare.MainRoutingTest Extends %UnitTest.TestCase
{

/// Test routing for UnitConverterMain class
Method TestRoutingLogic()
{
    // Test routing logic by spying on PerformConversion method

    // Length category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "length")
    do $$$AssertEquals(100, result, "Length conversion should route to LengthConverter")

    // Weight category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "g", "weight")
    do $$$AssertEquals(1000, result, "Weight conversion should route to WeightConverter")

    // Temperature category
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "F", "temperature")
    do $$$AssertEquals(32, result, "Temperature conversion should route to TemperatureConverter")

    // Lab category
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dL", "mmol/L", "lab")
    do $$$AssertEquals(10.0, result, "Lab conversion should route to LabConverter")

    //error handling for unsupported category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "Height") 
    do $$$AssertEquals("Error: Unsupported category: Height", result, "Should return error for unsupported category")
}

}
