Class HealthCare.LabConverterTest Extends %UnitTest.TestCase
{

Method TestLabConversions()
{
    // Test lab conversions
    // mg/dL to mmol/L
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dL", "mmol/L", "lab")
    do $$$AssertEquals(10.0, result, "180 mg/dL should be approximately 10.0 mmol/L")

    // mmol/L to mg/dL
    set result = ##class(HealthCare.UnitConverterMain).Convert(10, "mmol/L", "mg/dL", "lab")
    do $$$AssertEquals(180.0, result, "10 mmol/L should be approximately 180.0 mg/dL")

    // Invalid unit test
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "mg/dL", "invalid", "lab")
    do $$$AssertEquals("Error: Unsupported lab unit: invalid", result, "Should return error for unsupported toUnit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "mg/dL", "lab")
    do $$$AssertEquals("Error: Unsupported lab unit: invalid", result, "Should return error for unsupported fromUnit")
}

}
