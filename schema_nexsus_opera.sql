-- ============================================================
-- PROJETO INTEGRADOR II - NEXSUS OPERA: DADOS EM SAÚDE
-- Instituição Parceira: Santa Casa de Misericórdia de Porto Alegre
-- Grupo 9 | Gestão da Tecnologia da Informação
-- ============================================================

-- 1. Criação da Tabela de Prontuário Unificado e Entrada Periférica
CREATE TABLE IF NOT EXISTS paciente_prontuario (
    id SERIAL PRIMARY KEY,
    cpf_cns VARCHAR(18) NOT NULL UNIQUE,
    nome_completo VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo_biologico VARCHAR(20) NOT NULL,
    
    -- Atributos Essenciais de Saúde
    tipo_sanguineo VARCHAR(5) NOT NULL,
    alergias TEXT DEFAULT 'Nenhuma informada',
    comorbidades TEXT DEFAULT 'Nenhuma informada',
    medicacao_continua TEXT DEFAULT 'Nenhuma informada',
    
    -- Contato de Emergência
    nome_contato_emergencia VARCHAR(100) NOT NULL,
    telefone_emergencia VARCHAR(20) NOT NULL,
    
    -- Governança e Conformidade com a LGPD
    termo_lgpd_aceito BOOLEAN NOT NULL DEFAULT FALSE,
    data_hora_aceite_lgpd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Controle de Auditoria do Sistema
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Criação de Índices para Busca Rápida no Atendimento/Triagem
CREATE INDEX IF NOT EXISTS idx_paciente_cpf_cns ON paciente_prontuario(cpf_cns);
CREATE INDEX IF NOT EXISTS idx_paciente_nome ON paciente_prontuario(nome_completo);

-- 3. Inserção de Massa de Dados Fictícios Anonimizados para Simulação
INSERT INTO paciente_prontuario (
    cpf_cns, 
    nome_completo, 
    data_nascimento, 
    sexo_biologico, 
    tipo_sanguineo, 
    alergias, 
    comorbidades, 
    medicacao_continua, 
    nome_contato_emergencia, 
    telefone_emergencia, 
    termo_lgpd_aceito
) VALUES 
(
    '123.456.789-00', 
    'Paciente Fictício Simulado 01', 
    '1985-04-12', 
    'Masculino', 
    'O+', 
    'Penicilina, Dipirona', 
    'Hipertensão Arterial', 
    'Losartana 50mg', 
    'Maria da Silva (Esposa)', 
    '(51) 99999-1111', 
    TRUE
),
(
    '987.654.321-11', 
    'Paciente Fictício Simulado 02', 
    '1992-09-25', 
    'Feminino', 
    'A-', 
    'Frutos do Mar, Iodo', 
    'Asma Brônquica', 
    'Salbutamol Spray', 
    'João Santos (Irmão)', 
    '(51) 98888-2222', 
    TRUE
),
(
    '741.852.963-22', 
    'Paciente Fictício Simulado 03', 
    '1970-01-30', 
    'Feminino', 
    'AB+', 
    'Nenhuma informada', 
    'Diabetes Tipo 2', 
    'Metformina 850mg', 
    'Carlos Andrade (Filho)', 
    '(51) 97777-3333', 
    TRUE
);

-- 4. Consulta de Validação (Simulação da Busca na Triagem)
SELECT 
    cpf_cns, 
    nome_completo, 
    tipo_sanguineo, 
    alergias, 
    comorbidades, 
    termo_lgpd_aceito, 
    data_hora_aceite_lgpd 
FROM paciente_prontuario;