-- Echamos un vistazo a los datos que vamos a usar.

-- Check database

SELECT *
FROM death_data
ORDER BY entity, year DESC;

-- Averiguo los 5 países de América Latina con más muertes en el año 2019 y
-- visualizo la población para agregar contexto.

-- We need to know the 5 latin american countries with more deaths in 2019,
-- and we put the population to add context.


SELECT entity, year, COALESCE(executions, '0') + Meningitis + Alzheimers_disease_and_other_dementias +
					  Parkinsons_disease + Nutritional_deficiencies + Malaria +
					  Drowning + Interpersonal_violence + Maternal_disorders +
					  HIV_AIDS + Drug_use_disorders + Tuberculosis +
					  Cardiovascular_diseases + Lower_respiratory_infections +
					  Neonatal_disorders + Alcohol_use_disorders + Self_harm +
					  Exposure_to_forces_of_nature + Diarrheal_diseases +
					  Environmental_heat_and_cold_exposure + Neoplasms +
					  Conflict_and_terrorism + Diabetes_mellitus +
					  Chronic_kidney_disease + Poisonings + Protein_energy_malnutrition +
					  COALESCE(Terrorism, '0') + Road_injuries + Chronic_respiratory_diseases +
					  Cirrhosis_and_diseases + Digestive_diseases +
					  Fire_heat_and_hot_substances + Acute_hepatitis AS Total_deaths, Population
FROM death_data
WHERE year = '2019'
ORDER BY total_deaths DESC
FETCH FIRST 5 ROWS ONLY;


-- Echamos un vistazo a los primeros 5 países y las causas de muerte más comunes.

-- We look the first 5 countries and the most common death causes.

SELECT *
FROM death_data
WHERE entity IN ('Brazil', 'Mexico', 'Argentina', 'Colombia', 'Venezuela') AND year = '2019'
ORDER BY population DESC;
