Class HealthCare.Tests.WeightConverterTest Extends %UnitTest.TestCase
{

Method TestWeightConversions()
{
    // Test weight conversions
    // Kilograms to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "G", "weight")
    do $$$AssertEquals("1000.00", result, "1 kilogram should be 1000 grams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "mg", "weight")
    do $$$AssertEquals("1000000.00", result, "1 kilogram should be 1000000 milligrams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "lb", "weight")
    do $$$AssertEquals("2.20", result, "1 kilogram should be approximately 2.20 pounds")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "oz", "weight")
    do $$$AssertEquals("35.27", result, "1 kilogram should be approximately 35.273991 ounces")

    // Grams to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "kg", "weight")
    do $$$AssertEquals("1.00", result, "1000 grams should be 1 kilogram")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "mg", "weight")
    do $$$AssertEquals("1000000.00", result, "1000 grams should be 1000000 milligrams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "lb", "weight")
    do $$$AssertEquals("2.20", result, "1000 grams should be approximately 2.20462 pounds")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "oz", "weight")
    do $$$AssertEquals("35.27", result, "1000 grams should be approximately 35.274 ounces")

    // Milligrams to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "Mg", "kg", "weight")
    do $$$AssertEquals("1.00", result, "1000000 milligrams should be 1 kilogram")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "g", "weight")
    do $$$AssertEquals("1000.00", result, "1000000 milligrams should be 1000 grams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "lb", "weight")
    do $$$AssertEquals("2.20", result, "1000000 milligrams should be approximately 2.20462 pounds")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "oz", "weight")
    do $$$AssertEquals("35.27", result, "1000000 milligrams should be approximately 35.274 ounces")

    // Pounds to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "kg", "weight")
    do $$$AssertEquals("1.00", result, "2.20462 pounds should be approximately 1 kilogram")

    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "g", "weight")
    do $$$AssertEquals("1000.00", result, "2.20462 pounds should be approximately 1000 grams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "mg", "weight")
    do $$$AssertEquals("999998.00", result, "2.20462 pounds should be approximately 1000000 milligrams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "oz", "weight")
    do $$$AssertEquals("35.27", result, "2.20462 pounds should be approximately 35.274 ounces")

    // Ounces to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "kg", "weight")
    do $$$AssertEquals("1.00", result, "35.274 ounces should be approximately 1 kilogram")

    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "g", "weight")
    do $$$AssertEquals("1000.00", result, "35.274 ounces should be approximately 1000 grams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "mg", "weight")
    do $$$AssertEquals("1000000.26", result, "35.274 ounces should be approximately 1000000 milligrams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "lb", "weight")
    do $$$AssertEquals("2.20", result, "35.274 ounces should be approximately 2.20462 pounds")
}

Method TestGetSupportedUnits()
{
    // Test that GetSupportedUnits returns expected units
    set result = ##class(HealthCare.WeightConverter).GetSupportedUnits()
    set unitCount = $Length(result, ", ")
    do $$$AssertEquals(5, unitCount, "Should contain 5 units: kg, g, mg, lb, oz")
    
    // Check that all expected units are present
    do $$$AssertTrue(result["kg", "Should contain kg")
    do $$$AssertTrue(result["g", "Should contain g") 
    do $$$AssertTrue(result["mg", "Should contain mg")
    do $$$AssertTrue(result["lb", "Should contain lb")
    do $$$AssertTrue(result["oz", "Should contain oz")
    
    // Check the format (comma separated)
    do $$$AssertTrue(result[", ", "Should be comma separated")
}

Method TestDirectWeightConverter()
{
    // Test direct calls to WeihgtConverter
    // Input value should be numeric, units should be low case
    set result = ##class(HealthCare.WeightConverter).Convert(2.20462, "lb", "oz")
    do $$$AssertTrue($IsValidNum(result), "Direct call should return numeric result")
    do $$$AssertTrue(result > 35.2 && result < 35.3, "2.20462 pounds should be approximately 35.3 ounces")

    set result = ##class(HealthCare.WeightConverter).Convert("35.274", "oz", "mg")
    do $$$AssertEquals("1000000.263", result, "Direct call: 35.274 ounces should be approximately 1000000.263 milligrams")

    // Test direct call with invalide unit
    set result = ##class(HealthCare.WeightConverter).Convert(1, "mg", "invalid")
    do $$$AssertTrue(result["Error: Unsupported weight unit: invalid", "Direct call should return invalid unit")
}

Method TestErrorCases()
{
    // Test unsupported units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "g", "invalid", "weight")
    do $$$AssertEquals("Error: Unsupported weight unit: invalid", result, "Should return error for unsupported toUnit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "invalid", "mg", "weight")
    do $$$AssertEquals("Error: Unsupported weight unit: invalid", result, "Should return error for unsupported fromUnit")
}

}
