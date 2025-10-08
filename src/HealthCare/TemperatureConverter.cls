Class HealthCare.TemperatureConverter
{

ClassMethod ConvertTemperature(value As %Numeric, fromUnit As %String, toUnit As %String) As %String
{
    // normalize units to lowercase
    set fromUnit = $ZConvert(fromUnit, "L")
    set toUnit = $ZConvert(toUnit, "L")
    
    // Convert to Celsius first
    set celsiusValue = ""
    if fromUnit = "c" {
        set celsiusValue = value
    } elseif fromUnit = "f" {
        set celsiusValue = (value - 32) * 5 / 9
    } elseif fromUnit = "k" {
        set celsiusValue = value - 273.15
    } else { 
        return "Error: Unsupported temperature unit: "_fromUnit
    }

    // Convert from Celsius to target unit
    if toUnit = "c" {
        return $Normalize(celsiusValue,6)
    } elseif toUnit = "f" {
        return $Normalize((celsiusValue * 9 / 5) + 32,6)
    } elseif toUnit = "k" {
        return $Normalize(celsiusValue + 273.15,6)
    } else {
        return "Error: Unsupported temperature unit: "_toUnit
    }
}

}
