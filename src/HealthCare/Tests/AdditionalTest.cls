Class HealthCare.AdditionalTest Extends %UnitTest.TestCase
{

Method TestSensitive()
{
    // Test case sensitivity of units
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "M", "CM", "length")
    do $$$AssertEquals(100, result, "1 M should be 100 CM (case insensitive)")
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "Kg", "G", "weight")
    do $$$AssertEquals(1000, result, "1 Kg should be 1000 G (case insensitive)")
    set result = ##class(HealthCare.UnitConverterMain).Convert(0, "c", "f", "temperature")
    do $$$AssertEquals(32, result, "0 c should be 32 f (case insensitive)")
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "MG/DL", "MMOL/L", "lab")
    do $$$AssertEquals(10.0, result, "180 MG/DL should be approximately 10.0 MMOL/L (case insensitive)")
}

Method TestSameUnitConversion()
{
    // Test same unit conversion returns original value
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "m", "m", "length")
    do $$$AssertEquals(100, result, "Converting 100 m to m should return 100")
    set result = ##class(HealthCare.UnitConverterMain).Convert(50, "kg", "kg", "weight")
    do $$$AssertEquals(50, result, "Converting 50 kg to kg should return 50")
    set result = ##class(HealthCare.UnitConverterMain).Convert(37, "C", "C", "temperature")
    do $$$AssertEquals(37, result, "Converting 37 C to C should return 37")
    set result = ##class(HealthCare.UnitConverterMain).Convert(5.5, "mg/dL", "mg/dL", "lab")
    do $$$AssertEquals(5.5, result, "Converting 5.5 mg/dL to mg/dL should return 5.5")
}

}
