Class HealthCare.Tests.LengthConverterTest Extends %UnitTest.TestCase
{

Method TestLengthConversions()
{
    // Test length conversions
    // meter to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "length")
    do $$$AssertEquals("100.00", result, "1 meter should be 100.00 centimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert("1", "m", "mm", "length")
    do $$$AssertEquals("1000.00", result, "1 meter should be 1000.00 millimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "in", "length")
    do $$$AssertEquals("39.37", result, "1 meter should be approximately 39.37 inches")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "ft", "length")
    do $$$AssertEquals("3.28", result, "1 meter should be approximately 3.28 feet")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "yd", "length")
    do $$$AssertEquals("1.09", result, "1 meter should be approximately 1.09 yards")

    // centimeters to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "length")
    do $$$AssertEquals("1.00", result, "100 centimeters should be 1.00 meter")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "mm", "length")
    do $$$AssertEquals("1000.00", result, "100 centimeters should be 1000.00 millimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "in", "length")
    do $$$AssertEquals("39.37", result, "100 centimeters should be approximately 39.37 inches")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "ft", "length")
    do $$$AssertEquals("3.28", result, "100 centimeters should be approximately 3.28 feet")

    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "yd", "length")
    do $$$AssertEquals("1.09", result, "100 centimeters should be approximately 1.09 yards")


    // mm to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "m", "length")
    do $$$AssertEquals("1.00", result, "1000 millimeters should be 1.00 meter")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "cm", "length")
    do $$$AssertEquals("100.00", result, "1000 millimeters should be 100.00 centimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "in", "length")
    do $$$AssertEquals("39.37", result, "1000 millimeters should be approximately 39.37 inches")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "ft", "length")
    do $$$AssertEquals("3.28", result, "1000 millimeters should be approximately 3.28 feet")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "yd", "length")
    do $$$AssertEquals("1.09", result, "1000 millimeters should be approximately 1.09 yards")


    // in to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "m", "length")
    do $$$AssertEquals("1.00", result, "39.370079 inches should be approximately 1.00 meter")

    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "cm", "length")
    do $$$AssertEquals("100.00", result, "39.370079 inches should be approximately 100.00 centimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "mm", "length")
    do $$$AssertEquals("1000.00", result, "39.370079 inches should be approximately 1000.00 millimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "ft", "length")
    do $$$AssertEquals("3.28", result, "39.370079 inches should be approximately 3.28 feet")

    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "yd", "length")
    do $$$AssertEquals("1.09", result, "39.370079 inches should be approximately 1.09 yards")

    // ft to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "m", "length")
    do $$$AssertEquals("1.00", result, "3.28084 feet should be approximately 1.00 meter")

    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "cm", "length")
    do $$$AssertEquals("100.00", result, "3.28084 feet should be approximately 100.00 centimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "mm", "length")
    do $$$AssertEquals("1000.00", result, "3.28084 feet should be approximately 1000.00 millimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "in", "length")
    do $$$AssertEquals("39.37", result, "3.28084 feet should be approximately 39.37 inches")

    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "yd", "length")
    do $$$AssertEquals("1.09", result, "3.28084 feet should be approximately 1.093613 yards")

    // yd to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "m", "length")
    do $$$AssertEquals("1.00", result, "1.093613 yards should be approximately 1 meter")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "cm", "length")
    do $$$AssertEquals("100.00", result, "1.093613 yards should be approximately 100 centimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "mm", "length")
    do $$$AssertEquals("1000.00", result, "1.093613 yards should be approximately 1000.00 millimeters")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "in", "length")
    do $$$AssertEquals("39.37", result, "1.093613 yards should be approximately 39.37 inches")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "ft", "length")
    do $$$AssertEquals("3.28", result, "1.093613 yards should be approximately 3.28 feet")
}

Method TestErrorCases()
{
    // Test invalid units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "invalid", "length")
    do $$$AssertEquals("Error: Unsupported length unit: invalid", result, "Should return error for unsupported toUnit")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "invalid", "m", "length")
    do $$$AssertEquals("Error: Unsupported length unit: invalid", result, "Should return error for unsupported fromUnit")
}

Method TestDirectLengthConverter()
{
    // Test direct calls to LengthConverter
    // Input value should be numeric, units should be low case
    set result = ##class(HealthCare.LengthConverter).Convert(10.093613, "yd", "m")
    do $$$AssertTrue($IsValidNum(result), "Direct call should return numeric result for glucose conversion")
    do $$$AssertTrue(result > 9.2 && result < 10.0, "1.093613 yards should be approximately 9.2 meter")

    set result = ##class(HealthCare.LengthConverter).Convert(1, "m", "cm")
    do $$$AssertEquals("100", result, "Direct call: 1 meter should be 100 centimeters")

    // Test direct call with invalid unit
    set result = ##class(HealthCare.LengthConverter).Convert(1, "m", "invalid")
    do $$$AssertTrue(result["Error: Unsupported length unit: invalid", "Direct call should return invalid unit")
}

// Tes get info

Method TestGetSupportedUnits()
{
    set result = ##class(HealthCare.LengthConverter).GetSupportedUnits()
    // Test that GetSupportedUnits returns expected units
    set unitCount = $Length(result, ", ")
    do $$$AssertEquals(6, unitCount, "Should contain 6 units: m, cm, mm, in, ft, yd")
    
    //Check that all expected units are present
    do $$$AssertTrue(result["m", "Should contain m")
    do $$$AssertTrue(result["cm", "Should contain cm") 
    do $$$AssertTrue(result["mm", "Should contain mm")
    do $$$AssertTrue(result["in", "Should contain in")
    do $$$AssertTrue(result["ft", "Should contain ft")
    do $$$AssertTrue(result["yd", "Should contain yd")

    // Check the format (comma separated)
    do $$$AssertTrue(result[", ", "Should be comma separated")
}

}
