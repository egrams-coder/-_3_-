//
//  main.swift
//  ДЗ_3_ЕвтюхинРоман
//
//  Created by Роман on 24.07.2020.
//  Copyright © 2020 Nebo. All rights reserved.
//

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum engineOnOff {
    case On
    case Off
}

enum windowOpenClosed {
    case Open
    case Closed
}

enum loadingUnloadingBody: Int {
    case loading = 250, unloading = 150
}

enum loadingUnloadingTrunk: Int {
    case loading = 6000, unloading = 5500
}

struct SportCar {
    let brand: String
    let release: Int
    var engine_On_Off: engineOnOff  {
        willSet {
            print("Пользователь собирается поменять параметры двигателя Ferrari по умолчанию")
        }
        didSet {
            if engine_On_Off == .On {
                print("Двигатель Ferrari - работает (пользовательская настройка)")
            } else {
                print("Двигатель Ferrari - отключен (пользовательская настройка) ")
            }
        }
    }
    var window_open_closed: windowOpenClosed {
        willSet {
            print("Пользователь собирается поменять параметры окон Ferrari по умолчанию ")
        }
        didSet {
            if window_open_closed == .Open {
                print("Окна Ferrari - открыты (пользовательская настройка)")
            } else {
                print("Окна Ferrari - закрыты (пользовательская настройка)")
            }
        }
    }
    let volume_body: Int
    var fullness_body: loadingUnloadingBody {
        willSet {
            print("Пользователь собирается поменять параметры - загрузка/разгрузка багажника Ferrari по умолчанию ")
        }
        didSet {
            if fullness_body == .loading {
                print("Идет загрузка багажника Ferrari в \(loadingUnloadingBody.loading.rawValue) л. (пользовательская настройка)")
            } else {
                print("Идет разгрузка багажника Ferrari \(loadingUnloadingBody.unloading.rawValue) л. (пользовательская настройка)")
            }
        }
    }

    func printSportCar()  {
        print("Автомобиль: \(brand)")
        print("Год выпуска: \(release)")
        if engine_On_Off == .On {
            print("Двигатель по умолчанию: включен")
        } else {
            print("Двигатель по умолчанию: отключен")
        }
        if window_open_closed == .Open {
            print("Окна по умолчанию: открыты")
        } else {
            print("Окна по умолчанию: закрыты")
        }
        print("Объём багажника: \(volume_body) л.")
        if fullness_body == .loading {
            print("Идёт загрузка багажника (по умолчанию) объёмом в \(loadingUnloadingBody.loading.rawValue) л.")
        } else {
            print("Идёт разгрузка багажника (по умолчанию) объёмом в \(loadingUnloadingBody.unloading.rawValue) л.")
        }
    }
}

var ferrari = SportCar(brand: "Ferrari", release: 2020, engine_On_Off: .On, window_open_closed: .Closed, volume_body: 300, fullness_body: .unloading)

struct TrunkCar {
    var brand: String
    var release: Int
    var engine_On_Off: engineOnOff
    var window_open_closed: windowOpenClosed
    var volume_trunk: Int
    var fullness_trunk: loadingUnloadingTrunk {
        willSet {
            print("Пользователь собирается поменять параметры - загрузка/разгрузка кузова Ural по умолчанию ")
        }
        didSet {
            if fullness_trunk == .loading {
                print("Идет загрузка кузова Ural в \(loadingUnloadingTrunk.loading.rawValue) л. (пользовательская настройка)")
            } else {
                print("Идет разгрузка кузова Ural в \(loadingUnloadingTrunk.unloading.rawValue) л. (пользовательская настройка)")
            }
        }
    }
    
    func printTrunkCar()  {
        print("Автомобиль: \(brand)")
        print("Год выпуска: \(release)")
        if engine_On_Off == .On {
            print("Двигатель по умолчанию: включен")
        } else {
            print("Двигатель по умолчанию: отключен")
        }
        if window_open_closed == .Open {
            print("Окна по умолчанию: открыты")
        } else {
            print("Окна по умолчанию: закрыты")
        }
        print("Объём багажника: \(volume_trunk) л.")
        if fullness_trunk == .loading {
            print("Идёт загрузка кузова (по умолчанию) объёмом в \(loadingUnloadingTrunk.loading.rawValue) л.")
        } else {
            print("Идёт разгрузка кузова (по умолчанию) объёмом в \(loadingUnloadingTrunk.unloading.rawValue) л.")
        }
    }

    mutating func windowChange (window change: windowOpenClosed) {
        self.window_open_closed = .Closed
        print("Пользователь ввел новые параметры - Окон в Ural - ", window_open_closed)
    }

    mutating func engineChange (engine change: engineOnOff) {
        self.engine_On_Off = .On
        print("Пользователь ввел новые параметры - Двигателя в Ural - ", engine_On_Off)
    }
}

var ural = TrunkCar(brand: "Ural", release: 1987, engine_On_Off: .Off, window_open_closed: .Open, volume_trunk: 7000, fullness_trunk: .unloading)


// Ferrari
print("Заводские данные: ")
print("---------------------------")
ferrari.printSportCar()
print("")
print("Пользовательские настройки: ")
print("---------------------------")
// Введите новые данные в настройки Ferrari
ferrari.engine_On_Off = .Off
ferrari.window_open_closed = .Open
ferrari.fullness_body = .loading


// Ural
print("")
print("Заводские данные: ")
print("---------------------------")
ural.printTrunkCar()
print("")
print("Пользовательские настройки: ")
print("---------------------------")
// Введите новые данные в настройки Ural
ural.engineChange(engine: .On)
ural.windowChange(window: .Closed)
ural.fullness_trunk = .unloading

