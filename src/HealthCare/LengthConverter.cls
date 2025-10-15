Class HealthCare.LengthConverter
{

/// Convert length between various units
/// mm, cm, m, um, in, ft, yd
ClassMethod Convert(value As %String, fromUnit As %String, toUnit As %String) As %String
{
    // Convert input value to numeric
    set numericValue = +value

    // Define conversion ratios to meters
    set ratio("m") = 1
    set ratio("cm") = 0.01
    set ratio("mm") = 0.001
    set ratio("in") = 0.0254
    set ratio("ft") = 0.3048
    set ratio("yd") = 0.9144

    // Validate units
    if ('$Data(ratio(fromUnit))) || ('$Data(ratio(toUnit))) {
        set error = "Error: Unsupported length unit"
        if ('$Data(ratio(fromUnit))) {
            set error = error _ ": " _ fromUnit
        }
        if ('$Data(ratio(toUnit))) {
            set error = error _ ": " _ toUnit
        }
        return error
    }

    // Convert to meters first and then to target unit
    set meters = numericValue * ratio(fromUnit)
    set result = meters / ratio(toUnit)
    return result
}

/// Return supported units
ClassMethod GetSupportedUnits() As %String
{
    set units = $lb("m", "cm", "mm", "in", "ft", "yd")
    return $lts(units, ", ")
}

}
