Class HealthCare.UnitConverterTestCase Extends %UnitTest.TestCase
{

ClassMethod RunAllTests()
{
    write !,"Running HealthCare.UnitConverterTest tests...",!
    Do ##class(%UnitTest.Manager).RunTest("HealthCare.UnitConverterTestCase")
    write !,"All tests completed.",!
}

Method TestLengthConversions()
{
    // Test length conversions
    // meter to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "length")
    do $$$AssertEquals("100", result, "1 meter should be 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "mm", "length")
    do $$$AssertEquals("1000", result, "1 meter should be 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "in", "length")
    do $$$AssertEquals("39.370079", result, "1 meter should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "ft", "length")
    do $$$AssertEquals("3.28084", result, "1 meter should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "yd", "length")
    do $$$AssertEquals("1.093613", result, "1 meter should be approximately 1.093613 yards")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "km", "length")
    do $$$AssertEquals("0.001", result, "1 meter should be 0.001 kilometers")

    // centimeters to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "length")
    do $$$AssertEquals("1", result, "100 centimeters should be 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "mm", "length")
    do $$$AssertEquals("1000", result, "100 centimeters should be 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "in", "length")
    do $$$AssertEquals("39.370079", result, "100 centimeters should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "ft", "length")
    do $$$AssertEquals("3.28084", result, "100 centimeters should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "yd", "length")
    do $$$AssertEquals("1.093613", result, "100 centimeters should be approximately 1.093613 yards")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "km", "length")
    do $$$AssertEquals("0.001", result, "100 centimeters should be 0.001 kilometers")

    // mm to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "m", "length")
    do $$$AssertEquals("1", result, "1000 millimeters should be 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "cm", "length")
    do $$$AssertEquals("100", result, "1000 millimeters should be 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "in", "length")
    do $$$AssertEquals("39.370079", result, "1000 millimeters should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "ft", "length")
    do $$$AssertEquals("3.28084", result, "1000 millimeters should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "yd", "length")
    do $$$AssertEquals("1.093613", result, "1000 millimeters should be approximately 1.093613 yards")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "mm", "km", "length")
    do $$$AssertEquals("0.001", result, "1000 millimeters should be 0.001 kilometers")

    // km to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "m", "length")
    do $$$AssertEquals("1000", result, "1 kilometer should be 1000 meters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "cm", "length")
    do $$$AssertEquals("100000", result, "1 kilometer should be 100000 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "mm", "length")
    do $$$AssertEquals("1000000", result, "1 kilometer should be 1000000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "in", "length")
    do $$$AssertEquals("39370.079", result, "1 kilometer should be approximately 39370.079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "ft", "length")
    do $$$AssertEquals("3280.84", result, "1 kilometer should be approximately 3280.84 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "km", "yd", "length")
    do $$$AssertEquals("1094.0", result, "1 kilometer should be approximately 1094.0 yards")

    // in to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "m", "length")
    do $$$AssertEquals("1", result, "39.370079 inches should be approximately 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "cm", "length")
    do $$$AssertEquals("100", result, "39.370079 inches should be approximately 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "mm", "length")
    do $$$AssertEquals("1000", result, "39.370079 inches should be approximately 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "km", "length")
    do $$$AssertEquals("0.001", result, "39.370079 inches should be approximately 0.001 kilometers")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "ft", "length")
    do $$$AssertEquals("3.28084", result, "39.370079 inches should be approximately 3.28084 feet")
    set result = ##class(HealthCare.UnitConverterMain).Convert(39.370079, "in", "yd", "length")
    do $$$AssertEquals("1.093613", result, "39.370079 inches should be approximately 1.093613 yards")

    // ft to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "m", "length")
    do $$$AssertEquals("1", result, "3.28084 feet should be approximately 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "cm", "length")
    do $$$AssertEquals("100", result, "3.28084 feet should be approximately 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "mm", "length")
    do $$$AssertEquals("1000", result, "3.28084 feet should be approximately 1000 millimeters")
    set result  = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "km", "length")
    do $$$AssertEquals("0.001", result, "3.28084 feet should be approximately 0.001 kilometers")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "in", "length")
    do $$$AssertEquals("39.370079", result, "3.28084 feet should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(3.28084, "ft", "yd", "length")
    do $$$AssertEquals("1.093613", result, "3.28084 feet should be approximately 1.093613 yards")

    // yd to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "m", "length")
    do $$$AssertEquals("1", result, "1.093613 yards should be approximately 1 meter")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "cm", "length")
    do $$$AssertEquals("100", result, "1.093613 yards should be approximately 100 centimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "mm", "length")
    do $$$AssertEquals("1000", result, "1.093613 yards should be approximately 1000 millimeters")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "km", "length")
    do $$$AssertEquals("0.001", result, "1.093613 yards should be approximately 0.001 kilometers")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "in", "length")
    do $$$AssertEquals("39.370079", result, "1.093613 yards should be approximately 39.370079 inches")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1.093613, "yd", "ft", "length")
    do $$$AssertEquals("3.28084", result, "1.093613 yards should be approximately 3.28084 feet")

    // Invalid unit test
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "invalid", "length")
    do $$$AssertEquals("Error: Unsupported length unit: invalid", result, "Should return error for unsupported toUnit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "invalid", "m", "length")
    do $$$AssertEquals("Error: Unsupported length unit: invalid", result, "Should return error for unsupported fromUnit")
}

Method TestTemperatureConversions()
{
    // Test temperature conversions
    // Celsius to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "F", "temperature")
    do $$$AssertEquals("32", result, "0 Celsius should be 32 Fahrenheit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "K", "temperature")
    do $$$AssertEquals("273.15", result, "0 Celsius should be 273.15 Kelvin")

    // Fahrenheit to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(32, "F", "C", "temperature")
    do $$$AssertEquals("0", result, "32 Fahrenheit should be 0 Celsius")
    set result = ##class(HealthCare.UnitConverterMain).Convert(32, "F", "K", "temperature")
    do $$$AssertEquals("273.15", result, "32 Fahrenheit should be 273.15 Kelvin")

    // Kelvin to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(273.15, "K", "C", "temperature")
    do $$$AssertEquals("0", result, "273.15 Kelvin should be 0 Celsius")
    set result = ##class(HealthCare.UnitConverterMain).Convert(273.15, "K", "F", "temperature")
    do $$$AssertEquals("32", result, "273.15 Kelvin should be 32 Fahrenheit")

    // Invalid unit test
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "C", "invalid", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported toUnit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "C", "temperature")
    do $$$AssertEquals("Error: Unsupported temperature unit: invalid", result, "Should return error for unsupported fromUnit")
}

Method TestWeightConversions()
{
    // Test weight conversions
    // Kilograms to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "g", "weight")
    do $$$AssertEquals("1000", result, "1 kilogram should be 1000 grams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "mg", "weight")
    do $$$AssertEquals("1000000", result, "1 kilogram should be 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "lb", "weight")
    do $$$AssertEquals("2.20462", result, "1 kilogram should be approximately 2.20462 pounds")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "oz", "weight")
    do $$$AssertEquals("35.274", result, "1 kilogram should be approximately 35.274 ounces")

    // Grams to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "kg", "weight")
    do $$$AssertEquals("1", result, "1000 grams should be 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "mg", "weight")
    do $$$AssertEquals("1000000", result, "1000 grams should be 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "lb", "weight")
    do $$$AssertEquals("2.20462", result, "1000 grams should be approximately 2.20462 pounds")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "oz", "weight")
    do $$$AssertEquals("35.274", result, "1000 grams should be approximately 35.274 ounces")

    // Milligrams to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "kg", "weight")
    do $$$AssertEquals("1", result, "1000000 milligrams should be 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "g", "weight")
    do $$$AssertEquals("1000", result, "1000000 milligrams should be 1000 grams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "lb", "weight")
    do $$$AssertEquals("2.20462", result, "1000000 milligrams should be approximately 2.20462 pounds")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "oz", "weight")
    do $$$AssertEquals("35.274", result, "1000000 milligrams should be approximately 35.274 ounces")

    // Pounds to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "kg", "weight")
    do $$$AssertEquals("1", result, "2.20462 pounds should be approximately 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "g", "weight")
    do $$$AssertEquals("1000", result, "2.20462 pounds should be approximately 1000 grams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "mg", "weight")
    do $$$AssertEquals("1000000", result, "2.20462 pounds should be approximately 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "oz", "weight")
    do $$$AssertEquals("35.274", result, "2.20462 pounds should be approximately 35.274 ounces")

    // Ounces to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "kg", "weight")
    do $$$AssertEquals("1", result, "35.274 ounces should be approximately 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "g", "weight")
    do $$$AssertEquals("1000", result, "35.274 ounces should be approximately 1000 grams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "mg", "weight")
    do $$$AssertEquals("1000000", result, "35.274 ounces should be approximately 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "lb", "weight")
    do $$$AssertEquals("2.20462", result, "35.274 ounces should be approximately 2.20462 pounds")
}

Method TestLabConversions()
{
    // Test lab conversions
    // mg/dL to mmol/L
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dL", "mmol/L", "lab")
    do $$$AssertEquals("10.0", result, "180 mg/dL should be approximately 10.0 mmol/L")

    // mmol/L to mg/dL
    set result = ##class(HealthCare.UnitConverterMain).Convert(10, "mmol/L", "mg/dL", "lab")
    do $$$AssertEquals("180.0", result, "10 mmol/L should be approximately 180.0 mg/dL")

    // Invalid unit test
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "mg/dL", "invalid", "lab")
    do $$$AssertEquals("Error: Unsupported lab unit: invalid", result, "Should return error for unsupported toUnit")
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "mg/dL", "lab")
    do $$$AssertEquals("Error: Unsupported lab unit: invalid", result, "Should return error for unsupported fromUnit")
}

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

Method TestSameUnitConversion()
{
    // Test same unit conversion returns original value
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "m", "m", "length")
    do $$$AssertEquals("100", result, "Converting 100 m to m should return 100")
    set result = ##class(HealthCare.UnitConverterMain).Convert(50, "kg", "kg", "weight")
    do $$$AssertEquals("50", result, "Converting 50 kg to kg should return 50")
    set result = ##class(HealthCare.UnitConverterMain).Convert(37, "C", "C", "temperature")
    do $$$AssertEquals("37", result, "Converting 37 C to C should return 37")
    set result = ##class(HealthCare.UnitConverterMain).Convert(5.5, "mg/dL", "mg/dL", "lab")
    do $$$AssertEquals("5.5", result, "Converting 5.5 mg/dL to mg/dL should return 5.5")
}

Method TestRoutingLogic()
{
    // Test routing logic by spying on PerformConversion method

    // Length category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "length")
    do $$$AssertEquals("100", result, "Length conversion should route to LengthConverter")

    // Weight category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "g", "weight")
    do $$$AssertEquals("1000", result, "Weight conversion should route to WeightConverter")

    // Temperature category
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "C", "F", "temperature")
    do $$$AssertEquals("32", result, "Temperature conversion should route to TemperatureConverter")

    // Lab category
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dL", "mmol/L", "lab")
    do $$$AssertEquals("10.0", result, "Lab conversion should route to LabConverter")

    //error handling for unsupported category
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "m", "cm", "Height") 
    do $$$AssertEquals("Error: Unsupported category: Height", result, "Should return error for unsupported category")
}

Method TestSensitive()
{
    // Test case sensitivity of units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "M", "CM", "length")
    do $$$AssertEquals("100", result, "1 M should be 100 CM (case insensitive)")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "Kg", "G", "weight")
    do $$$AssertEquals("1000", result, "1 Kg should be 1000 G (case insensitive)")
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "c", "f", "temperature")
    do $$$AssertEquals("32", result, "0 c should be 32 f (case insensitive)")
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "MG/DL", "MMOL/L", "lab")
    do $$$AssertEquals("10.0", result, "180 MG/DL should be approximately 10.0 MMOL/L (case insensitive)")
}

}
