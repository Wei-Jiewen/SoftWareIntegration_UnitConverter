Class HealthCare.UnitConverterMain
{

/// Main class for unit conversion in healthcare context
/// category: length, weight, temperature, lab
/// Routes conversion requests to specialized classes based on the category
/// Default precision is 2 ,rang:0-10
/// To convert category "lab", need to input testItem (glucose,creatinine,cholesterol)
/// Example usage:
///    set result = ##class(HealthCare.UnitConverterMain).Convert(100, "cm", "m", "length")
///    write result  ; Output: 1.00
ClassMethod Convert(value As %String, fromUnit As %String, toUnit As %String, category As %String, testItem As %String = "", precision As %Integer = 2) As %String
{
    // Normalize input values - remove spaces and convert to lowercase
   set value = $Translate(value, " ", "")
   set category = $ZConvert($Translate(category, " "), "L")
   set fromUnit = $ZConvert($Translate(fromUnit, " "), "L")
   set toUnit = $ZConvert($Translate(toUnit, " "), "L") 
   set testItem = $ZConvert($Translate(testItem, " "), "L")

    // Validate all inputs
    set error = ..ValidateInputs(value, fromUnit, toUnit,category,testItem,precision)
    if (error '= "") {
        return error
    }

    // Return same value if units are identical
    if fromUnit = toUnit {
        return $Fn(value,"",precision)
    }
    // Perform the conversion based on category
    set result = ..PerformConversion(value, fromUnit, toUnit, category,testItem)

    // Format result with specified precision if numeric
    if $IsValidNum(result) {
        return $Fn(result,"",precision)
    } else {
        return result
    }
}

ClassMethod ValidateInputs(value As %String, fromUnit As %String, toUnit As %String, category As %String, testItem As %String, precision As %Integer = 2) As %String
{
    
    // Check required fields
    if (fromUnit = "" ) {
        return "Error: fromUnit is required"
    } elseif (toUnit = "" ) {
        return "Error: toUnit is required"
    } elseif (category = "" ) {
        return "Error: category is required"
    }
    // Validate numeric value
    if '$IsValidNum(value) {
        return "Error: Value must be numeric"
    }

    // Validate category is supported
    set validCategories = ",length,weight,temperature,lab,"
    if (validCategories'[(","_category_",")) {
        return "Error: Unsupported category:"_category
    }
    
    //  Range checks for different categories
    if (category = "temperature") {
    // 
    if (+value < -273.15) {
        return "Error: Temperature below absolute zero"
    }  
    } elseif (+value < 0) {
        //  Other categories should not have negative values
        return "Error: Value must be non-negative for category: "_category
    }
    // Check for extremely large values
    if (+value > 999999999) {
        return "Error: Value too large (max: 999,999,999)"
    }
    // Validate precision range
    if (precision < 0) || (precision > 10) {
        return "Error: Precision must be between 0 and 10"
    }

    // Special validation for lab category
    if (category = "lab") && (testItem=""){
        return "Error: testItem is required for lab category"
    }

    return "" // no error
}

/// Route conversion to appropriate specialized class based on category
ClassMethod PerformConversion(value As %String, fromUnit As %String, toUnit As %String, category As %String, testItem As %String = "") As %String
{
    quit $Case(category,
        "length": ##class(HealthCare.LengthConverter).Convert(value, fromUnit, toUnit),
        "weight": ##class(HealthCare.WeightConverter).Convert(value, fromUnit, toUnit),
        "temperature": ##class(HealthCare.TemperatureConverter).Convert(value,fromUnit,toUnit),
        "lab": ##class(HealthCare.LabConverter).Convert(value, fromUnit, toUnit, testItem),
        :"Error: Unsupported category: "_category
    )
}

/// Return conversion information,categories and units
ClassMethod GetConversionInfo() As %String
{
    set info = "Supported Conversion Categories:" _ $Char(13,10)
    set info = info _ "Length: " _ ##class(HealthCare.LengthConverter).GetSupportedUnits() _ $Char(13,10)
    set info = info _ "Weight: " _ ##class(HealthCare.WeightConverter).GetSupportedUnits() _ $Char(13,10)
    set info = info _ "Temperature: c, f, k" _ $Char(13,10)
    set info = info _ "Lab Tests:" _ $Char(13,10) _ ##class(HealthCare.LabConverter).GetSupportedTestItems()
    
    return info
}

}
