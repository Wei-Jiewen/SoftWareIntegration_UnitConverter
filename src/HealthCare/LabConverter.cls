Class HealthCare.LabConverter
{

ClassMethod Convert(value As %Numeric, fromUnit As %String, toUnit As %String) As %String
{
    // Normalize units to lowercase
    set fromUnit = $ZConvert(fromUnit, "L")
    set toUnit = $ZConvert(toUnit, "L")

    // route to appropriate conversion method based on units
    if ..IsGlucoseUnit(fromUnit, toUnit) {
        return ..ConvertGlucose(value, fromUnit, toUnit)
    } elseif ..IsCreatinineUnit(fromUnit, toUnit) {
        return ..ConvertCreatinine(value, fromUnit, toUnit)
    } else {
        return "Error: Unsupported unit conversion from "_fromUnit_" to "_toUnit
    }
}

ClassMethod ConvertGlucose(value As %Numeric, fromUnit As %String, toUnit As %String) As %Numeric
{
    // Normalize units to lowercase
    set fromUnit = $ZConvert(fromUnit, "L")
    set toUnit = $ZConvert(toUnit, "L")

    // Convert to mg/dL (base unit) first
    set valueInMgPerDl = 0
    if fromUnit = "mg/dl" {
        set valueInMgPerDl = value
    } elseif fromUnit = "mmol/l" {
        set valueInMgPerDl = value * 18.0182
    } else {
        return "Error: Unsupported glucose unit "_fromUnit
    }

    // Convert from base unit to target unit
    if toUnit = "mg/dl" {
        return $Normalize(valueInMgPerDl, 6)
    } elseif toUnit = "mmol/l" {
        return $Normalize(valueInMgPerDl / 18.0182, 6)
    } else {
        return "Error: Unsupported glucose unit "_toUnit
    }
}

ClassMethod ConvertCreatinine(value As %Numeric, fromUnit As %String, toUnit As %String) As %Numeric
{
    // normalize units to lowercase
    set fromUnit = $ZConvert(fromUnit, "L")
    set toUnit = $ZConvert(toUnit, "L")

    // convert to mg/dL (base unit) first
    set valueInMgPerDl = 0
    if fromUnit = "mg/dl" {
        set valueInMgPerDl = value
    } elseif fromUnit = "umol/l" {
        set valueInMgPerDl = value / 88.4
    } else {
        return "Error: Unsupported creatinine unit "_fromUnit
    }

    // Convert from base unit to target unit
    if toUnit = "mg/dl" {
        return valueInMgPerDl
    } elseif toUnit = "umol/l" {
        return valueInMgPerDl * 88.4
    } else {
        return "Error: Unsupported creatinine unit "_toUnit
    }
}

ClassMethod IsGlucoseUnit(fromUnit As %String, toUnit As %String) As %Boolean
{
    // Supported glucose units
    set glucoseUnits = $ListBuild("mg/dl","mmol/l")

    // Check if both units are in the supported list
    return ($ListFind(glucoseUnits, fromUnit) > 0) && ($ListFind(glucoseUnits, toUnit) > 0)
}

ClassMethod IsCreatinineUnit(fromUnit As %String, toUnit As %String) As %Boolean
{
    // Supported creatinine units
    set creatinineUnits = $ListBuild("mg/dl","umol/l")

    // Check if both units are in the supported list
    return ($ListFind(creatinineUnits, fromUnit) > 0) && ($ListFind(creatinineUnits, toUnit) > 0)
}

}
