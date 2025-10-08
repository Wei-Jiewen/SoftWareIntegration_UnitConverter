Class HealthCare.LengthConverter
{

ClassMethod ConvertLength(value As %Numeric, fromUnit As %String, toUnit As %String) As %String
{
    // normalize units to lowercase
    set fromUnit = $ZConvert(fromUnit, "L")
    set toUnit = $ZConvert(toUnit, "L")

    // define conversion ratios to meters
    set ratio("m") = 1
    set ratio("km") = 0.001
    set ratio("cm") = 100
    set ratio("mm") = 1000
    set ratio("in") = 39.3701
    set ratio("ft") = 3.28084
    set ratio("yd") = 1.09361

    // validate units
    if ('$Data(ratio(fromUnit))) {
        return "Error: Unsupported length unit: "_fromUnit
    }
    if ('$Data(ratio(toUnit))) {
        return "Error: Unsupported length unit: "_toUnit
    }

    // Convert to meters first and then to target unit
    set meters = value * ratio(toUnit)
    set result = meters / ratio(fromUnit)
    return $Normalize(result,6)
}

}
