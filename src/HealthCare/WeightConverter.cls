Class HealthCare.WeightConverter
{

/// Summary: Class for converting weight units in healthcare context
/// g, kg, mg, lb, oz
///    set result = ##class(HealthCare.WeightConverter).ConvertWeight(150, "lb", "kg")
///    write result  ; Output: 68.0388
ClassMethod Convert(value As %String, fromUnit As %String, toUnit As %String) As %String
{
    set numericValue = +value
    // define conversion ratios to kilograms
    set ratio("kg") = 1
    set ratio("g") = 0.001
    set ratio("mg") = 0.000001
    set ratio("lb") = 0.453592
    set ratio("oz") = 0.0283495 

    // validate units
    if ('$Data(ratio(fromUnit))) || ('$Data(ratio(toUnit))) {
        set error = "Error: Unsupported weight unit"
        if ('$Data(ratio(fromUnit))) {
            set error = error _ ": " _ fromUnit
        }
        if ('$Data(ratio(toUnit))) {
            set error = error _ ": " _ toUnit
        }
        return error
    }
    // Convert to kilograms first and then to target unit
    set kgs = numericValue * ratio(fromUnit)
    set result = kgs / ratio(toUnit)

    return result
}

/// Get supported weight units
ClassMethod GetSupportedUnits() As %String
{
    set units = $lb("kg", "g", "mg", "lb", "oz")
    return $lts(units, ", ")
}

}
