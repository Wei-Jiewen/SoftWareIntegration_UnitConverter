Class HealthCare.WeightConverterTest Extends %UnitTest.TestCase
{

Method TestWeightConversions()
{
    // Test weight conversions
    // Kilograms to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "g", "weight")
    do $$$AssertEquals(1000, result, "1 kilogram should be 1000 grams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "mg", "weight")
    do $$$AssertEquals(1000000, result, "1 kilogram should be 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "lb", "weight")
    do $$$AssertEquals(2.20462, result, "1 kilogram should be approximately 2.20462 pounds")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "kg", "oz", "weight")
    do $$$AssertEquals(35.274, result, "1 kilogram should be approximately 35.274 ounces")

    // Grams to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "kg", "weight")
    do $$$AssertEquals(1, result, "1000 grams should be 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "mg", "weight")
    do $$$AssertEquals(1000000, result, "1000 grams should be 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "lb", "weight")
    do $$$AssertEquals(2.20462, result, "1000 grams should be approximately 2.20462 pounds")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000, "g", "oz", "weight")
    do $$$AssertEquals(35.274, result, "1000 grams should be approximately 35.274 ounces")

    // Milligrams to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "kg", "weight")
    do $$$AssertEquals(1, result, "1000000 milligrams should be 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "g", "weight")
    do $$$AssertEquals(1000, result, "1000000 milligrams should be 1000 grams")

    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "lb", "weight")
    do $$$AssertEquals(2.20462, result, "1000000 milligrams should be approximately 2.20462 pounds")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1000000, "mg", "oz", "weight")
    do $$$AssertEquals(35.274, result, "1000000 milligrams should be approximately 35.274 ounces")

    // Pounds to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "kg", "weight")
    do $$$AssertEquals(1, result, "2.20462 pounds should be approximately 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "g", "weight")
    do $$$AssertEquals(1000, result, "2.20462 pounds should be approximately 1000 grams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "mg", "weight")
    do $$$AssertEquals(1000000, result, "2.20462 pounds should be approximately 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(2.20462, "lb", "oz", "weight")
    do $$$AssertEquals(35.274, result, "2.20462 pounds should be approximately 35.274 ounces")

    // Ounces to other units
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "kg", "weight")
    do $$$AssertEquals(1, result, "35.274 ounces should be approximately 1 kilogram")
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "g", "weight")
    do $$$AssertEquals(1000, result, "35.274 ounces should be approximately 1000 grams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "mg", "weight")
    do $$$AssertEquals(1000000, result, "35.274 ounces should be approximately 1000000 milligrams")
    set result = ##class(HealthCare.UnitConverterMain).Convert(35.274, "oz", "lb", "weight")
    do $$$AssertEquals(2.20462, result, "35.274 ounces should be approximately 2.20462 pounds")
}

}
