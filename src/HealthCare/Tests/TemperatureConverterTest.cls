Class HealthCare.Tests.TemperatureConverterTest Extends %UnitTest.TestCase
{

Method TestTemperatureConversions()
{
    // Test temperature conversions

    // Celsius to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "F", "temperature")
    do $$$AssertEquals("32.00", result, "0 Celsius should be 32.00 Fahrenheit")

    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "K", "temperature")
    do $$$AssertEquals("273.15", result, "0 Celsius should be 273.15 Kelvin")

    // Fahrenheit to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(32, "F", "C", "temperature")
    do $$$AssertEquals("0.00", result, "32 Fahrenheit should be 0.00 Celsius")

    set result = ##class(HealthCare.UnitConverterMain).Convert(32, "F", "K", "temperature")
    do $$$AssertEquals("273.15", result, "32 Fahrenheit should be 273.15 Kelvin")

    // Kelvin to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(273.15, "K", "C", "temperature")
    do $$$AssertEquals("0.00", result, "273.15 Kelvin should be 0.00 Celsius")

    set result = ##class(HealthCare.UnitConverterMain).Convert(273.15, "K", "F", "temperature")
    do $$$AssertEquals("32.00", result, "273.15 Kelvin should be 32.00 Fahrenheit")

    // Invalid unit test
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "C", "invalid", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported toUnit")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "C", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported fromUnit")
}

Method TestErrorCases()
{
    // Test unsupported units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "c", "invalid", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported toUnit")
    
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "invalid", "f", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported fromUnit")
}

Method TestDirectLengthConverter()
{
    // Test direct calls to TemperatureConverter
    // Input value should be numeric, units should be low case
    set result = ##class(HealthCare.TemperatureConverter).Convert(274.869, "k", "f")
    do $$$AssertTrue($IsValidNum(result), "Direct call should return numeric result")
    do $$$AssertTrue(result > 35 && result < 35.1, "273.15 Kelvin should be approximately 35 Fahrenheit")

    set result = ##class(HealthCare.TemperatureConverter).Convert("273.15", "k", "f")
    do $$$AssertEquals("32", result, "Direct call: 273.15 Kelvin should be 32 Fahrenheit")

    // Test direct call with invalid unit
    set result = ##class(HealthCare.TemperatureConverter).Convert(1, "c", "invalid")
    do $$$AssertTrue(result["Error: Unsupported temperature unit: invalid", "Direct call should return invalid unit")
}

Method TestGetSupportedUnits()
{
    // Test that GetSupportedUnits returns expected units
    set result = ##class(HealthCare.TemperatureConverter).GetSupportedUnits()
    set unitCount = $Length(result, ", ")
    do $$$AssertEquals(3, unitCount, "Should contain 6 units: c, f,k")
    
    // Check that all expected units are present
    do $$$AssertTrue(result["c", "Should contain c")
    do $$$AssertTrue(result["f", "Should contain f")
    do $$$AssertTrue(result["k", "Should contain k") 
    
    // Check the format (comma separated)
    do $$$AssertTrue(result[", ", "Should be comma separated")
}

}
