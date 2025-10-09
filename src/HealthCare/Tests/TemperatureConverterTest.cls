Class HealthCare.TemperatureConverterTest Extends %UnitTest.TestCase
{

/// This class tests the Temperature conversion functionality of the UnitConverterMain class.
Method TestTemperatureConversions()
{
    // Test temperature conversions
    // Celsius to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "F", "temperature")
    do $$$AssertEquals(32, result, "0 Celsius should be 32 Fahrenheit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "K", "temperature")
    do $$$AssertEquals(273.15, result, "0 Celsius should be 273.15 Kelvin")

    // Fahrenheit to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(32, "F", "C", "temperature")
    do $$$AssertEquals(0, result, "32 Fahrenheit should be 0 Celsius")
    set result = ##class(HealthCare.UnitConverterMain).Convert(32, "F", "K", "temperature")
    do $$$AssertEquals(273.15, result, "32 Fahrenheit should be 273.15 Kelvin")

    // Kelvin to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(273.15, "K", "C", "temperature")
    do $$$AssertEquals(0, result, "273.15 Kelvin should be 0 Celsius")
    set result = ##class(HealthCare.UnitConverterMain).Convert(273.15, "K", "F", "temperature")
    do $$$AssertEquals(32, result, "273.15 Kelvin should be 32 Fahrenheit")

    // Invalid unit test
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "C", "invalid", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported toUnit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "C", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported fromUnit")
}

}
