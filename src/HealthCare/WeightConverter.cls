Class HealthCare.WeightConverter
{

ClassMethod ConvertWeight(value As %Numeric, fromUnit As %String, toUnit As %String) As %String
{
    // normalize units to lowercase
    set fromUnit = $ZConvert(fromUnit, "L")
    set toUnit = $ZConvert(toUnit, "L")

    // define conversion ratios to kilograms
    set ratio("kg") = 1
    set ratio("g") = 0.001
    set ratio("mg") = 0.000001
    set ratio("lb") = 0.453592
    set ratio("oz") = 0.0283495

    // validate units
    if ('$Data(ratio(fromUnit))) {
        return "Error: Unsupported weight unit "_fromUnit
    }
    if ('$Data(ratio(toUnit))) {
        return "Error: Unsupported weight unit "_toUnit
    }
    // Convert to kilograms first and then to target unit
    set kgs = value * ratio(fromUnit)
 
    set result = kgs / ratio(toUnit)
    return $Normalize(result,6)
}

}
