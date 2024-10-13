// Based on MF CBA settings from SGD
// See the below website for how to set up and use a cba_settings folder specific to your server
// https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System

// TFAR - Global settings
force TFAR_AICanHearPlayer = false;
force TFAR_AICanHearSpeaker = false;

force TFAR_giveLongRangeRadioToGroupLeaders = false;
force TFAR_giveMicroDagrToSoldier = false;
force TFAR_givePersonalRadioToRegularSoldier = false;

force tfar_radioCodesDisabled = true;
force TFAR_SameLRFrequenciesForSide = true;
force TFAR_SameSRFrequenciesForSide = true;
force TFAR_setting_defaultFrequencies_lr_east = "84.1,84.2,84.3,84.4,84.5,84.6,84.7,84.8,84.9";
force TFAR_setting_defaultFrequencies_lr_independent = "84.1,84.2,84.3,84.4,84.5,84.6,84.7,84.8,84.9";
force TFAR_setting_defaultFrequencies_lr_west = "84.1,84.2,84.3,84.4,84.5,84.6,84.7,84.8,84.9";
force TFAR_setting_defaultFrequencies_sr_east = "61.1,61.2,61.3,61.4,61.5,61.6,61.7,61.8,61.9";
force TFAR_setting_defaultFrequencies_sr_independent = "61.1,61.2,61.3,61.4,61.5,61.6,61.7,61.8,61.9";
force TFAR_setting_defaultFrequencies_sr_west = "61.1,61.2,61.3,61.4,61.5,61.6,61.7,61.8,61.9";

force TFAR_setting_DefaultRadio_Airborne_east = "";
force TFAR_setting_DefaultRadio_Airborne_Independent = "";
force TFAR_setting_DefaultRadio_Airborne_West = "";
force TFAR_setting_DefaultRadio_Backpack_east = "";
force TFAR_setting_DefaultRadio_Backpack_Independent = "";
force TFAR_setting_DefaultRadio_Backpack_west = "";
force TFAR_setting_DefaultRadio_Personal_east = "";
force TFAR_setting_DefaultRadio_Personal_Independent = "";
force TFAR_setting_DefaultRadio_Personal_West = "";
force TFAR_setting_DefaultRadio_Rifleman_East = "";
force TFAR_setting_DefaultRadio_Rifleman_Independent = "";
force TFAR_setting_DefaultRadio_Rifleman_West = "";

force TFAR_takingRadio = 2;

// ACRE2
force acre_sys_core_automaticAntennaDirection = false;
force acre_sys_core_fullDuplex = false;
force acre_sys_core_ignoreAntennaDirection = true;
force acre_sys_core_interference = true;
force acre_sys_core_revealToAI = 1;
force acre_sys_core_terrainLoss = 1;
force acre_sys_core_ts3ChannelName = "";
force acre_sys_core_ts3ChannelPassword = "";
force acre_sys_core_ts3ChannelSwitch = true;
force acre_sys_signal_signalModel = 0;

// ACRE2 Gestures
force acre_sys_gestures_enabled = true;
force acre_sys_gestures_stopADS = true;

// ACRE2 Zeus
force acre_sys_zeus_zeusCanSpectate = false;
force acre_sys_zeus_zeusCommunicateViaCamera = true;
force acre_sys_zeus_zeusDefaultVoiceSource = false;

// ACE

// ACE Cook off
force ace_cookoff_ammoCookoffDuration = 1;
force ace_cookoff_destroyVehicleAfterCookoff = false;
force ace_cookoff_enable = 2;
force ace_cookoff_enableAmmobox = false;
force ace_cookoff_enableAmmoCookoff = false;
force ace_cookoff_enableFire = false;
force ace_cookoff_probabilityCoef = 1;

// ACE Dragging
force ace_dragging_allowRunWithLightweight = true;
ace_dragging_dragAndFire = true;
force ace_dragging_skipContainerWeight = false;
force ace_dragging_weightCoefficient = 0;

// ACE G-Forces
force ace_gforces_coef = 1;
force ace_gforces_enabledFor = 0;

// ACE Goggles
ace_goggles_effects = 2;
ace_goggles_showClearGlasses = true;
ace_goggles_showInThirdPerson = false;

// ACE Hearing
force ace_hearing_autoAddEarplugsToUnits = 1;
ace_hearing_disableEarRinging = true;
force ace_hearing_earplugsVolume = 0.5;
force ace_hearing_enableCombatDeafness = true;
force ace_hearing_enabledForZeusUnits = true;
force ace_hearing_unconsciousnessVolume = 0.4;

