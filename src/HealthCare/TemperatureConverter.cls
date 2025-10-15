Class HealthCare.TemperatureConverter
{

/// convert temperature between Celsius, Fahrenheit, and Kelvin
/// Supported units: "C", "F", "K"
ClassMethod Convert(value As %String, fromUnit As %String, toUnit As %String) As %String
{
    set numericValue = +value
    
    // Convert to Celsius first
    set celsiusValue = ""
    if fromUnit = "c" {
        set celsiusValue = numericValue
    } elseif fromUnit = "f" {
        set celsiusValue = (numericValue - 32) * 5 / 9
    } elseif fromUnit = "k" {
        set celsiusValue = numericValue - 273.15
    } else { 
        return "Error: Unsupported temperature unit: "_fromUnit
    }

    // Convert from Celsius to target unit
    if toUnit = "c" {
        return celsiusValue
    } elseif toUnit = "f" {
        return (celsiusValue * 9 / 5) + 32
    } elseif toUnit = "k" {
        return celsiusValue + 273.15
    } else {
        return "Error: Unsupported temperature unit: "_toUnit
    }
}

ClassMethod GetSupportedUnits() As %String
{
    set units = $lb("c", "f","k")
    return $lts(units, ", ")
}

}
