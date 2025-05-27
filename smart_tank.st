PROGRAM SmartWaterTank

VAR
    TankLevel      : INT;     // percentage 0–100
    FlowRate       : REAL;    // in L/min
    Pump           : BOOL;    // Output
    OverflowAlarm  : BOOL;    // Output
    LowFlowAlarm   : BOOL;    // Output
    MaintenanceMode: BOOL;    // Input
    CurrentHour    : INT;     // 0–23 (simulate system time)
    LowFlowTimer   : TON;
END_VAR

// -------------------------
// Time-Based Pump Control
// -------------------------
IF NOT MaintenanceMode THEN
    IF (CurrentHour >= 22) OR (CurrentHour < 6) THEN
        IF TankLevel < 30 THEN
            Pump := TRUE;
        ELSIF TankLevel > 80 THEN
            Pump := FALSE;
        END_IF;
    ELSE
        Pump := FALSE;
    END_IF;
ELSE
    Pump := FALSE;
END_IF;

// -------------------------
// Overflow Safety
// -------------------------
IF TankLevel > 95 THEN
    Pump := FALSE;
    OverflowAlarm := TRUE;
ELSE
    OverflowAlarm := FALSE;
END_IF;

// -------------------------
// Flow Rate Alarm
// -------------------------
IF FlowRate < 10 THEN
    LowFlowTimer(IN := TRUE, PT := T#5m);
ELSE
    LowFlowTimer(IN := FALSE);
END_IF;

IF LowFlowTimer.Q THEN
    LowFlowAlarm := TRUE;
ELSE
    LowFlowAlarm := FALSE;
END_IF;
