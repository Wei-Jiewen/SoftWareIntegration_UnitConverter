Class HealthCare.LengthConverterTest Extends %UnitTest.TestCase
{

Method TestLengthConversions()
{
    // Test length conversions
    // meter to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "length")
    do $$$AssertEquals(100, result, "1 meter should be 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "mm", "length")
    do $$$AssertEquals(1000, result, "1 meter should be 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "in", "length")
    do $$$AssertEquals(39.370079, result, "1 meter should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "ft", "length")
    do $$$AssertEquals(3.28084, result, "1 meter should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "yd", "length")
    do $$$AssertEquals(1.093613, result, "1 meter should be approximately 1.093613 yards")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "km", "length")
    do $$$AssertEquals(0.001, result, "1 meter should be 0.001 kilometers")

    // centimeters to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "length")
    do $$$AssertEquals(1, result, "100 centimeters should be 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "mm", "length")
    do $$$AssertEquals(1000, result, "100 centimeters should be 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "in", "length")
    do $$$AssertEquals(39.370079, result, "100 centimeters should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "ft", "length")
    do $$$AssertEquals(3.28084, result, "100 centimeters should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "yd", "length")
    do $$$AssertEquals(1.093613, result, "100 centimeters should be approximately 1.093613 yards")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "km", "length")
    do $$$AssertEquals(0.001, result, "100 centimeters should be 0.001 kilometers")

    // mm to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "m", "length")
    do $$$AssertEquals(1, result, "1000 millimeters should be 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "cm", "length")
    do $$$AssertEquals(100, result, "1000 millimeters should be 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "in", "length")
    do $$$AssertEquals(39.370079, result, "1000 millimeters should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "ft", "length")
    do $$$AssertEquals(3.28084, result, "1000 millimeters should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "yd", "length")
    do $$$AssertEquals(1.093613, result, "1000 millimeters should be approximately 1.093613 yards")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "km", "length")
    do $$$AssertEquals(0.001, result, "1000 millimeters should be 0.001 kilometers")

    // km to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "m", "length")
    do $$$AssertEquals(1000, result, "1 kilometer should be 1000 meters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "cm", "length")
    do $$$AssertEquals(100000, result, "1 kilometer should be 100000 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "mm", "length")
    do $$$AssertEquals(1000000, result, "1 kilometer should be 1000000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "in", "length")
    do $$$AssertEquals(39370.079, result, "1 kilometer should be approximately 39370.079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "ft", "length")
    do $$$AssertEquals(3280.84, result, "1 kilometer should be approximately 3280.84 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "yd", "length")
    do $$$AssertEquals(1094.0, result, "1 kilometer should be approximately 1094.0 yards")

    // in to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "m", "length")
    do $$$AssertEquals(1, result, "39.370079 inches should be approximately 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "cm", "length")
    do $$$AssertEquals(100, result, "39.370079 inches should be approximately 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "mm", "length")
    do $$$AssertEquals(1000, result, "39.370079 inches should be approximately 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "km", "length")
    do $$$AssertEquals(0.001, result, "39.370079 inches should be approximately 0.001 kilometers")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "ft", "length")
    do $$$AssertEquals(3.28084, result, "39.370079 inches should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "yd", "length")
    do $$$AssertEquals(1.093613, result, "39.370079 inches should be approximately 1.093613 yards")

    // ft to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "m", "length")
    do $$$AssertEquals(1, result, "3.28084 feet should be approximately 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "cm", "length")
    do $$$AssertEquals(100, result, "3.28084 feet should be approximately 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "mm", "length")
    do $$$AssertEquals(1000, result, "3.28084 feet should be approximately 1000 millimeters")
    set result  = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "km", "length")
    do $$$AssertEquals(0.001, result, "3.28084 feet should be approximately 0.001 kilometers")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "in", "length")
    do $$$AssertEquals(39.370079, result, "3.28084 feet should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "yd", "length")
    do $$$AssertEquals(1.093613, result, "3.28084 feet should be approximately 1.093613 yards")

    // yd to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "m", "length")
    do $$$AssertEquals(1, result, "1.093613 yards should be approximately 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "cm", "length")
    do $$$AssertEquals(100, result, "1.093613 yards should be approximately 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "mm", "length")
    do $$$AssertEquals(1000, result, "1.093613 yards should be approximately 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "km", "length")
    do $$$AssertEquals(0.001, result, "1.093613 yards should be approximately 0.001 kilometers")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "in", "length")
    do $$$AssertEquals(39.370079, result, "1.093613 yards should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "ft", "length")
    do $$$AssertEquals(3.28084, result, "1.093613 yards should be approximately 3.28084 feet")

    // Invalid unit test
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "invalid", "length")
    do $$$AssertEquals("Error: Unsupported length unit: invalid", result, "Should return error for unsupported toUnit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "invalid", "m", "length")
    do $$$AssertEquals("Error: Unsupported length unit: invalid", result, "Should return error for unsupported fromUnit")
}

}
