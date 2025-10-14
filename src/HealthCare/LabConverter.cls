Class HealthCare.LabConverter
{

/// Convert lab values between various units
/// Supported conversions:
/// - Glucose: mg/d <-> mmol/
/// - Creatinine: mg/d <-> µmol/
/// - Cholesterol：mg/d <-> mmol/
/// Example usage:
///    set result = ##class(HealthCare.LabConverter).Convert(100, "mg/dl", "mmol/l","glucose")
///    write result; Output: 5.549943945566149782
ClassMethod Convert(value As %String, fromUnit As %String, toUnit As %String, testItem As %String) As %String
{
    // Check if testItem is provided
    if (testItem =""){
        return "Error:testItem is required for lab conversion"
    }
    return ..PerformConversion(value,fromUnit,toUnit,testItem)
}

ClassMethod PerformConversion(value As %String, fromUnit As %String, toUnit As %String, testItem As %String) As %String
{
    // Convert input value to numeric
    set numericValue = +value

    do ..InitiallizeRatio(.ratio)

    // Validate units are supported for the testItem
    if ('$Data(ratio(testItem, fromUnit))) {
        return "Error: Unsupported "_testItem_" unit: "_fromUnit
    }
    if ('$Data(ratio(testItem, toUnit))) {
        return "Error: Unsupported "_testItem_" unit: "_toUnit
    }
    // Convert to base unit then to target unit
    set baseValue = numericValue /ratio(testItem,fromUnit)
    set result = baseValue * ratio(testItem,toUnit)
    return result
}

ClassMethod InitiallizeRatio(Output ratio) As %Status
{
    kill ratio
    
    // Glucose
    // 1 mmol/L = 18.0182 mg/dL
    set ratio("glucose", "mg/dl") = 18.0182
    set ratio("glucose", "mmol/l") = 1
    
    // Creatinine
    // 1 mg/dL = 88.4 µmol/L
    set ratio("creatinine", "mg/dl") = 1
    set ratio("creatinine", "umol/l") = 88.4
    
     // Cholesterol
    // 1 mmol/L = 38.67 mg/dL
    set ratio("cholesterol", "mg/dl") = 38.67
    set ratio("cholesterol", "mmol/l") = 1
    
    return $$$OK
}

/// Return list of supported test items and their unit
ClassMethod GetSupportedTestItems() As %String
{
    do ..InitiallizeRatio(.ratio)
    
    set info = ""
    set testItem = $Order(ratio(""))

    // Build formatted string with supported tests and units
    while (testItem '= "") {
        if (info '= "") {
            set info = info _ $Char(13,10)
        }
        
        set info = info _ "• " _ testItem _ ": " //Add line break

        set units = ""
        set unit = $Order(ratio(testItem, ""))
        
        while (unit '= "") {
            if (units '= "") {
                set units = units _ ", "
            }
            set units = units _ unit
            set unit = $Order(ratio(testItem, unit))
        }
        set info = info _ units
        
        set testItem = $Order(ratio(testItem))
    }
    
    return info
}

}
