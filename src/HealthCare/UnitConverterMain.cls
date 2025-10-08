Class HealthCare.UnitConverterMain
{

ClassMethod Convert(value As %Numeric, fromUnit As %String, toUnit As %String, category As %String = "") As %String
{
   
    // Validate inputs
    set error = ..ValidateInputs(value, fromUnit, toUnit, category)
    if error '= 1 {
        return "Error: "_error
    }
    // same unitts, return the original value
    if fromUnit = toUnit {
        return value
    }
    
    
    set category = $ZConvert(category, "L")
    // route to appropriate conversion method based on category
    return ..PerformConversion(value, fromUnit, toUnit, category)
}

ClassMethod ValidateInputs(value As %Numeric, fromUnit As %String, toUnit As %String, category As %String) As %Boolean
{
    // Basic validation for numeric value and non-empty units
    if '$IsValidNum(value) {
        return "Error: Value must be numeric"
    }
    // Check for empty strings
    if (fromUnit = "" ) {
        return "Error: fromUnit is required"
    } elseif (toUnit = "" ) {
        return "Error: toUnit is required"
    } elseif (category = "" ) {
        return "Error: category is required"
    }

    // Value should be non-negative for most medical units
    if value < 0 {
        return "Error: Value must be non-negative"
    }
    return 1
}

ClassMethod PerformConversion(value As %Numeric, fromUnit As %String, toUnit As %String, category As %String) As %String
{
    // route to appropriate conversion method based on category
    quit $Case(category,
        "length": ##class(HealthCare.LengthConverter).ConvertLength(value, fromUnit, toUnit),
        "weight": ##class(HealthCare.WeightConverter).ConvertWeight(value, fromUnit, toUnit),
        "temperature": ##class(HealthCare.TemperatureConverter).ConvertTemperature(value, fromUnit, toUnit),
        "lab": ##class(HealthCare.LabConverter).Convert(value, fromUnit, toUnit),
        : "Error: Unsupported category: "_category
        )
}

}
