Class HealthCare.InputValidationTest Extends %UnitTest.TestCase
{

Method TestInvalidInputs()
{
    // Test invalid inputs
    // Negative value
    set result = ##class(HealthCare.UnitConverterMain).Convert(-1, "m", "cm", "length")
    do $$$AssertEquals("Error: Value must be non-negative", result, "Should return error for negative value")
    // Empty strings
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "", "cm", "length")
    do $$$AssertEquals("Error: fromUnit is required", result, "Should return error for empty fromUnit")
    // empty fromUnit
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "", "cm", "length")
    do $$$AssertEquals("Error: fromUnit is required", result, "Should return error for empty fromUnit")
    //  Empty toUnit
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "", "length")
    do $$$AssertEquals("Error: toUnit is required", result, "Should return error for empty toUnit")
    // Empty category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "")
    do $$$AssertEquals("Error: category is required", result, "Should return error for empty category")
    // Non-numeric value
    set result = ##class(HealthCare.UnitConverterMain).Convert("abc", "m", "cm", "length")
    do $$$AssertEquals("Error: Value must be numeric", result, "Should return error for non-numeric value")
    // Unsupported category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "invalid")
    do $$$AssertEquals("Error: Unsupported category invalid", result, "Should return error for unsupported category")
}

}
