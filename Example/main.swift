//
// main.swift
// SystemKitReborn
//
// The MIT License
//
// Copyright (C) 2022 BatemaDevelopment <https://github.com/lukas-batema>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import SystemKitReborn

print("MACHINE STATUS")

print("\nCPU")
print("\tPhysical Cores:  \(System.physicalCores())")
print("\tLogical Cores:   \(System.logicalCores())")

var sys = System()
let cpuUsage = sys.usageCPU()
print("\tSystem:          \(Int(cpuUsage.system))%")
print("\tUser:            \(Int(cpuUsage.user))%")
print("\tIdle:            \(Int(cpuUsage.idle))%")
print("\tNice:            \(Int(cpuUsage.nice))%")


print("\nMEMORY")
print("\tPhysical Size:   \(System.physicalMemory())GB")

let memoryUsage = System.memoryUsage()
func memoryUnit(_ value: Double) -> String {
    if value < 1.0 { return String(Int(value * 1000.0))    + "MB" }
    else           { return NSString(format:"%.2f", value) as String + "GB" }
}

print("\tFree:            \(memoryUnit(memoryUsage.free))")
print("\tWired:           \(memoryUnit(memoryUsage.wired))")
print("\tActive:          \(memoryUnit(memoryUsage.active))")
print("\tInactive:        \(memoryUnit(memoryUsage.inactive))")
print("\tCompressed:      \(memoryUnit(memoryUsage.compressed))")


print("\nSYSTEM")
print("\tModel:           \(System.modelName())")

let names = System.uname()
print("\tSystem Name:     \(names.sysname)")
print("\tNode Name:       \(names.nodename)")
print("\tRelease:         \(names.release)")
print("\tVersion:         \(names.version)")
print("\tMachine:         \(names.machine)")

let uptime = System.uptime()
print("\tUptime:          \(uptime.days)d \(uptime.hrs)h \(uptime.mins)m " +
                            "\(uptime.secs)s")

let counts = System.processCounts()
print("\tProcesses:       \(counts.processCount)")
print("\tThreads:         \(counts.threadCount)")

let loadAverage = System.loadAverage().map { NSString(format:"%.2f", $0) }
print("\tLoad Average:    \(loadAverage)")
print("\tMach Factor:     \(System.machFactor())")


print("\nPOWER")
let cpuThermalStatus = System.CPUPowerLimit()

print("\tCPU Speed Limit: \(cpuThermalStatus.processorSpeed)%")
print("\tCPUs Available:  \(cpuThermalStatus.processorCount)")
print("\tScheduler Limit: \(cpuThermalStatus.schedulerTime)%")

print("\tThermal Level:   \(System.thermalLevel().rawValue)")

var battery = Battery()
if battery.open() != kIOReturnSuccess { exit(0) }

print("\nBATTERY")
print("\tAC Powered:      \(battery.isACPowered())")
print("\tCharged:         \(battery.isCharged())")
print("\tCharging:        \(battery.isCharging())")
print("\tCharge:          \(battery.charge())%")
print("\tCapacity:        \(battery.currentCapacity()) mAh")
print("\tMax Capacity:    \(battery.maxCapactiy()) mAh")
print("\tDesign Capacity: \(battery.designCapacity()) mAh")
print("\tCycles:          \(battery.cycleCount())")
print("\tMax Cycles:      \(battery.designCycleCount())")
print("\tTemperature:     \(battery.temperature())°C")
print("\tTime Remaining:  \(battery.timeRemainingFormatted())")

_ = battery.close()
