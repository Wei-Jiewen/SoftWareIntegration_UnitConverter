Class HealthCare.Tests.MainRoutingTest Extends %UnitTest.TestCase
{

Method TestNormalization()
{
    set result = ##class(HealthCare.UnitConverterMain).Convert(" 100 ", " CM ", " M ", " LENGTH ")
    do $$$AssertEquals("1.00", result, "Should normalize spaces and case")

    set result = ##class(HealthCare.UnitConverterMain).Convert("100.5", "kg", "g", "weight")
    do $$$AssertEquals("100500.00", result, "Should handle decimal values")

    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "MG/DL", "MMOL/L", "lab","Glucose")
    do $$$AssertEquals("9.99", result, "Should handle integer values and normalize case")
}

Method TestSameUnitConversion()
{
   
    // Test same unit returns original value with precision
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "kg", "kg", "weight")
    do $$$AssertEquals("100.00", result, "Same unit should return original value")

    set result = ##class(HealthCare.UnitConverterMain).Convert(123.456, "cm", "cm", "length")
    do $$$AssertEquals("123.46", result, "Same unit should format with precision")
}

Method TestPrecisionFromatting()
{
    // Test different precision values
    set result = ##class(HealthCare.UnitConverterMain).Convert(100.12345,"cm","m","length","",0)
    do $$$AssertEquals("1", result, "Precision 0 should round to integer")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100.12345, "cm", "m", "length", "", 4)
    do $$$AssertEquals("1.0012", result, "Precision 4 should show 4 decimal places")
}

Method TestVailiationErrors()
{
    // Test required field validation
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "", "m", "length")
    do $$$AssertTrue(result["Error: fromUnit is required", "Should validate missing fromUnit")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "", "length")
    do $$$AssertTrue(result["Error: toUnit is required", "Should validate missing toUnit")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "")
    do $$$AssertTrue(result["Error: category is required", "Should validate missing category")

    // Test numeric validation
    set result = ##class(HealthCare.UnitConverterMain).Convert("abc", "cm", "m", "length")
    do $$$AssertTrue(result["Error: Value must be numeric", "Should validate non-numeric value")

    // Test catetroy validation
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "invalid")
    do $$$AssertTrue(result["Error: Unsupported category", "Should validate unsupported category")
}

Method TestRangeValidations()
{
    // Test negative values for non-temperature categories
    set result = ##class(HealthCare.UnitConverterMain).Convert(-1, "cm", "m", "length")
    do $$$AssertTrue(result["Error: Value must be non-negative", "Should reject negative length")

    set result = ##class(HealthCare.UnitConverterMain).Convert(-1, "kg", "g", "weight")
    do $$$AssertTrue(result["Error: Value must be non-negative", "Should reject negative weight")

    // Test temperature absolute zero
    set result = ##class(HealthCare.UnitConverterMain).Convert(-300, "c", "f", "temperature")
    do $$$AssertTrue(result["Error: Temperature below absolute zero", "Should reject below absolute zero")

    // Test large values
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000000, "cm", "m", "length")
    do $$$AssertTrue(result["Error: Value too large", "Should reject very large values")
}

Method TestPrecisionValidation()
{
    // Test precicion bound
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "length", "", -1)
    do $$$AssertTrue(result["Error: Precision must be between 0 and 10", "Should reject negative precision")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "length", "", 11)
    do $$$AssertTrue(result["Error: Precision must be between 0 and 10", "Should reject precision > 10")
}

Method TestLabCategroyValidation()
{
    //Test lab category requires testItem
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "mg/dl", "mmol/l", "lab")
    do $$$AssertTrue(result["Error: testItem is required for lab category", "Lab category should require testItem")
    
    // Test lab category with testItem should work
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dl", "mmol/l", "lab", "glucose")
    do $$$AssertEquals("9.99", result, "Lab conversion with testItem should work")
}

Method TestAllCategoriesRouting()
{
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "length")
    do $$$AssertEquals("1.00", result, "Should route length category correctly")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "g", "weight")
    do $$$AssertEquals("1000.00", result, "Should route weight category correctly")

    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "c", "f", "temperature")
    do $$$AssertEquals("32.00", result, "Should route temperature category correctly")

    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dl", "mmol/l", "lab", "glucose")
    do $$$AssertEquals("9.99", result, "Should route lab category correctly")
}

Method TestErrorPropagation()
{
    // Test that errors from specific converters are properly propagated
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "m", "length")
    do $$$AssertTrue(result["Error: Unsupported length unit", "Should propagate length converter errors")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "kg", "weight")
    do $$$AssertTrue(result["Error: Unsupported weight unit", "Should propagate weight converter errors")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "c", "temperature")
    do $$$AssertTrue(result["Error: Unsupported temperature unit", "Should propagate temperature converter errors")

    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dl", "invalid", "lab", "glucose")
    do $$$AssertTrue(result["Error: Unsupported glucose unit", "Should propagate temperature converter errors")
}

Method TestEdgeCase()
{
    //test zero values
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "cm", "m", "length")
    do $$$AssertEquals("0.00", result, "Should handle zero values") 

    // Test very small values
    set result = ##class(HealthCare.UnitConverterMain).Convert(0.0001, "kg", "g", "weight", "", 6)
    do $$$AssertEquals("0.100000", result, "Should handle very small values with high precision")

    // Test maximum allowed value
    set result = ##class(HealthCare.UnitConverterMain).Convert(999999999, "cm", "m", "length")
    do $$$AssertEquals("9999999.99", result, "Should handle maximum allowed value")
}

Method TestGetConversionInfo()
{
    set result = ##class(HealthCare.UnitConverterMain).GetConversionInfo()
    
    // check all category
    do $$$AssertTrue(result["Length:", "Should contain Length category")
    do $$$AssertTrue(result["Weight:", "Should contain Weight category") 
    do $$$AssertTrue(result["Temperature:", "Should contain Temperature category")
    do $$$AssertTrue(result["Lab Tests:", "Should contain Lab Tests category")
    
    // check units
    do $$$AssertTrue(result["m, cm, mm", "Should contain length units")
    do $$$AssertTrue(result["kg, g, mg", "Should contain weight units")
    do $$$AssertTrue(result["c, f, k", "Should contain temperature units")
    do $$$AssertTrue(result["glucose", "Should contain glucose test")
    do $$$AssertTrue(result["creatinine", "Should contain creatinine test")
    do $$$AssertTrue(result["cholesterol", "Should contain cholesterol test")
    
    do $$$AssertTrue(result[$Char(13,10), "Should use line breaks")
    
    do $$$AssertTrue($Length(result) > 50, "Should return meaningful information")
}

}
