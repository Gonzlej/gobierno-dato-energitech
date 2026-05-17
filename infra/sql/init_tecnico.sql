CREATE TABLE IF NOT EXISTS mapa_contadores (
    id_meter VARCHAR(50) PRIMARY KEY,
    id_cliente VARCHAR(20),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    ultima_sincronizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS telemetria_iot (
    id SERIAL PRIMARY KEY,
    meter_id VARCHAR(50) REFERENCES mapa_contadores(id_meter),
    timestamp_lectura TIMESTAMP NOT NULL,
    kw_consumidos DECIMAL(12,4),
    voltaje DECIMAL(6,2),
    temp_ambiente DECIMAL(5,2),
    estado_sensor VARCHAR(10) -- OK, ERROR, LOW_BATT
);

-- Datos Sintéticos
INSERT INTO mapa_contadores (id_meter, id_cliente, latitud, longitud) 
VALUES ('MTR_9944', 'CLI001', 40.4167, -3.7037);

INSERT INTO telemetria_iot (meter_id, timestamp_lectura, kw_consumidos, voltaje, temp_ambiente, estado_sensor)
VALUES ('MTR_9944', NOW(), 0.452, 231.5, 22.4, 'OK');