// ACE Medical
force ace_medical_ai_enabledFor = 2;
force ace_medical_ai_requireItems = 0;
force ace_medical_AIDamageThreshold = 1;
force ace_medical_bleedingCoefficient = 1;
force ace_medical_blood_bloodLifetime = 1200;
force ace_medical_blood_enabledFor = 2;
force ace_medical_blood_maxBloodObjects = 500;
force ace_medical_deathChance = 0.504122;
force ace_medical_dropWeaponUnconsciousChance = 0;
force ace_medical_enableVehicleCrashes = false;
force ace_medical_engine_damagePassThroughEffect = 1;
force ace_medical_fatalDamageSource = 2;
force ace_medical_fractureChance = 0.153883;
force ace_medical_fractures = 1;
force ace_medical_ivFlowRate = 1;
force ace_medical_limping = 1;
force ace_medical_painCoefficient = 1;
force ace_medical_painUnconsciousChance = 0.0473491;
force ace_medical_painUnconsciousThreshold = 0.5;
force ace_medical_playerDamageThreshold = 1;
force ace_medical_spontaneousWakeUpChance = 1;
force ace_medical_spontaneousWakeUpEpinephrineBoost = 30;
force ace_medical_statemachine_AIUnconsciousness = true;
force ace_medical_statemachine_cardiacArrestBleedoutEnabled = true;
force ace_medical_statemachine_cardiacArrestTime = 1208;
force ace_medical_statemachine_fatalInjuriesAI = 0;
force ace_medical_statemachine_fatalInjuriesPlayer = 0;
force ace_medical_treatment_advancedBandages = 1;
force ace_medical_treatment_advancedDiagnose = 1;
force ace_medical_treatment_advancedMedication = true;
force ace_medical_treatment_allowBodyBagUnconscious = false;
force ace_medical_treatment_allowGraveDigging = 1;
force ace_medical_treatment_allowLitterCreation = true;
force ace_medical_treatment_allowSelfIV = 1;
force ace_medical_treatment_allowSelfPAK = 0;
force ace_medical_treatment_allowSelfStitch = 1;
force ace_medical_treatment_allowSharedEquipment = 0;
force ace_medical_treatment_bandageEffectiveness = 1;
ace_medical_treatment_bandageRollover = true;
force ace_medical_treatment_clearTrauma = 1;
force ace_medical_treatment_consumePAK = 0;
force ace_medical_treatment_consumeSurgicalKit = 0;
force ace_medical_treatment_convertItems = 0;
force ace_medical_treatment_cprSuccessChanceMax = 0.4;
force ace_medical_treatment_cprSuccessChanceMin = 0.4;
force ace_medical_treatment_graveDiggingMarker = true;
force ace_medical_treatment_holsterRequired = 0;
force ace_medical_treatment_litterCleanupDelay = 600;
force ace_medical_treatment_locationEpinephrine = 0;
force ace_medical_treatment_locationIV = 0;
force ace_medical_treatment_locationPAK = 3;
force ace_medical_treatment_locationsBoostTraining = false;
force ace_medical_treatment_locationSurgicalKit = 2;
force ace_medical_treatment_maxLitterObjects = 500;
force ace_medical_treatment_medicEpinephrine = 0;
force ace_medical_treatment_medicIV = 0;
force ace_medical_treatment_medicPAK = 1;
force ace_medical_treatment_medicSurgicalKit = 1;
force ace_medical_treatment_timeCoefficientPAK = 1;
force ace_medical_treatment_treatmentTimeAutoinjector = 2;
force ace_medical_treatment_treatmentTimeBodyBag = 7.54496;
ace_medical_treatment_treatmentTimeCoeffZeus = 1;
force ace_medical_treatment_treatmentTimeCPR = 15;
force ace_medical_treatment_treatmentTimeGrave = 30;
force ace_medical_treatment_treatmentTimeIV = 12;
force ace_medical_treatment_treatmentTimeSplint = 7;
force ace_medical_treatment_treatmentTimeTourniquet = 3.99976;
force ace_medical_treatment_woundReopenChance = 1;
force ace_medical_treatment_woundStitchTime = 5;
force ace_medical_vitals_simulateSpO2 = true;

// ACE Nightvision
force ace_nightvision_aimDownSightsBlur = 0;
force ace_nightvision_disableNVGsWithSights = false;
force ace_nightvision_effectScaling = 0;
force ace_nightvision_fogScaling = 0.473486;
force ace_nightvision_noiseScaling = 0;
ace_nightvision_shutterEffects = true;

// ACE Overheating
force ace_overheating_cookoffCoef = 0;
force ace_overheating_coolingCoef = 1;
ace_overheating_displayTextOnJam = true;
force ace_overheating_enabled = false;
force ace_overheating_heatCoef = 1;
force ace_overheating_jamChanceCoef = 0;
force ace_overheating_overheatingDispersion = false;
force ace_overheating_overheatingRateOfFire = true;
ace_overheating_particleEffectsAndDispersionDistance = 3000;
ace_overheating_showParticleEffects = false;
ace_overheating_showParticleEffectsForEveryone = false;
force ace_overheating_suppressorCoef = 1;
force ace_overheating_unJamFailChance = 0.1;
force ace_overheating_unJamOnreload = false;
force ace_overheating_unJamOnSwapBarrel = false;

// ACE Trenches
force ace_trenches_bigEnvelopeDigDuration = 10;
force ace_trenches_bigEnvelopeRemoveDuration = 5;
force ace_trenches_smallEnvelopeDigDuration = 10;
force ace_trenches_smallEnvelopeRemoveDuration = 5;
