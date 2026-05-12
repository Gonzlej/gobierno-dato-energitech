CREATE TABLE IF NOT EXISTS clientes (
    id_cliente VARCHAR(20) PRIMARY KEY,
    nombre_titular VARCHAR(100) NOT NULL,
    dni_cif VARCHAR(20) NOT NULL,
    tipo_cliente ENUM('Residencial', 'PYME', 'Industrial') NOT NULL,
    segmento_valor ENUM('Oro', 'Plata', 'Bronce'),
    canal_preferencia VARCHAR(20),
    consentimiento_rgpd BOOLEAN DEFAULT FALSE,
    zona_tarifaria VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS contratos (
    id_contrato VARCHAR(20) PRIMARY KEY,
    id_cliente VARCHAR(20),
    potencia_contratada DECIMAL(10,2),
    tarifa_id VARCHAR(20),
    fecha_alta DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Datos Sintéticos
INSERT INTO clientes VALUES ('CLI001', 'Juan Pérez', '12345678X', 'Residencial', 'Plata', 'App', TRUE, 'Madrid_Z1');
INSERT INTO clientes VALUES ('CLI002', 'Talleres SL', 'B98765432', 'PYME', 'Oro', 'Email', TRUE, 'Barcelona_Z2');
INSERT INTO contratos VALUES ('CON_001', 'CLI001', 4.6, 'TUR_DHA', '2023-01-15');
INSERT INTO contratos VALUES ('CON_002', 'CLI002', 15.0, 'P2.0', '2022-11-20');