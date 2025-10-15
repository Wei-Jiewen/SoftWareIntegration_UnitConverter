Class HealthCare.Tests.LabConverterTest Extends %UnitTest.TestCase
{

Method TestLabConversions()
{
    // Test glucose conversions
    set result = ##class(HealthCare.UnitConverterMain).Convert(180, "mg/dL", "mmol/L", "lab","glucose")
    do $$$AssertEquals("9.99", result, "180 mg/dL should be approximately 9.99 mmol/L")

    set result = ##class(HealthCare.UnitConverterMain).Convert(5.5, "mmol/L", "mg/dL", "lab","glucose")
    do $$$AssertEquals("99.10", result, "10 mmol/L should be approximately 99.10 mg/dL")

     // Test Creatinine conversions
    set result = ##class(HealthCare.UnitConverterMain).Convert(1, "mg/dl", "umol/l", "lab", "creatinine")
    do $$$AssertEquals("88.40", result, "1 mg/dL creatinine should be 88.40 µmol/L")

    set result = ##class(HealthCare.UnitConverterMain).Convert(88.4, "umol/l", "mg/dl", "lab", "creatinine")
    do $$$AssertEquals("1.00", result, "88.4 µmol/L creatinine should be 1.00 mg/dL")


    // Test Cholesterol conversions
    set result = ##class(HealthCare.UnitConverterMain).Convert(193.35, "mg/dl", "mmol/l", "lab", "cholesterol")
    do $$$AssertEquals("5.00", result, "193.35 mg/dL cholesterol should be 5.00 mmol/L")

    set result = ##class(HealthCare.UnitConverterMain).Convert(5, "mmol/l", "mg/dl", "lab", "cholesterol")
    do $$$AssertEquals("193.35", result, "5 mmol/L cholesterol should be 193.35 mg/dL")
}

Method TestErrorCases()
{
    // Test missing testItem
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "mg/dl", "mmol/l", "lab")
    do $$$AssertTrue(result["Error: testItem is required", "Should require testItem for lab category")

    // Test unsupported testItem
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "mg/dl", "mmol/l", "lab", "invalid_test")
    do $$$AssertTrue(result["Error: Unsupported invalid_test unit", "Should return error for unsupported testItem")

    // Test unsupported fromUnit for glucose
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "mmol/l", "lab", "glucose")
    do $$$AssertTrue(result["Error: Unsupported glucose unit", "Should return error for unsupported fromUnit")

    // Test unsupported toUnit for glucose
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "mg/dl", "invalid", "lab", "glucose")
    do $$$AssertTrue(result["Error: Unsupported glucose unit", "Should return error for unsupported toUnit")

    // Test unsupported fromUnit for creatinine
    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "invalid", "umol/l", "lab", "creatinine")
    do $$$AssertTrue(result["Error: Unsupported creatinine unit", "Should return error for unsupported fromUnit")
}

Method TestDirectLabConverter()
{
    // Test direct calls to LabConverter
    // Input value should be numeric, units and testItem should be low case
    set result = ##class(HealthCare.LabConverter).Convert(180, "mg/dl", "mmol/l", "glucose")
    do $$$AssertTrue($IsValidNum(result), "Direct call should return numeric result for glucose conversion")
    do $$$AssertTrue(result > 9.9 && result < 10.0, "180 mg/dL glucose should be approximately 10 mmol/L")

    set result = ##class(HealthCare.LabConverter).Convert(1, "mg/dl", "umol/l", "creatinine")
    do $$$AssertEquals("88.4", result, "Direct call: 1 mg/dL creatinine should be 88.4 µmol/L")

    // Test direct call with missing testItem
    set result = ##class(HealthCare.LabConverter).Convert(100, "mg/dl", "mmol/l", "")
    do $$$AssertTrue(result["Error:testItem is required for lab conversion", "Direct call should require testItem")
}

Method TestGetSupportedTestItems()
{
    set result = ##class(HealthCare.LabConverter).GetSupportedTestItems()
    do $$$AssertTrue(result["glucose", "Contains glucose")
    do $$$AssertTrue(result["creatinine", "Contains creatinine") 
    do $$$AssertTrue(result["cholesterol", "Contains cholesterol")
}

}
