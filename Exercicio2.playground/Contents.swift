import UIKit

//-- Exercicio 1 CONVERSOR DE TEMPERATURAS
enum TemperatureUnit {
    case celsius
    case fahrenheit
}
struct Temperature {
    var value: Double
    var unit: TemperatureUnit

    init(value: Double, unit: TemperatureUnit) {
        self.value = value
        self.unit = unit
    }
}

func convert(temperature: Temperature, to unit: TemperatureUnit) -> Temperature {
    switch temperature.unit {
    case .celsius:
        if unit == .fahrenheit {
            let newValue = (temperature.value * 9/5) + 32
            return Temperature(value: newValue, unit: .fahrenheit)
        }
    case .fahrenheit:
        if unit == .celsius {
            let newValue = (temperature.value - 32) * 5/9
            return Temperature(value: newValue, unit: .celsius)
        }
    }
    return temperature
}

let celsiusTemperature = Temperature(value: 25, unit: .celsius)
let fahrenheitTemperature = Temperature(value: 50, unit: .fahrenheit)

let newCelsiusTemperature = convert(temperature: fahrenheitTemperature, to: .celsius)
let newFahrenheitTemperature = convert(temperature: celsiusTemperature, to: .fahrenheit)


print("\(celsiusTemperature.value)° \(celsiusTemperature.unit) é igual a \(fahrenheitTemperature.value)° \(fahrenheitTemperature.unit)")
print("\(fahrenheitTemperature.value)° \(fahrenheitTemperature.unit) é igual a \(newCelsiusTemperature.value)° \(newCelsiusTemperature.unit)")
