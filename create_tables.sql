
CREATE TABLE patients_sql (
    patient_nbr BIGINT PRIMARY KEY,
    race TEXT,
    gender TEXT,
    age TEXT
);


CREATE TABLE hospital_visits_sql (
    encounter_id BIGINT PRIMARY KEY,
    patient_nbr BIGINT REFERENCES patients(patient_nbr),
    admission_type_id INTEGER,
    discharge_disposition_id INTEGER,
    admission_source_id INTEGER,
    time_in_hospital INTEGER,
    num_lab_procedures INTEGER,
    num_procedures INTEGER,
    num_medications INTEGER,
    number_outpatient INTEGER,
    number_emergency INTEGER,
    number_inpatient INTEGER,
    diag_1 TEXT,
    diag_2 TEXT,
    diag_3 TEXT,
    number_diagnoses INTEGER,
    max_glu_serum TEXT,
    a1cresult TEXT,
    metformin TEXT,
    insulin TEXT,
    change TEXT,
    diabetesmed TEXT,
    readmitted TEXT
);

