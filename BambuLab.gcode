; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 24m 10s; total estimated time: 32m 37s
; total layer number: 18
; total filament length [mm] : 2525.09,242.78
; total filament volume [cm^3] : 6073.55,583.96
; total filament weight [g] : 7.53,0.72
; model label id: 145,179
; filament_density: 1.24,1.24
; filament_diameter: 1.75,1.75
; max_z_height: 2.92
; filament: 1,2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 70,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 4
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0
; change_filament_gcode = ;=X1 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200
; close_fan_the_first_x_layers = 1,1
; complete_print_exhaust_fan_speed = 80,80
; cool_plate_temp = 35,35
; cool_plate_temp_initial_layer = 35,35
; cooling_filter_enabled = 0
; counter_coef_1 = 0,0
; counter_coef_2 = 0.025,0.025
; counter_coef_3 = -0.11,-0.11
; counter_limit_max = 0.05,0.05
; counter_limit_min = -0.04,-0.04
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50
; different_settings_to_system = inner_wall_speed;internal_solid_infill_speed;ironing_flow;ironing_speed;ironing_type;outer_wall_speed;prime_tower_infill_gap;prime_tower_rib_wall;sparse_infill_speed;support_style;top_surface_speed;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 60,60
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0
; enable_prime_tower = 1
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 45,45
; eng_plate_temp_initial_layer = 45,45
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100,100
; fan_direction = left
; fan_max_speed = 100,100
; fan_min_speed = 70,70
; filament_adaptive_volumetric_speed = 0,0
; filament_adhesiveness_category = 100,100
; filament_change_length = 10,10
; filament_change_length_nc = 10,10
; filament_colour = #FFFFFF;#00AE42
; filament_colour_type = 1;1
; filament_cooling_before_tower = 10,10
; filament_cost = 25.4,25.4
; filament_density = 1.24,1.24
; filament_deretraction_speed = 30,30
; filament_diameter = 1.75,1.75
; filament_end_gcode = "; filament end gcode \n;M106 P3 S0\n";"; filament end gcode \n;M106 P3 S0\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 1,1
; filament_flush_temp = 0,0
; filament_flush_volumetric_speed = 0,0
; filament_ids = ;
; filament_is_support = 0,0
; filament_map = 1,1
; filament_map_2 = 0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 26.8,26.8
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_multi_colour = #FFFFFF;#00AE42
; filament_notes = 
; filament_nozzle_map = 0,0
; filament_pre_cooling_temperature = 0,0
; filament_pre_cooling_temperature_nc = 0,0
; filament_prime_volume = 45,45
; filament_prime_volume_nc = 60,60
; filament_printable = 3,3
; filament_ramming_travel_time = 0,0
; filament_ramming_travel_time_nc = 0,0
; filament_ramming_volumetric_speed = -1,-1
; filament_ramming_volumetric_speed_nc = -1,-1
; filament_retract_before_wipe = 70%,70%
; filament_retract_length_nc = 10,10
; filament_retract_restart_extra = 0,0
; filament_retract_when_changing_layer = 1,1
; filament_retraction_length = 0.8,0.8
; filament_retraction_minimum_travel = 1,1
; filament_retraction_speed = 30,30
; filament_scarf_gap = 0,0
; filament_scarf_height = 10%,10%
; filament_scarf_length = 10,10
; filament_scarf_seam_type = none,none
; filament_self_index = 1,2
; filament_settings_id = "Bambu PLA Basic @Bambu Lab(coin(1).3mf)(coin(1).3mf)(bambu_badges(2).3mf)";"Bambu PLA Basic @Bambu Lab(coin(1).3mf)(coin(1).3mf)(bambu_badges(2).3mf)"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S180\n{elsif (bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S255\n{endif};Prevent PLA from jamming";"; filament start gcode\n{if (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S180\n{elsif (bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S255\n{endif};Prevent PLA from jamming"
; filament_type = PLA;PLA
; filament_velocity_adaptation_factor = 1,1
; filament_vendor = "Bambu Lab";"Bambu Lab"
; filament_volume_map = 0,0
; filament_wipe = 1,1
; filament_wipe_distance = 2,2
; filament_z_hop = 0.4,0.4
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,290,582,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 300
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0
; hole_coef_2 = -0.025,-0.025
; hole_coef_3 = 0.28,0.28
; hole_limit_max = 0.25,0.25
; hole_limit_min = 0.08,0.08
; host_type = octoprint
; hot_plate_temp = 45,45
; hot_plate_temp_initial_layer = 45,45
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 0,0
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 200
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 120
; ironing_direction = 45
; ironing_flow = 15%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 60
; ironing_type = top
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.16
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0
; machine_end_gcode = ;===== date: 20240528 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos\nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N100\nM1006 A49 B20 L100 C44 D20 M100 E41 F20 N100\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM960 S5 P0 ; turn off logo lamp\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: X1-0.4 ====================\n;===== date: 20251031 ==================\n;===== start printer sound ================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A46 B10 L100 C43 D10 M70 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A43 B10 L100 C0 D10 M60 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A41 B10 L100 C0 D10 M100 E41 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E44 F10 N100\nM1006 A49 B10 L100 C0 D10 M100 E49 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A48 B10 L100 C44 D10 M60 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M90 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A46 B10 L100 C43 D10 M60 E39 F10 N100\nM1006 W\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n{if scan_first_layer}\n;=========register first layer scan=====\nM977 S1 P60\n{endif}\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_no_support_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_no_support_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X128 Y128\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n;===== check scanner clarity ===========================\nG1 X128 Y128 F24000\nG28 Z P0\nM972 S5 P0\nG1 X230 Y15 F24000\n;===== check scanner clarity end =======================\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== mech mode fast check============================\n\n{if scan_first_layer}\n;start heatbed  scan====================================\nM976 S2 P1\nG90\nG1 X128 Y128 F20000\nM976 S3 P2  ;register void printing detection\n{endif}\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature[initial_no_support_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X231 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n\n;===== draw extrinsic para cali paint =================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M1002 gcode_claim_action : 8\n\n    T1000\n\n    G0 F1200.0 X231 Y12   Z0.2 E0.577\n    G0 F1200.0 X226 Y12   Z0.2 E0.275\n    G0 F1200.0 X226 Y1.5  Z0.2 E0.577\n    G0 F1200.0 X220 Y1.5  Z0.2 E0.330\n    G0 F1200.0 X220 Y8    Z0.2 E0.358\n    G0 F1200.0 X210 Y8    Z0.2 E0.549\n    G0 F1200.0 X210 Y1.5  Z0.2 E0.357\n\n    G0 X48.0 E11.9 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X48.0 Y12 E0.772 F1200.0\n    G0 X45.0 E0.22 F1200.0\n    G0 X35.0 Y6.0 E0.86 F1200.0\n\n    ;=========== extruder cali extrusion ==================\n    T1000\n    M83\n    {if default_acceleration > 0}\n        {if outer_wall_acceleration > 0}\n            M204 S[outer_wall_acceleration]\n        {else}\n            M204 S[default_acceleration]\n        {endif}\n    {endif}\n    G0 X35.000 Y6.000 Z0.300 F30000 E0\n    G1 F1500.000 E0.800\n    M106 S0 ; turn off fan\n    G0 X185.000 E9.35441 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G0 X187 Z0\n    G1 F1500.000 E-0.800\n    G0 Z1\n    G0 X180 Z0.3 F18000\n\n    M900 L1000.0 M1.0\n    M900 K0.040\n    G0 X45.000 F30000\n    G0 Y8.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.020\n    G0 X45.000 F30000\n    G0 Y10.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.000\n    G0 X45.000 F30000\n    G0 Y12.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n\n    G0 X45.000 F30000 ; move to start point\n\nM623 ; end of "draw extrinsic para cali paint"\n\n\nM1002 judge_flag extrude_cali_flag\nM622 J0\n    G0 X231 Y1.5 F30000\n    G0 X18 E14.3 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM623\n\nM104 S140\n\n\n;=========== laser and rgb calibration ===========\nM400\nM18 E\nM500 R\n\nM973 S3 P14\n\nG1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nT1100\nG1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nM400 P100\nM960 S1 P1\nM400 P100\nM973 S6 P0; use auto exposure for horizontal laser by xcam\nM960 S0 P0\n\nG1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos\nM960 S2 P1\nM400 P100\nM973 S6 P1; use auto exposure for vertical laser by xcam\nM960 S0 P0\n\n;=========== handeye calibration ======================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M973 S3 P1 ; camera start stream\n    M400 P500\n    M973 S1\n    G0 F6000 X228.500 Y4.750 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X215.00 Y4.750\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y6.75\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y6.75\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X215.00 Y4.750\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G1 Z3 F3000\n\n    M400\n    M500 ; save cali data\n\n    M104 S{nozzle_temperature[initial_no_support_extruder]} ; rise nozzle temp now ,to reduce temp waiting time.\n\n    T1100\n    M400 P400\n    M960 S0 P0\n    G0 F30000.000 Y10.000 X65.000 Z0.000\n    M400 P400\n    M960 S1 P1\n    M400 P50\n\n    M969 S1 N3 A2000\n    G0 F360.000 X181.000 Z0.000\n    M980.3 A70.000 B{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60/4} C5.000 D{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60} E5.000 F175.000 H1.000 I0.000 J0.020 K0.040\n    M400 P100\n    G0 F20000\n    G0 Z1 ; rise nozzle up\n    T1000 ; change to nozzle space\n    G0 X45.000 Y4.000 F30000 ; move to test line pos\n    M969 S0 ; turn off scanning\n    M960 S0 P0\n\n\n    G1 Z2 F20000\n    T1000\n    G0 X45.000 Y4.000 F30000 E0\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n    G0 Z0.3\n    G1 F1500.000 E3.600\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n\n    ; see if extrude cali success, if not ,use default value\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M400\n        M900 K0.02 M{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*0.02}\n    M623\n\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X185.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X190.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X195.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X200.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X205.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X210.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X215.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X220.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X225.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    M973 S4\n\nM623\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM973 S4 ; turn off scanner\nM400 ; wait all motion done before implement the emprical L parameters\n;M900 L500.0 ; Empirical parameters\nM109 S[nozzle_temperature_initial_layer]\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n;===== purge line to wipe the nozzle ============================\nG1 E{-retraction_length[initial_no_support_extruder]} F1800\nG1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position\nG1 E{retraction_length[initial_no_support_extruder]} F1800\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG1 Z0.2\nG0 X239 E15 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\nG0 Y12 E0.7 F{outer_wall_volumetric_speed/(0.3*0.5)/4* 60}\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220,220
; nozzle_temperature_initial_layer = 220,220
; nozzle_temperature_range_high = 240,240
; nozzle_temperature_range_low = 190,190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 160
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,50%
; overhang_threshold_participating_cooling = 95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 100%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 0
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.16mm Optimal @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab X1
; printer_notes = 
; printer_settings_id = Bambu Lab X1 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 0,0
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 10,10
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 1
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 4,4
; slow_down_min_speed = 60,60
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 200
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 35,35
; supertack_plate_temp_initial_layer = 35,35
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.16
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = tree_hybrid
; support_threshold_angle = 25
; support_top_z_distance = 0.16
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 60,60
; template_custom_gcode = 
; textured_plate_temp = 45,45
; textured_plate_temp_initial_layer = 45,45
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 6
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 60
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = ;
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 40
; wipe_tower_y = 200
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R32
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
; FEATURE: Custom
;===== machine: X1-0.4 ====================
;===== date: 20251031 ==================
;===== start printer sound ================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A46 B10 L100 C43 D10 M70 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A43 B10 L100 C0 D10 M60 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A41 B10 L100 C0 D10 M100 E41 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E44 F10 N100
M1006 A49 B10 L100 C0 D10 M100 E49 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A48 B10 L100 C44 D10 M60 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M90 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A46 B10 L100 C43 D10 M60 E39 F10 N100
M1006 W
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S45 ;set bed temp
M190 S45 ;wait for bed temp


;=========register first layer scan=====
M977 S1 P60


;=============turn on fans to prevent PLA jamming=================

    ;Prevent PLA from jamming
    M142 P1 R35 S40

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F668.524 T240

M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P4 R31
G1 E50 F200
M400
M104 S220
G92 E0
M73 P18 R26
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P19 R26
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
M73 P20 R26
G1 Z10
G1 F30000
G1 X128 Y128
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================

;===== check scanner clarity ===========================
G1 X128 Y128 F24000
G28 Z P0
M972 S5 P0
G1 X230 Y15 F24000
;===== check scanner clarity end =======================

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X36.8005 Y106.899 I135.644 J105.8
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression

;=============turn on fans to prevent PLA jamming=================

    ;Prevent PLA from jamming
    M142 P1 R35 S40

M106 P2 S100 ; turn on big fan ,to cool down toolhead

M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

M73 P20 R25
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== mech mode fast check============================


;start heatbed  scan====================================
M976 S2 P1
G90
G1 X128 Y128 F20000
M976 S3 P2  ;register void printing detection


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F3949.2
G0 Y11 E0.700 F987.299
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X231 E0.700 F3949.2
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate


;===== draw extrinsic para cali paint =================
M1002 judge_flag extrude_cali_flag
M622 J1

    M1002 gcode_claim_action : 8

    T1000

    G0 F1200.0 X231 Y12   Z0.2 E0.577
    G0 F1200.0 X226 Y12   Z0.2 E0.275
    G0 F1200.0 X226 Y1.5  Z0.2 E0.577
    G0 F1200.0 X220 Y1.5  Z0.2 E0.330
    G0 F1200.0 X220 Y8    Z0.2 E0.358
    G0 F1200.0 X210 Y8    Z0.2 E0.549
    G0 F1200.0 X210 Y1.5  Z0.2 E0.357

    G0 X48.0 E11.9 F3949.2
    G0 X48.0 Y12 E0.772 F1200.0
    G0 X45.0 E0.22 F1200.0
    G0 X35.0 Y6.0 E0.86 F1200.0

    ;=========== extruder cali extrusion ==================
    T1000
    M83
    
        
            M204 S5000
        
    
    G0 X35.000 Y6.000 Z0.300 F30000 E0
    G1 F1500.000 E0.800
    M106 S0 ; turn off fan
    G0 X185.000 E9.35441 F3949.2
    G0 X187 Z0
    G1 F1500.000 E-0.800
    G0 Z1
    G0 X180 Z0.3 F18000

    M900 L1000.0 M1.0
    M900 K0.040
    G0 X45.000 F30000
    G0 Y8.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F987.299
    G1 X70.000 E0.31181 F987.299
    G1 X75.000 E0.31181 F3949.2
    G1 X80.000 E0.31181 F987.299
    G1 X85.000 E0.31181 F3949.2
    G1 X90.000 E0.31181 F987.299
    G1 X95.000 E0.31181 F3949.2
    G1 X100.000 E0.31181 F987.299
    G1 X105.000 E0.31181 F3949.2
    G1 X110.000 E0.31181 F987.299
M73 P21 R25
    G1 X115.000 E0.31181 F3949.2
    G1 X120.000 E0.31181 F987.299
    G1 X125.000 E0.31181 F3949.2
    G1 X130.000 E0.31181 F987.299
    G1 X135.000 E0.31181 F3949.2
    G1 X140.000 E0.31181 F987.299
    G1 X145.000 E0.31181 F3949.2
    G1 X150.000 E0.31181 F987.299
    G1 X155.000 E0.31181 F3949.2
    G1 X160.000 E0.31181 F987.299
    G1 X165.000 E0.31181 F3949.2
    G1 X170.000 E0.31181 F987.299
    G1 X175.000 E0.31181 F3949.2
    G1 X180.000 E0.31181 F3949.2
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.020
    G0 X45.000 F30000
    G0 Y10.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F987.299
    G1 X70.000 E0.31181 F987.299
    G1 X75.000 E0.31181 F3949.2
    G1 X80.000 E0.31181 F987.299
    G1 X85.000 E0.31181 F3949.2
    G1 X90.000 E0.31181 F987.299
    G1 X95.000 E0.31181 F3949.2
    G1 X100.000 E0.31181 F987.299
    G1 X105.000 E0.31181 F3949.2
    G1 X110.000 E0.31181 F987.299
    G1 X115.000 E0.31181 F3949.2
    G1 X120.000 E0.31181 F987.299
    G1 X125.000 E0.31181 F3949.2
M73 P22 R25
    G1 X130.000 E0.31181 F987.299
    G1 X135.000 E0.31181 F3949.2
    G1 X140.000 E0.31181 F987.299
    G1 X145.000 E0.31181 F3949.2
    G1 X150.000 E0.31181 F987.299
    G1 X155.000 E0.31181 F3949.2
    G1 X160.000 E0.31181 F987.299
    G1 X165.000 E0.31181 F3949.2
    G1 X170.000 E0.31181 F987.299
    G1 X175.000 E0.31181 F3949.2
    G1 X180.000 E0.31181 F3949.2
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.000
    G0 X45.000 F30000
    G0 Y12.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F987.299
    G1 X70.000 E0.31181 F987.299
    G1 X75.000 E0.31181 F3949.2
    G1 X80.000 E0.31181 F987.299
    G1 X85.000 E0.31181 F3949.2
    G1 X90.000 E0.31181 F987.299
    G1 X95.000 E0.31181 F3949.2
    G1 X100.000 E0.31181 F987.299
    G1 X105.000 E0.31181 F3949.2
    G1 X110.000 E0.31181 F987.299
    G1 X115.000 E0.31181 F3949.2
    G1 X120.000 E0.31181 F987.299
    G1 X125.000 E0.31181 F3949.2
    G1 X130.000 E0.31181 F987.299
    G1 X135.000 E0.31181 F3949.2
    G1 X140.000 E0.31181 F987.299
    G1 X145.000 E0.31181 F3949.2
    G1 X150.000 E0.31181 F987.299
    G1 X155.000 E0.31181 F3949.2
    G1 X160.000 E0.31181 F987.299
    G1 X165.000 E0.31181 F3949.2
    G1 X170.000 E0.31181 F987.299
    G1 X175.000 E0.31181 F3949.2
    G1 X180.000 E0.31181 F3949.2
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3

    G0 X45.000 F30000 ; move to start point

M623 ; end of "draw extrinsic para cali paint"


M1002 judge_flag extrude_cali_flag
M622 J0
    G0 X231 Y1.5 F30000
    G0 X18 E14.3 F3949.2
M623

M104 S140


;=========== laser and rgb calibration ===========
M400
M18 E
M500 R

M973 S3 P14

G1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
T1100
G1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
M400 P100
M960 S1 P1
M400 P100
M973 S6 P0; use auto exposure for horizontal laser by xcam
M960 S0 P0

G1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos
M960 S2 P1
M400 P100
M973 S6 P1; use auto exposure for vertical laser by xcam
M960 S0 P0

;=========== handeye calibration ======================
M1002 judge_flag extrude_cali_flag
M622 J1

    M973 S3 P1 ; camera start stream
    M400 P500
    M973 S1
    G0 F6000 X228.500 Y4.750 Z0.000
    M960 S0 P1
    M973 S1
    M400 P800
    M971 S6 P0
    M973 S2 P0
    M400 P500
    G0 Z0.000 F12000
    M960 S0 P0
    M960 S1 P1
    G0 X215.00 Y4.750
    M400 P200
    M971 S5 P1
    M973 S2 P1
    M400 P500
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y6.75
    M400 P200
    M971 S5 P3
    G0 Z0.500 F12000
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y6.75
    M400 P200
    M971 S5 P4
    M973 S2 P0
    M400 P500
    M960 S0 P0
    M960 S1 P1
    G0 X215.00 Y4.750
    M400 P500
    M971 S5 P2
    M963 S1
    M400 P1500
    M964
    T1100
    G1 Z3 F3000

    M400
    M500 ; save cali data

    M104 S220 ; rise nozzle temp now ,to reduce temp waiting time.

    T1100
    M400 P400
    M960 S0 P0
    G0 F30000.000 Y10.000 X65.000 Z0.000
    M400 P400
    M960 S1 P1
    M400 P50

    M969 S1 N3 A2000
    G0 F360.000 X181.000 Z0.000
    M980.3 A70.000 B61.6019 C5.000 D246.408 E5.000 F175.000 H1.000 I0.000 J0.020 K0.040
    M400 P100
    G0 F20000
    G0 Z1 ; rise nozzle up
    T1000 ; change to nozzle space
    G0 X45.000 Y4.000 F30000 ; move to test line pos
    M969 S0 ; turn off scanning
    M960 S0 P0


    G1 Z2 F20000
    T1000
    G0 X45.000 Y4.000 F30000 E0
    M109 S220
    G0 Z0.3
    G1 F1500.000 E3.600
    G1 X65.000 E1.24726 F987.299
    G1 X70.000 E0.31181 F987.299
    G1 X75.000 E0.31181 F3949.2
    G1 X80.000 E0.31181 F987.299
    G1 X85.000 E0.31181 F3949.2
    G1 X90.000 E0.31181 F987.299
    G1 X95.000 E0.31181 F3949.2
    G1 X100.000 E0.31181 F987.299
    G1 X105.000 E0.31181 F3949.2
    G1 X110.000 E0.31181 F987.299
M73 P23 R25
    G1 X115.000 E0.31181 F3949.2
    G1 X120.000 E0.31181 F987.299
    G1 X125.000 E0.31181 F3949.2
    G1 X130.000 E0.31181 F987.299
    G1 X135.000 E0.31181 F3949.2

    ; see if extrude cali success, if not ,use default value
    M1002 judge_last_extrude_cali_success
    M622 J0
        M400
        M900 K0.02 M0.0821359
    M623

    G1 X140.000 E0.31181 F987.299
    G1 X145.000 E0.31181 F3949.2
    G1 X150.000 E0.31181 F987.299
    G1 X155.000 E0.31181 F3949.2
    G1 X160.000 E0.31181 F987.299
    G1 X165.000 E0.31181 F3949.2
    G1 X170.000 E0.31181 F987.299
    G1 X175.000 E0.31181 F3949.2
    G1 X180.000 E0.31181 F987.299
    G1 X185.000 E0.31181 F3949.2
    G1 X190.000 E0.31181 F987.299
    G1 X195.000 E0.31181 F3949.2
    G1 X200.000 E0.31181 F987.299
    G1 X205.000 E0.31181 F3949.2
    G1 X210.000 E0.31181 F987.299
    G1 X215.000 E0.31181 F3949.2
    G1 X220.000 E0.31181 F987.299
    G1 X225.000 E0.31181 F3949.2
    M973 S4

M623

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M973 S4 ; turn off scanner
M400 ; wait all motion done before implement the emprical L parameters
;M900 L500.0 ; Empirical parameters
M109 S220
M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000
;===== purge line to wipe the nozzle ============================
G1 E-0.8 F1800
G1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position
G1 E0.8 F1800
M109 S220
G1 Z0.2
G0 X239 E15 F3949.2
G0 Y12 E0.7 F987.299
; MACHINE_START_GCODE_END
; filament start gcode
;Prevent PLA from jamming
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.2 F30000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 1/18
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
G1 E-.8 F1800
M204 S6000
G1 Z.6 F30000
; object ids of layer 1 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer1 end: 145,179
M625
M204 S6000
G1 X74.5 Y206.5
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S500
G1  X40.500 Y206.500  E1.2922 F3000
G1  Y198.500  E0.3041
G1  X74.500  E1.2922
G1  Y206.500  E0.3041
M204 S6000
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #2
M204 S500
G1  Y199.000  E0.0190
G1  X74.000  E1.2352
M73 P23 R24
G1  Y199.500  E0.0190
G1  X41.000  E1.2542
G1  Y200.000  E0.0190
G1  X74.000  E1.2542
G1  Y200.500  E0.0190
G1  X41.000  E1.2542
G1  Y201.000  E0.0190
G1  X74.000  E1.2542
G1  Y201.500  E0.0190
G1  X41.000  E1.2542
G1  Y202.000  E0.0190
G1  X74.000  E1.2542
G1  Y202.500  E0.0190
G1  X41.000  E1.2542
G1  Y203.000  E0.0190
G1  X74.000  E1.2542
G1  Y203.500  E0.0190
G1  X41.000  E1.2542
G1  Y204.000  E0.0190
G1  X74.000  E1.2542
G1  Y204.500  E0.0190
G1  X41.000  E1.2542
G1  Y205.000  E0.0190
G1  X74.000  E1.2542
G1  Y205.500  E0.0190
G1  X41.000  E1.2542
G1  Y206.000  E0.0190
G1  X74.000  E1.2542
G1  Y206.500  E0.0190
; CP EMPTY GRID END
;------------------






M204 S6000
G1  X75.000 Y207.500  
M204 S500
G1  X40.000  E1.3302
G1  Y198.000  E0.3611
G1  X75.000  E1.3302
M73 P24 R24
G1  Y207.500  E0.3611
M204 S6000
G1  X75.457 Y207.957  
M204 S500
G1  X39.543  E1.3650
G1  Y197.543  E0.3958
G1  X75.457  E1.3650
M73 P25 R24
G1  Y207.957  E0.3958
M204 S6000
G1  X75.914 Y208.414  
M204 S500
G1  X39.086  E1.3997
G1  Y197.086  E0.4305
G1  X75.914  E1.3997
G1  Y208.414  E0.4305
M204 S6000
G1  X76.371 Y208.871  
M204 S500
G1  X38.629  E1.4345
G1  Y196.629  E0.4653
G1  X76.371  E1.4345
G1  Y208.871  E0.4653
M204 S6000
G1  X76.828 Y209.328  
M204 S500
G1  X38.172  E1.4692
G1  Y196.172  E0.5000
G1  X76.828  E1.4692
G1  Y209.328  E0.5000
M204 S6000
G1  X77.285 Y209.785  
M204 S500
G1  X37.715  E1.5039
G1  Y195.715  E0.5348
G1  X77.285  E1.5039
G1  Y209.785  E0.5348
M204 S6000
G1  X77.742 Y210.242  
M204 S500
G1  X37.258  E1.5387
G1  Y195.258  E0.5695
G1  X77.742  E1.5387
G1  Y210.242  E0.5695
M204 S6000
G1  X78.199 Y210.699  
M204 S500
G1  X36.801  E1.5734
G1  Y194.801  E0.6043
G1  X78.199  E1.5734
G1  Y210.699  E0.6043
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F24000
M204 S500
G1 X78.199 Y208.699 E-.228
; WIPE_END
G1 E-.012 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S6000
G1 X137.968 Y137.415
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G3 X150.709 Y105.828 I14.471 J-12.526 E1.59581
G3 X153 Y105.758 I1.98 J27.24 E.08717
G3 X138.007 Y137.461 I-.562 J19.131 E2.8852
M204 S6000
G1 X137.622 Y137.714 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X149.514 Y105.512 I14.816 J-12.825 E1.58977
G3 X153.027 Y105.301 I2.918 J19.28 E.13391
G3 X137.661 Y137.76 I-.588 J19.588 E2.95367
G1 E-.56 F1800
; WIPE_START
G1 F3000
G1 X136.888 Y136.814 E-.13926
G1 X136.433 Y136.182 E-.08874
; WIPE_END
G1 E-.012 F1800
M204 S6000
G1 X141.913 Y130.87 Z.6 F30000
G1 X163.762 Y109.689 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50029
M73 P26 R24
G1 F6300
M204 S500
G1 X165.878 Y111.805 E.1138
G3 X168.27 Y114.845 I-13.035 J12.722 E.14738
G1 X162.426 Y109.015 E.31395
G2 X160.982 Y108.203 I-7.558 J11.755 E.06304
G1 X169.147 Y116.368 E.43917
G3 X169.704 Y117.572 I-9.871 J5.297 E.05046
G1 X159.765 Y107.633 E.53455
G2 X158.706 Y107.221 I-4 J8.712 E.04324
G1 X170.115 Y118.63 E.6136
G3 X170.428 Y119.589 I-7.928 J3.116 E.03841
G1 X157.75 Y106.912 E.68184
G2 X156.867 Y106.675 I-2.438 J7.324 E.03482
G1 X170.671 Y120.48 E.74246
G1 X170.846 Y121.301 E.03193
G1 X156.035 Y106.49 E.79656
G1 X155.249 Y106.35 E.03039
G1 X170.978 Y122.08 E.84599
G3 X171.08 Y122.829 I-6.251 J1.231 E.02875
G1 X154.511 Y106.26 E.89113
G2 X153.797 Y106.193 I-.922 J5.98 E.02729
G1 X171.145 Y123.54 E.93301
G3 X171.178 Y124.221 I-5.719 J.624 E.02593
G1 X153.111 Y106.153 E.97173
M73 P26 R23
G2 X152.457 Y106.147 I-.384 J5.615 E.02487
G1 X171.198 Y124.887 E1.00791
G1 X171.18 Y125.516 E.02394
G1 X151.813 Y106.149 E1.0416
G1 X151.204 Y106.187 E.02322
G1 X171.153 Y126.136 E1.07292
G1 X171.101 Y126.731 E.02271
G1 X150.602 Y106.232 E1.10248
G1 X150.025 Y106.302 E.0221
G1 X171.036 Y127.312 E1.13001
G1 X170.953 Y127.876 E.02167
G1 X149.458 Y106.382 E1.15605
G1 X148.911 Y106.481 E.02116
G1 X170.856 Y128.426 E1.18029
G1 X170.745 Y128.962 E.02079
G1 X148.373 Y106.59 E1.20324
G1 X147.853 Y106.716 E.02036
G1 X170.622 Y129.485 E1.22459
G1 X170.483 Y129.994 E.02005
G1 X147.34 Y106.851 E1.24473
G1 X146.845 Y107.002 E.0197
G1 X170.337 Y130.495 E1.26351
G1 X170.175 Y130.979 E.01942
G1 X146.352 Y107.156 E1.28125
G1 X145.881 Y107.332 E.01912
G1 X170.008 Y131.46 E1.29763
M73 P27 R23
G1 X169.823 Y131.92 E.0189
G1 X145.41 Y107.508 E1.31296
G2 X144.96 Y107.705 I1.427 J3.892 E.0187
G1 X169.637 Y132.381 E1.32719
G3 X169.43 Y132.822 I-3.804 J-1.512 E.01851
G1 X144.512 Y107.903 E1.34022
G2 X144.077 Y108.115 I1.569 J3.766 E.01841
G1 X169.222 Y133.261 E1.35241
G3 X169.001 Y133.686 I-3.691 J-1.65 E.01825
G1 X143.65 Y108.335 E1.36345
G2 X143.23 Y108.562 I1.701 J3.656 E.01817
G1 X168.772 Y134.104 E1.37372
G3 X168.537 Y134.515 I-3.585 J-1.776 E.01804
G1 X142.824 Y108.803 E1.38291
G1 X142.418 Y109.044 E.01795
G1 X168.287 Y134.913 E1.39131
G1 X168.037 Y135.31 E.01784
G1 X142.031 Y109.304 E1.39868
G1 X141.646 Y109.565 E.01772
G1 X167.769 Y135.688 E1.40501
G1 X167.5 Y136.066 E.01763
G1 X141.271 Y109.837 E1.41065
G1 X140.905 Y110.118 E.01755
G1 X167.22 Y136.433 E1.41529
G1 X166.931 Y136.79 E.01749
G1 X140.542 Y110.402 E1.41926
G1 X140.195 Y110.702 E.01744
G1 X166.639 Y137.146 E1.42225
G1 X166.331 Y137.484 E.01741
G1 X139.848 Y111.002 E1.42431
G2 X139.516 Y111.316 I2.485 J2.962 E.01741
G1 X166.022 Y137.823 E1.42561
G3 X165.701 Y138.148 I-2.901 J-2.546 E.0174
G1 X139.188 Y111.635 E1.42593
G2 X138.867 Y111.961 I2.578 J2.87 E.0174
G1 X165.373 Y138.467 E1.42561
G3 X165.041 Y138.781 I-2.815 J-2.645 E.01741
G1 X138.558 Y112.299 E1.42431
G1 X138.25 Y112.637 E.01741
G1 X164.694 Y139.081 E1.42225
G1 X164.347 Y139.381 E.01744
G1 X137.959 Y112.993 E1.41926
G1 X137.669 Y113.351 E.01749
G1 X163.984 Y139.665 E1.41529
G1 X163.618 Y139.946 E.01755
G1 X137.39 Y113.717 E1.41065
G1 X137.12 Y114.095 E.01763
G1 X163.244 Y140.218 E1.40501
G1 X162.858 Y140.479 E.01772
G1 X136.852 Y114.473 E1.39868
G1 X136.602 Y114.871 E.01784
G1 X162.471 Y140.739 E1.39132
G1 X162.065 Y140.98 E.01795
G1 X136.352 Y115.268 E1.38291
G2 X136.117 Y115.679 I3.346 J2.186 E.01804
G1 X161.659 Y141.221 E1.37372
G3 X161.239 Y141.448 I-2.121 J-3.429 E.01817
G1 X135.888 Y116.097 E1.36345
G2 X135.667 Y116.522 I3.474 J2.077 E.01825
G1 X160.812 Y141.668 E1.35241
G3 X160.378 Y141.88 I-2.004 J-3.555 E.0184
G1 X135.459 Y116.961 E1.34022
G2 X135.252 Y117.402 I3.599 J1.953 E.01851
G1 X159.929 Y142.079 E1.3272
G3 X159.479 Y142.275 I-1.884 J-3.709 E.0187
M73 P28 R23
G1 X135.067 Y117.863 E1.31296
G1 X134.881 Y118.324 E.0189
G1 X159.008 Y142.451 E1.29764
G1 X158.537 Y142.627 E.01912
G1 X134.714 Y118.804 E1.28125
G1 X134.552 Y119.288 E.01942
G1 X158.045 Y142.781 E1.26353
G1 X157.55 Y142.933 E.01968
G1 X134.406 Y119.789 E1.24479
G1 X134.268 Y120.298 E.02005
G1 X157.037 Y143.067 E1.22459
G1 X156.516 Y143.193 E.02036
G1 X134.144 Y120.821 E1.20324
G1 X134.033 Y121.357 E.02079
G1 X155.978 Y143.302 E1.1803
G1 X155.431 Y143.401 E.02116
G1 X133.936 Y121.907 E1.15605
G1 X133.853 Y122.471 E.02167
G1 X154.864 Y143.481 E1.13001
G1 X154.287 Y143.551 E.0221
G1 X133.788 Y123.052 E1.10248
G1 X133.736 Y123.647 E.02271
G1 X153.685 Y143.596 E1.07292
G1 X153.076 Y143.634 E.02322
G1 X133.709 Y124.267 E1.0416
G1 X133.692 Y124.896 E.02394
G1 X152.433 Y143.637 E1.00795
G3 X151.778 Y143.63 I-.265 J-5.511 E.0249
G1 X133.711 Y125.562 E.97173
G2 X133.744 Y126.243 I5.749 J.057 E.02593
G1 X151.092 Y143.59 E.93301
G3 X150.378 Y143.523 I.208 J-6.047 E.02729
G1 X133.809 Y126.954 E.89113
G2 X133.911 Y127.703 I6.352 J-.482 E.02875
G1 X149.641 Y143.433 E.84599
G1 X148.854 Y143.293 E.03039
G1 X134.043 Y128.482 E.79656
G1 X134.218 Y129.304 E.03193
G1 X148.023 Y143.108 E.74246
G3 X147.139 Y142.871 I1.555 J-7.565 E.03482
G1 X134.461 Y130.194 E.68184
G2 X134.774 Y131.153 I8.238 J-2.155 E.03841
G1 X146.183 Y142.562 E.61361
G3 X145.124 Y142.15 I2.942 J-9.127 E.04324
G1 X135.185 Y132.211 E.53455
G2 X135.742 Y133.415 I10.424 J-4.091 E.05046
G1 X143.907 Y141.58 E.43918
G3 X142.42 Y140.739 I11.445 J-21.985 E.06501
G1 X136.619 Y134.938 E.312
G2 X139.01 Y137.977 I15.422 J-9.679 E.14735
G1 X141.127 Y140.094 E.11385
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F6300
G1 X139.713 Y138.68 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
M204 S6000
G1 X133.88 Y133.758 Z.6 F30000
G1 X109.898 Y113.526 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X110.25 Y113.97 E.02156
G3 X93.341 Y106.515 I-15.216 J11.608 E3.8372
G3 X95.632 Y106.449 I1.928 J27.226 E.08716
G3 X109.536 Y113.089 I-.598 J19.129 E.6027
G1 X109.86 Y113.48 E.01927
M204 S6000
G1 X110.253 Y113.238 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X110.614 Y113.693 E.02207
G3 X92.146 Y106.197 I-15.58 J11.887 E3.88498
G3 X95.659 Y105.993 I2.882 J19.282 E.13392
G3 X109.882 Y112.791 I-.625 J19.586 E.6166
G1 X110.215 Y113.192 E.01978
G1 E-.56 F1800
; WIPE_START
G1 F3000
M73 P29 R23
G1 X110.614 Y113.693 E-.07304
G1 X111.297 Y114.633 E-.13241
G1 X111.402 Y114.8 E-.02255
; WIPE_END
G1 E-.012 F1800
M204 S6000
G1 X106.353 Y110.376 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50026
G1 F6300
M204 S500
G1 X108.498 Y112.521 E.11536
G3 X110.868 Y115.537 I-13.054 J12.694 E.14614
G1 X105.052 Y109.724 E.3127
G2 X103.576 Y108.893 I-7.744 J12.02 E.06444
G1 X111.745 Y117.062 E.43933
G1 X112.203 Y118.022 E.04046
G1 X112.301 Y118.264 E.00993
G1 X102.359 Y108.322 E.53468
G2 X101.3 Y107.91 I-3.999 J8.711 E.04323
G1 X112.712 Y119.322 E.6137
G3 X113.025 Y120.281 I-7.934 J3.119 E.03842
G1 X100.345 Y107.602 E.68191
G2 X99.462 Y107.365 I-2.435 J7.326 E.03479
G1 X113.268 Y121.171 E.74249
G1 X113.441 Y121.991 E.03185
G1 X98.631 Y107.181 E.79646
G1 X97.843 Y107.04 E.03046
G1 X113.574 Y122.771 E.84603
G3 X113.677 Y123.52 I-6.252 J1.236 E.02877
G1 X97.106 Y106.95 E.89115
G2 X96.393 Y106.884 I-.915 J5.978 E.02725
G1 X113.74 Y124.23 E.9329
G3 X113.774 Y124.912 I-5.728 J.632 E.02596
G1 X95.706 Y106.843 E.97173
G2 X95.053 Y106.837 I-.376 J5.618 E.02483
G1 X113.794 Y125.578 E1.00789
G3 X113.776 Y126.206 I-5.167 J.163 E.02392
G1 X94.41 Y106.841 E1.04148
G1 X93.799 Y106.877 E.02326
G1 X113.749 Y126.827 E1.0729
M73 P29 R22
G1 X113.696 Y127.421 E.02267
G1 X93.199 Y106.923 E1.10235
G1 X92.621 Y106.992 E.02213
G1 X113.632 Y128.003 E1.12998
G1 X113.548 Y128.566 E.02164
G1 X92.055 Y107.073 E1.15592
G1 X91.506 Y107.171 E.02118
G1 X113.453 Y129.117 E1.18026
G1 X113.34 Y129.652 E.02076
G1 X90.969 Y107.281 E1.20311
G1 X90.448 Y107.406 E.02038
G1 X113.218 Y130.176 E1.22454
G1 X113.079 Y130.684 E.02003
G1 X89.936 Y107.541 E1.24465
G1 X89.44 Y107.692 E.0197
G1 X112.934 Y131.186 E1.26348
G1 X112.77 Y131.669 E.0194
G1 X88.949 Y107.847 E1.28111
G1 X88.477 Y108.023 E.01913
G1 X112.605 Y132.15 E1.29758
G1 X112.418 Y132.611 E.01888
G1 X88.006 Y108.198 E1.31291
G2 X87.556 Y108.395 I1.446 J3.909 E.01868
G1 X112.232 Y133.071 E1.32705
G3 X112.027 Y133.512 I-3.821 J-1.508 E.01853
G1 X87.107 Y108.593 E1.34016
G2 X86.673 Y108.806 I1.579 J3.763 E.01839
G1 X111.818 Y133.95 E1.35226
G3 X111.597 Y134.377 I-3.702 J-1.643 E.01826
G1 X86.246 Y109.025 E1.36339
G2 X85.827 Y109.253 I1.708 J3.647 E.01815
G1 X111.368 Y134.794 E1.37358
G3 X111.133 Y135.206 I-3.592 J-1.768 E.01805
G1 X85.42 Y109.493 E1.38285
G2 X85.014 Y109.734 I1.803 J3.5 E.01796
G1 X110.883 Y135.602 E1.39121
G1 X110.633 Y135.999 E.01783
G1 X84.628 Y109.994 E1.39854
G1 X84.241 Y110.254 E.01772
G1 X110.365 Y136.379 E1.40495
G1 X110.095 Y136.755 E.01763
G1 X83.868 Y110.528 E1.41051
G1 X83.501 Y110.808 E.01755
G1 X109.815 Y137.122 E1.41519
G1 X109.526 Y137.48 E.01749
G1 X83.139 Y111.092 E1.4191
G1 X82.792 Y111.392 E.01744
M73 P30 R22
G1 X109.236 Y137.836 E1.42219
G1 X108.927 Y138.174 E.01741
G1 X82.444 Y111.691 E1.42425
G2 X82.112 Y112.006 I2.484 J2.946 E.01741
G1 X108.618 Y138.512 E1.42547
G3 X108.298 Y138.838 I-2.91 J-2.54 E.0174
G1 X81.784 Y112.325 E1.42587
G2 X81.464 Y112.651 I2.589 J2.867 E.0174
G1 X107.969 Y139.157 E1.42547
G3 X107.638 Y139.472 I-2.823 J-2.637 E.01741
G1 X81.155 Y112.989 E1.42426
G1 X80.846 Y113.326 E.01741
G1 X107.29 Y139.771 E1.42219
G1 X106.943 Y140.071 E.01744
G1 X80.555 Y113.683 E1.41913
G1 X80.265 Y114.04 E.01749
G1 X106.581 Y140.355 E1.41524
G1 X106.214 Y140.635 E.01755
G1 X79.986 Y114.408 E1.41053
G1 X79.716 Y114.784 E.01763
G1 X105.841 Y140.909 E1.40497
G1 X105.454 Y141.169 E.01772
G1 X79.449 Y115.164 E1.39856
G1 X79.199 Y115.56 E.01783
G1 X105.068 Y141.429 E1.39124
G3 X104.662 Y141.67 I-2.225 J-3.284 E.01796
G1 X78.948 Y115.957 E1.38287
G2 X78.714 Y116.369 I3.351 J2.178 E.01805
G1 X104.255 Y141.91 E1.37361
G3 X103.836 Y142.138 I-2.129 J-3.421 E.01815
G1 X78.484 Y116.786 E1.36343
G2 X78.264 Y117.212 I3.482 J2.071 E.01826
G1 X103.409 Y142.357 E1.3523
G3 X102.975 Y142.57 I-2.014 J-3.551 E.01839
G1 X78.055 Y117.65 E1.3402
G2 X77.85 Y118.092 I3.615 J1.95 E.01853
G1 X102.526 Y142.768 E1.3271
G3 X102.077 Y142.965 I-1.889 J-3.695 E.01868
G1 X77.663 Y118.552 E1.31296
G1 X77.476 Y119.012 E.01888
G1 X101.605 Y143.141 E1.29763
G1 X101.133 Y143.316 E.01913
G1 X77.311 Y119.493 E1.28117
G1 X77.147 Y119.977 E.0194
G1 X100.642 Y143.471 E1.26354
G1 X100.147 Y143.623 E.0197
G1 X77.002 Y120.478 E1.24471
G1 X76.863 Y120.986 E.02003
G1 X99.634 Y143.757 E1.22461
G1 X99.113 Y143.883 E.02038
G1 X76.741 Y121.511 E1.20318
G1 X76.628 Y122.045 E.02076
G1 X98.576 Y143.992 E1.18034
G1 X98.028 Y144.091 E.02118
G1 X76.533 Y122.596 E1.156
G1 X76.449 Y123.159 E.02164
G1 X97.462 Y144.172 E1.13007
G1 X96.884 Y144.241 E.02213
G1 X76.385 Y123.741 E1.10245
G1 X76.332 Y124.335 E.02267
G1 X96.283 Y144.287 E1.073
G1 X95.673 Y144.323 E.02326
G1 X76.305 Y124.955 E1.04159
G1 X76.287 Y125.584 E.0239
G1 X95.031 Y144.328 E1.00805
G3 X94.377 Y144.321 I-.273 J-5.509 E.02485
G1 X76.306 Y126.25 E.97186
G2 X76.341 Y126.931 I5.765 J.05 E.02595
G1 X93.69 Y144.28 E.93303
G3 X92.977 Y144.214 I.2 J-6.033 E.02724
G1 X76.404 Y127.641 E.89129
G2 X76.506 Y128.39 I6.359 J-.487 E.02877
G1 X92.241 Y144.125 E.84619
G1 X91.452 Y143.983 E.03046
G1 X76.639 Y129.17 E.79664
G1 X76.812 Y129.989 E.03184
G1 X90.622 Y143.799 E.74269
G3 X89.739 Y143.563 I1.55 J-7.561 E.03478
G1 X77.055 Y130.879 E.68213
G2 X77.368 Y131.839 I8.244 J-2.157 E.0384
G1 X88.784 Y143.255 E.61395
G3 X87.726 Y142.844 I2.937 J-9.119 E.04321
G1 X77.78 Y132.898 E.53487
G2 X78.333 Y134.098 I10.596 J-4.157 E.05028
G1 X86.509 Y142.274 E.43969
G3 X85.028 Y141.439 I12.889 J-24.61 E.06467
G1 X79.209 Y135.621 E.3129
G2 X81.559 Y138.617 I15.3 J-9.578 E.14507
G1 X83.737 Y140.795 E.11713
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
M73 P31 R22
G1 F6300
G1 X82.323 Y139.381 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 2/18
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S206.55
; open powerlost recovery
M1003 S1
M976 S1 P1 ; scan model before printing 2nd layer
M400 P100
G1 E.8
G1 E-.8
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
; object ids of layer 2 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer2 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z.36
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #3
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
G1  X75.466 Y207.966  
G1  X39.534  E1.1130
G1  Y197.534  E0.3231
G1  X75.466  E1.1130
G1  Y207.966  E0.3231
G1  X75.931 Y208.431  
G1  X39.069  E1.1419
G1  Y197.069  E0.3520
G1  X75.931  E1.1419
G1  Y208.431  E0.3520
G1  X76.397 Y208.897  
G1  X38.603  E1.1707
G1  Y196.603  E0.3808
G1  X76.397  E1.1707
G1  Y208.897  E0.3808
G1  X76.863 Y209.363  
G1  X38.137  E1.1996
G1  Y196.137  E0.4097
G1  X76.863  E1.1996
G1  Y209.363  E0.4097
G1  X77.328 Y209.828  
G1  X37.672  E1.2284
G1  Y195.672  E0.4385
G1  X77.328  E1.2284
G1  Y209.828  E0.4385
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F6300
G1 X77.328 Y207.828 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.76 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.78 Y137.578
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X144.073 Y107.403 I14.658 J-12.687 E.98524
G3 X153.105 Y105.517 I8.38 J17.562 E.25757
G3 X137.819 Y137.623 I-.667 J19.374 E2.12336
G1 X137.477 Y137.84 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X142.858 Y107.579 I14.961 J-12.949 E.90292
G3 X147.323 Y105.78 I9.936 J18.218 E.12378
G3 X153.128 Y105.117 I5.084 J18.777 E.15046
G3 X137.516 Y137.885 I-.69 J19.774 E2.01065
G1 E-.56 F1800
; WIPE_START
M73 P32 R22
G1 F9600
M204 S10000
G1 X136.737 Y136.93 E-.14053
G1 X136.289 Y136.307 E-.08747
; WIPE_END
G1 E-.012 F1800
G1 X143.849 Y137.353 Z.76 F30000
G1 X164.111 Y140.158 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F7200
G1 X166.158 Y138.11 E.07486
G2 X168.344 Y135.375 I-13.337 J-12.897 E.09063
G1 X162.94 Y140.779 E.19755
G1 X162.643 Y140.98 E.00928
G1 X161.552 Y141.618 E.03269
G1 X169.159 Y134.011 E.27813
G2 X169.719 Y132.901 I-9.071 J-5.273 E.03215
G1 X160.45 Y142.17 E.33888
G3 X159.483 Y142.588 I-4 J-7.936 E.02725
G1 X170.133 Y131.937 E.38941
G2 X170.457 Y131.064 I-7.196 J-3.162 E.02408
G1 X158.605 Y142.915 E.43331
G3 X157.809 Y143.162 I-2.486 J-6.621 E.02156
G1 X170.71 Y130.26 E.4717
G1 X170.921 Y129.5 E.02041
G1 X157.056 Y143.365 E.50693
G3 X156.335 Y143.536 I-1.807 J-5.994 E.01917
G1 X171.081 Y128.791 E.53913
G2 X171.217 Y128.105 I-5.707 J-1.485 E.01807
G1 X155.664 Y143.658 E.56864
G3 X155.015 Y143.758 I-1.088 J-4.939 E.01699
G1 X171.312 Y127.461 E.59585
G2 X171.387 Y126.835 I-5.233 J-.951 E.01629
G1 X154.393 Y143.829 E.62133
G3 X153.788 Y143.885 I-.821 J-5.614 E.01572
G1 X171.44 Y126.233 E.64538
G2 X171.471 Y125.653 I-4.878 J-.551 E.01504
G1 X153.203 Y143.921 E.66791
G3 X152.643 Y143.931 I-.368 J-4.709 E.01449
G1 X171.486 Y125.087 E.68897
G2 X171.483 Y124.541 I-4.6 J-.244 E.01413
G1 X152.092 Y143.932 E.70897
G3 X151.562 Y143.912 I-.096 J-4.473 E.01371
G1 X171.466 Y124.008 E.72772
G2 X171.436 Y123.489 I-4.387 J-.002 E.01345
G1 X151.042 Y143.882 E.74561
G3 X150.537 Y143.838 I.119 J-4.281 E.01313
G1 X171.39 Y122.986 E.76242
G2 X171.338 Y122.488 I-4.214 J.191 E.01294
G1 X150.045 Y143.781 E.77849
G3 X149.559 Y143.717 I.292 J-4.124 E.01268
G1 X171.265 Y122.011 E.79363
G1 X171.193 Y121.533 E.01248
G1 X149.092 Y143.634 E.80805
G1 X148.626 Y143.551 E.01225
G1 X171.099 Y121.078 E.82168
G1 X171.003 Y120.624 E.01198
G1 X148.179 Y143.448 E.83449
G1 X147.735 Y143.342 E.01179
G1 X170.896 Y120.181 E.8468
G1 X170.777 Y119.75 E.01156
G1 X147.3 Y143.228 E.85838
G1 X146.878 Y143.1 E.01139
G1 X170.659 Y119.319 E.86946
G2 X170.521 Y118.908 I-3.536 J.96 E.01123
G1 X146.457 Y142.972 E.87982
G3 X146.053 Y142.826 I.92 J-3.173 E.0111
G1 X170.381 Y118.498 E.88948
M73 P32 R21
G2 X170.235 Y118.094 I-3.473 J1.029 E.0111
G1 X145.654 Y142.676 E.89874
G1 X145.254 Y142.526 E.01103
G1 X170.076 Y117.704 E.90753
G1 X169.917 Y117.313 E.0109
G1 X144.87 Y142.36 E.91575
G1 X144.488 Y142.193 E.01079
G1 X169.745 Y116.935 E.92345
G1 X169.567 Y116.564 E.01065
G1 X144.114 Y142.017 E.9306
G1 X143.75 Y141.831 E.01056
G1 X169.389 Y116.192 E.9374
G2 X169.195 Y115.837 I-3.082 J1.456 E.01048
G1 X143.387 Y141.645 E.94359
G3 X143.035 Y141.447 I1.496 J-3.06 E.01044
G1 X168.999 Y115.483 E.94927
G2 X168.801 Y115.131 I-3.059 J1.492 E.01044
G1 X142.689 Y141.243 E.95468
G1 X142.343 Y141.039 E.01038
G1 X168.588 Y114.795 E.95954
G1 X168.374 Y114.459 E.0103
G1 X142.012 Y140.821 E.96384
G1 X141.683 Y140.6 E.01024
G1 X168.156 Y114.127 E.96789
G1 X167.926 Y113.808 E.01018
G1 X141.355 Y140.378 E.97147
G1 X141.045 Y140.139 E.01013
G1 X167.696 Y113.488 E.97441
G2 X167.459 Y113.176 I-2.751 J1.842 E.01015
G1 X140.734 Y139.9 E.9771
G1 X140.423 Y139.661 E.01013
G1 X167.212 Y112.873 E.97943
G1 X166.965 Y112.57 E.0101
G1 X140.125 Y139.41 E.98131
G1 X139.83 Y139.156 E.01008
G1 X166.71 Y112.276 E.98278
G1 X166.447 Y111.989 E.01006
G1 X139.538 Y138.897 E.98381
G1 X139.259 Y138.627 E.01005
G1 X166.183 Y111.703 E.98441
G2 X165.91 Y111.427 I-2.463 J2.165 E.01005
G1 X138.98 Y138.357 E.98462
G3 X138.706 Y138.081 I2.187 J-2.439 E.01005
G1 X165.631 Y111.156 E.98441
G1 X165.351 Y110.886 E.01005
G1 X138.443 Y137.794 E.98381
G1 X138.18 Y137.508 E.01006
G1 X165.06 Y110.628 E.98278
G1 X164.764 Y110.374 E.01008
G1 X137.924 Y137.214 E.98131
G1 X137.678 Y136.911 E.0101
G1 X164.468 Y110.12 E.97952
G2 X164.159 Y109.88 I-2.173 J2.48 E.01013
G1 X137.431 Y136.608 E.97722
G3 X137.194 Y136.295 I2.512 J-2.154 E.01015
G1 X163.847 Y109.642 E.97448
G1 X163.535 Y109.405 E.01014
G1 X136.964 Y135.976 E.97148
G1 X136.733 Y135.656 E.01018
G1 X163.206 Y109.184 E.9679
G1 X162.877 Y108.963 E.01024
G1 X136.515 Y135.325 E.96385
G1 X136.302 Y134.989 E.0103
G1 X162.547 Y108.744 E.95955
G1 X162.2 Y108.541 E.01038
G1 X136.089 Y134.652 E.95469
G3 X135.891 Y134.301 I2.858 J-1.842 E.01044
G1 X161.854 Y108.337 E.94928
G2 X161.503 Y108.139 I-1.845 J2.857 E.01044
G1 X135.695 Y133.947 E.9436
G3 X135.5 Y133.592 I2.898 J-1.818 E.01047
G1 X161.139 Y107.953 E.93741
G1 X160.776 Y107.767 E.01056
G1 X135.322 Y133.22 E.93062
G1 X135.144 Y132.848 E.01065
M73 P33 R21
G1 X160.402 Y107.591 E.92346
G1 X160.02 Y107.423 E.01079
G1 X134.973 Y132.47 E.91577
G1 X134.814 Y132.08 E.0109
G1 X159.638 Y107.256 E.90761
G2 X159.24 Y107.104 I-1.478 J3.281 E.01102
G1 X134.654 Y131.69 E.89888
G3 X134.508 Y131.286 I3.322 J-1.432 E.0111
G1 X158.838 Y106.956 E.88955
G2 X158.433 Y106.811 I-1.42 J3.341 E.01113
G1 X134.369 Y130.876 E.87984
G3 X134.23 Y130.465 I3.41 J-1.376 E.01123
G1 X158.011 Y106.684 E.86948
G1 X157.59 Y106.556 E.01139
G1 X134.112 Y130.034 E.8584
G1 X133.993 Y129.603 E.01156
G1 X157.155 Y106.441 E.84682
G1 X156.711 Y106.335 E.01179
G1 X133.886 Y129.16 E.83452
G1 X133.79 Y128.706 E.01198
G1 X156.264 Y106.232 E.8217
G1 X155.798 Y106.149 E.01225
G1 X133.696 Y128.251 E.80808
G1 X133.624 Y127.773 E.01248
G1 X155.331 Y106.066 E.79365
G2 X154.845 Y106.003 I-.779 J4.061 E.01268
G1 X133.552 Y127.296 E.77852
G3 X133.499 Y126.799 I4.165 J-.689 E.01294
G1 X154.353 Y105.945 E.76245
G2 X153.848 Y105.901 I-.625 J4.236 E.01313
G1 X133.454 Y126.295 E.74564
G3 X133.423 Y125.776 I4.362 J-.517 E.01345
G1 X153.328 Y105.871 E.72776
G2 X152.793 Y105.856 I-.403 J4.984 E.01384
G1 X133.406 Y125.243 E.70881
G3 X133.403 Y124.697 I4.596 J-.303 E.01413
G1 X152.245 Y105.854 E.68892
G2 X151.688 Y105.862 I-.217 J4.286 E.01443
G1 X133.418 Y124.131 E.66796
G3 X133.451 Y123.549 I4.494 J-.041 E.01508
G1 X151.102 Y105.898 E.64536
G2 X150.503 Y105.948 I.118 J5.077 E.01555
G1 X133.507 Y122.943 E.62139
G3 X133.577 Y122.324 I5.816 J.345 E.01613
G1 X149.878 Y106.023 E.59597
G2 X149.227 Y106.124 I.527 J5.534 E.01704
G1 X133.672 Y121.679 E.5687
G3 X133.808 Y120.994 I5.838 J.798 E.01806
G1 X148.555 Y106.246 E.53919
G2 X147.834 Y106.418 I1.083 J6.16 E.01917
G1 X133.966 Y120.286 E.50705
G1 X134.17 Y119.532 E.0202
G1 X147.081 Y106.621 E.47206
G2 X146.286 Y106.867 I1.679 J6.836 E.02155
G1 X134.432 Y118.721 E.43339
G3 X134.755 Y117.848 I7.516 J2.287 E.02408
G1 X145.408 Y107.195 E.38949
G2 X144.441 Y107.612 I3.032 J8.352 E.02725
G1 X135.17 Y116.884 E.33898
G3 X135.729 Y115.775 I9.625 J4.159 E.03214
G1 X143.34 Y108.164 E.27826
G1 X143.217 Y108.228 E.00357
G2 X141.936 Y109.018 I6.732 J12.338 E.03894
G1 X136.544 Y114.41 E.19715
G1 X136.626 Y114.28 E.00398
G3 X138.72 Y111.685 I17.546 J12.015 E.0863
G1 X140.783 Y109.622 E.07542
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X139.368 Y111.036 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X131.76 Y111.643 Z.76 F30000
G1 X110.09 Y113.37 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.445 Y113.822 E.01588
G3 X86.702 Y108.078 I-15.411 J11.759 E2.63708
G3 X95.737 Y106.209 I8.381 J17.74 E.25753
G3 X109.721 Y112.93 I-.704 J19.372 E.44138
G1 X110.051 Y113.324 E.01422
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.763 Y113.579 E.01504
G3 X85.486 Y108.251 I-15.73 J12.003 E2.46729
G3 X95.761 Y105.809 I9.541 J17.305 E.27426
G3 X110.025 Y112.668 I-.727 J19.773 E.41775
G1 X110.362 Y113.072 E.0135
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.763 Y113.579 E-.07367
G1 X111.454 Y114.526 E-.1337
G1 X111.551 Y114.679 E-.02063
; WIPE_END
G1 E-.012 F1800
G1 X104.008 Y113.511 Z.76 F30000
G1 X83.376 Y110.314 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G1 X81.337 Y112.353 E.07453
G2 X79.242 Y114.941 I15.426 J14.636 E.08618
G1 X79.143 Y115.097 E.00478
G1 X84.529 Y109.71 E.19695
G3 X85.844 Y108.9 I8.206 J11.849 E.03994
G1 X85.936 Y108.853 E.00267
G1 X78.325 Y116.464 E.27828
G2 X77.765 Y117.574 I9.072 J5.275 E.03216
G1 X87.037 Y108.302 E.33901
G3 X88.004 Y107.884 I4.002 J7.942 E.02725
G1 X77.356 Y118.533 E.38934
G2 X77.028 Y119.41 I6.578 J2.956 E.02422
G1 X88.879 Y107.56 E.43329
G3 X89.676 Y107.312 I2.485 J6.598 E.02159
G1 X76.767 Y120.221 E.47197
G1 X76.561 Y120.977 E.02027
G1 X90.43 Y107.108 E.50709
G3 X91.152 Y106.936 I1.815 J6.005 E.0192
G1 X76.404 Y121.684 E.53922
G2 X76.269 Y122.368 I5.7 J1.476 E.01804
G1 X91.822 Y106.815 E.56864
G3 X92.474 Y106.713 I1.188 J5.441 E.01707
G1 X76.173 Y123.014 E.596
G2 X76.098 Y123.638 I5.224 J.941 E.01626
G1 X93.098 Y106.639 E.62154
M73 P34 R21
G3 X93.698 Y106.588 I.727 J5.029 E.01558
G1 X76.044 Y124.242 E.64546
G2 X76.015 Y124.821 I4.866 J.541 E.01501
G1 X94.282 Y106.553 E.66791
G3 X94.841 Y106.544 I.351 J4.293 E.01446
G1 X75.998 Y125.387 E.68897
G2 X76.002 Y125.932 I4.591 J.234 E.0141
G1 X95.388 Y106.547 E.70878
G3 X95.924 Y106.561 I.141 J5.002 E.01387
G1 X76.018 Y126.466 E.7278
G2 X76.05 Y126.984 I4.379 J-.008 E.01342
G1 X96.443 Y106.592 E.74561
G3 X96.949 Y106.635 I-.109 J4.285 E.01315
G1 X76.095 Y127.489 E.76249
G2 X76.148 Y127.985 I4.207 J-.201 E.01291
G1 X97.44 Y106.693 E.7785
G3 X97.927 Y106.756 I-.284 J4.144 E.0127
G1 X76.22 Y128.464 E.7937
G1 X76.291 Y128.942 E.0125
G1 X98.393 Y106.84 E.80812
G1 X98.859 Y106.923 E.01224
G1 X76.386 Y129.396 E.82168
G1 X76.482 Y129.85 E.012
G1 X99.307 Y107.025 E.83456
G1 X99.75 Y107.132 E.01177
G1 X76.589 Y130.292 E.8468
G1 X76.707 Y130.724 E.01157
G1 X100.186 Y107.245 E.85844
G1 X100.607 Y107.374 E.01138
G1 X76.826 Y131.155 E.86951
G1 X76.965 Y131.566 E.01121
G1 X101.028 Y107.502 E.87982
G3 X101.434 Y107.646 I-1.007 J3.498 E.01114
G1 X77.104 Y131.977 E.8896
G2 X77.252 Y132.378 I3.16 J-.936 E.01107
G1 X101.835 Y107.795 E.89884
G3 X102.234 Y107.945 I-1.065 J3.426 E.01103
G1 X77.412 Y132.768 E.90757
G1 X77.572 Y133.157 E.01088
G1 X102.616 Y108.113 E.91565
G1 X102.997 Y108.282 E.01078
G1 X77.741 Y133.538 E.92346
G1 X77.918 Y133.911 E.01066
G1 X103.372 Y108.457 E.93067
G1 X103.735 Y108.643 E.01056
G1 X78.095 Y134.283 E.93746
G1 X78.291 Y134.637 E.01046
G1 X104.098 Y108.83 E.94359
G3 X104.451 Y109.027 I-1.489 J3.071 E.01045
G1 X78.486 Y134.991 E.94933
G2 X78.685 Y135.342 I3.054 J-1.503 E.01043
G1 X104.796 Y109.231 E.95469
G1 X105.142 Y109.435 E.01038
G1 X78.898 Y135.679 E.95955
G1 X79.111 Y136.016 E.0103
G1 X105.473 Y109.653 E.9639
G1 X105.802 Y109.874 E.01024
G1 X79.33 Y136.346 E.96789
G1 X79.559 Y136.666 E.01018
G1 X106.13 Y110.095 E.9715
G3 X106.443 Y110.333 I-1.861 J2.776 E.01015
G1 X79.789 Y136.986 E.97453
G2 X80.027 Y137.298 I2.744 J-1.852 E.01014
G1 X106.754 Y110.571 E.97722
G3 X107.065 Y110.81 I-1.863 J2.739 E.01014
G1 X80.274 Y137.601 E.97957
G1 X80.52 Y137.905 E.0101
G1 X107.36 Y111.064 E.98136
G1 X107.655 Y111.319 E.01008
G1 X80.776 Y138.198 E.98278
G1 X81.039 Y138.485 E.01006
G1 X107.948 Y111.576 E.98386
G1 X108.227 Y111.847 E.01005
G1 X81.302 Y138.771 E.98444
G1 X81.579 Y139.044 E.01005
G1 X108.505 Y112.117 E.98449
G3 X108.78 Y112.393 I-2.182 J2.45 E.01005
G1 X81.857 Y139.316 E.98439
G1 X82.134 Y139.588 E.01005
G1 X109.042 Y112.68 E.98385
G1 X109.305 Y112.967 E.01006
G1 X82.426 Y139.846 E.98277
G1 X82.721 Y140.1 E.01008
G1 X109.562 Y113.26 E.98136
G1 X109.808 Y113.563 E.0101
G1 X83.016 Y140.355 E.97956
G2 X83.327 Y140.594 I2.183 J-2.512 E.01014
G1 X110.054 Y113.867 E.97721
G3 X110.292 Y114.178 I-2.503 J2.161 E.01014
G1 X83.639 Y140.832 E.97453
G2 X83.951 Y141.069 I2.154 J-2.513 E.01015
G1 X110.522 Y114.498 E.9715
G1 X110.751 Y114.818 E.01018
G1 X84.28 Y141.29 E.96788
G1 X84.608 Y141.511 E.01024
G1 X110.971 Y115.149 E.96389
G1 X111.183 Y115.486 E.0103
G1 X84.94 Y141.729 E.95954
G1 X85.285 Y141.933 E.01038
G1 X111.396 Y115.823 E.95468
G3 X111.595 Y116.173 I-2.856 J1.853 E.01043
G1 X85.631 Y142.137 E.94932
G2 X85.983 Y142.335 I1.84 J-2.872 E.01045
G1 X111.79 Y116.528 E.94358
G1 X111.986 Y116.882 E.01046
G1 X86.346 Y142.521 E.93744
G1 X86.71 Y142.708 E.01056
G1 X112.163 Y117.254 E.93065
G1 X112.341 Y117.626 E.01066
G1 X87.084 Y142.883 E.92344
G1 X87.466 Y143.051 E.01078
G1 X112.513 Y118.003 E.9158
G1 X112.672 Y118.395 E.01091
G1 X87.847 Y143.219 E.90765
G2 X88.246 Y143.369 I1.466 J-3.282 E.01103
G1 X112.83 Y118.786 E.89885
G3 X112.977 Y119.188 I-3.314 J1.44 E.01109
G1 X88.647 Y143.518 E.88958
G2 X89.053 Y143.662 I1.411 J-3.349 E.01114
G1 X113.116 Y119.599 E.8798
G1 X113.255 Y120.01 E.01121
G1 X89.475 Y143.79 E.86948
G1 X89.896 Y143.919 E.01138
G1 X113.374 Y120.441 E.85842
G1 X113.492 Y120.873 E.01157
G1 X90.332 Y144.032 E.84678
G1 X90.775 Y144.139 E.01177
G1 X113.599 Y121.314 E.83453
G1 X113.695 Y121.769 E.012
G1 X91.223 Y144.241 E.82165
G1 X91.688 Y144.325 E.01224
G1 X113.79 Y122.223 E.80809
G1 X113.861 Y122.701 E.0125
G1 X92.154 Y144.408 E.79366
G2 X92.642 Y144.471 I.77 J-4.071 E.01271
G1 X113.933 Y123.18 E.77846
G3 X113.986 Y123.676 I-4.151 J.696 E.01292
G1 X93.133 Y144.529 E.76245
G2 X93.644 Y144.568 I.614 J-4.746 E.01326
G1 X114.031 Y124.181 E.74541
G3 X114.063 Y124.699 I-4.352 J.525 E.01343
G1 X94.16 Y144.601 E.72769
G2 X94.689 Y144.622 I.423 J-4.055 E.0137
G1 X114.078 Y125.233 E.70893
G3 X114.083 Y125.778 I-4.591 J.311 E.0141
G1 X95.239 Y144.622 E.689
G2 X95.8 Y144.61 I.183 J-4.732 E.01452
G1 X114.066 Y126.344 E.66786
G3 X114.036 Y126.924 I-4.9 J.038 E.01501
G1 X96.384 Y144.576 E.64541
G2 X96.985 Y144.525 I-.128 J-5.086 E.01559
G1 X113.982 Y127.527 E.62149
G3 X113.908 Y128.151 I-5.296 J-.317 E.01627
G1 X97.609 Y144.451 E.59594
G2 X98.261 Y144.348 I-.536 J-5.543 E.01707
G1 X113.811 Y128.798 E.56858
G3 X113.677 Y129.482 I-5.832 J-.792 E.01804
G1 X98.931 Y144.228 E.53915
G2 X99.653 Y144.055 I-1.091 J-6.167 E.0192
G1 X113.52 Y130.189 E.50701
G1 X113.313 Y130.945 E.02027
G1 X100.407 Y143.851 E.47189
G2 X101.204 Y143.604 I-1.683 J-6.825 E.0216
G1 X113.052 Y131.756 E.4332
G3 X112.729 Y132.628 I-7.514 J-2.284 E.02407
G1 X102.078 Y143.279 E.38942
G1 X103.046 Y142.861 E.02725
G1 X112.314 Y133.592 E.33889
G3 X111.754 Y134.702 I-9.635 J-4.168 E.03217
G1 X104.147 Y142.309 E.27813
G1 X105.209 Y141.689 E.03179
G1 X105.54 Y141.466 E.01032
G1 X110.936 Y136.07 E.19729
G3 X108.73 Y138.825 I-15.484 J-10.135 E.09138
G1 X106.71 Y140.845 E.07386
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
M73 P35 R21
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X108.124 Y139.431 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 3/18
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S209.1
G17
G3 Z.76 I1.217 J0 P1  F30000
; object ids of layer 3 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer3 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z.52
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #4
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
G1  X75.466 Y207.966  
G1  X39.534  E1.1130
G1  Y197.534  E0.3231
G1  X75.466  E1.1130
G1  Y207.966  E0.3231
G1  X75.931 Y208.431  
G1  X39.069  E1.1419
G1  Y197.069  E0.3520
G1  X75.931  E1.1419
G1  Y208.431  E0.3520
G1  X76.397 Y208.897  
G1  X38.603  E1.1707
G1  Y196.603  E0.3808
G1  X76.397  E1.1707
G1  Y208.897  E0.3808
G1  X76.863 Y209.363  
G1  X38.137  E1.1996
G1  Y196.137  E0.4097
G1  X76.863  E1.1996
G1  Y209.363  E0.4097
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X76.863 Y207.363 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.92 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.779 Y137.578
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X140.2 Y109.858 I14.658 J-12.686 E.85813
G3 X153.185 Y105.522 I12.268 J15.123 E.3868
G3 X137.818 Y137.624 I-.747 J19.371 E2.12118
G1 X137.476 Y137.84 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X139.059 Y110.315 I14.961 J-12.948 E.78253
G3 X153.208 Y105.122 I13.388 J14.605 E.39664
G3 X137.516 Y137.886 I-.77 J19.771 E2.0086
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X136.737 Y136.93 E-.14053
G1 X136.289 Y136.307 E-.08747
; WIPE_END
G1 E-.012 F1800
G1 X137.149 Y136.53 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423016
G1 F7200
G1 X138.863 Y138.244 E.06268
G2 X141.942 Y140.773 I13.02 J-12.712 E.10321
G1 X136.553 Y135.384 E.19704
G3 X135.731 Y134.013 I11.141 J-7.606 E.04135
G1 X143.338 Y141.62 E.27814
G1 X144.439 Y142.171 E.03183
G1 X135.17 Y132.902 E.33891
G3 X134.756 Y131.938 I7.921 J-3.976 E.02715
G1 X145.407 Y142.589 E.38945
G1 X146.278 Y142.911 E.02402
G1 X134.434 Y131.066 E.4331
G3 X134.173 Y130.256 I6.7 J-2.601 E.02202
G1 X147.077 Y143.16 E.47182
G2 X147.832 Y143.365 I2.105 J-6.252 E.02024
G1 X133.964 Y129.498 E.50706
G3 X133.808 Y128.792 I5.864 J-1.667 E.0187
G1 X148.555 Y143.538 E.5392
G1 X149.223 Y143.657 E.01756
G1 X133.675 Y128.109 E.56853
G1 X133.577 Y127.461 E.01693
G1 X149.876 Y143.761 E.596
G1 X150.499 Y143.834 E.01621
G1 X133.503 Y126.838 E.62146
G1 X133.448 Y126.233 E.0157
M73 P35 R20
G1 X151.101 Y143.886 E.64546
G1 X151.684 Y143.919 E.0151
G1 X133.419 Y125.655 E.66784
G3 X133.403 Y125.089 I5.566 J-.439 E.01463
G1 X152.246 Y143.932 E.68898
G1 X152.795 Y143.931 E.01419
G1 X133.413 Y124.55 E.70867
G1 X133.424 Y124.01 E.01395
G1 X153.327 Y143.913 E.72775
G1 X153.845 Y143.881 E.01342
G1 X133.457 Y123.494 E.74547
G1 X133.505 Y122.992 E.01302
G1 X154.345 Y143.832 E.76199
G1 X154.839 Y143.776 E.01286
G1 X133.553 Y122.491 E.7783
G3 X133.623 Y122.011 I4.821 J.458 E.01254
G1 X155.331 Y143.719 E.79373
G1 X155.796 Y143.634 E.01222
G1 X133.695 Y121.533 E.80811
G1 X133.79 Y121.078 E.01201
G1 X156.261 Y143.55 E.82166
G2 X156.71 Y143.449 I-.624 J-3.835 E.0119
G1 X133.885 Y120.624 E.83461
G3 X133.994 Y120.183 I3.763 J.695 E.01175
G1 X157.152 Y143.341 E.84679
G2 X157.59 Y143.229 I-.729 J-3.747 E.01168
G1 X134.111 Y119.75 E.85849
G3 X134.231 Y119.32 I3.684 J.791 E.01155
G1 X158.01 Y143.1 E.8695
G1 X158.431 Y142.971 E.01137
G1 X134.369 Y118.909 E.87982
G1 X134.507 Y118.497 E.01122
G1 X158.838 Y142.828 E.88966
G1 X159.238 Y142.679 E.01105
G1 X134.655 Y118.096 E.89887
G1 X134.813 Y117.704 E.01092
G1 X159.638 Y142.529 E.90772
G1 X160.019 Y142.361 E.01077
G1 X134.971 Y117.312 E.91588
G3 X135.145 Y116.936 I3.257 J1.275 E.01072
G1 X160.4 Y142.192 E.92346
M73 P36 R20
G2 X160.776 Y142.018 I-1.28 J-3.255 E.01071
G1 X135.321 Y116.563 E.93073
G3 X135.5 Y116.192 I3.219 J1.319 E.01066
G1 X161.139 Y141.831 E.93747
G1 X161.501 Y141.644 E.01055
G1 X135.695 Y115.837 E.94361
G1 X135.89 Y115.482 E.01047
G1 X161.855 Y141.447 E.9494
G1 X162.2 Y141.243 E.01037
G1 X136.09 Y115.133 E.9547
G1 X136.302 Y114.795 E.01031
G1 X162.545 Y141.038 E.95956
G2 X162.877 Y140.821 I-1.661 J-2.913 E.01028
G1 X136.514 Y114.458 E.96397
G3 X136.734 Y114.128 I2.889 J1.692 E.01025
G1 X163.205 Y140.599 E.96791
G1 X163.533 Y140.378 E.01023
G1 X136.963 Y113.808 E.97152
G3 X137.194 Y113.489 I3.284 J2.133 E.01018
G1 X163.847 Y140.142 E.97455
G1 X164.158 Y139.903 E.01014
G1 X137.437 Y113.182 E.97703
G1 X137.68 Y112.876 E.01012
G1 X164.469 Y139.665 E.97952
G2 X164.764 Y139.41 I-1.937 J-2.542 E.01008
G1 X137.924 Y112.569 E.98141
G3 X138.18 Y112.277 I2.274 J1.734 E.01008
G1 X165.059 Y139.155 E.9828
G2 X165.352 Y138.899 I-2.017 J-2.604 E.01008
G1 X138.443 Y111.989 E.98394
G1 X138.705 Y111.701 E.01006
G1 X165.631 Y138.627 E.98454
G1 X165.909 Y138.356 E.01005
G1 X138.98 Y111.427 E.98464
G1 X139.258 Y111.156 E.01005
G1 X166.184 Y138.082 E.98454
G1 X166.446 Y137.794 E.01006
G1 X139.537 Y110.885 E.98394
G3 X139.83 Y110.628 I2.296 J2.331 E.01008
G1 X166.709 Y137.507 E.9828
G2 X166.966 Y137.214 I-2.335 J-2.317 E.01008
G1 X140.125 Y110.373 E.98144
G3 X140.42 Y110.119 I2.286 J2.349 E.01008
G1 X167.212 Y136.91 E.97964
G1 X167.457 Y136.606 E.01011
G1 X140.731 Y109.88 E.97724
G1 X141.042 Y109.642 E.01014
G1 X167.697 Y136.296 E.97461
G1 X167.926 Y135.975 E.01019
G1 X141.356 Y109.405 E.97152
G1 X141.684 Y109.184 E.01023
G1 X168.155 Y135.655 E.96791
G2 X168.375 Y135.325 I-2.668 J-2.022 E.01025
G1 X142.012 Y108.962 E.96397
G3 X142.344 Y108.745 I1.998 J2.702 E.01028
G1 X168.587 Y134.988 E.95956
G1 X168.799 Y134.65 E.01031
G1 X142.689 Y108.54 E.9547
G1 X143.034 Y108.336 E.01037
G1 X169 Y134.301 E.9494
G1 X169.194 Y133.946 E.01047
G1 X143.388 Y108.139 E.94361
G1 X143.75 Y107.952 E.01055
G1 X169.389 Y133.591 E.93747
G2 X169.568 Y133.22 I-3.044 J-1.692 E.01066
G1 X144.113 Y107.765 E.93073
G3 X144.489 Y107.591 I1.656 J3.081 E.01071
G1 X169.744 Y132.847 E.92346
G2 X169.918 Y132.471 I-3.078 J-1.649 E.01072
G1 X144.87 Y107.423 E.91588
G1 X145.251 Y107.254 E.01077
G1 X170.076 Y132.079 E.90772
G1 X170.234 Y131.687 E.01092
G1 X145.651 Y107.104 E.89887
G1 X146.051 Y106.955 E.01104
G1 X170.382 Y131.286 E.88966
G1 X170.52 Y130.874 E.01122
G1 X146.458 Y106.812 E.87982
G1 X146.879 Y106.683 E.01137
G1 X170.652 Y130.457 E.86927
G1 X170.773 Y130.027 E.01153
G1 X147.299 Y106.554 E.8583
G3 X147.736 Y106.442 I1.166 J3.635 E.01168
G1 X170.893 Y129.598 E.84671
G2 X171.004 Y129.16 I-3.159 J-1.032 E.01171
G1 X148.178 Y106.334 E.83461
G3 X148.628 Y106.233 I1.072 J3.731 E.0119
G1 X171.099 Y128.705 E.82166
G1 X171.194 Y128.25 E.01201
G1 X149.093 Y106.149 E.80812
G1 X149.558 Y106.064 E.01222
G1 X171.266 Y127.772 E.79374
G1 X171.336 Y127.293 E.01252
G1 X150.046 Y106.003 E.77847
G1 X150.536 Y105.944 E.01277
G1 X171.391 Y126.798 E.76252
G1 X171.435 Y126.292 E.01312
G1 X151.044 Y105.902 E.74557
G1 X151.562 Y105.87 E.01342
G1 X171.465 Y125.773 E.72775
G1 X171.476 Y125.234 E.01395
G1 X152.096 Y105.855 E.70859
G1 X152.65 Y105.858 E.01431
G1 X171.486 Y124.694 E.68872
G2 X171.47 Y124.129 I-5.582 J-.127 E.01463
G1 X153.205 Y105.864 E.66785
G1 X153.788 Y105.897 E.0151
G1 X171.441 Y123.55 E.64547
G1 X171.386 Y122.945 E.0157
G1 X154.39 Y105.949 E.62146
G1 X155.013 Y106.022 E.01621
G1 X171.312 Y122.322 E.596
G1 X171.215 Y121.675 E.01693
G1 X155.666 Y106.126 E.56854
G1 X156.334 Y106.245 E.01756
G1 X171.081 Y120.991 E.5392
G2 X170.925 Y120.285 I-6.017 J.96 E.0187
G1 X157.057 Y106.418 E.50706
G3 X157.818 Y106.629 I-1.163 J5.674 E.02042
G1 X170.716 Y119.527 E.47163
G2 X170.456 Y118.717 I-6.959 J1.791 E.02202
G1 X158.618 Y106.879 E.43284
G3 X159.482 Y107.194 I-2.679 J8.705 E.02379
G1 X170.133 Y117.845 E.38946
G2 X169.719 Y116.881 I-8.336 J3.012 E.02714
G1 X160.45 Y107.612 E.33892
G1 X161.551 Y108.163 E.03183
G1 X169.158 Y115.77 E.27816
G2 X168.337 Y114.399 I-11.962 J6.234 E.04134
G1 X162.947 Y109.01 E.19706
G3 X165.275 Y110.813 I-11.312 J17.011 E.0762
G3 X167.74 Y113.253 I-71.741 J74.93 E.0897
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X166.326 Y111.839 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X158.697 Y112.047 Z.92 F30000
G1 X110.09 Y113.37 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.444 Y113.823 E.01588
G3 X82.824 Y110.526 I-15.411 J11.76 E2.51004
G3 X95.817 Y106.213 I12.239 J15.146 E.3868
G3 X109.72 Y112.931 I-.784 J19.369 E.43912
G1 X110.051 Y113.324 E.01422
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P37 R20
G1 F9600
M204 S5000
G1 X110.763 Y113.579 E.01504
G3 X81.682 Y110.98 I-15.729 J12.004 E2.34696
G3 X95.841 Y105.813 I13.361 J14.63 E.39664
G3 X110.024 Y112.669 I-.807 J19.77 E.41565
G1 X110.362 Y113.072 E.0135
M204 S10000
G1 X110.342 Y113.951 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G2 X107.898 Y111.527 I-83.096 J81.39 E.089
G2 X105.54 Y109.698 I-13.7 J15.221 E.07723
G1 X110.936 Y115.094 E.19729
G3 X111.754 Y116.461 I-11.113 J7.576 E.04123
G1 X104.147 Y108.855 E.27813
G1 X103.046 Y108.303 E.03185
G1 X112.314 Y117.572 E.33889
G3 X112.729 Y118.536 I-7.919 J3.976 E.02715
G1 X102.078 Y107.885 E.38942
G1 X101.204 Y107.56 E.02412
G1 X113.052 Y119.408 E.43319
G3 X113.313 Y120.219 I-6.695 J2.604 E.02203
G1 X100.407 Y107.313 E.47189
G2 X99.653 Y107.109 I-2.097 J6.248 E.0202
G1 X113.52 Y120.975 E.50701
G3 X113.677 Y121.682 I-5.877 J1.677 E.01873
G1 X98.931 Y106.936 E.53915
G1 X98.261 Y106.816 E.0176
G1 X113.811 Y122.366 E.56857
G1 X113.908 Y123.012 E.01689
G1 X97.609 Y106.713 E.59594
G1 X96.985 Y106.639 E.01625
G1 X113.982 Y123.637 E.62149
G1 X114.036 Y124.24 E.01566
G1 X96.384 Y106.588 E.64541
G2 X95.8 Y106.554 I-.639 J5.873 E.01513
G1 X114.066 Y124.82 E.66785
G1 X114.083 Y125.386 E.01465
G1 X95.246 Y106.549 E.68874
G1 X94.691 Y106.544 E.01434
G1 X114.078 Y125.931 E.70886
G1 X114.063 Y126.465 E.01381
G1 X94.158 Y106.561 E.72776
G1 X93.639 Y106.592 E.01344
G1 X114.031 Y126.983 E.74557
G1 X113.986 Y127.488 E.0131
G1 X93.133 Y106.635 E.76245
G1 X92.642 Y106.693 E.01279
G1 X113.933 Y127.984 E.77846
G1 X113.861 Y128.462 E.0125
G1 X92.154 Y106.756 E.79366
G1 X91.689 Y106.839 E.01224
G1 X113.79 Y128.941 E.80809
G3 X113.695 Y129.395 I-3.885 J-.575 E.01201
G1 X91.223 Y106.923 E.82165
G2 X90.775 Y107.025 I.632 J3.823 E.01188
G1 X113.599 Y129.849 E.83453
G3 X113.492 Y130.291 I-3.778 J-.688 E.01177
G1 X90.332 Y107.132 E.84678
G2 X89.903 Y107.252 I.979 J4.31 E.01153
G1 X113.374 Y130.723 E.85815
G3 X113.255 Y131.154 I-3.688 J-.781 E.01157
G1 X89.479 Y107.378 E.86933
G1 X89.054 Y107.503 E.01144
G1 X113.116 Y131.565 E.87977
G1 X112.977 Y131.976 E.01121
G1 X88.647 Y107.646 E.88958
G1 X88.246 Y107.794 E.01105
G1 X112.83 Y132.378 E.89885
G1 X112.672 Y132.769 E.01091
G1 X87.847 Y107.945 E.90764
G1 X87.466 Y108.113 E.01078
G1 X112.513 Y133.16 E.9158
G3 X112.341 Y133.538 I-3.264 J-1.265 E.01073
G1 X87.084 Y108.281 E.92344
G2 X86.71 Y108.456 I1.287 J3.242 E.0107
G1 X112.163 Y133.91 E.93065
G1 X111.986 Y134.282 E.01066
G1 X86.346 Y108.643 E.93744
G1 X85.983 Y108.829 E.01056
G1 X111.79 Y134.636 E.94358
G1 X111.595 Y134.991 E.01046
G1 X85.631 Y109.026 E.94932
G1 X85.285 Y109.231 E.01038
G1 X111.396 Y135.341 E.95468
G1 X111.183 Y135.678 E.0103
G1 X84.944 Y109.439 E.95937
G1 X84.613 Y109.658 E.01026
G1 X110.971 Y136.015 E.9637
G3 X110.751 Y136.346 I-2.894 J-1.682 E.01026
G1 X84.282 Y109.876 E.96778
G1 X83.951 Y110.095 E.01026
G1 X110.522 Y136.666 E.97149
G1 X110.292 Y136.986 E.01018
G1 X83.639 Y110.332 E.97453
G1 X83.327 Y110.57 E.01014
G1 X110.054 Y137.297 E.97721
G1 X109.808 Y137.6 E.0101
G1 X83.016 Y110.809 E.97956
G1 X82.721 Y111.064 E.01008
G1 X109.562 Y137.904 E.98136
G3 X109.305 Y138.197 I-2.599 J-2.015 E.01008
G1 X82.426 Y111.318 E.98277
G2 X82.134 Y111.575 I2.021 J2.591 E.01007
G1 X109.042 Y138.484 E.98386
G1 X108.78 Y138.771 E.01006
G1 X81.855 Y111.846 E.98446
G1 X81.576 Y112.117 E.01005
G1 X108.505 Y139.046 E.98462
G1 X108.227 Y139.317 E.01005
G1 X81.301 Y112.392 E.98446
G1 X81.039 Y112.679 E.01006
G1 X107.948 Y139.588 E.98386
G3 X107.655 Y139.845 I-2.313 J-2.332 E.01007
G1 X80.776 Y112.966 E.98277
G2 X80.52 Y113.259 I2.344 J2.31 E.01008
G1 X107.36 Y140.1 E.98136
G1 X107.065 Y140.354 E.01008
G1 X80.274 Y113.563 E.97957
G1 X80.027 Y113.866 E.0101
G1 X106.754 Y140.593 E.97722
G1 X106.443 Y140.831 E.01014
G1 X79.789 Y114.178 E.97453
G1 X79.559 Y114.498 E.01018
G1 X106.13 Y141.068 E.97151
G1 X105.802 Y141.29 E.01024
G1 X79.33 Y114.818 E.96789
G2 X79.111 Y115.148 I2.67 J2.009 E.01026
G1 X105.473 Y141.511 E.9639
G3 X105.142 Y141.729 I-2.003 J-2.689 E.01027
G1 X78.898 Y115.485 E.95955
G1 X78.685 Y115.822 E.0103
G1 X104.796 Y141.933 E.95469
G1 X104.451 Y142.137 E.01038
G1 X78.486 Y116.172 E.94933
G1 X78.291 Y116.527 E.01046
G1 X104.098 Y142.334 E.9436
G1 X103.735 Y142.521 E.01056
G1 X78.095 Y116.881 E.93746
G1 X77.918 Y117.253 E.01066
G1 X103.372 Y142.707 E.93067
G3 X102.997 Y142.882 I-1.661 J-3.064 E.0107
G1 X77.741 Y117.626 E.92346
G2 X77.575 Y118.01 I3.725 J1.834 E.01082
G1 X102.616 Y143.05 E.91556
G1 X102.234 Y143.218 E.01078
G1 X77.414 Y118.398 E.90751
G1 X77.252 Y118.786 E.01087
G1 X101.835 Y143.369 E.89883
G1 X101.434 Y143.518 E.01105
G1 X77.104 Y119.187 E.8896
G1 X76.965 Y119.598 E.01121
G1 X101.028 Y143.661 E.87983
G1 X100.607 Y143.79 E.01138
G1 X76.826 Y120.009 E.86951
G2 X76.707 Y120.44 I3.537 J1.204 E.01157
G1 X100.186 Y143.919 E.85844
G3 X99.75 Y144.032 I-1.173 J-3.618 E.01166
G1 X76.589 Y120.872 E.8468
G2 X76.482 Y121.313 I3.666 J1.129 E.01176
G1 X99.307 Y144.139 E.83456
G3 X98.859 Y144.241 I-1.081 J-3.722 E.01188
G1 X76.386 Y121.768 E.82168
G2 X76.291 Y122.222 I3.752 J1.022 E.01201
G1 X98.393 Y144.324 E.80812
G1 X97.927 Y144.408 E.01224
G1 X76.22 Y122.7 E.7937
G1 X76.148 Y123.179 E.0125
G1 X97.44 Y144.471 E.7785
G1 X96.949 Y144.529 E.01279
M73 P38 R20
G1 X76.095 Y123.675 E.76249
G1 X76.05 Y124.18 E.0131
G1 X96.443 Y144.572 E.74561
G1 X95.924 Y144.603 E.01344
G1 X76.018 Y124.698 E.7278
G1 X76.002 Y125.231 E.01381
G1 X95.393 Y144.622 E.70897
G1 X94.843 Y144.622 E.01421
G1 X75.998 Y125.776 E.68905
G1 X76.015 Y126.343 E.01465
G1 X94.282 Y144.61 E.66791
G1 X93.698 Y144.576 E.01513
G1 X76.044 Y126.922 E.64546
G1 X76.098 Y127.526 E.01566
G1 X93.098 Y144.525 E.62154
G1 X92.474 Y144.451 E.01625
G1 X76.173 Y128.15 E.596
G1 X76.269 Y128.796 E.01689
G1 X91.822 Y144.348 E.56864
G1 X91.152 Y144.228 E.0176
G1 X76.404 Y129.48 E.53922
G2 X76.561 Y130.187 I6.034 J-.969 E.01872
G1 X90.43 Y144.056 E.50709
G3 X89.676 Y143.852 I1.342 J-6.453 E.0202
G1 X76.767 Y130.943 E.47197
G2 X77.028 Y131.754 I6.964 J-1.794 E.02203
G1 X88.879 Y143.604 E.43329
G1 X88.004 Y143.28 E.02412
G1 X77.351 Y132.626 E.38952
G2 X77.765 Y133.59 I8.326 J-3.007 E.02714
G1 X87.037 Y142.862 E.33901
G1 X85.936 Y142.311 E.03184
G1 X78.325 Y134.7 E.27828
G2 X79.143 Y136.067 I11.93 J-6.206 E.04121
G1 X84.545 Y141.469 E.19751
G3 X81.487 Y138.961 I9.748 J-15.002 E.10246
G1 X79.735 Y137.209 E.06405
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X81.149 Y138.623 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 4/18
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z.92 I1.217 J0 P1  F30000
; object ids of layer 4 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer4 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z.68
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #5
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
G1  X75.466 Y207.966  
G1  X39.534  E1.1130
G1  Y197.534  E0.3231
G1  X75.466  E1.1130
G1  Y207.966  E0.3231
G1  X75.931 Y208.431  
G1  X39.069  E1.1419
G1  Y197.069  E0.3520
G1  X75.931  E1.1419
G1  Y208.431  E0.3520
G1  X76.397 Y208.897  
G1  X38.603  E1.1707
G1  Y196.603  E0.3808
G1  X76.397  E1.1707
G1  Y208.897  E0.3808
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X76.397 Y206.897 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.08 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.779 Y137.579
G1 Z.68
M73 P38 R19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X137.733 Y112.262 I14.659 J-12.685 E.76277
G3 X153.265 Y105.526 I14.714 J12.654 E.48437
G3 X137.818 Y137.624 I-.827 J19.368 E2.11896
G1 X137.476 Y137.841 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X136.692 Y112.913 I14.962 J-12.947 E.69224
G3 X153.288 Y105.126 I15.766 J12.024 E.48889
G3 X137.515 Y137.886 I-.85 J19.768 E2.00654
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X136.737 Y136.93 E-.14056
G1 X136.289 Y136.307 E-.08744
; WIPE_END
G1 E-.012 F1800
G1 X143.849 Y137.354 Z1.08 F30000
G1 X164.111 Y140.158 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F7200
G1 X166.158 Y138.11 E.07486
G2 X168.344 Y135.375 I-13.336 J-12.896 E.09063
G1 X162.94 Y140.779 E.19755
G1 X162.643 Y140.98 E.00928
G1 X161.552 Y141.618 E.03268
G1 X169.159 Y134.011 E.27813
G2 X169.719 Y132.901 I-9.072 J-5.274 E.03215
G1 X160.45 Y142.17 E.33888
G3 X159.483 Y142.588 I-4 J-7.936 E.02725
G1 X170.133 Y131.937 E.38941
G2 X170.457 Y131.064 I-7.195 J-3.162 E.02408
G1 X158.605 Y142.915 E.43331
G3 X157.809 Y143.162 I-2.486 J-6.621 E.02156
G1 X170.718 Y130.252 E.47199
G1 X170.923 Y129.498 E.0202
G1 X157.056 Y143.365 E.50699
G3 X156.335 Y143.536 I-1.807 J-5.994 E.01917
G1 X171.081 Y128.791 E.53913
G2 X171.217 Y128.105 I-5.706 J-1.485 E.01807
G1 X155.664 Y143.658 E.56865
G3 X155.013 Y143.76 I-1.179 J-5.433 E.01704
G1 X171.312 Y127.461 E.59592
G2 X171.387 Y126.835 I-5.233 J-.951 E.01629
G1 X154.387 Y143.835 E.62155
G3 X153.788 Y143.885 I-.718 J-5.025 E.01555
G1 X171.44 Y126.233 E.64538
G2 X171.471 Y125.653 I-4.878 J-.551 E.01504
G1 X153.203 Y143.921 E.66791
G3 X152.643 Y143.931 I-.368 J-4.712 E.01449
G1 X171.486 Y125.087 E.68896
G2 X171.483 Y124.541 I-4.602 J-.244 E.01413
G1 X152.092 Y143.932 E.70897
G3 X151.562 Y143.912 I-.096 J-4.473 E.01371
G1 X171.466 Y124.008 E.72772
M73 P39 R19
G2 X171.436 Y123.489 I-4.388 J-.002 E.01345
G1 X151.042 Y143.882 E.74561
G3 X150.537 Y143.838 I.119 J-4.281 E.01313
G1 X171.39 Y122.986 E.76242
G2 X171.338 Y122.488 I-4.214 J.191 E.01294
G1 X150.045 Y143.781 E.77849
G3 X149.559 Y143.717 I.293 J-4.131 E.01268
G1 X171.265 Y122.011 E.79363
G1 X171.193 Y121.533 E.01248
G1 X149.092 Y143.634 E.80805
G1 X148.626 Y143.551 E.01225
G1 X171.099 Y121.078 E.82168
G1 X171.003 Y120.624 E.01198
G1 X148.179 Y143.448 E.83449
G1 X147.735 Y143.342 E.01179
G1 X170.896 Y120.181 E.8468
G1 X170.777 Y119.75 E.01156
G1 X147.3 Y143.228 E.85838
G1 X146.878 Y143.1 E.01139
G1 X170.659 Y119.319 E.86946
G2 X170.521 Y118.908 I-3.536 J.96 E.01123
G1 X146.457 Y142.972 E.87982
G3 X146.051 Y142.827 I1.017 J-3.494 E.01113
G1 X170.381 Y118.498 E.88953
G2 X170.235 Y118.094 I-3.473 J1.029 E.0111
G1 X145.65 Y142.679 E.89887
G3 X145.252 Y142.528 I1.081 J-3.435 E.01102
G1 X170.076 Y117.704 E.9076
G1 X169.917 Y117.314 E.0109
G1 X144.87 Y142.36 E.91575
G1 X144.488 Y142.193 E.01079
G1 X169.745 Y116.935 E.92345
G1 X169.567 Y116.564 E.01065
G1 X144.114 Y142.017 E.9306
G1 X143.75 Y141.831 E.01056
G1 X169.389 Y116.192 E.9374
G2 X169.195 Y115.837 I-3.09 J1.46 E.01048
G1 X143.387 Y141.645 E.94359
G3 X143.035 Y141.447 I1.495 J-3.059 E.01044
G1 X168.999 Y115.483 E.94927
G2 X168.801 Y115.131 I-3.059 J1.492 E.01044
G1 X142.689 Y141.243 E.95468
G1 X142.343 Y141.039 E.01038
G1 X168.588 Y114.795 E.95954
G1 X168.374 Y114.459 E.0103
G1 X142.012 Y140.821 E.96384
G1 X141.683 Y140.6 E.01024
G1 X168.156 Y114.127 E.96789
G1 X167.926 Y113.808 E.01018
G1 X141.355 Y140.379 E.97148
G1 X141.043 Y140.141 E.01014
G1 X167.696 Y113.488 E.97448
G2 X167.459 Y113.176 I-2.75 J1.842 E.01015
G1 X140.731 Y139.904 E.97722
G3 X140.421 Y139.664 I1.866 J-2.725 E.01013
G1 X167.212 Y112.873 E.97951
G1 X166.965 Y112.57 E.0101
G1 X140.125 Y139.41 E.9813
G1 X139.83 Y139.156 E.01008
G1 X166.71 Y112.276 E.98278
G1 X166.447 Y111.989 E.01006
G1 X139.538 Y138.897 E.98381
G1 X139.259 Y138.627 E.01005
G1 X166.183 Y111.703 E.9844
G2 X165.91 Y111.427 I-2.463 J2.165 E.01005
G1 X138.98 Y138.357 E.98462
G3 X138.706 Y138.081 I2.189 J-2.441 E.01005
G1 X165.631 Y111.156 E.98441
G1 X165.351 Y110.886 E.01005
G1 X138.443 Y137.794 E.98381
G1 X138.18 Y137.508 E.01006
G1 X165.06 Y110.628 E.98278
G1 X164.764 Y110.374 E.01008
G1 X137.924 Y137.214 E.98131
G1 X137.678 Y136.911 E.0101
G1 X164.468 Y110.12 E.97952
G2 X164.159 Y109.88 I-2.175 J2.483 E.01013
G1 X137.431 Y136.608 E.97722
G3 X137.194 Y136.295 I2.512 J-2.154 E.01015
G1 X163.847 Y109.642 E.97448
G1 X163.535 Y109.405 E.01014
G1 X136.964 Y135.976 E.97148
G1 X136.733 Y135.656 E.01018
G1 X163.206 Y109.184 E.9679
G1 X162.877 Y108.963 E.01024
G1 X136.515 Y135.325 E.96385
G1 X136.302 Y134.989 E.0103
G1 X162.547 Y108.744 E.95955
G1 X162.2 Y108.541 E.01038
G1 X136.089 Y134.652 E.95469
G3 X135.891 Y134.301 I2.866 J-1.846 E.01044
G1 X161.854 Y108.337 E.94928
G2 X161.503 Y108.139 I-1.845 J2.857 E.01044
G1 X135.695 Y133.947 E.9436
G3 X135.5 Y133.592 I2.898 J-1.818 E.01047
G1 X161.139 Y107.953 E.93741
G1 X160.776 Y107.767 E.01056
G1 X135.322 Y133.22 E.93062
G1 X135.144 Y132.848 E.01065
G1 X160.402 Y107.591 E.92346
G1 X160.02 Y107.423 E.01079
G1 X134.973 Y132.47 E.91577
G1 X134.814 Y132.08 E.0109
G1 X159.638 Y107.256 E.90761
G2 X159.24 Y107.104 I-1.476 J3.276 E.01102
G1 X134.654 Y131.69 E.89888
G3 X134.508 Y131.286 I3.322 J-1.432 E.0111
G1 X158.838 Y106.956 E.88955
G1 X158.767 Y106.93 E.00197
G2 X158.433 Y106.811 I-1.16 J2.747 E.00916
G1 X134.369 Y130.876 E.87984
G3 X134.23 Y130.465 I3.41 J-1.376 E.01123
G1 X158.011 Y106.684 E.86948
G1 X157.59 Y106.556 E.01139
G1 X134.112 Y130.034 E.8584
G1 X133.993 Y129.603 E.01156
G1 X157.155 Y106.441 E.84682
G1 X156.711 Y106.335 E.01179
G1 X133.886 Y129.16 E.83452
G1 X133.79 Y128.706 E.01198
G1 X156.264 Y106.232 E.8217
G1 X155.798 Y106.149 E.01225
G1 X133.696 Y128.251 E.80808
G1 X133.624 Y127.773 E.01248
G1 X155.331 Y106.066 E.79365
G2 X154.845 Y106.003 I-.778 J4.059 E.01268
G1 X133.552 Y127.296 E.77852
G3 X133.499 Y126.799 I4.165 J-.689 E.01294
G1 X154.353 Y105.945 E.76245
G2 X153.848 Y105.901 I-.625 J4.235 E.01313
G1 X133.454 Y126.295 E.74564
G3 X133.423 Y125.776 I4.362 J-.517 E.01345
G1 X153.328 Y105.871 E.72776
G1 X153.245 Y105.866 E.00214
G2 X152.798 Y105.851 I-.353 J3.764 E.01157
G1 X133.406 Y125.243 E.70901
G3 X133.403 Y124.697 I4.596 J-.303 E.01413
G1 X152.248 Y105.852 E.689
G2 X151.688 Y105.862 I-.193 J4.723 E.01449
G1 X133.418 Y124.131 E.66796
G3 X133.449 Y123.551 I4.905 J-.03 E.01504
G1 X151.102 Y105.898 E.64542
G2 X150.503 Y105.948 I.118 J5.074 E.01555
G1 X133.502 Y122.949 E.62159
G3 X133.577 Y122.324 I5.307 J.325 E.01629
G1 X149.878 Y106.023 E.59597
G2 X149.227 Y106.124 I.527 J5.536 E.01704
M73 P40 R19
G1 X133.672 Y121.679 E.5687
G3 X133.808 Y120.994 I5.836 J.798 E.01806
G1 X148.555 Y106.246 E.53919
G2 X147.834 Y106.418 I1.086 J6.17 E.01917
G1 X133.966 Y120.286 E.50705
G1 X134.17 Y119.532 E.0202
G1 X147.081 Y106.621 E.47206
G2 X146.286 Y106.867 I1.684 J6.852 E.02155
G1 X134.432 Y118.721 E.43339
G3 X134.755 Y117.848 I7.517 J2.287 E.02408
G1 X145.408 Y107.195 E.38949
G2 X144.441 Y107.612 I3.032 J8.352 E.02725
G1 X135.17 Y116.884 E.33898
G3 X135.729 Y115.775 I9.625 J4.16 E.03214
G1 X143.34 Y108.164 E.27826
G2 X142.48 Y108.664 I3.783 J7.487 E.02572
G2 X141.952 Y109.002 I2.586 J4.626 E.01622
G1 X136.544 Y114.41 E.19773
G3 X138.72 Y111.685 I16.006 J10.547 E.0903
G1 X140.783 Y109.622 E.07541
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X139.368 Y111.036 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X131.76 Y111.643 Z1.08 F30000
G1 X110.09 Y113.37 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.443 Y113.823 E.01588
G3 X80.353 Y112.924 I-15.41 J11.761 E2.41472
G3 X95.897 Y106.218 I14.701 J12.707 E.48432
G3 X109.72 Y112.931 I-.864 J19.366 E.43688
G1 X110.051 Y113.325 E.01422
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.762 Y113.58 E.01504
G3 X79.31 Y113.573 I-15.728 J12.004 E2.25669
G3 X95.921 Y105.818 I15.732 J12.03 E.48894
G3 X110.023 Y112.669 I-.887 J19.766 E.41357
G1 X110.362 Y113.072 E.0135
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.762 Y113.58 E-.07368
G1 X111.454 Y114.526 E-.13368
G1 X111.551 Y114.68 E-.02064
; WIPE_END
G1 E-.012 F1800
G1 X104.008 Y113.511 Z1.08 F30000
G1 X83.376 Y110.314 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G1 X81.337 Y112.353 E.07453
G2 X79.242 Y114.941 I15.425 J14.635 E.08618
G1 X79.143 Y115.097 E.00478
G1 X84.545 Y109.695 E.19751
G1 X84.872 Y109.475 E.0102
G1 X85.936 Y108.853 E.03186
G1 X78.325 Y116.464 E.27828
G2 X77.765 Y117.574 I9.073 J5.275 E.03216
G1 X87.037 Y108.302 E.33901
G3 X88.004 Y107.884 I4.006 J7.95 E.02725
G1 X77.351 Y118.538 E.38952
G2 X77.028 Y119.41 I7.192 J3.156 E.02406
G1 X88.879 Y107.56 E.43329
G3 X89.676 Y107.312 I2.481 J6.586 E.02159
G1 X76.767 Y120.221 E.47197
G1 X76.561 Y120.977 E.02027
G1 X90.43 Y107.108 E.50709
G3 X91.152 Y106.936 I1.811 J5.991 E.0192
G1 X76.404 Y121.684 E.53922
G2 X76.269 Y122.368 I5.696 J1.475 E.01804
G1 X91.822 Y106.815 E.56864
G3 X92.474 Y106.713 I1.188 J5.441 E.01707
G1 X76.173 Y123.014 E.596
G2 X76.098 Y123.638 I5.222 J.941 E.01626
G1 X93.098 Y106.639 E.62154
G3 X93.698 Y106.588 I.727 J5.03 E.01558
G1 X76.044 Y124.242 E.64546
G2 X76.015 Y124.821 I4.865 J.541 E.01501
G1 X94.282 Y106.553 E.66791
G3 X94.843 Y106.542 I.378 J4.721 E.01452
G1 X75.998 Y125.387 E.68905
G2 X76.002 Y125.932 I4.591 J.234 E.0141
G1 X95.393 Y106.542 E.70897
G3 X95.877 Y106.558 I.106 J4.081 E.01252
G1 X95.924 Y106.561 E.00121
G1 X76.018 Y126.466 E.7278
G2 X76.05 Y126.984 I4.38 J-.008 E.01342
G1 X96.443 Y106.592 E.74561
G3 X96.949 Y106.635 I-.109 J4.286 E.01315
G1 X76.095 Y127.489 E.76249
G2 X76.148 Y127.985 I4.208 J-.201 E.01291
G1 X97.44 Y106.693 E.7785
G3 X97.927 Y106.756 I-.284 J4.143 E.0127
G1 X76.22 Y128.464 E.7937
G1 X76.291 Y128.942 E.0125
G1 X98.393 Y106.84 E.80812
G1 X98.859 Y106.923 E.01224
G1 X76.386 Y129.396 E.82168
G1 X76.482 Y129.85 E.012
G1 X99.307 Y107.025 E.83456
G1 X99.75 Y107.132 E.01177
G1 X76.589 Y130.292 E.8468
G1 X76.707 Y130.724 E.01157
G1 X100.186 Y107.245 E.85844
G1 X100.607 Y107.374 E.01138
G1 X76.826 Y131.155 E.86951
G1 X76.965 Y131.566 E.01121
G1 X101.028 Y107.502 E.87982
G3 X101.434 Y107.646 I-1.005 J3.494 E.01114
G1 X77.104 Y131.977 E.8896
G2 X77.251 Y132.379 I3.463 J-1.038 E.01109
G1 X101.835 Y107.795 E.89887
G3 X102.234 Y107.945 I-1.074 J3.448 E.01103
G1 X77.409 Y132.77 E.90766
G1 X77.568 Y133.161 E.01091
G1 X102.616 Y108.114 E.91581
G1 X102.997 Y108.282 E.01078
G1 X77.741 Y133.538 E.92346
G1 X77.918 Y133.911 E.01066
G1 X103.372 Y108.457 E.93067
G1 X103.735 Y108.643 E.01056
G1 X78.095 Y134.283 E.93746
G1 X78.291 Y134.637 E.01046
G1 X104.098 Y108.83 E.94359
G3 X104.451 Y109.027 I-1.488 J3.07 E.01045
G1 X78.486 Y134.991 E.94933
G2 X78.685 Y135.342 I3.053 J-1.502 E.01043
G1 X104.796 Y109.231 E.95469
G1 X105.142 Y109.435 E.01038
G1 X78.898 Y135.679 E.95955
G1 X79.111 Y136.016 E.0103
G1 X105.473 Y109.653 E.9639
G1 X105.802 Y109.874 E.01024
G1 X79.33 Y136.346 E.96789
G1 X79.559 Y136.666 E.01018
G1 X106.13 Y110.095 E.9715
G3 X106.443 Y110.333 I-1.845 J2.755 E.01015
G1 X79.789 Y136.986 E.97453
G2 X80.027 Y137.298 I2.743 J-1.852 E.01014
G1 X106.754 Y110.571 E.97722
G3 X107.065 Y110.81 I-1.861 J2.737 E.01014
G1 X80.274 Y137.601 E.97957
G1 X80.52 Y137.905 E.0101
G1 X107.36 Y111.064 E.98136
G1 X107.655 Y111.319 E.01008
G1 X80.776 Y138.198 E.98277
G1 X81.039 Y138.485 E.01006
G1 X107.948 Y111.576 E.98386
G1 X108.227 Y111.847 E.01005
G1 X81.301 Y138.772 E.98446
G2 X81.576 Y139.047 I2.459 J-2.178 E.01005
G1 X108.505 Y112.117 E.98462
G3 X108.78 Y112.393 I-2.184 J2.452 E.01005
G1 X81.855 Y139.318 E.98446
G1 X82.134 Y139.589 E.01005
G1 X109.042 Y112.68 E.98386
G1 X109.305 Y112.967 E.01006
G1 X82.426 Y139.846 E.98277
G1 X82.721 Y140.1 E.01008
G1 X109.562 Y113.26 E.98135
G1 X109.808 Y113.563 E.0101
G1 X83.016 Y140.355 E.97956
G2 X83.327 Y140.594 I2.163 J-2.487 E.01014
G1 X110.054 Y113.867 E.97721
G3 X110.292 Y114.178 I-2.506 J2.163 E.01014
G1 X83.639 Y140.832 E.97453
G2 X83.951 Y141.069 I2.158 J-2.518 E.01015
G1 X110.522 Y114.498 E.9715
G1 X110.751 Y114.818 E.01018
G1 X84.28 Y141.29 E.96788
M73 P41 R19
G1 X84.608 Y141.511 E.01024
G1 X110.971 Y115.149 E.96389
G1 X111.183 Y115.486 E.0103
G1 X84.94 Y141.729 E.95954
G1 X85.285 Y141.933 E.01038
G1 X111.396 Y115.823 E.95468
G3 X111.595 Y116.173 I-2.85 J1.85 E.01043
G1 X85.631 Y142.137 E.94932
G2 X85.983 Y142.335 I1.839 J-2.871 E.01045
G1 X111.79 Y116.528 E.94358
G1 X111.986 Y116.882 E.01046
G1 X86.346 Y142.521 E.93744
G1 X86.71 Y142.708 E.01056
G1 X112.163 Y117.254 E.93065
G1 X112.341 Y117.626 E.01066
G1 X87.084 Y142.883 E.92344
G1 X87.466 Y143.051 E.01078
G1 X112.513 Y118.004 E.9158
G1 X112.672 Y118.395 E.01091
G1 X87.847 Y143.219 E.90764
G2 X88.246 Y143.369 I1.47 J-3.29 E.01103
G1 X112.83 Y118.786 E.89885
G3 X112.977 Y119.188 I-3.315 J1.44 E.01109
G1 X88.647 Y143.518 E.88958
G2 X89.053 Y143.662 I1.413 J-3.356 E.01114
G1 X113.116 Y119.599 E.8798
G1 X113.255 Y120.01 E.01121
G1 X89.475 Y143.79 E.86948
G1 X89.896 Y143.919 E.01138
G1 X113.374 Y120.441 E.85842
G1 X113.492 Y120.873 E.01157
G1 X90.332 Y144.032 E.84678
G1 X90.775 Y144.139 E.01177
G1 X113.599 Y121.314 E.83453
G1 X113.695 Y121.769 E.012
G1 X91.223 Y144.241 E.82165
G1 X91.689 Y144.325 E.01224
G1 X113.79 Y122.223 E.80809
G1 X113.861 Y122.701 E.0125
G1 X92.154 Y144.408 E.79366
G2 X92.642 Y144.471 I.769 J-4.069 E.01271
G1 X113.933 Y123.18 E.77846
G3 X113.986 Y123.676 I-4.155 J.697 E.01292
G1 X93.133 Y144.529 E.76245
G2 X93.639 Y144.572 I.616 J-4.247 E.01315
G1 X114.031 Y124.181 E.74557
G3 X114.063 Y124.699 I-4.352 J.525 E.01343
G1 X94.158 Y144.603 E.72776
G2 X94.689 Y144.622 I.424 J-4.463 E.01374
G1 X114.078 Y125.233 E.70893
G3 X114.083 Y125.778 I-4.591 J.311 E.0141
G1 X95.239 Y144.622 E.689
G2 X95.8 Y144.61 I.183 J-4.732 E.01452
G1 X114.066 Y126.344 E.66786
G3 X114.036 Y126.924 I-4.901 J.038 E.01501
G1 X96.384 Y144.576 E.64541
G2 X96.985 Y144.525 I-.128 J-5.085 E.01559
G1 X113.982 Y127.527 E.62149
G3 X113.908 Y128.151 I-5.296 J-.317 E.01627
G1 X97.609 Y144.451 E.59594
G2 X98.261 Y144.348 I-.536 J-5.544 E.01707
G1 X113.811 Y128.798 E.56858
G3 X113.677 Y129.482 I-5.83 J-.792 E.01804
G1 X98.931 Y144.228 E.53915
G2 X99.653 Y144.055 I-1.094 J-6.178 E.0192
G1 X113.52 Y130.189 E.50701
G1 X113.313 Y130.945 E.02027
G1 X100.407 Y143.851 E.47189
G2 X101.204 Y143.604 I-1.688 J-6.843 E.0216
G1 X113.052 Y131.756 E.43319
G3 X112.729 Y132.628 I-7.511 J-2.283 E.02407
G1 X102.078 Y143.279 E.38942
G1 X103.046 Y142.861 E.02725
G1 X112.314 Y133.592 E.33889
G3 X111.754 Y134.702 I-9.639 J-4.17 E.03217
G1 X104.147 Y142.309 E.27813
G1 X105.209 Y141.689 E.03179
G1 X105.54 Y141.466 E.01032
G1 X110.936 Y136.07 E.19729
G3 X108.73 Y138.825 I-15.484 J-10.135 E.09138
G1 X106.71 Y140.845 E.07386
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X108.124 Y139.431 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 5/18
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S244.8
G17
G3 Z1.08 I1.217 J0 P1  F30000
; object ids of layer 5 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer5 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z.84
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #6
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
M73 P41 R18
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
G1  X75.466 Y207.966  
G1  X39.534  E1.1130
G1  Y197.534  E0.3231
G1  X75.466  E1.1130
G1  Y207.966  E0.3231
G1  X75.931 Y208.431  
G1  X39.069  E1.1419
G1  Y197.069  E0.3520
G1  X75.931  E1.1419
G1  Y208.431  E0.3520
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X75.931 Y206.431 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.24 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.787 Y137.572
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
M73 P42 R18
G3 X136.8 Y113.45 I14.657 J-12.681 E.72058
G1 X137.011 Y113.155 E.01003
G3 X153.345 Y105.531 I15.436 J11.76 E.51833
G3 X137.826 Y137.617 I-.901 J19.36 E2.11655
G1 X137.476 Y137.841 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X135.386 Y114.86 I14.962 J-12.946 E.63205
G3 X153.368 Y105.131 I17.068 J10.064 E.55111
G3 X137.515 Y137.886 I-.93 J19.764 E2.00452
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.241 Y137.549 E-.04956
G1 X136.737 Y136.93 E-.091
G1 X136.289 Y136.307 E-.08744
; WIPE_END
G1 E-.012 F1800
G1 X142.603 Y132.019 Z1.24 F30000
G1 X168.388 Y114.509 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G3 X169.234 Y115.939 I-11.632 J7.845 E.04598
G1 X143.492 Y141.682 E1.00661
G3 X138.99 Y138.346 I10.74 J-19.201 E.15535
G1 X165.899 Y111.437 E1.05223
G2 X161.397 Y108.101 I-15.24 J15.863 E.15535
G1 X135.655 Y133.844 E1.00661
G3 X134.148 Y130.108 I17.064 J-9.054 E.11157
G1 X147.23 Y143.191 E.51157
G2 X149.347 Y143.664 I5.559 J-19.893 E.06001
G1 X171.217 Y121.794 E.85519
G2 X170.741 Y119.675 I-19.657 J3.304 E.0601
G1 X157.659 Y106.592 E.51157
G2 X155.542 Y106.119 I-5.557 J19.883 E.06001
G1 X133.672 Y127.989 E.85518
G3 X133.671 Y121.793 I21.069 J-3.101 E.17192
G1 X155.542 Y143.665 E.85526
G2 X157.657 Y143.193 I-3.702 J-21.543 E.05992
G1 X170.742 Y130.107 E.51169
G2 X171.218 Y127.99 I-19.961 J-5.601 E.06004
G1 X149.347 Y106.118 E.85526
G2 X147.232 Y106.59 I3.703 J21.549 E.05992
G1 X134.147 Y119.676 E.51169
G3 X135.655 Y115.94 I18.544 J5.316 E.1116
G1 X161.396 Y141.681 E1.00655
G2 X165.898 Y138.345 I-10.648 J-19.078 E.15536
G1 X138.991 Y111.438 E1.05217
G3 X143.493 Y108.102 I15.149 J15.74 E.15536
G1 X169.234 Y133.843 E1.00655
G3 X168.389 Y135.274 I-12.48 J-6.396 E.04598
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X169.234 Y133.843 E-.18946
G1 X168.995 Y133.604 E-.03854
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X161.776 Y131.124 Z1.24 F30000
G1 X110.09 Y113.37 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12000
G1 X110.443 Y113.824 E.01588
G3 X78.959 Y114.75 I-15.409 J11.761 E2.35118
G3 X95.977 Y106.223 I16.092 J10.869 E.55006
G3 X109.719 Y112.932 I-.944 J19.362 E.43464
G1 X110.051 Y113.325 E.01422
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.761 Y113.58 E.01504
G3 X78 Y115.518 I-15.728 J12.005 E2.1965
G3 X96.001 Y105.823 I17.027 J10.056 E.55123
G3 X110.023 Y112.67 I-.967 J19.762 E.4115
G1 X110.362 Y113.072 E.0135
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.761 Y113.58 E-.07367
G1 X111.236 Y114.222 E-.09098
G1 X111.454 Y114.527 E-.04273
G1 X111.551 Y114.68 E-.02063
; WIPE_END
G1 E-.012 F1800
G1 X105.169 Y118.865 Z1.24 F30000
G1 X79.096 Y135.965 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G3 X78.251 Y134.534 I11.63 J-7.834 E.04598
G1 X103.992 Y108.792 E1.00657
G3 X108.495 Y112.128 I-10.689 J19.133 E.15535
G1 X81.586 Y139.036 E1.0522
G2 X86.088 Y142.372 I15.191 J-15.797 E.15535
G1 X111.83 Y116.63 E1.00658
G3 X113.337 Y120.366 I-17.044 J9.05 E.11158
G1 X100.254 Y107.282 E.51162
G2 X98.138 Y106.809 I-5.674 J20.421 E.05997
G1 X76.267 Y128.68 E.85522
G2 X76.743 Y130.798 I19.991 J-3.381 E.06007
G1 X89.827 Y143.882 E.51162
G2 X91.943 Y144.355 I5.674 J-20.421 E.05997
G1 X113.814 Y122.484 E.85522
G3 X113.94 Y127.833 I-19.305 J3.132 E.1484
G1 X113.814 Y128.68 E.02367
G1 X91.943 Y106.809 E.85522
G2 X89.827 Y107.282 I3.558 J20.889 E.05997
G1 X76.743 Y120.366 E.51162
G2 X76.267 Y122.484 I19.514 J5.5 E.06007
G1 X98.138 Y144.355 E.85522
G2 X100.254 Y143.882 I-3.558 J-20.889 E.05997
G1 X113.337 Y130.798 E.51162
G3 X111.83 Y134.534 I-18.549 J-5.315 E.11158
G1 X86.088 Y108.792 E1.00657
G2 X81.586 Y112.128 I9.09 J16.975 E.15548
G1 X108.495 Y139.036 E1.0522
G3 X103.992 Y142.372 I-15.192 J-15.798 E.15535
G1 X78.251 Y116.63 E1.00658
G3 X79.096 Y115.199 I12.482 J6.408 E.04598
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X78.251 Y116.63 E-.18946
G1 X78.49 Y116.869 E-.03854
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 6/18
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S247.35
G17
G3 Z1.24 I1.217 J0 P1  F30000
; object ids of layer 6 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer6 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #7
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
G1  X75.466 Y207.966  
G1  X39.534  E1.1130
G1  Y197.534  E0.3231
G1  X75.466  E1.1130
G1  Y207.966  E0.3231
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X75.466 Y205.966 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.779 Y137.579
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X135.178 Y116.07 I14.659 J-12.684 E.63564
G3 X153.425 Y105.535 I17.268 J8.839 E.61585
G3 X137.818 Y137.624 I-.987 J19.36 E2.11452
G1 X137.477 Y137.839 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X137.182 Y137.493 E.01166
G3 X134.319 Y116.948 I15.256 J-12.598 E.56017
G3 X153.448 Y105.135 I18.133 J7.969 E.61333
G3 X137.513 Y137.884 I-1.01 J19.76 E2.00252
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.182 Y137.493 E-.05839
G1 X136.737 Y136.93 E-.08188
G1 X136.287 Y136.305 E-.08773
; WIPE_END
G1 E-.012 F1800
G1 X143.916 Y136.06 Z1.4 F30000
G1 X168.389 Y135.274 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G2 X169.234 Y133.843 I-11.635 J-7.827 E.04598
G1 X143.493 Y108.102 E1.00655
G2 X138.991 Y111.438 I10.647 J19.076 E.15536
G1 X165.898 Y138.345 E1.05217
G3 X161.396 Y141.681 I-15.15 J-15.742 E.15536
G1 X135.655 Y115.94 E1.00655
G2 X134.147 Y119.676 I17.035 J9.052 E.1116
G1 X147.232 Y106.59 E.51169
G3 X149.347 Y106.118 I5.817 J21.077 E.05992
G1 X171.218 Y127.99 E.85526
G3 X170.742 Y130.107 I-20.437 J-3.484 E.06004
G1 X157.657 Y143.193 E.51169
G3 X155.542 Y143.665 I-5.816 J-21.071 E.05992
G1 X133.671 Y121.793 E.85526
G2 X133.672 Y127.989 I18.703 J3.095 E.17208
G1 X155.542 Y106.119 E.85518
G3 X157.659 Y106.592 I-3.44 J20.356 E.06001
G1 X170.741 Y119.675 E.51156
G3 X171.217 Y121.794 I-19.187 J5.425 E.0601
M73 P43 R18
G1 X149.347 Y143.664 E.85518
G3 X147.23 Y143.191 I3.442 J-20.367 E.06001
G1 X134.148 Y130.108 E.51157
G2 X135.655 Y133.844 I18.57 J-5.319 E.11157
G1 X161.397 Y108.101 E1.00661
G3 X165.899 Y111.437 I-10.739 J19.2 E.15535
G1 X138.99 Y138.346 E1.05223
G2 X143.492 Y141.682 I15.242 J-15.866 E.15535
G1 X169.234 Y115.939 E1.00661
G2 X168.388 Y114.509 I-12.472 J6.412 E.04598
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X169.234 Y115.939 E-.18946
G1 X168.995 Y116.179 E-.03854
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X161.372 Y115.815 Z1.4 F30000
G1 X110.09 Y113.37 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12000
G1 X110.443 Y113.824 E.01588
G3 X77.791 Y116.728 I-15.409 J11.762 E2.28764
G3 X96.057 Y106.228 I17.237 J8.847 E.61594
G3 X109.719 Y112.932 I-1.023 J19.358 E.43242
G1 X110.051 Y113.325 E.01422
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.766 Y113.577 E.01504
G3 X77.125 Y117.194 I-15.724 J12.009 E2.14804
G3 X96.081 Y105.828 I17.916 J8.391 E.60162
G3 X110.027 Y112.666 I-1.038 J19.758 E.4095
G1 X110.363 Y113.072 E.01351
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.766 Y113.577 E-.07369
G1 X111.454 Y114.526 E-.1337
G1 X111.551 Y114.679 E-.02062
; WIPE_END
G1 E-.012 F1800
G1 X103.919 Y114.802 Z1.4 F30000
G1 X79.096 Y115.199 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G2 X78.251 Y116.63 I11.633 J7.836 E.04598
G1 X103.992 Y142.372 E1.00658
G2 X108.495 Y139.036 I-10.69 J-19.134 E.15535
G1 X81.586 Y112.128 E1.0522
G3 X86.088 Y108.792 I15.192 J15.799 E.15535
G1 X111.83 Y134.534 E1.00657
G2 X113.337 Y130.798 I-17.042 J-9.05 E.11158
G1 X100.254 Y143.882 E.51162
G3 X98.138 Y144.355 I-5.673 J-20.416 E.05997
G1 X76.267 Y122.484 E.85522
G3 X76.743 Y120.366 I19.99 J3.381 E.06007
G1 X89.827 Y107.282 E.51162
G3 X91.943 Y106.809 I5.673 J20.416 E.05997
G1 X113.814 Y128.68 E.85522
G2 X113.814 Y122.484 I-21.065 J-3.098 E.17191
G1 X91.943 Y144.355 E.85522
G3 X89.827 Y143.882 I3.556 J-20.882 E.05997
G1 X76.743 Y130.798 E.51162
G3 X76.267 Y128.68 I19.515 J-5.5 E.06007
G1 X98.138 Y106.809 E.85522
G3 X100.254 Y107.282 I-3.558 J20.893 E.05997
G1 X113.337 Y120.366 E.51162
G2 X111.83 Y116.63 I-18.551 J5.315 E.11158
G1 X86.088 Y142.372 E1.00658
G3 X81.586 Y139.036 I10.69 J-19.133 E.15535
G1 X108.495 Y112.128 E1.0522
G2 X103.992 Y108.792 I-13.592 J13.638 E.15548
G1 X78.251 Y134.534 E1.00658
G2 X79.096 Y135.965 I12.482 J-6.408 E.04598
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X78.251 Y134.534 E-.18946
G1 X78.49 Y134.295 E-.03854
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 7/18
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F30000
; object ids of layer 7 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer7 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z1.16
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #8
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.56 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.779 Y137.579
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X134.686 Y117.109 I14.659 J-12.684 E.60385
G3 X153.505 Y105.54 I17.765 J7.807 E.6498
G3 X137.818 Y137.624 I-1.067 J19.355 E2.11229
G1 X137.479 Y137.841 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X137.476 Y137.841 E.0001
G3 X134.319 Y116.948 I14.963 J-12.946 E.57185
G3 X153.528 Y105.14 I18.132 J7.968 E.61539
G3 X138.269 Y138.705 I-1.09 J19.755 E1.97183
G1 X137.52 Y137.885 E.0285
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.476 Y137.841 E-.0071
G1 X136.737 Y136.93 E-.13373
G1 X136.29 Y136.309 E-.08717
; WIPE_END
G1 E-.012 F1800
G1 X142.604 Y132.021 Z1.56 F30000
G1 X168.388 Y114.509 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G3 X169.234 Y115.939 I-11.626 J7.842 E.04598
G1 X143.492 Y141.682 E1.00661
G3 X138.99 Y138.346 I10.74 J-19.201 E.15535
G1 X165.899 Y111.437 E1.05223
G2 X161.397 Y108.101 I-15.24 J15.863 E.15535
G1 X135.655 Y133.844 E1.00661
G3 X134.148 Y130.108 I17.064 J-9.054 E.11157
G1 X147.23 Y143.191 E.51157
G2 X149.347 Y143.664 I5.559 J-19.892 E.06001
G1 X171.217 Y121.794 E.85518
G2 X170.741 Y119.675 I-19.659 J3.305 E.0601
G1 X157.659 Y106.592 E.51156
G2 X155.542 Y106.119 I-5.557 J19.883 E.06001
G1 X133.672 Y127.989 E.85518
G3 X133.671 Y121.793 I21.069 J-3.101 E.17192
G1 X155.542 Y143.665 E.85526
G2 X157.657 Y143.193 I-3.702 J-21.543 E.05992
G1 X170.742 Y130.107 E.51169
G2 X171.218 Y127.99 I-19.961 J-5.601 E.06004
G1 X149.347 Y106.118 E.85526
G2 X147.232 Y106.59 I3.703 J21.549 E.05992
G1 X134.147 Y119.676 E.51169
G3 X135.655 Y115.94 I21.222 J6.398 E.11155
G1 X161.396 Y141.681 E1.00655
G2 X165.898 Y138.345 I-10.647 J-19.077 E.15536
G1 X138.991 Y111.438 E1.05217
G3 X143.493 Y108.102 I13.559 J13.594 E.15548
G1 X169.234 Y133.843 E1.00655
G3 X168.389 Y135.274 I-12.48 J-6.396 E.04598
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X169.234 Y133.843 E-.18946
G1 X168.995 Y133.604 E-.03854
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X161.776 Y131.124 Z1.56 F30000
G1 X110.09 Y113.37 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12000
G1 X110.443 Y113.824 E.01588
G3 X77.297 Y117.766 I-15.409 J11.762 E2.25588
G3 X96.137 Y106.232 I17.75 J7.84 E.64979
G3 X109.719 Y112.932 I-1.103 J19.353 E.43019
G1 X110.051 Y113.325 E.01422
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.761 Y113.581 E.01504
G3 X76.93 Y117.604 I-15.727 J12.005 E2.13633
G3 X96.161 Y105.832 I18.117 J8.002 E.61539
G3 X110.022 Y112.67 I-1.127 J19.753 E.40737
G1 X110.362 Y113.072 E.0135
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.761 Y113.581 E-.07367
G1 X111.454 Y114.526 E-.13368
G1 X111.551 Y114.68 E-.02065
; WIPE_END
G1 E-.012 F1800
G1 X103.919 Y114.802 Z1.56 F30000
G1 X79.096 Y115.199 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G2 X78.251 Y116.63 I11.629 J7.833 E.04598
G1 X103.992 Y142.372 E1.00658
G2 X108.495 Y139.036 I-10.69 J-19.134 E.15535
G1 X81.586 Y112.128 E1.0522
M73 P44 R18
G3 X86.088 Y108.792 I13.592 J13.639 E.15548
G1 X111.83 Y134.534 E1.00657
G2 X113.337 Y130.798 I-17.042 J-9.05 E.11158
G1 X100.254 Y143.882 E.51162
G3 X98.138 Y144.355 I-5.673 J-20.416 E.05997
G1 X76.267 Y122.484 E.85522
G3 X76.743 Y120.366 I19.989 J3.381 E.06007
G1 X89.827 Y107.282 E.51162
G3 X90.522 Y107.101 I1.867 J5.764 E.01985
G3 X91.943 Y106.809 I3.176 J11.834 E.04014
G1 X113.814 Y128.68 E.85522
G2 X114.012 Y127.03 I-13.803 J-2.493 E.04598
G1 X76.069 Y127.03 F30000
G1 F12000
G2 X76.267 Y128.68 I14.003 J-.843 E.04598
G1 X98.138 Y106.809 E.85522
G3 X100.254 Y107.282 I-3.557 J20.887 E.05997
G1 X113.337 Y120.366 E.51162
G3 X113.814 Y122.484 I-19.52 J5.501 E.06007
G1 X91.943 Y144.355 E.85522
G3 X89.827 Y143.882 I3.558 J-20.893 E.05997
G1 X76.743 Y130.798 E.51162
G2 X78.251 Y134.534 I18.551 J-5.315 E.11158
G1 X103.992 Y108.792 E1.00657
G3 X108.495 Y112.128 I-10.689 J19.133 E.15535
G1 X81.586 Y139.036 E1.0522
G2 X86.088 Y142.372 I15.192 J-15.798 E.15535
G1 X111.83 Y116.63 E1.00658
G2 X110.985 Y115.199 I-12.48 J6.406 E.04598
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X111.83 Y116.63 E-.18946
G1 X111.591 Y116.869 E-.03854
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 8/18
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S244.8
G17
G3 Z1.56 I1.217 J0 P1  F30000
; object ids of layer 8 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer8 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z1.32
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #9
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.72 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.779 Y137.579
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X134.686 Y117.109 I14.659 J-12.683 E.60385
G3 X153.585 Y105.545 I17.764 J7.807 E.65201
G3 X137.818 Y137.624 I-1.147 J19.351 E2.1101
G1 X137.475 Y137.836 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X136.735 Y136.931 E.03
G3 X134.319 Y116.948 I15.703 J-12.036 E.54175
G3 X153.608 Y105.145 I18.132 J7.968 E.61744
G3 X137.512 Y137.883 I-1.17 J19.751 E1.99846
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X136.735 Y136.931 E-.14002
G1 X136.285 Y136.304 E-.08798
; WIPE_END
G1 E-.012 F1800
G1 X137.696 Y136.706 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F3000;_EXTRUDE_SET_SPEED
G3 X136.683 Y135.534 I42.329 J-37.607 E.03503
G3 X162.728 Y108.899 I15.765 J-10.635 E1.17651
G1 X163.607 Y109.627 E.02581
; Slow Down End
G1 X167.634 Y113.647 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G3 X168.802 Y115.189 I-6.548 J6.168 E.04384
G3 X141.774 Y140.624 I-16.354 J9.7 E1.16206
G1 X140.712 Y139.715 E.03162
; Slow Down End
G1 X134.28 Y120.693 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G3 X134.73 Y119.093 I21.343 J5.136 E.04596
G1 X146.65 Y107.173 E.46611
G3 X149.68 Y106.451 I10.232 J36.224 E.08614
G1 X170.879 Y127.65 E.82895
G3 X170.159 Y130.69 I-29.538 J-5.382 E.08642
G1 X158.239 Y142.61 E.46611
G3 X155.209 Y143.332 I-10.236 J-36.241 E.08614
G1 X134.01 Y122.133 E.82895
G2 X134.01 Y127.65 I20.971 J2.758 E.15298
G1 X155.209 Y106.452 E.82892
G3 X158.237 Y107.171 I-3.181 J20.128 E.08615
G1 X170.161 Y119.094 E.46624
G3 X170.879 Y122.133 I-29.211 J8.505 E.08638
G1 X149.68 Y143.332 E.82892
G3 X146.652 Y142.612 I3.181 J-20.128 E.08615
G1 X134.729 Y130.689 E.46624
G3 X134.281 Y129.089 I20.095 J-6.482 E.04596
G1 X162.547 Y140.561 F30000
G1 F12000
G3 X161.11 Y141.395 I-11.8 J-18.682 E.04596
G1 X135.939 Y116.224 E.98424
G3 X139.264 Y111.711 I18.704 J10.294 E.15545
G1 X165.626 Y138.073 E1.03084
G2 X168.95 Y133.559 I-15.381 J-14.808 E.15545
G1 X143.779 Y108.388 E.98424
G2 X142.342 Y109.222 I10.364 J19.519 E.04596
G1 X168.11 Y114.79 F30000
G1 F12000
G3 X168.951 Y116.223 I-11.658 J7.803 E.04598
G1 X143.779 Y141.395 E.9843
G3 X139.753 Y138.562 I9.081 J-17.179 E.13647
G1 X139.498 Y138.838 E.01039
G1 X138.99 Y138.346 E.01955
G1 X165.899 Y111.437 E1.05223
G2 X164.528 Y110.191 I-11.189 J10.935 E.05127
G1 X164.279 Y110.475 E.01043
G2 X161.11 Y108.388 I-16.851 J22.139 E.105
G1 X135.938 Y133.56 E.9843
G2 X136.779 Y134.993 I12.5 J-6.37 E.04598
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X135.938 Y133.56 E-.18946
G1 X136.177 Y133.321 E-.03854
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X130.115 Y128.684 Z1.72 F30000
G1 X110.09 Y113.37 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12000
G1 X110.445 Y113.822 E.01588
G3 X77.556 Y117.221 I-15.405 J11.76 E2.27193
G3 X96.217 Y106.237 I17.484 J8.361 E.63528
G3 X109.721 Y112.93 I-1.177 J19.345 E.42802
G1 X110.051 Y113.324 E.01422
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.761 Y113.581 E.01504
G3 X76.489 Y118.691 I-15.727 J12.005 E2.10624
G3 X96.241 Y105.837 I18.558 J6.914 E.64752
G3 X110.023 Y112.67 I-1.207 J19.749 E.40531
G1 X110.362 Y113.072 E.0135
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.761 Y113.581 E-.07367
G1 X111.454 Y114.526 E-.13368
G1 X111.551 Y114.68 E-.02065
; WIPE_END
G1 E-.012 F1800
G1 X105.427 Y110.125 Z1.72 F30000
G1 X105.143 Y109.913 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G2 X103.706 Y109.079 I-11.53 J18.192 E.04596
G1 X78.535 Y134.25 E.98427
G2 X81.859 Y138.763 I18.764 J-10.338 E.15544
G1 X108.222 Y112.401 E1.03086
G3 X111.546 Y116.914 I-15.441 J14.853 E.15544
G1 X86.375 Y142.085 E.98427
G3 X85.537 Y141.617 I3.532 J-7.297 E.02655
G3 X84.938 Y141.251 I2.785 J-5.23 E.01943
G1 X76.876 Y129.78 F30000
G1 F12000
G2 X77.325 Y131.38 I20.889 J-4.994 E.04596
G1 X89.247 Y143.302 E.46617
G2 X92.275 Y144.023 I6.228 J-19.432 E.08617
G1 X113.474 Y122.824 E.82896
G2 X112.756 Y119.784 I-29.705 J5.418 E.0864
G1 X100.834 Y107.862 E.46617
G2 X97.806 Y107.141 I-6.228 J19.432 E.08617
M73 P44 R17
G1 X76.606 Y128.34 E.82896
G3 X76.426 Y126.688 I13.829 J-2.347 E.04598
G1 X83.8 Y110.389 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F3000;_EXTRUDE_SET_SPEED
G1 X84.761 Y109.585 E.02834
G1 X84.892 Y109.498 E.00357
G3 X110.796 Y136.231 I10.141 J16.091 E1.17305
G3 X109.833 Y137.348 I-19.362 J-15.718 E.03338
; Slow Down End
G1 X110.706 Y135.684 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G2 X111.546 Y134.25 I-11.652 J-7.789 E.04598
G1 X86.375 Y109.079 E.98427
G2 X83.203 Y111.168 I13.513 J23.964 E.1051
G1 X82.954 Y110.883 E.01047
G2 X81.586 Y112.128 I9.796 J12.136 E.05117
G1 X108.495 Y139.036 E1.0522
G1 X108.001 Y139.515 E.01902
G1 X107.745 Y139.239 E.0104
G3 X103.706 Y142.085 I-13.098 J-14.302 E.13699
G1 X78.535 Y116.914 E.98427
G3 X79.375 Y115.48 I12.496 J6.357 E.04598
G1 X113.655 Y126.688 F30000
G1 F12000
G3 X113.474 Y128.34 I-14.009 J-.695 E.04598
M73 P45 R17
G1 X92.275 Y107.141 E.82896
G2 X89.247 Y107.862 I3.198 J20.149 E.08617
G1 X77.325 Y119.784 E.46617
G2 X76.606 Y122.824 I28.983 J8.456 E.0864
G1 X97.806 Y144.023 E.82896
G2 X100.834 Y143.302 I-3.198 J-20.149 E.08617
G1 X112.756 Y131.38 E.46617
G2 X113.204 Y129.78 I-20.422 J-6.588 E.04596
G1 X106.825 Y140.36 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F3000;_EXTRUDE_SET_SPEED
G3 X105.714 Y141.313 I-16.727 J-18.391 E.03312
G3 X79.056 Y115.291 I-10.673 J-15.731 E1.17761
G3 X79.808 Y114.387 I15.698 J12.296 E.02658
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F3000
G1 X79.056 Y115.291 E-.13398
G1 X78.665 Y115.911 E-.08356
G1 X78.621 Y115.991 E-.01046
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 9/18
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S178.5
G17
G3 Z1.72 I1.217 J0 P1  F30000
; object ids of layer 9 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer9 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z1.48
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #10
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F3000
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.88 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.785 Y137.573
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X136.343 Y114.09 I14.657 J-12.686 E.69904
G1 X136.614 Y113.711 E.01287
G3 X153.665 Y105.549 I15.803 J11.121 E.54618
G1 X154.13 Y105.576 E.01287
G3 X137.824 Y137.619 I-1.687 J19.311 E2.09506
G1 X137.481 Y137.843 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X137.482 Y137.836 E.00019
G3 X136.01 Y113.867 I14.961 J-12.948 E.66199
G1 X136.288 Y113.478 E.01225
G3 X153.688 Y105.149 I16.128 J11.353 E.51712
G1 X154.165 Y105.177 E.01225
G3 X138.275 Y138.699 I-1.722 J19.711 E1.95552
G1 X137.522 Y137.887 E.02841
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.482 Y137.836 E-.00744
G1 X136.737 Y136.93 E-.1337
G1 X136.292 Y136.311 E-.08685
; WIPE_END
G1 E-.012 F1800
G1 X135.889 Y134.649 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40271
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X142.04 Y140.801 E.46071
G1 X142.324 Y140.991 E.01805
G1 X143.295 Y141.562 E.05969
G1 X143.595 Y141.715 E.01785
G1 X135.613 Y133.733 E.5978
G3 X135.019 Y132.499 I29.288 J-14.851 E.07251
G1 X144.826 Y142.306 E.73442
G2 X145.896 Y142.736 I4.159 J-8.804 E.06112
G1 X134.592 Y131.431 E.8466
G1 X134.263 Y130.463 E.05416
G1 X146.862 Y143.061 E.94351
G2 X147.754 Y143.314 I2.574 J-7.396 E.04915
G1 X134.02 Y129.579 E1.02857
G3 X133.833 Y128.751 I6.881 J-1.994 E.04497
G1 X148.594 Y143.513 E1.10549
G1 X149.373 Y143.651 E.04188
G1 X133.685 Y127.964 E1.17483
G1 X133.571 Y127.21 E.0404
G1 X150.118 Y143.757 E1.23923
G2 X150.84 Y143.839 I1.049 J-6.038 E.03849
G1 X133.505 Y126.503 E1.29826
G3 X133.456 Y125.814 I5.783 J-.753 E.03658
G1 X151.52 Y143.878 E1.35276
G2 X152.182 Y143.9 I.519 J-5.57 E.03513
G1 X133.435 Y125.153 E1.40394
G3 X133.44 Y124.517 I5.36 J-.282 E.0337
G1 X152.821 Y143.899 E1.45148
G2 X153.437 Y143.874 I.102 J-5.193 E.03265
G1 X133.457 Y123.894 E1.49629
G3 X133.503 Y123.3 I12.525 J.677 E.03155
G1 X154.04 Y143.837 E1.53801
G2 X154.618 Y143.775 I-.236 J-4.908 E.0308
G1 X133.555 Y122.712 E1.57744
G3 X133.635 Y122.152 I9.39 J1.064 E.02995
G1 X155.189 Y143.706 E1.61419
G2 X155.736 Y143.613 I-.511 J-4.644 E.02939
G1 X133.717 Y121.594 E1.64898
G3 X133.826 Y121.062 I4.529 J.652 E.02874
G1 X156.278 Y143.514 E1.6814
G2 X156.799 Y143.395 I-.746 J-4.445 E.02831
G1 X133.937 Y120.533 E1.71213
G3 X134.07 Y120.025 I4.337 J.866 E.02778
G1 X157.313 Y143.269 E1.74072
G2 X157.812 Y143.127 I-.945 J-4.266 E.02746
G1 X134.206 Y119.522 E1.76781
G3 X134.36 Y119.035 I4.173 J1.051 E.02703
G1 X158.301 Y142.977 E1.79297
G1 X158.317 Y142.972 E.00084
G2 X158.78 Y142.815 I-1.087 J-3.984 E.02594
G1 X134.521 Y118.556 E1.81678
G3 X134.693 Y118.088 I4.034 J1.215 E.02643
G1 X159.247 Y142.641 E1.83881
G2 X159.708 Y142.463 I-1.271 J-3.978 E.02623
G1 X134.877 Y117.632 E1.85962
G3 X135.065 Y117.179 I3.9 J1.356 E.02595
G1 X160.152 Y142.267 E1.87877
G1 X160.596 Y142.07 E.0257
G1 X135.271 Y116.745 E1.89659
G1 X135.477 Y116.311 E.02545
G1 X161.021 Y141.855 E1.91301
G1 X161.444 Y141.637 E.02517
G1 X135.7 Y115.894 E1.92792
G1 X135.927 Y115.481 E.02497
G1 X161.856 Y141.409 E1.9418
G1 X162.258 Y141.171 E.02474
G1 X136.163 Y115.076 E1.95422
G1 X136.41 Y114.683 E.02459
G1 X162.658 Y140.931 E1.96569
G1 X163.04 Y140.673 E.02442
G1 X136.658 Y114.29 E1.97575
G1 X136.925 Y113.917 E.0243
G1 X163.422 Y140.414 E1.98437
G2 X163.791 Y140.144 I-2.098 J-3.251 E.02427
G1 X137.191 Y113.544 E1.99206
G3 X137.469 Y113.181 I3.192 J2.158 E.0242
G1 X164.154 Y139.866 E1.9984
G2 X164.513 Y139.585 I-2.19 J-3.168 E.02417
G1 X137.755 Y112.827 E2.00387
G3 X138.043 Y112.475 I3.117 J2.253 E.02411
G1 X164.856 Y139.288 E2.00802
G1 X165.199 Y138.991 E.02404
G1 X138.349 Y112.14 E2.01086
G1 X138.654 Y111.805 E.024
G1 X165.53 Y138.681 E2.01273
G1 X165.854 Y138.365 E.02398
G1 X138.97 Y111.481 E2.0133
G1 X139.295 Y111.165 E.02398
G1 X166.174 Y138.045 E2.01301
G1 X166.48 Y137.71 E.024
G1 X139.621 Y110.852 E2.01143
G1 X139.964 Y110.555 E.02404
G1 X166.785 Y137.375 E2.00858
G2 X167.077 Y137.027 I-2.79 J-2.631 E.02408
G1 X140.308 Y110.258 E2.00472
G3 X140.663 Y109.973 I2.58 J2.854 E.02413
G1 X167.363 Y136.673 E1.99954
G2 X167.644 Y136.314 I-2.884 J-2.555 E.02416
G1 X141.025 Y109.695 E1.99349
G3 X141.391 Y109.42 I2.493 J2.938 E.02423
G1 X167.911 Y135.941 E1.98609
G1 X168.178 Y135.567 E.0243
G1 X141.773 Y109.162 E1.97747
G1 X142.155 Y108.904 E.02442
G1 X168.429 Y135.178 E1.9677
G1 X168.677 Y134.785 E.02459
G1 X142.551 Y108.66 E1.95654
G1 X142.953 Y108.421 E.02474
G1 X168.917 Y134.385 E1.94441
G1 X169.143 Y133.972 E.02497
G1 X143.361 Y108.189 E1.93084
G1 X143.784 Y107.971 E.02517
G1 X169.37 Y133.558 E1.91619
G2 X169.577 Y133.125 I-3.524 J-1.946 E.02545
G1 X144.206 Y107.754 E1.90003
G3 X144.648 Y107.556 I1.883 J3.617 E.02568
G1 X169.783 Y132.69 E1.88233
G1 X169.833 Y132.585 E.00619
G2 X169.975 Y132.243 I-2.815 J-1.371 E.01964
G1 X145.092 Y107.359 E1.8635
G3 X145.549 Y107.176 I1.769 J3.763 E.0261
G1 X170.159 Y131.786 E1.84303
G2 X170.336 Y131.323 I-3.824 J-1.721 E.02629
M73 P46 R17
G1 X146.016 Y107.002 E1.82134
G1 X146.027 Y106.998 E.00067
G3 X146.49 Y106.836 I1.593 J3.816 E.02595
G1 X170.497 Y130.843 E1.79788
G2 X170.655 Y130.362 I-3.966 J-1.573 E.02687
G1 X146.98 Y106.686 E1.77309
G3 X147.473 Y106.539 I1.484 J4.084 E.02728
G1 X170.792 Y129.858 E1.74637
G1 X170.929 Y129.354 E.02763
G1 X147.988 Y106.414 E1.71805
G3 X148.503 Y106.289 I1.304 J4.252 E.0281
G1 X171.041 Y128.826 E1.68785
G1 X171.151 Y128.297 E.02866
G1 X149.045 Y106.19 E1.65554
G1 X149.587 Y106.092 E.02916
G1 X171.237 Y127.743 E1.62143
G1 X171.32 Y127.185 E.02987
G1 X150.157 Y106.022 E1.58488
G3 X150.729 Y105.953 I.871 J4.837 E.0305
G1 X171.375 Y126.6 E1.54625
G1 X171.427 Y126.011 E.0313
G1 X151.332 Y105.916 E1.50492
G3 X151.94 Y105.885 I.571 J5.113 E.03229
G1 X171.446 Y125.39 E1.46076
G2 X171.458 Y124.762 I-5.29 J-.414 E.0333
G1 X152.579 Y105.883 E1.4138
G3 X153.234 Y105.898 I.207 J5.522 E.03469
G1 X171.437 Y124.101 E1.36322
G2 X171.397 Y123.421 I-5.753 J-.004 E.0361
G1 X153.913 Y105.937 E1.30937
G3 X154.626 Y106.009 I-.254 J6.039 E.03796
G1 X171.333 Y122.716 E1.25119
G2 X171.227 Y121.97 I-6.34 J.522 E.03995
G1 X155.361 Y106.104 E1.18817
G1 X156.14 Y106.243 E.04188
G1 X171.091 Y121.194 E1.1197
G2 X170.917 Y120.38 I-6.989 J1.065 E.04409
G1 X156.967 Y106.429 E1.04479
G3 X157.844 Y106.666 I-1.558 J7.507 E.04815
G1 X170.674 Y119.497 E.96087
G2 X170.363 Y118.545 I-20.491 J6.174 E.05301
G1 X158.79 Y106.972 E.8667
G1 X159.132 Y107.099 E.01928
G3 X159.836 Y107.378 I-2.001 J6.073 E.04013
G1 X169.958 Y117.5 E.75803
G2 X169.412 Y116.313 I-10.278 J4.013 E.0692
G1 X161.033 Y107.934 E.6275
G3 X162.482 Y108.743 I-8.937 J17.714 E.0879
G1 X169.159 Y115.42 E.50005
M106 S178.5
G1 X165.845 Y111.492 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G1 X165.899 Y111.437 E.00214
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X165.845 Y111.492 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X158.216 Y111.749 Z1.88 F30000
M73 P47 R17
G1 X110.09 Y113.37 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12000
G1 X110.45 Y113.818 E.01589
G3 X84.69 Y109.187 I-15.411 J11.761 E2.57344
G1 X85.679 Y108.602 E.03177
G3 X96.297 Y106.242 I9.334 J16.928 E.30486
G1 X96.762 Y106.269 E.01287
G3 X109.726 Y112.925 I-1.722 J19.309 E.4131
G1 X110.052 Y113.324 E.01423
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.769 Y113.575 E.01504
G3 X84.476 Y108.848 I-15.729 J12.004 E2.43706
G1 X85.486 Y108.251 E.03009
G3 X96.321 Y105.842 I9.527 J17.278 E.28865
G1 X96.798 Y105.87 E.01225
G3 X110.03 Y112.664 I-1.758 J19.708 E.3912
G1 X110.363 Y113.072 E.01351
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.769 Y113.575 E-.07369
G1 X111.454 Y114.526 E-.1337
G1 X111.551 Y114.679 E-.0206
; WIPE_END
G1 E-.012 F1800
G1 X104.103 Y113.011 Z1.88 F30000
G1 X85.578 Y108.86 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40271
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X78.907 Y115.53 E.49955
G2 X78.071 Y117.007 I19.634 J12.096 E.08989
G1 X86.455 Y108.623 E.62786
G3 X87.652 Y108.066 I6.468 J12.336 E.06995
G1 X77.526 Y118.192 E.75835
G2 X77.12 Y119.238 I16.39 J6.955 E.05939
G1 X88.697 Y107.661 E.86697
G3 X89.538 Y107.388 I2.728 J6.957 E.04687
G1 X89.643 Y107.356 E.00579
G1 X76.809 Y120.189 E.96111
G1 X76.568 Y121.07 E.04836
G1 X90.519 Y107.119 E1.04478
G3 X91.345 Y106.934 I1.978 J6.863 E.04487
G1 X76.394 Y121.885 E1.1197
G2 X76.258 Y122.661 I6.474 J1.537 E.04178
G1 X92.126 Y106.793 E1.18836
G3 X92.86 Y106.699 I1.159 J6.142 E.03922
G1 X76.151 Y123.409 E1.25135
G1 X76.088 Y124.111 E.03737
M73 P47 R16
G1 X93.572 Y106.628 E1.30936
G1 X94.253 Y106.587 E.03611
G1 X76.047 Y124.792 E1.36338
G1 X76.028 Y125.452 E.03496
G1 X94.906 Y106.574 E1.41379
G1 X95.546 Y106.574 E.0339
M73 P48 R16
G1 X76.039 Y126.081 E1.46091
G1 X76.057 Y126.703 E.03294
G1 X96.154 Y106.607 E1.50503
G3 X96.757 Y106.644 I-2.59 J46.581 E.03198
G1 X76.109 Y127.291 E1.54627
G2 X76.164 Y127.877 I4.953 J-.17 E.03115
G1 X97.329 Y106.712 E1.585
G3 X97.898 Y106.783 I-.312 J4.833 E.0304
G1 X76.248 Y128.434 E1.62141
G2 X76.333 Y128.988 I4.721 J-.443 E.02974
G1 X98.441 Y106.881 E1.65566
G3 X98.982 Y106.979 I-.565 J4.624 E.02916
G1 X76.444 Y129.517 E1.68786
G1 X76.556 Y130.046 E.02862
G1 X99.498 Y107.104 E1.71814
G1 X100.013 Y107.229 E.02809
G1 X76.693 Y130.549 E1.74647
G1 X76.83 Y131.052 E.0276
G1 X100.506 Y107.377 E1.77306
G1 X100.996 Y107.526 E.02716
G1 X76.988 Y131.535 E1.79798
G1 X77.15 Y132.013 E.02675
G1 X101.47 Y107.693 E1.82131
G1 X101.936 Y107.867 E.02637
G1 X77.325 Y132.478 E1.84312
G1 X77.51 Y132.933 E.02603
G1 X102.393 Y108.05 E1.86347
G1 X102.837 Y108.246 E.02572
G1 X77.702 Y133.382 E1.88242
G1 X77.908 Y133.816 E.02544
G1 X103.279 Y108.445 E1.90001
G1 X103.702 Y108.662 E.02518
G1 X78.115 Y134.249 E1.91622
G2 X78.341 Y134.663 I3.626 J-1.719 E.02499
G1 X104.125 Y108.879 E1.93092
G3 X104.532 Y109.112 I-1.759 J3.546 E.02486
G1 X78.569 Y135.075 E1.94438
G2 X78.808 Y135.477 I4.311 J-2.298 E.02474
G1 X104.935 Y109.35 E1.95661
G3 X105.33 Y109.595 I-3.349 J5.847 E.02463
G1 X79.056 Y135.869 E1.96766
G2 X79.306 Y136.259 I3.41 J-1.918 E.02455
G1 X105.712 Y109.853 E1.97755
G1 X106.095 Y110.11 E.02443
G1 X79.574 Y136.631 E1.98617
G1 X79.841 Y137.004 E.0243
G1 X106.46 Y110.386 E1.99345
G1 X106.823 Y110.663 E.02419
G1 X80.122 Y137.364 E1.99961
G1 X80.409 Y137.717 E.0241
G1 X107.177 Y110.949 E2.00468
G1 X107.521 Y111.245 E.02404
G1 X80.7 Y138.067 E2.00865
G1 X81.006 Y138.401 E.024
G1 X107.865 Y111.542 E2.0115
G3 X108.19 Y111.856 I-2.46 J2.869 E.02399
G1 X81.311 Y138.735 E2.01296
G2 X81.631 Y139.056 I2.862 J-2.533 E.02399
G1 X108.515 Y112.172 E2.01336
G3 X108.831 Y112.496 I-2.577 J2.824 E.02399
G1 X81.956 Y139.371 E2.01268
G2 X82.285 Y139.682 I3.454 J-3.328 E.02399
G1 X109.137 Y112.83 E2.01092
G1 X109.443 Y113.165 E.024
G1 X82.629 Y139.979 E2.00808
G1 X82.973 Y140.275 E.02404
G1 X109.73 Y113.518 E2.00381
G1 X110.017 Y113.872 E.0241
G1 X83.331 Y140.557 E1.99846
G1 X83.694 Y140.834 E.02419
G1 X110.293 Y114.235 E1.992
G1 X110.561 Y114.608 E.0243
G1 X84.063 Y141.106 E1.98443
G1 X84.445 Y141.363 E.02443
G1 X110.827 Y114.982 E1.97572
G1 X111.075 Y115.374 E.02458
G1 X84.828 Y141.621 E1.96563
G2 X85.227 Y141.862 I2.231 J-3.246 E.02471
G1 X111.323 Y115.767 E1.95428
G3 X111.558 Y116.172 I-3.3 J2.185 E.02482
G1 X85.63 Y142.1 E1.94173
G2 X86.018 Y142.317 I2.026 J-3.169 E.02357
G1 X86.041 Y142.328 E.00137
G1 X111.785 Y116.585 E1.92796
G3 X112.008 Y117.002 I-3.407 J2.083 E.02508
G1 X86.464 Y142.546 E1.91294
G2 X86.889 Y142.761 I2.03 J-3.466 E.02523
G1 X112.214 Y117.436 E1.89663
G1 X112.421 Y117.87 E.02544
G1 X87.333 Y142.957 E1.87882
G1 X87.778 Y143.153 E.02572
G1 X112.608 Y118.323 E1.85955
G1 X112.793 Y118.778 E.02603
G1 X88.239 Y143.332 E1.83886
G1 X88.705 Y143.506 E.02637
G1 X112.964 Y119.247 E1.8167
G1 X113.125 Y119.726 E.02675
G1 X89.183 Y143.668 E1.79301
G1 X89.674 Y143.818 E.02716
G1 X113.278 Y120.213 E1.76772
G1 X113.416 Y120.716 E.0276
G1 X90.171 Y143.96 E1.74076
G1 X90.687 Y144.085 E.02809
G1 X113.548 Y121.224 E1.71203
G1 X113.659 Y121.753 E.02862
G1 X91.207 Y144.205 E1.68144
G1 X91.749 Y144.303 E.0292
G1 X113.767 Y122.286 E1.64888
G1 X113.85 Y122.843 E.02983
G1 X92.295 Y144.397 E1.61422
G1 X92.867 Y144.465 E.03051
G1 X113.929 Y123.403 E1.57733
M73 P49 R16
G1 X113.982 Y123.991 E.03125
G1 X93.444 Y144.529 E1.53804
G1 X94.049 Y144.564 E.03206
G1 X114.027 Y124.586 E1.49617
G1 X114.046 Y125.208 E.03294
G1 X94.664 Y144.59 E1.45151
G1 X95.304 Y144.59 E.0339
G1 X114.049 Y125.845 E1.40381
G1 X114.029 Y126.505 E.03496
G1 X95.966 Y144.568 E1.35279
G1 X96.646 Y144.528 E.03611
G1 X113.98 Y127.194 E1.29812
G3 X113.913 Y127.902 I-5.99 J-.213 E.03766
G1 X97.367 Y144.447 E1.23906
G2 X98.112 Y144.342 I-.51 J-6.326 E.03986
G1 X113.8 Y128.655 E1.17486
G3 X113.652 Y129.443 I-6.719 J-.854 E.0425
G1 X98.893 Y144.202 E1.10531
G2 X99.275 Y144.114 I-.553 J-3.26 E.02076
G1 X99.732 Y144.003 E.02492
G1 X113.464 Y130.271 E1.02837
G3 X113.221 Y131.154 I-145.796 J-39.556 E.04847
G1 X100.624 Y143.751 E.94341
G2 X101.59 Y143.426 I-2.256 J-8.296 E.05397
G1 X112.894 Y132.121 E.84662
G3 X112.667 Y132.695 I-4.951 J-1.628 E.03268
G1 X112.467 Y133.189 E.02823
G1 X102.66 Y142.996 E.73444
G2 X103.751 Y142.477 I-3.825 J-9.442 E.06401
G1 X103.892 Y142.404 E.00839
G1 X111.869 Y134.427 E.59743
G3 X110.952 Y135.984 I-13.575 J-6.946 E.09576
G1 X104.819 Y142.117 E.45932
M106 S178.5
G1 X81.641 Y112.182 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G1 X81.586 Y112.128 E.00213
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X81.641 Y112.182 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 10/18
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M106 S214.2
G17
G3 Z1.88 I1.217 J0 P1  F30000
; object ids of layer 10 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer10 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z1.64
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #11
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
M73 P50 R16
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.04 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.786 Y137.573
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X147.299 Y106.198 I14.659 J-12.685 E1.08031
G1 X148.415 Y105.926 E.03178
G3 X153.745 Y105.554 I4.035 J19.447 E.14817
G1 X154.13 Y105.576 E.01066
G3 X137.825 Y137.618 I-1.686 J19.312 E2.09518
G1 X137.482 Y137.844 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X137.481 Y137.836 E.00021
G3 X136.01 Y113.867 I14.961 J-12.948 E.662
G1 X136.241 Y113.544 E.0102
G3 X153.768 Y105.154 I16.207 J11.354 E.52108
G1 X154.165 Y105.177 E.01019
G3 X138.275 Y138.699 I-1.722 J19.711 E1.95559
G1 X137.523 Y137.888 E.02837
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.481 Y137.836 E-.00762
G1 X136.737 Y136.93 E-.1337
G1 X136.293 Y136.313 E-.08667
; WIPE_END
G1 E-.012 F1800
G1 X136.176 Y135.114 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F7200
G1 X150.11 Y121.18 E.50946
G1 X149.186 Y121.555 E.02579
G1 X136.089 Y134.652 E.47886
G3 X135.891 Y134.301 I2.858 J-1.842 E.01044
G1 X148.261 Y121.93 E.4523
G1 X147.337 Y122.305 E.02579
G1 X135.695 Y133.947 E.42567
G3 X135.5 Y133.592 I2.898 J-1.818 E.01047
G1 X146.774 Y122.318 E.41219
G1 X146.66 Y122.242 E.00354
G1 X146.66 Y121.883 E.00928
G1 X135.322 Y133.22 E.41452
G1 X135.144 Y132.848 E.01065
G1 X146.659 Y121.334 E.42099
G1 X146.658 Y120.785 E.01418
M73 P50 R15
G1 X134.973 Y132.47 E.42722
G1 X134.814 Y132.08 E.0109
M73 P51 R15
G1 X146.657 Y120.237 E.43301
G1 X146.656 Y119.688 E.01418
G1 X134.654 Y131.69 E.43879
G3 X134.508 Y131.286 I3.322 J-1.432 E.0111
G1 X146.655 Y119.139 E.4441
G1 X146.654 Y118.591 E.01418
G1 X134.369 Y130.876 E.44917
G3 X134.23 Y130.465 I3.41 J-1.376 E.01123
G1 X146.653 Y118.042 E.45419
G1 X146.652 Y117.494 E.01418
G1 X134.112 Y130.034 E.45849
G1 X133.993 Y129.603 E.01156
G1 X146.651 Y116.945 E.46279
G1 X146.65 Y116.538 E.01052
G1 X146.858 Y116.33 E.0076
G1 X147.267 Y116.329 E.01057
G1 X157.155 Y106.441 E.36152
G3 X157.59 Y106.556 I-.746 J3.722 E.01164
G1 X147.817 Y116.328 E.3573
G1 X148.368 Y116.327 E.01424
G1 X158.011 Y106.684 E.35258
G1 X158.433 Y106.811 E.01139
G1 X148.919 Y116.326 E.34787
G1 X149.469 Y116.325 E.01424
G1 X158.838 Y106.956 E.34255
G1 X159.24 Y107.104 E.01106
G1 X150.02 Y116.324 E.33709
G1 X150.571 Y116.323 E.01424
G1 X159.638 Y107.256 E.33151
G1 X160.02 Y107.423 E.01079
G1 X151.095 Y116.349 E.32632
G1 X151.276 Y116.529 E.00662
G1 X151.276 Y116.716 E.00483
G1 X160.402 Y107.591 E.33365
G3 X160.776 Y107.767 I-1.296 J3.232 E.01068
G1 X151.277 Y117.265 E.34727
G1 X151.279 Y117.814 E.01418
G1 X161.139 Y107.953 E.36053
G1 X161.503 Y108.139 E.01056
G1 X151.28 Y118.362 E.37379
G1 X151.281 Y118.911 E.01418
G1 X161.854 Y108.337 E.3866
G1 X162.2 Y108.541 E.01038
G1 X154.425 Y116.316 E.28427
G1 X154.976 Y116.315 E.01424
G1 X162.547 Y108.744 E.27679
G3 X162.877 Y108.963 I-1.675 J2.891 E.01026
G1 X155.527 Y116.314 E.26875
G1 X156.077 Y116.313 E.01424
G1 X163.206 Y109.184 E.26065
G3 X163.535 Y109.405 I-1.702 J2.876 E.01024
G1 X156.628 Y116.311 E.25251
G1 X157.179 Y116.31 E.01424
G1 X163.847 Y109.642 E.24379
G1 X164.159 Y109.88 E.01014
G1 X157.729 Y116.309 E.23508
G1 X157.915 Y116.309 E.00479
G1 X158.097 Y116.491 E.00667
G1 X164.468 Y110.12 E.23294
G1 X164.764 Y110.374 E.01008
G1 X158.124 Y117.014 E.24278
G1 X158.125 Y117.563 E.01418
G1 X165.06 Y110.628 E.25355
G3 X165.351 Y110.886 I-2.033 J2.586 E.01007
G1 X158.126 Y118.111 E.26417
G1 X158.127 Y118.66 E.01418
G1 X165.631 Y111.156 E.27435
G1 X165.91 Y111.427 E.01005
G1 X158.128 Y119.209 E.28452
G1 X158.129 Y119.757 E.01418
G1 X166.183 Y111.703 E.29448
G1 X166.447 Y111.989 E.01006
G1 X158.13 Y120.306 E.30406
G1 X158.131 Y120.854 E.01418
G1 X166.71 Y112.276 E.31365
G3 X166.965 Y112.57 I-2.348 J2.298 E.01008
G1 X158.132 Y121.403 E.32295
G1 X158.133 Y121.952 E.01418
G1 X167.212 Y112.873 E.33193
G1 X167.459 Y113.176 E.0101
G1 X158.134 Y122.5 E.34092
G1 X158.135 Y123.049 E.01418
G1 X167.696 Y113.488 E.34955
G1 X167.926 Y113.808 E.01018
G1 X158.136 Y123.597 E.35793
G1 X158.137 Y124.146 E.01418
G1 X168.156 Y114.127 E.3663
G3 X168.374 Y114.459 I-2.681 J2.003 E.01026
G1 X157.965 Y124.868 E.38058
G1 X153.918 Y127.669 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G1 X153.917 Y126.811 E.02371
G1 X154.664 Y127.111 E.02226
G1 X157.748 Y130.195 E.12059
G1 X157.744 Y128.347 E.0511
G1 X157.09 Y128.084 E.0195
G1 X153.925 Y131.249 E.12374
G1 X153.927 Y132.066 E.0226
G1 X154.772 Y132.064 E.02337
G1 X150.126 Y132.073 F30000
G1 F12000
G1 X150.905 Y132.072 E.02153
G1 X150.903 Y131.188 E.02444
G1 X147.071 Y127.356 E.14984
G1 X147.077 Y130.259 E.08029
G1 X150.894 Y126.442 E.14927
G1 X150.891 Y124.779 E.04597
G1 X147.537 Y124.853 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F7200
G1 X153.501 Y118.889 E.21805
G1 X153.502 Y119.437 E.01418
G1 X148.777 Y124.163 E.17277
G1 X149.701 Y123.788 E.02579
G1 X153.503 Y119.986 E.139
G1 X153.504 Y120.535 E.01418
G1 X150.626 Y123.413 E.10523
G1 X150.976 Y123.271 E.00977
G1 X151.18 Y123.408 E.00636
G1 X153.505 Y121.083 E.085
G1 X153.506 Y121.632 E.01418
G1 X151.29 Y123.848 E.08104
G1 X151.291 Y124.397 E.01418
G1 X153.507 Y122.18 E.08104
G1 X153.508 Y122.729 E.01418
G1 X151.292 Y124.945 E.08104
G1 X151.293 Y125.494 E.01418
G1 X153.509 Y123.278 E.08104
G1 X153.51 Y123.649 E.0096
G1 X153.582 Y123.755 E.00331
G1 X151.294 Y126.043 E.08365
G1 X151.295 Y126.591 E.01418
G1 X153.936 Y123.95 E.09656
G1 X154.328 Y124.108 E.01093
G1 X151.296 Y127.14 E.11086
G1 X151.297 Y127.688 E.01418
G1 X154.72 Y124.265 E.12516
G1 X155.113 Y124.422 E.01093
G1 X151.125 Y128.41 E.1458
G1 X150.364 Y120.645 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G1 X148.823 Y121.27 E.04597
G1 X147.056 Y119.503 E.06908
G1 X147.061 Y121.984 E.0686
G1 X147.823 Y121.675 E.02274
G1 X150.879 Y118.619 E.11951
G1 X150.876 Y116.956 E.04597
G1 X153.671 Y117.07 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F7200
G1 X151.282 Y119.459 E.08736
G1 X151.283 Y120.008 E.01418
G1 X153.499 Y117.792 E.08103
G1 X153.5 Y118.34 E.01418
G1 X136.515 Y135.325 E.621
G2 X136.733 Y135.656 I2.901 J-1.673 E.01026
G1 X146.667 Y125.723 E.36319
G1 X146.668 Y126.271 E.01418
G1 X136.964 Y135.976 E.35481
G1 X137.194 Y136.295 E.01018
G1 X146.669 Y126.82 E.34644
G1 X146.67 Y127.369 E.01418
G1 X137.431 Y136.608 E.3378
G1 X137.678 Y136.911 E.0101
G1 X146.671 Y127.917 E.32882
G1 X146.672 Y128.466 E.01418
G1 X137.924 Y137.214 E.31984
G2 X138.18 Y137.508 I2.608 J-2.007 E.01008
G1 X146.673 Y129.014 E.31054
G1 X146.674 Y129.563 E.01418
G1 X138.443 Y137.794 E.30096
G1 X138.706 Y138.081 E.01006
G1 X146.676 Y130.111 E.29138
G1 X146.677 Y130.66 E.01418
G1 X138.98 Y138.357 E.28142
G1 X139.259 Y138.627 E.01005
G1 X146.678 Y131.209 E.27124
G1 X146.679 Y131.757 E.01418
G1 X139.538 Y138.897 E.26106
G2 X139.83 Y139.156 I2.324 J-2.327 E.01007
G1 X146.696 Y132.289 E.25106
G1 X146.888 Y132.48 E.00699
G1 X147.056 Y132.48 E.00433
G1 X140.125 Y139.41 E.25337
G1 X140.421 Y139.664 E.01008
G1 X147.606 Y132.479 E.26269
G1 X148.157 Y132.478 E.01424
G1 X140.731 Y139.904 E.27151
G1 X141.043 Y140.141 E.01014
G1 X148.708 Y132.477 E.28023
G1 X149.258 Y132.476 E.01424
G1 X141.355 Y140.379 E.28895
G2 X141.683 Y140.6 I2.032 J-2.658 E.01024
G1 X149.809 Y132.474 E.29708
G1 X150.36 Y132.473 E.01424
G1 X141.887 Y140.946 E.30976
G1 X133.74 Y129.306 F30000
G1 F7200
G1 X156.711 Y106.335 E.83987
G2 X156.264 Y106.232 I-1.09 J3.714 E.01186
G1 X133.79 Y128.706 E.8217
G3 X133.696 Y128.251 I3.782 J-1.018 E.01203
G1 X155.798 Y106.149 E.80808
G1 X155.331 Y106.066 E.01225
G1 X133.624 Y127.773 E.79365
G1 X133.552 Y127.296 E.01248
G1 X154.845 Y106.003 E.77852
G1 X154.353 Y105.945 E.01281
G1 X133.499 Y126.799 E.76245
G1 X133.454 Y126.295 E.01308
G1 X153.848 Y105.901 E.74564
G1 X153.328 Y105.871 E.01346
G1 X133.423 Y125.776 E.72776
G1 X133.406 Y125.243 E.01378
G1 X152.798 Y105.851 E.70901
G1 X152.248 Y105.852 E.01424
G1 X133.403 Y124.697 E.689
G1 X133.418 Y124.131 E.01462
G1 X151.688 Y105.862 E.66796
G1 X151.102 Y105.898 E.01516
G1 X133.449 Y123.551 E.64542
G1 X133.502 Y122.949 E.01563
G1 X150.503 Y105.948 E.62159
G1 X149.878 Y106.023 E.01628
G1 X133.577 Y122.324 E.59597
G1 X133.672 Y121.679 E.01685
G1 X149.227 Y106.124 E.5687
G1 X148.555 Y106.246 E.01765
G1 X133.808 Y120.994 E.53919
G3 X133.966 Y120.286 I6.043 J.978 E.01875
G1 X147.834 Y106.418 E.50705
G2 X147.081 Y106.621 I1.334 J6.444 E.02016
G1 X134.17 Y119.532 E.47206
G3 X134.432 Y118.721 I6.971 J1.8 E.02205
G1 X146.286 Y106.867 E.43339
G1 X145.408 Y107.195 E.02422
G1 X134.755 Y117.848 E.38949
G3 X135.17 Y116.884 I8.323 J3.007 E.02715
G1 X144.441 Y107.612 E.33898
G2 X143.34 Y108.164 I4.099 J9.556 E.03187
G1 X135.729 Y115.775 E.27826
G3 X136.544 Y114.41 I11.903 J6.182 E.0411
G1 X141.952 Y109.002 E.19774
G2 X138.875 Y111.529 I9.735 J14.989 E.10315
G1 X137.133 Y113.271 E.06368
G1 X153.898 Y116.848 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G1 X153.901 Y118.51 E.04597
G1 X157.733 Y122.342 E.14984
G1 X157.728 Y119.608 E.0756
G1 X153.911 Y123.426 E.14928
G1 X153.911 Y123.508 E.00229
G1 X155.377 Y124.097 E.04368
G1 X170.797 Y119.181 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F7200
G1 X158.152 Y131.826 E.46233
G1 X158.151 Y131.278 E.01418
G1 X170.521 Y118.908 E.45226
G1 X170.381 Y118.498 E.0112
G1 X158.15 Y130.729 E.4472
G1 X158.149 Y130.181 E.01418
G1 X170.235 Y118.094 E.4419
G1 X170.076 Y117.704 E.0109
G1 X158.148 Y129.632 E.43611
G1 X158.147 Y129.083 E.01418
G1 X169.917 Y117.314 E.43033
G2 X169.745 Y116.935 I-3.273 J1.257 E.01074
G1 X158.146 Y128.535 E.4241
G1 X158.145 Y128.206 E.00849
G1 X158.056 Y128.075 E.00411
G1 X169.567 Y116.564 E.42087
G1 X169.389 Y116.192 E.01065
G1 X157.689 Y127.892 E.42779
G1 X157.296 Y127.735 E.01093
G1 X169.195 Y115.837 E.43503
G1 X168.999 Y115.483 E.01045
G1 X156.904 Y127.578 E.44221
G1 X156.512 Y127.42 E.01093
G1 X168.801 Y115.131 E.44931
G1 X168.588 Y114.795 E.0103
G1 X156.12 Y127.263 E.45585
G1 X155.727 Y127.106 E.01093
G1 X157.466 Y125.367 E.06358
G1 X157.074 Y125.209 E.01093
G1 X155.335 Y126.948 E.06358
G1 X154.943 Y126.791 E.01093
G1 X156.682 Y125.052 E.06358
G1 X156.29 Y124.895 E.01093
G1 X154.55 Y126.634 E.06358
G1 X154.158 Y126.476 E.01093
G1 X155.897 Y124.737 E.06358
G1 X155.505 Y124.58 E.01093
G1 X151.299 Y128.786 E.15377
M73 P52 R15
G1 X151.3 Y129.334 E.01418
G1 X153.517 Y127.118 E.08103
G1 X153.518 Y127.666 E.01418
G1 X151.301 Y129.883 E.08103
G1 X151.302 Y130.431 E.01418
G1 X153.519 Y128.215 E.08104
G1 X153.52 Y128.764 E.01418
G1 X151.303 Y130.98 E.08104
G1 X151.304 Y131.529 E.01418
G1 X153.521 Y129.312 E.08104
G1 X153.522 Y129.861 E.01418
G1 X142.343 Y141.039 E.40872
G1 X142.689 Y141.243 E.01038
G1 X153.523 Y130.409 E.3961
G1 X153.524 Y130.958 E.01418
G1 X143.035 Y141.447 E.38349
G2 X143.387 Y141.645 I1.847 J-2.862 E.01044
G1 X153.525 Y131.506 E.37068
G1 X153.526 Y132.055 E.01418
G1 X143.75 Y141.831 E.35742
G1 X144.114 Y142.017 E.01056
G1 X153.699 Y132.432 E.35044
G1 X153.735 Y132.467 E.0013
G1 X154.214 Y132.466 E.01239
G1 X144.488 Y142.193 E.35562
G1 X144.87 Y142.36 E.01079
G1 X154.765 Y132.465 E.36178
G1 X155.316 Y132.464 E.01424
G1 X145.252 Y142.528 E.36794
G2 X145.65 Y142.679 I1.479 J-3.284 E.01102
G1 X155.866 Y132.463 E.37352
G1 X156.417 Y132.462 E.01424
G1 X146.051 Y142.827 E.37898
G2 X146.457 Y142.972 I1.422 J-3.348 E.01113
G1 X156.968 Y132.461 E.3843
G1 X157.518 Y132.46 E.01424
G1 X146.878 Y143.1 E.38901
G1 X147.3 Y143.228 E.01139
G1 X170.777 Y119.75 E.85838
G1 X170.896 Y120.181 E.01156
G1 X147.735 Y143.342 E.8468
G1 X148.179 Y143.448 E.01179
G1 X171.003 Y120.624 E.83449
G1 X171.099 Y121.078 E.01198
G1 X148.626 Y143.551 E.82168
G1 X149.092 Y143.634 E.01225
G1 X171.193 Y121.533 E.80805
G1 X171.265 Y122.011 E.01248
G1 X149.559 Y143.717 E.79363
G2 X150.045 Y143.781 I.778 J-4.06 E.01268
G1 X171.338 Y122.488 E.77849
G3 X171.39 Y122.986 I-4.162 J.688 E.01294
G1 X150.537 Y143.838 E.76242
G2 X151.042 Y143.882 I.624 J-4.237 E.01313
G1 X171.436 Y123.489 E.74561
G3 X171.466 Y124.008 I-4.358 J.517 E.01345
G1 X151.562 Y143.912 E.72772
G2 X152.092 Y143.932 I.433 J-4.453 E.01371
G1 X171.483 Y124.541 E.70897
G3 X171.486 Y125.087 I-4.596 J.302 E.01413
G1 X152.643 Y143.931 E.68896
G2 X153.203 Y143.921 I.192 J-4.723 E.01449
G1 X171.471 Y125.653 E.66791
G3 X171.44 Y126.233 I-4.908 J.03 E.01504
G1 X153.788 Y143.885 E.64538
G2 X154.387 Y143.835 I-.118 J-5.071 E.01555
G1 X171.387 Y126.835 E.62155
G3 X171.312 Y127.461 I-5.305 J-.325 E.01629
G1 X155.013 Y143.76 E.59592
G2 X155.664 Y143.658 I-.528 J-5.535 E.01704
G1 X171.217 Y128.105 E.56864
G3 X171.081 Y128.791 I-5.841 J-.799 E.01807
G1 X156.335 Y143.536 E.53913
G2 X157.056 Y143.365 I-1.083 J-6.158 E.01917
G1 X170.923 Y129.498 E.50699
G1 X170.718 Y130.252 E.0202
G1 X157.809 Y143.162 E.47199
G2 X158.605 Y142.915 I-1.69 J-6.868 E.02156
G1 X170.457 Y131.064 E.43331
G3 X170.133 Y131.937 I-7.518 J-2.289 E.02408
G1 X159.483 Y142.588 E.38941
G2 X160.45 Y142.17 I-3.033 J-8.353 E.02725
G1 X169.719 Y132.901 E.33888
G3 X169.159 Y134.011 I-13.026 J-5.877 E.03214
G1 X161.552 Y141.618 E.27813
G1 X162.643 Y140.98 E.03268
G1 X162.94 Y140.779 E.00928
G1 X168.344 Y135.375 E.19755
G3 X166.158 Y138.11 I-15.521 J-10.162 E.09063
G1 X164.111 Y140.158 E.07486
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X165.525 Y138.743 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X158.585 Y135.567 Z2.04 F30000
G1 X110.09 Y113.371 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.45 Y113.818 E.01588
G3 X84.69 Y109.187 I-15.411 J11.76 E2.5734
G1 X85.679 Y108.602 E.03177
G3 X96.377 Y106.247 I9.353 J17.006 E.30705
G1 X96.762 Y106.269 E.01065
G3 X109.726 Y112.926 I-1.722 J19.309 E.4131
G1 X110.052 Y113.324 E.01423
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.769 Y113.575 E.01505
G3 X84.476 Y108.848 I-15.729 J12.003 E2.43702
G1 X85.486 Y108.251 E.03009
G3 X96.401 Y105.847 I9.546 J17.358 E.29068
G1 X96.798 Y105.87 E.01019
G3 X110.03 Y112.664 I-1.758 J19.708 E.3912
G1 X110.363 Y113.072 E.01351
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.769 Y113.575 E-.0737
G1 X111.454 Y114.526 E-.13369
G1 X111.551 Y114.679 E-.02061
; WIPE_END
G1 E-.012 F1800
G1 X104.008 Y113.511 Z2.04 F30000
G1 X83.376 Y110.315 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G1 X81.337 Y112.353 E.07452
G2 X79.242 Y114.941 I15.425 J14.635 E.08618
G1 X79.143 Y115.097 E.00478
G1 X84.545 Y109.695 E.1975
G3 X85.936 Y108.853 I13.237 J20.309 E.04205
G1 X78.325 Y116.464 E.27827
G2 X77.765 Y117.574 I9.071 J5.274 E.03216
G1 X87.037 Y108.302 E.33901
G3 X88.004 Y107.884 I4 J7.936 E.02725
G1 X77.351 Y118.538 E.38952
G2 X77.028 Y119.41 I7.19 J3.156 E.02406
G1 X88.879 Y107.56 E.43329
G3 X89.676 Y107.312 I2.48 J6.58 E.02159
G1 X76.767 Y120.221 E.47197
G1 X76.561 Y120.977 E.02027
G1 X90.43 Y107.108 E.50709
G3 X91.152 Y106.936 I9.569 J38.495 E.01919
G1 X76.404 Y121.684 E.53922
G2 X76.269 Y122.368 I5.692 J1.474 E.01804
G1 X91.822 Y106.815 E.56864
G3 X92.474 Y106.713 I1.188 J5.442 E.01707
G1 X76.173 Y123.014 E.596
G2 X76.098 Y123.638 I5.22 J.94 E.01626
G1 X93.098 Y106.639 E.62154
G3 X93.698 Y106.588 I.727 J5.031 E.01558
G1 X76.044 Y124.242 E.64546
G2 X76.015 Y124.821 I4.866 J.541 E.01501
G1 X94.282 Y106.553 E.66791
G3 X94.843 Y106.542 I.378 J4.721 E.01452
G1 X75.998 Y125.387 E.68904
G2 X76.002 Y125.932 I4.591 J.234 E.0141
G1 X95.393 Y106.542 E.70897
G3 X95.924 Y106.561 I.106 J4.481 E.01374
G1 X76.018 Y126.466 E.7278
G2 X76.05 Y126.984 I4.379 J-.008 E.01342
G1 X96.443 Y106.592 E.74561
G3 X96.949 Y106.635 I-.11 J4.291 E.01315
G1 X76.095 Y127.489 E.76249
G2 X76.148 Y127.985 I4.207 J-.201 E.01291
G1 X97.44 Y106.693 E.7785
G3 X97.927 Y106.756 I-.283 J4.13 E.0127
G1 X76.22 Y128.464 E.7937
G1 X76.291 Y128.942 E.0125
G1 X98.393 Y106.84 E.80812
G1 X98.859 Y106.923 E.01224
G1 X76.386 Y129.396 E.82168
G1 X76.482 Y129.85 E.012
G1 X99.307 Y107.025 E.83456
G1 X99.75 Y107.132 E.01177
G1 X76.589 Y130.292 E.8468
G1 X76.707 Y130.724 E.01157
G1 X100.186 Y107.245 E.85844
G1 X100.607 Y107.374 E.01138
G1 X76.826 Y131.155 E.86951
G1 X76.965 Y131.566 E.01121
G1 X101.028 Y107.502 E.87982
G3 X101.434 Y107.646 I-1.007 J3.498 E.01114
G1 X77.104 Y131.977 E.8896
G2 X77.251 Y132.379 I3.465 J-1.039 E.01109
G1 X101.835 Y107.795 E.89887
G3 X102.234 Y107.945 I-1.071 J3.442 E.01103
G1 X77.409 Y132.77 E.90766
G1 X77.568 Y133.161 E.01091
G1 X102.616 Y108.113 E.91582
G1 X102.997 Y108.282 E.01078
G1 X77.741 Y133.538 E.92346
G1 X77.918 Y133.911 E.01066
G1 X103.372 Y108.457 E.93067
G1 X103.735 Y108.643 E.01056
G1 X78.095 Y134.283 E.93746
G1 X78.291 Y134.637 E.01046
G1 X104.098 Y108.83 E.94359
G3 X104.451 Y109.027 I-1.488 J3.07 E.01045
G1 X78.486 Y134.991 E.94933
G2 X78.685 Y135.342 I3.048 J-1.499 E.01043
G1 X104.796 Y109.231 E.95469
G1 X105.142 Y109.435 E.01038
G1 X78.898 Y135.679 E.95955
G1 X79.111 Y136.016 E.0103
G1 X105.473 Y109.653 E.9639
G1 X105.802 Y109.874 E.01024
G1 X79.33 Y136.346 E.96789
G1 X79.559 Y136.666 E.01018
G1 X106.13 Y110.095 E.9715
G3 X106.443 Y110.333 I-1.861 J2.776 E.01015
G1 X79.789 Y136.986 E.97453
G2 X80.027 Y137.298 I2.743 J-1.851 E.01014
G1 X106.754 Y110.571 E.97722
G3 X107.065 Y110.81 I-1.863 J2.739 E.01014
G1 X80.274 Y137.601 E.97957
G1 X80.52 Y137.905 E.0101
G1 X107.36 Y111.064 E.98136
G1 X107.655 Y111.319 E.01008
G1 X80.776 Y138.198 E.98278
G1 X81.039 Y138.485 E.01006
G1 X107.948 Y111.576 E.98386
G1 X108.227 Y111.847 E.01005
G1 X81.301 Y138.772 E.98446
G2 X81.576 Y139.047 I2.456 J-2.175 E.01005
G1 X108.505 Y112.117 E.98462
G3 X108.78 Y112.393 I-2.183 J2.452 E.01005
G1 X81.855 Y139.318 E.98446
G1 X82.134 Y139.589 E.01005
G1 X109.042 Y112.68 E.98386
G1 X109.305 Y112.967 E.01006
G1 X82.426 Y139.846 E.98277
G1 X82.721 Y140.1 E.01008
G1 X109.562 Y113.26 E.98135
G1 X109.808 Y113.563 E.0101
G1 X83.016 Y140.355 E.97956
G2 X83.327 Y140.594 I2.162 J-2.485 E.01014
G1 X110.054 Y113.867 E.97721
G3 X110.292 Y114.178 I-2.508 J2.165 E.01014
G1 X83.639 Y140.832 E.97453
G2 X83.951 Y141.069 I2.153 J-2.512 E.01015
G1 X110.522 Y114.498 E.9715
G1 X110.751 Y114.818 E.01018
G1 X84.28 Y141.29 E.96788
G1 X84.608 Y141.511 E.01024
G1 X110.971 Y115.149 E.96389
G1 X111.183 Y115.486 E.0103
M73 P53 R15
G1 X84.94 Y141.729 E.95954
G1 X85.285 Y141.933 E.01038
G1 X111.396 Y115.823 E.95468
G3 X111.595 Y116.173 I-2.861 J1.856 E.01043
G1 X85.631 Y142.137 E.94932
G2 X85.983 Y142.335 I1.837 J-2.868 E.01045
G1 X111.79 Y116.528 E.94358
G1 X111.986 Y116.882 E.01046
G1 X86.346 Y142.521 E.93744
G1 X86.71 Y142.708 E.01056
G1 X112.163 Y117.254 E.93065
G1 X112.341 Y117.626 E.01066
G1 X87.084 Y142.883 E.92344
G1 X87.466 Y143.051 E.01078
G1 X112.513 Y118.003 E.9158
G1 X112.672 Y118.395 E.01091
G1 X87.847 Y143.219 E.90764
G2 X88.246 Y143.369 I1.466 J-3.281 E.01103
G1 X112.83 Y118.786 E.89885
G3 X112.977 Y119.188 I-3.314 J1.44 E.01109
G1 X88.647 Y143.518 E.88958
G2 X89.053 Y143.662 I1.412 J-3.353 E.01114
G1 X113.116 Y119.599 E.8798
G1 X113.255 Y120.01 E.01121
G1 X89.475 Y143.79 E.86948
G1 X89.896 Y143.919 E.01138
G1 X113.374 Y120.441 E.85842
G1 X113.492 Y120.873 E.01157
G1 X90.332 Y144.032 E.84678
G1 X90.775 Y144.139 E.01177
G1 X113.599 Y121.314 E.83453
G1 X113.695 Y121.769 E.012
G1 X91.223 Y144.241 E.82165
G1 X91.688 Y144.325 E.01224
G1 X113.79 Y122.223 E.80809
G1 X113.861 Y122.701 E.0125
G1 X92.154 Y144.408 E.79366
G2 X92.642 Y144.471 I.77 J-4.073 E.01271
G1 X113.933 Y123.18 E.77846
G3 X113.986 Y123.676 I-4.151 J.696 E.01292
G1 X93.133 Y144.529 E.76245
G2 X93.639 Y144.572 I.616 J-4.248 E.01315
G1 X114.031 Y124.181 E.74557
G3 X114.063 Y124.699 I-4.352 J.525 E.01343
G1 X94.158 Y144.603 E.72776
G2 X94.689 Y144.622 I.424 J-4.463 E.01374
G1 X114.078 Y125.233 E.70893
G3 X114.083 Y125.778 I-4.591 J.311 E.0141
G1 X95.239 Y144.622 E.689
G2 X95.8 Y144.61 I.183 J-4.732 E.01452
G1 X114.066 Y126.344 E.66786
G3 X114.036 Y126.924 I-4.9 J.038 E.01501
G1 X96.384 Y144.576 E.64541
G2 X96.985 Y144.525 I-.128 J-5.085 E.01559
G1 X113.982 Y127.527 E.62149
G3 X113.908 Y128.151 I-5.295 J-.317 E.01627
G1 X97.609 Y144.451 E.59594
G2 X98.261 Y144.348 I-.537 J-5.545 E.01707
G1 X113.811 Y128.798 E.56858
G3 X113.677 Y129.482 I-5.832 J-.792 E.01804
G1 X98.931 Y144.228 E.53915
G2 X99.653 Y144.055 I-1.089 J-6.161 E.0192
G1 X113.52 Y130.189 E.50701
G1 X113.313 Y130.945 E.02027
G1 X100.407 Y143.851 E.47189
G2 X101.204 Y143.604 I-1.683 J-6.825 E.0216
G1 X113.052 Y131.756 E.4332
G3 X112.729 Y132.628 I-7.512 J-2.284 E.02407
G1 X102.078 Y143.279 E.38942
G1 X103.046 Y142.861 E.02725
G1 X112.314 Y133.592 E.33889
G3 X111.754 Y134.702 I-9.635 J-4.168 E.03217
G1 X104.147 Y142.309 E.27813
G1 X105.209 Y141.689 E.03179
G1 X105.54 Y141.466 E.01032
G1 X110.936 Y136.07 E.19729
G3 X108.73 Y138.825 I-15.484 J-10.135 E.09138
G1 X106.71 Y140.845 E.07386
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X108.124 Y139.431 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 11/18
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.04 I1.217 J0 P1  F30000
; object ids of layer 11 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer11 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z1.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #12
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.786 Y137.573
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X147.299 Y106.198 I14.658 J-12.685 E1.08031
G1 X148.415 Y105.926 E.03178
G3 X153.825 Y105.558 I4.041 J19.491 E.15039
G1 X154.13 Y105.576 E.00844
G3 X137.825 Y137.618 I-1.686 J19.312 E2.09516
G1 X137.472 Y137.832 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X136.742 Y136.926 E.02987
G3 X147.192 Y105.811 I15.702 J-12.038 E.99297
G1 X148.332 Y105.534 E.0301
G3 X153.848 Y105.158 I4.124 J19.891 E.14228
G1 X154.165 Y105.177 E.00813
M73 P54 R15
G3 X137.515 Y137.872 I-1.72 J19.711 E1.98443
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X136.742 Y136.926 E-.13932
G1 X136.552 Y136.672 E-.03614
G1 X136.282 Y136.298 E-.05254
; WIPE_END
M73 P54 R14
G1 E-.012 F1800
G1 X140.773 Y140.154 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423016
G1 F7200
G1 X138.776 Y138.157 E.073
G3 X136.666 Y135.562 I15.425 J-14.702 E.08657
G1 X136.552 Y135.384 E.00547
G1 X141.942 Y140.774 E.19709
G1 X142.306 Y141.018 E.01133
G1 X143.339 Y141.621 E.03091
G1 X135.731 Y134.013 E.27818
G3 X135.17 Y132.902 I9.073 J-5.28 E.03219
G1 X144.44 Y142.172 E.33894
G1 X145.407 Y142.59 E.02725
G1 X134.756 Y131.938 E.38947
G3 X134.433 Y131.066 I7.184 J-3.151 E.02405
G1 X146.279 Y142.912 E.43313
G2 X147.077 Y143.16 I2.493 J-6.597 E.02163
G1 X134.173 Y130.256 E.47184
G1 X133.964 Y129.497 E.02034
G1 X147.832 Y143.365 E.50708
G1 X148.555 Y143.539 E.01922
G1 X133.808 Y128.792 E.53921
G3 X133.674 Y128.108 I5.693 J-1.468 E.01801
G1 X149.224 Y143.658 E.56855
G2 X149.877 Y143.761 I1.199 J-5.455 E.01711
G1 X133.576 Y127.461 E.59601
G3 X133.503 Y126.838 I5.214 J-.932 E.01624
G1 X150.499 Y143.834 E.62147
G2 X151.101 Y143.886 I.738 J-5.044 E.01562
G1 X133.448 Y126.233 E.64548
G3 X133.419 Y125.654 I4.861 J-.532 E.01498
G1 X151.684 Y143.919 E.66785
G2 X152.246 Y143.932 I.388 J-4.731 E.01455
G1 X133.401 Y125.087 E.68907
G3 X133.407 Y124.543 I4.591 J-.224 E.01407
G1 X152.795 Y143.931 E.70893
G2 X153.327 Y143.913 I.117 J-4.485 E.01377
G1 X133.422 Y124.008 E.72783
G3 X133.454 Y123.491 I4.371 J.017 E.0134
G1 X153.845 Y143.882 E.74558
G2 X154.353 Y143.84 I-.099 J-4.299 E.01318
G1 X133.498 Y122.985 E.76253
G3 X133.553 Y122.49 I4.203 J.21 E.01289
G1 X154.843 Y143.78 E.77847
G2 X155.331 Y143.719 I-.272 J-4.133 E.01273
G1 X133.623 Y122.011 E.79374
G3 X133.695 Y121.533 I28.403 J4.029 E.01249
G1 X155.796 Y143.634 E.80812
G1 X156.262 Y143.55 E.01222
G1 X133.79 Y121.078 E.82167
G1 X133.885 Y120.623 E.01201
G1 X156.711 Y143.449 E.83462
G1 X157.153 Y143.342 E.01176
G1 X133.994 Y120.183 E.8468
G1 X134.111 Y119.75 E.01158
G1 X157.729 Y143.368 E.86358
G1 X154.772 Y132.064 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G1 X153.927 Y132.066 E.02337
G1 X153.925 Y131.248 E.0226
G1 X157.09 Y128.084 E.12373
G1 X157.744 Y128.347 E.0195
G1 X157.748 Y130.195 E.0511
G1 X154.664 Y127.111 E.12058
G1 X153.917 Y126.811 E.02226
G1 X153.918 Y127.669 E.02371
G1 X157.009 Y127.807 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423016
G1 F7200
G1 X150.304 Y121.102 E.24517
G1 X149.913 Y121.26 E.01091
G1 X155.779 Y127.127 E.21449
G1 X154.861 Y126.758 E.02557
G1 X149.388 Y121.286 E.20011
G1 X151.109 Y120.258 F30000
G1 F7200
G1 X153.508 Y122.657 E.08772
G1 X153.507 Y122.107 E.01424
G1 X151.282 Y119.882 E.08136
G1 X151.281 Y119.331 E.01424
G1 X153.506 Y121.556 E.08136
G1 X153.505 Y121.005 E.01424
G1 X151.28 Y118.78 E.08136
G1 X151.279 Y118.229 E.01424
G1 X153.504 Y120.454 E.08135
G1 X153.503 Y119.904 E.01424
G1 X151.278 Y117.679 E.08135
G1 X151.277 Y117.128 E.01424
G1 X153.676 Y119.527 E.08771
G1 X150.876 Y116.956 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G1 X150.879 Y118.619 E.04597
G1 X147.823 Y121.675 E.1195
G1 X147.061 Y121.984 E.02275
G1 X147.056 Y119.503 E.06859
G1 X148.823 Y121.27 E.06907
G1 X150.364 Y120.645 E.04597
G1 X150.891 Y124.78 F30000
G1 F12000
G1 X150.894 Y126.442 E.04597
G1 X147.077 Y130.259 E.14926
G1 X147.071 Y127.356 E.08028
G1 X150.903 Y131.188 E.14983
G1 X150.904 Y132.072 E.02444
G1 X150.126 Y132.073 E.02153
G1 X153.699 Y131.643 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423016
G1 F7200
G1 X151.3 Y129.244 E.08772
G1 X151.299 Y128.693 E.01424
G1 X153.524 Y130.918 E.08136
G1 X153.523 Y130.367 E.01424
G1 X151.298 Y128.142 E.08136
G1 X151.297 Y127.591 E.01424
G1 X153.522 Y129.817 E.08136
G1 X153.521 Y129.266 E.01424
G1 X151.296 Y127.041 E.08136
G1 X151.295 Y126.49 E.01424
G1 X153.52 Y128.715 E.08136
G1 X153.519 Y128.164 E.01424
G1 X151.294 Y125.939 E.08136
G1 X151.293 Y125.389 E.01424
G1 X153.518 Y127.614 E.08135
G1 X153.516 Y127.063 E.01424
G1 X151.292 Y124.838 E.08135
G1 X151.291 Y124.287 E.01424
G1 X153.541 Y126.538 E.0823
G1 X153.828 Y126.344 E.00895
G1 X153.943 Y126.39 E.00322
G1 X149.131 Y121.577 E.17597
G1 X148.739 Y121.736 E.01091
G1 X150.477 Y123.473 E.06353
G1 X150.086 Y123.632 E.01091
G1 X148.348 Y121.895 E.06353
G1 X147.957 Y122.053 E.01091
G1 X149.695 Y123.791 E.06353
G1 X149.304 Y123.949 E.01091
G1 X147.566 Y122.212 E.06353
G1 X147.175 Y122.37 E.01091
G1 X148.912 Y124.108 E.06353
G1 X148.521 Y124.266 E.01091
G1 X137.432 Y113.177 E.4055
G2 X137.192 Y113.487 I2.495 J2.169 E.01014
G1 X148.13 Y124.425 E.39994
G1 X147.739 Y124.584 E.01091
G1 X136.963 Y113.808 E.39402
G1 X136.734 Y114.128 E.01019
G1 X147.348 Y124.742 E.3881
G1 X146.957 Y124.901 E.01091
G1 X136.514 Y114.458 E.38185
G1 X136.302 Y114.795 E.01031
G1 X146.666 Y125.159 E.37896
G1 X146.667 Y125.71 E.01424
G1 X136.09 Y115.133 E.38676
G2 X135.889 Y115.482 I2.848 J1.862 E.01042
G1 X146.668 Y126.261 E.39412
G1 X146.669 Y126.812 E.01424
G1 X135.695 Y115.837 E.40128
G1 X135.5 Y116.192 E.01047
G1 X146.67 Y127.362 E.40844
G1 X146.671 Y127.913 E.01424
G1 X135.321 Y116.563 E.415
G1 X135.145 Y116.936 E.01067
G1 X146.672 Y128.464 E.42151
G1 X146.673 Y129.015 E.01424
G1 X134.971 Y117.312 E.42789
G1 X134.813 Y117.704 E.01092
G1 X146.675 Y129.565 E.43371
G1 X146.676 Y130.116 E.01424
G1 X134.655 Y118.096 E.43953
G2 X134.507 Y118.497 I3.309 J1.449 E.01107
G1 X146.677 Y130.667 E.44498
G1 X146.678 Y131.218 E.01424
G1 X134.369 Y118.909 E.45008
G1 X134.23 Y119.32 E.01122
G1 X146.679 Y131.768 E.45517
G1 X146.68 Y132.272 E.01303
G1 X146.888 Y132.48 E.0076
G1 X147.389 Y132.479 E.01296
G1 X158.01 Y143.1 E.38836
G1 X158.431 Y142.971 E.01137
G1 X147.938 Y132.478 E.38367
G1 X148.487 Y132.477 E.01419
G1 X158.838 Y142.828 E.3785
G1 X159.238 Y142.679 E.01105
G1 X149.035 Y132.476 E.37307
G1 X149.584 Y132.475 E.01419
G1 X159.638 Y142.529 E.36764
G1 X160.019 Y142.361 E.01077
G1 X150.133 Y132.474 E.36151
G1 X150.681 Y132.473 E.01419
G1 X160.4 Y142.192 E.35538
G2 X160.776 Y142.018 I-1.276 J-3.246 E.01071
G1 X151.164 Y132.406 E.35146
G1 X151.306 Y132.264 E.00518
G1 X151.305 Y131.997 E.00689
G1 X161.139 Y141.831 E.35956
G1 X161.501 Y141.644 E.01055
G1 X151.304 Y131.446 E.37286
G1 X151.303 Y130.896 E.01424
G1 X161.855 Y141.447 E.38582
G1 X162.2 Y141.243 E.01037
G1 X151.302 Y130.345 E.39847
G1 X151.301 Y129.794 E.01424
G1 X162.545 Y141.038 E.41113
G2 X162.878 Y140.821 I-1.662 J-2.914 E.01028
G1 X154.522 Y132.466 E.30552
G1 X155.07 Y132.464 E.01419
G1 X163.205 Y140.6 E.29745
G1 X163.533 Y140.378 E.01024
G1 X155.619 Y132.463 E.28938
G1 X156.168 Y132.462 E.01419
G1 X163.847 Y140.142 E.28078
G1 X164.158 Y139.903 E.01014
G1 X156.716 Y132.461 E.2721
G1 X157.265 Y132.46 E.01419
G1 X164.469 Y139.665 E.26342
G2 X164.764 Y139.41 I-1.98 J-2.592 E.01008
G1 X157.814 Y132.459 E.25414
G1 X157.945 Y132.459 E.0034
G1 X158.152 Y132.248 E.00764
G1 X165.059 Y139.155 E.25254
G2 X165.352 Y138.899 I-2.011 J-2.597 E.01008
G1 X158.151 Y131.698 E.2633
G1 X158.15 Y131.147 E.01424
G1 X165.631 Y138.627 E.27351
G1 X165.909 Y138.356 E.01005
G1 X158.149 Y130.596 E.28373
G1 X158.148 Y130.046 E.01424
G1 X166.185 Y138.082 E.29384
G1 X166.447 Y137.794 E.01006
G1 X158.147 Y129.495 E.30346
G1 X158.146 Y128.944 E.01424
G1 X166.709 Y137.507 E.31308
G2 X166.966 Y137.214 I-2.336 J-2.318 E.01008
G1 X150.695 Y120.943 E.59495
G1 X151.086 Y120.785 E.01091
G1 X153.509 Y123.208 E.08861
G1 X153.51 Y123.649 E.01139
G1 X153.632 Y123.828 E.00561
G1 X154.463 Y124.162 E.02316
G1 X167.212 Y136.91 E.46615
G1 X167.458 Y136.606 E.01011
G1 X155.381 Y124.53 E.44157
G1 X156.299 Y124.898 E.02557
G1 X167.697 Y136.296 E.41675
G1 X167.926 Y135.975 E.01019
G1 X157.217 Y125.266 E.39157
G1 X157.827 Y125.511 E.017
M73 P55 R14
G1 X157.937 Y125.437 E.00343
G1 X168.155 Y135.655 E.37362
G2 X168.375 Y135.325 I-2.669 J-2.022 E.01025
G1 X158.139 Y125.089 E.37428
G1 X158.138 Y124.538 E.01424
G1 X168.587 Y134.988 E.38208
G1 X168.8 Y134.65 E.01031
G1 X158.137 Y123.988 E.38988
G1 X158.136 Y123.437 E.01424
G1 X169 Y134.301 E.39723
G1 X169.194 Y133.946 E.01047
G1 X158.135 Y122.886 E.40439
G1 X158.134 Y122.336 E.01424
G1 X169.389 Y133.591 E.41155
G2 X169.568 Y133.22 I-3.035 J-1.688 E.01066
G1 X158.133 Y121.785 E.41811
G1 X158.132 Y121.234 E.01424
G1 X169.744 Y132.847 E.42462
G2 X169.918 Y132.471 I-3.07 J-1.645 E.01072
G1 X158.131 Y120.683 E.431
G1 X158.13 Y120.133 E.01424
G1 X170.076 Y132.079 E.43681
G1 X170.234 Y131.687 E.01092
G1 X158.129 Y119.582 E.44263
G1 X158.128 Y119.031 E.01424
G1 X170.382 Y131.286 E.44808
G1 X170.52 Y130.874 E.01122
G1 X158.127 Y118.481 E.45318
G1 X158.125 Y117.93 E.01424
G1 X170.659 Y130.463 E.45827
G2 X170.778 Y130.033 I-3.565 J-1.222 E.01155
G1 X158.124 Y117.379 E.46268
G1 X158.123 Y116.828 E.01424
G1 X170.895 Y129.6 E.467
G2 X171.004 Y129.16 I-3.657 J-1.137 E.01175
G1 X148.179 Y106.334 E.83461
G3 X148.628 Y106.233 I1.073 J3.737 E.0119
G1 X171.099 Y128.705 E.82166
G1 X171.194 Y128.25 E.01201
G1 X149.093 Y106.149 E.80812
G1 X149.558 Y106.064 E.01222
G1 X171.266 Y127.772 E.79374
G1 X171.336 Y127.293 E.01252
G1 X150.046 Y106.003 E.77847
G1 X150.536 Y105.943 E.01277
G1 X171.391 Y126.798 E.76253
G1 X171.435 Y126.292 E.01312
G1 X151.044 Y105.902 E.74557
G1 X151.562 Y105.87 E.01342
G1 X171.467 Y125.775 E.72783
G1 X171.482 Y125.24 E.01383
G1 X152.094 Y105.852 E.70892
G1 X152.643 Y105.851 E.01419
G1 X171.488 Y124.696 E.68907
G1 X171.47 Y124.129 E.01468
G1 X153.205 Y105.864 E.66785
G1 X153.788 Y105.897 E.0151
G1 X171.441 Y123.55 E.64547
G1 X171.386 Y122.945 E.0157
G1 X154.39 Y105.949 E.62146
G1 X155.013 Y106.022 E.01621
G1 X171.313 Y122.322 E.596
G1 X171.215 Y121.675 E.01693
G1 X155.666 Y106.126 E.56854
G1 X156.334 Y106.245 E.01756
G1 X171.081 Y120.991 E.5392
G2 X170.925 Y120.285 I-6.028 J.963 E.0187
G1 X157.057 Y106.418 E.50707
G3 X157.812 Y106.623 I-1.352 J6.464 E.02024
G1 X170.716 Y119.527 E.47183
G2 X170.456 Y118.717 I-6.96 J1.791 E.02202
G1 X158.61 Y106.872 E.43311
G1 X159.482 Y107.194 E.02402
G1 X170.133 Y117.845 E.38946
G2 X169.719 Y116.881 I-8.333 J3.01 E.02714
G1 X160.45 Y107.612 E.33893
G1 X161.551 Y108.163 E.03183
G1 X169.158 Y115.77 E.27816
G2 X168.337 Y114.399 I-11.955 J6.23 E.04134
G1 X162.947 Y109.01 E.19706
G3 X165.275 Y110.813 I-11.313 J17.012 E.0762
G3 X167.741 Y113.253 I-71.821 J75.01 E.0897
G1 X157.778 Y116.483 F30000
G1 F7200
G1 X147.737 Y106.442 E.36716
G2 X147.299 Y106.554 I.727 J3.738 E.01168
G1 X157.056 Y116.311 E.35676
G1 X156.507 Y116.312 E.01419
G1 X146.879 Y106.683 E.35207
G1 X146.458 Y106.812 E.01137
G1 X155.959 Y116.313 E.34738
G1 X155.41 Y116.314 E.01419
G1 X146.051 Y106.955 E.34221
G1 X145.651 Y107.104 E.01104
G1 X154.861 Y116.315 E.33679
G1 X154.313 Y116.316 E.01419
G1 X145.251 Y107.254 E.33135
G1 X144.87 Y107.422 E.01077
G1 X153.764 Y116.317 E.32522
G1 X153.704 Y116.317 E.00156
G1 X153.497 Y116.525 E.0076
G1 X153.497 Y116.599 E.00191
G1 X144.489 Y107.591 E.32938
G2 X144.113 Y107.765 I1.28 J3.255 E.01071
G1 X153.498 Y117.15 E.34315
G1 X153.499 Y117.701 E.01424
G1 X143.75 Y107.952 E.35645
G1 X143.388 Y108.139 E.01055
G1 X153.5 Y118.251 E.36975
G1 X153.501 Y118.802 E.01424
G1 X143.034 Y108.336 E.38271
G1 X142.689 Y108.54 E.01037
G1 X150.472 Y116.323 E.28458
G1 X149.924 Y116.324 E.01419
G1 X142.344 Y108.745 E.27713
G2 X142.012 Y108.962 I1.66 J2.911 E.01028
G1 X149.375 Y116.325 E.26924
G1 X148.826 Y116.326 E.01419
G1 X141.684 Y109.184 E.26117
G1 X141.356 Y109.405 E.01024
G1 X148.278 Y116.327 E.2531
G1 X147.729 Y116.328 E.01419
G1 X141.042 Y109.641 E.2445
G1 X140.731 Y109.88 E.01014
G1 X147.18 Y116.329 E.23582
G1 X146.858 Y116.33 E.00835
G1 X146.745 Y116.443 E.00414
G1 X140.42 Y110.118 E.23127
G2 X140.125 Y110.373 I1.976 J2.586 E.01008
G1 X146.651 Y116.899 E.23862
G1 X146.652 Y117.45 E.01424
G1 X139.83 Y110.628 E.24943
G2 X139.537 Y110.884 I2.02 J2.607 E.01008
G1 X146.653 Y118 E.2602
G1 X146.654 Y118.551 E.01424
G1 X139.258 Y111.156 E.27041
G1 X138.98 Y111.427 E.01005
G1 X146.655 Y119.102 E.28063
G1 X146.656 Y119.652 E.01424
G1 X138.705 Y111.701 E.29073
G1 X138.443 Y111.989 E.01006
G1 X146.657 Y120.203 E.30035
G1 X146.658 Y120.754 E.01424
G1 X138.18 Y112.276 E.30997
G2 X137.923 Y112.569 I2.335 J2.318 E.01008
G1 X146.659 Y121.305 E.31943
G1 X146.66 Y121.855 E.01424
G1 X137.554 Y112.749 E.33296
G1 X155.377 Y124.097 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
G1 X153.911 Y123.508 E.04368
G1 X153.911 Y123.425 E.00229
G1 X157.728 Y119.608 E.14927
G1 X157.733 Y122.342 E.0756
G1 X153.901 Y118.51 E.14984
G1 X153.898 Y116.848 E.04597
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X153.901 Y118.51 E-.18954
G1 X154.14 Y118.749 E-.03846
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X146.564 Y117.824 Z2.2 F30000
G1 X110.09 Y113.371 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12000
G1 X110.451 Y113.818 E.01589
G3 X95.615 Y106.201 I-15.41 J11.76 E2.89108
G1 X96.457 Y106.251 E.02334
G1 X96.762 Y106.269 E.00844
G3 X109.727 Y112.925 I-1.722 J19.308 E.41311
G1 X110.052 Y113.324 E.01423
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.769 Y113.574 E.01504
G3 X95.627 Y105.801 I-15.729 J12.003 E2.73787
G1 X96.481 Y105.851 E.02195
G1 X96.798 Y105.87 E.00813
G3 X110.03 Y112.663 I-1.757 J19.707 E.39121
G1 X110.363 Y113.072 E.01351
M204 S10000
G1 X110.342 Y113.951 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G2 X107.898 Y111.527 I-83.096 J81.39 E.089
G2 X105.54 Y109.698 I-13.699 J15.219 E.07723
G1 X110.936 Y115.094 E.19729
G3 X111.754 Y116.461 I-11.113 J7.576 E.04123
G1 X104.147 Y108.855 E.27813
G1 X103.046 Y108.303 E.03185
G1 X112.314 Y117.572 E.33889
G3 X112.729 Y118.536 I-7.914 J3.973 E.02715
G1 X102.078 Y107.885 E.38942
G1 X101.204 Y107.56 E.02412
G1 X113.052 Y119.408 E.43319
G3 X113.313 Y120.219 I-6.695 J2.604 E.02203
G1 X100.407 Y107.313 E.47189
G2 X99.653 Y107.109 I-2.096 J6.244 E.0202
G1 X113.52 Y120.975 E.50701
G3 X113.677 Y121.682 I-5.877 J1.677 E.01873
G1 X98.931 Y106.936 E.53915
G1 X98.261 Y106.816 E.0176
G1 X113.811 Y122.366 E.56857
G1 X113.908 Y123.012 E.01689
G1 X97.609 Y106.713 E.59594
G1 X96.985 Y106.639 E.01625
G1 X113.982 Y123.637 E.62149
G1 X114.036 Y124.24 E.01566
G1 X96.384 Y106.588 E.64541
G1 X95.8 Y106.554 E.01513
G1 X114.066 Y124.82 E.66786
G1 X114.083 Y125.386 E.01465
G1 X95.239 Y106.542 E.689
G1 X94.689 Y106.542 E.01421
G1 X114.078 Y125.931 E.70893
G1 X114.063 Y126.465 E.01381
G1 X94.158 Y106.561 E.72776
G1 X93.639 Y106.592 E.01344
G1 X114.031 Y126.983 E.74557
G1 X113.986 Y127.488 E.0131
G1 X93.133 Y106.635 E.76245
G1 X92.642 Y106.693 E.01279
G1 X113.933 Y127.984 E.77846
G1 X113.861 Y128.462 E.0125
G1 X92.154 Y106.756 E.79366
G1 X91.689 Y106.839 E.01224
G1 X113.79 Y128.941 E.80809
G3 X113.695 Y129.395 I-3.885 J-.575 E.01201
G1 X91.223 Y106.923 E.82165
G2 X90.775 Y107.025 I.633 J3.825 E.01188
G1 X113.599 Y129.849 E.83453
G3 X113.492 Y130.291 I-3.779 J-.688 E.01177
G1 X90.332 Y107.132 E.84678
G2 X89.896 Y107.245 I.737 J3.733 E.01166
G1 X113.374 Y130.723 E.85842
G1 X113.336 Y130.86 E.00368
G3 X113.255 Y131.154 I-2.541 J-.541 E.00788
G1 X89.475 Y107.374 E.86948
G1 X89.054 Y107.502 E.01138
G1 X113.116 Y131.565 E.8798
G1 X112.977 Y131.976 E.01121
G1 X88.647 Y107.646 E.88958
G1 X88.246 Y107.794 E.01105
G1 X112.83 Y132.378 E.89885
G1 X112.672 Y132.769 E.01091
G1 X87.847 Y107.945 E.90764
G1 X87.466 Y108.113 E.01078
G1 X112.513 Y133.16 E.9158
G3 X112.341 Y133.537 I-3.267 J-1.267 E.01073
G1 X87.084 Y108.281 E.92344
G2 X86.71 Y108.456 I1.288 J3.243 E.0107
G1 X112.163 Y133.91 E.93065
G1 X111.986 Y134.282 E.01066
G1 X86.346 Y108.643 E.93744
G1 X85.983 Y108.829 E.01056
G1 X111.79 Y134.636 E.94358
G1 X111.595 Y134.991 E.01046
G1 X85.631 Y109.026 E.94932
G1 X85.285 Y109.231 E.01038
G1 X111.396 Y135.341 E.95468
G1 X111.183 Y135.678 E.0103
G1 X84.94 Y109.435 E.95954
G2 X84.608 Y109.652 I1.672 J2.908 E.01027
G1 X110.971 Y136.015 E.96389
G3 X110.751 Y136.346 I-2.894 J-1.682 E.01026
G1 X84.28 Y109.874 E.96788
G1 X83.951 Y110.095 E.01024
G1 X110.522 Y136.666 E.9715
G1 X110.292 Y136.986 E.01018
G1 X83.639 Y110.332 E.97453
G1 X83.327 Y110.57 E.01014
G1 X110.054 Y137.297 E.97721
G1 X109.808 Y137.6 E.0101
G1 X83.016 Y110.809 E.97956
G1 X82.721 Y111.064 E.01008
M73 P56 R14
G1 X109.562 Y137.904 E.98136
G3 X109.305 Y138.197 I-2.599 J-2.015 E.01008
G1 X82.426 Y111.318 E.98277
G2 X82.134 Y111.575 I2.021 J2.591 E.01007
G1 X109.042 Y138.484 E.98386
G1 X108.78 Y138.771 E.01006
G1 X81.855 Y111.846 E.98446
G1 X81.576 Y112.117 E.01005
G1 X108.505 Y139.046 E.98462
G1 X108.227 Y139.317 E.01005
G1 X81.301 Y112.392 E.98446
G1 X81.039 Y112.679 E.01006
G1 X107.948 Y139.588 E.98386
G3 X107.655 Y139.845 I-2.314 J-2.334 E.01007
G1 X80.776 Y112.966 E.98278
G2 X80.52 Y113.259 I2.346 J2.312 E.01008
G1 X107.36 Y140.1 E.98136
G1 X107.065 Y140.354 E.01008
G1 X80.274 Y113.563 E.97957
G1 X80.027 Y113.866 E.0101
G1 X106.754 Y140.593 E.97722
G1 X106.443 Y140.831 E.01014
G1 X79.789 Y114.178 E.97453
G1 X79.559 Y114.498 E.01018
G1 X106.13 Y141.068 E.97151
G1 X105.802 Y141.29 E.01024
G1 X79.33 Y114.818 E.96789
G2 X79.111 Y115.148 I2.672 J2.011 E.01026
G1 X105.473 Y141.511 E.9639
G3 X105.142 Y141.729 I-2 J-2.683 E.01027
G1 X78.898 Y115.485 E.95955
G1 X78.685 Y115.822 E.0103
G1 X104.796 Y141.933 E.95469
G1 X104.451 Y142.137 E.01038
G1 X78.486 Y116.172 E.94933
G1 X78.291 Y116.527 E.01046
G1 X104.098 Y142.334 E.94359
G1 X103.735 Y142.521 E.01056
G1 X78.095 Y116.881 E.93746
G1 X77.918 Y117.253 E.01066
G1 X103.372 Y142.707 E.93067
G3 X102.997 Y142.882 I-1.662 J-3.067 E.0107
G1 X77.741 Y117.626 E.92346
G2 X77.568 Y118.003 I3.092 J1.643 E.01073
G1 X102.616 Y143.05 E.91582
G1 X102.234 Y143.218 E.01078
G1 X77.409 Y118.394 E.90766
G1 X77.251 Y118.785 E.01091
G1 X101.835 Y143.369 E.89887
G1 X101.434 Y143.518 E.01105
G1 X77.104 Y119.187 E.8896
G1 X76.965 Y119.598 E.01121
G1 X101.028 Y143.661 E.87983
G1 X100.607 Y143.79 E.01138
G1 X76.826 Y120.009 E.86951
G2 X76.707 Y120.44 I3.592 J1.219 E.01157
G1 X100.186 Y143.919 E.85844
G3 X99.75 Y144.032 I-1.173 J-3.618 E.01166
G1 X76.589 Y120.872 E.8468
G2 X76.482 Y121.313 I3.667 J1.129 E.01176
G1 X99.307 Y144.139 E.83456
G3 X98.859 Y144.241 I-1.081 J-3.722 E.01188
G1 X76.386 Y121.768 E.82168
G2 X76.291 Y122.222 I3.752 J1.022 E.01201
G1 X98.393 Y144.324 E.80812
G1 X97.927 Y144.408 E.01224
G1 X76.22 Y122.7 E.7937
G1 X76.148 Y123.179 E.0125
G1 X97.44 Y144.471 E.7785
G1 X96.949 Y144.529 E.01279
G1 X76.095 Y123.675 E.76249
G1 X76.05 Y124.18 E.0131
G1 X96.443 Y144.572 E.74561
G1 X95.924 Y144.603 E.01344
G1 X76.018 Y124.698 E.7278
G1 X76.002 Y125.231 E.01381
G1 X95.393 Y144.622 E.70897
G1 X94.843 Y144.622 E.01421
G1 X75.998 Y125.776 E.68905
G1 X76.015 Y126.343 E.01465
G1 X94.282 Y144.61 E.66791
G1 X93.698 Y144.576 E.01513
G1 X76.044 Y126.922 E.64546
G1 X76.098 Y127.526 E.01566
G1 X93.098 Y144.525 E.62154
G1 X92.474 Y144.451 E.01625
G1 X76.173 Y128.15 E.596
G1 X76.269 Y128.796 E.01689
G1 X91.822 Y144.348 E.56864
G1 X91.152 Y144.228 E.0176
G1 X76.404 Y129.48 E.53922
G2 X76.561 Y130.187 I6.034 J-.969 E.01872
G1 X90.43 Y144.056 E.50709
G3 X89.676 Y143.852 I1.341 J-6.448 E.0202
G1 X76.767 Y130.943 E.47197
G2 X77.028 Y131.754 I6.964 J-1.794 E.02203
G1 X88.879 Y143.604 E.43329
G1 X88.004 Y143.28 E.02412
G1 X77.351 Y132.626 E.38952
G2 X77.765 Y133.59 I8.327 J-3.007 E.02714
G1 X87.037 Y142.862 E.33901
G1 X85.936 Y142.311 E.03184
G1 X78.325 Y134.7 E.27828
G2 X79.143 Y136.067 I11.928 J-6.205 E.04121
G1 X84.545 Y141.469 E.19751
G3 X81.487 Y138.961 I9.749 J-15.003 E.10246
G1 X79.735 Y137.209 E.06404
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X81.149 Y138.623 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 12/18
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S209.1
G17
G3 Z2.2 I1.217 J0 P1  F30000
; object ids of layer 12 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer12 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z1.96
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #13
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.36 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.786 Y137.573
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
M73 P57 R14
G1 F12000
G3 X147.299 Y106.198 I14.658 J-12.685 E1.0803
G1 X148.415 Y105.926 E.03178
G3 X153.905 Y105.563 I4.049 J19.549 E.15261
G1 X154.13 Y105.576 E.00622
G3 X137.825 Y137.618 I-1.686 J19.312 E2.09514
G1 X137.469 Y137.829 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X136.599 Y136.737 E.03582
G3 X147.192 Y105.811 I15.845 J-11.85 E.98689
G1 X148.332 Y105.534 E.0301
G3 X153.928 Y105.163 I4.132 J19.948 E.14434
G1 X154.165 Y105.177 E.00608
G3 X137.512 Y137.869 I-1.72 J19.711 E1.98452
M73 P57 R13
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X136.599 Y136.737 E-.16582
G1 X136.28 Y136.295 E-.06218
; WIPE_END
G1 E-.012 F1800
G1 X142.217 Y141.091 Z2.36 F30000
G1 X142.562 Y141.37 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G1 X150.799 Y133.133 E.30115
G1 X150.248 Y133.134 E.01424
G1 X142.349 Y141.033 E.28879
G1 X142.018 Y140.815 E.01026
G1 X149.697 Y133.135 E.28079
G1 X149.146 Y133.136 E.01424
G1 X141.686 Y140.597 E.27278
G3 X141.355 Y140.378 I1.43 J-2.524 E.01026
G1 X148.596 Y133.137 E.26475
G1 X148.045 Y133.139 E.01424
G1 X141.043 Y140.141 E.25603
G1 X140.73 Y139.904 E.01014
G1 X147.494 Y133.14 E.24731
G1 X146.944 Y133.141 E.01424
G1 X140.421 Y139.663 E.23849
G1 X140.125 Y139.409 E.01008
G1 X146.494 Y133.041 E.23287
G1 X146.219 Y132.766 E.01005
G1 X139.829 Y139.156 E.23361
G3 X139.538 Y138.897 I2.033 J-2.586 E.01007
G1 X146.005 Y132.43 E.23645
G1 X146.004 Y131.882 E.01418
G1 X139.259 Y138.627 E.24662
G1 X138.979 Y138.357 E.01005
G1 X146.003 Y131.333 E.2568
G1 X146.002 Y130.785 E.01418
G1 X138.706 Y138.081 E.26676
G1 X138.443 Y137.794 E.01006
G1 X146.001 Y130.236 E.27634
G1 X146 Y129.687 E.01418
G1 X138.18 Y137.508 E.28592
G3 X137.925 Y137.212 I2.014 J-1.99 E.01008
G1 X145.999 Y129.139 E.29518
G1 X145.997 Y128.59 E.01418
G1 X137.681 Y136.906 E.30406
G1 X137.437 Y136.601 E.01011
G1 X145.996 Y128.042 E.31294
G1 X145.995 Y127.493 E.01418
G1 X137.193 Y136.295 E.32182
G1 X136.963 Y135.976 E.01018
G1 X145.994 Y126.945 E.3302
G1 X145.993 Y126.396 E.01418
G1 X136.733 Y135.656 E.33858
G3 X136.515 Y135.325 I2.688 J-2.007 E.01027
G1 X145.992 Y125.847 E.34652
G1 X145.991 Y125.299 E.01418
G1 X136.302 Y134.988 E.35427
G1 X136.088 Y134.652 E.0103
G1 X147.959 Y122.781 E.43404
G1 X148.884 Y122.406 E.02579
G1 X147.227 Y124.063 E.06057
G1 X148.152 Y123.688 E.0258
G1 X149.808 Y122.031 E.06056
G1 X150.733 Y121.656 E.02579
G1 X149.076 Y123.313 E.06056
G1 X150.001 Y122.938 E.0258
G1 X152.828 Y120.111 E.10337
G1 X152.829 Y120.659 E.01418
G1 X150.926 Y122.563 E.0696
G1 X151.055 Y122.51 E.00361
G1 X151.338 Y122.7 E.00881
G1 X152.83 Y121.208 E.05458
G1 X152.831 Y121.756 E.01418
G1 X151.666 Y122.921 E.0426
G1 X151.964 Y123.121 E.00926
G1 X151.964 Y123.174 E.00136
G1 X152.833 Y122.305 E.03177
G1 X152.834 Y122.854 E.01418
G1 X151.965 Y123.722 E.03177
G1 X151.966 Y124.271 E.01418
G1 X152.835 Y123.402 E.03177
G1 X152.835 Y123.856 E.01175
G1 X152.874 Y123.913 E.00176
G1 X151.967 Y124.82 E.03316
G1 X151.968 Y125.368 E.01418
G1 X153.096 Y124.24 E.04124
G1 X153.189 Y124.378 E.0043
G1 X153.416 Y124.469 E.00634
G1 X151.969 Y125.917 E.05293
G1 X151.97 Y126.465 E.01418
G1 X153.942 Y124.493 E.07211
G1 X153.056 Y126.515 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42561
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X154.938 Y126.512 E.11134
G1 X156.118 Y126.985 E.0752
G1 X153.259 Y126.991 E.1691
G1 X153.26 Y127.466 E.02813
G1 X157.298 Y127.459 E.23885
G1 X158.192 Y127.817 E.05698
G1 X158.27 Y127.932 E.00823
G1 X153.261 Y127.942 E.29629
G1 X153.262 Y128.417 E.02813
G1 X158.403 Y128.408 E.30407
G1 X158.403 Y128.883 E.02813
G1 X153.263 Y128.893 E.30407
G1 X153.264 Y129.369 E.02813
G1 X158.404 Y129.359 E.30407
G1 X158.405 Y129.835 E.02813
G1 X153.265 Y129.844 E.30407
G1 X153.266 Y130.32 E.02813
G1 X158.406 Y130.31 E.30406
G1 X158.407 Y130.786 E.02813
G1 X153.266 Y130.796 E.30406
G1 X153.267 Y131.271 E.02813
G1 X158.408 Y131.261 E.30406
G1 X158.409 Y131.737 E.02813
G1 X153.268 Y131.747 E.30406
G1 X153.269 Y132.222 E.02813
G1 X158.41 Y132.213 E.30406
G1 X158.41 Y132.357 E.00854
G1 X158.079 Y132.689 E.0277
G1 X153.315 Y132.698 E.28181
M106 S209.1
G1 X158.654 Y132.423 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
; LAYER_HEIGHT: 0.16
G1 F7200
G1 X170.896 Y120.181 E.44759
G1 X170.778 Y119.75 E.01156
G1 X158.827 Y131.701 E.43696
G1 X158.826 Y131.152 E.01418
G1 X170.659 Y119.319 E.43266
G2 X170.521 Y118.908 I-3.53 J.958 E.01123
G1 X158.825 Y130.604 E.42764
G1 X158.824 Y130.055 E.01418
G1 X170.381 Y118.498 E.42258
G2 X170.235 Y118.094 I-3.47 J1.028 E.0111
G1 X158.822 Y129.507 E.41727
G1 X158.821 Y128.958 E.01418
G1 X170.076 Y117.704 E.41149
G1 X169.917 Y117.313 E.0109
G1 X158.82 Y128.409 E.4057
G1 X158.82 Y127.999 E.01061
G1 X158.764 Y127.916 E.00258
G1 X169.745 Y116.935 E.4015
G1 X169.567 Y116.563 E.01065
G1 X158.542 Y127.589 E.40311
G1 X158.466 Y127.477 E.00349
G1 X158.208 Y127.373 E.00721
G1 X169.389 Y116.192 E.40883
G2 X169.195 Y115.836 I-3.089 J1.46 E.01048
G1 X157.682 Y127.349 E.42094
G1 X156.254 Y125.375 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40467
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X158.397 Y125.371 E.11461
G1 X158.396 Y124.917 E.02431
G1 X155.667 Y124.922 E.14593
G1 X154.539 Y124.469 E.06499
G1 X158.395 Y124.462 E.20621
G1 X158.394 Y124.007 E.02431
G1 X153.449 Y124.017 E.26444
G1 X153.253 Y123.728 E.01866
G1 X153.253 Y123.562 E.00885
G1 X158.393 Y123.553 E.27488
G1 X158.393 Y123.098 E.02431
G1 X153.252 Y123.108 E.27488
G1 X153.251 Y122.653 E.02431
G1 X158.392 Y122.643 E.27488
G1 X158.391 Y122.189 E.02431
G1 X153.25 Y122.198 E.27489
G1 X153.249 Y121.744 E.02431
G1 X158.39 Y121.734 E.27489
G1 X158.389 Y121.279 E.02431
G1 X153.248 Y121.289 E.27489
G1 X153.248 Y120.834 E.02431
G1 X158.388 Y120.825 E.27489
G1 X158.387 Y120.37 E.02431
G1 X153.247 Y120.38 E.27489
G1 X153.246 Y119.925 E.02431
G1 X158.387 Y119.915 E.27489
G1 X158.386 Y119.461 E.02431
G1 X153.245 Y119.47 E.27489
G1 X153.244 Y119.016 E.02431
G1 X158.385 Y119.006 E.27489
G1 X158.384 Y118.551 E.02431
G1 X153.243 Y118.561 E.27489
G1 X153.242 Y118.106 E.02431
G1 X158.383 Y118.097 E.27489
G1 X158.382 Y117.642 E.02431
G1 X153.241 Y117.652 E.2749
G1 X153.241 Y117.197 E.02431
G1 X158.381 Y117.187 E.2749
G1 X158.381 Y116.733 E.02431
G1 X153.24 Y116.742 E.2749
G1 X153.239 Y116.419 E.01728
G1 X153.37 Y116.288 E.00993
G1 X158.534 Y116.278 E.27615
M106 S209.1
G1 X153.6 Y116.04 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
; LAYER_HEIGHT: 0.16
G1 F7200
G1 X161.503 Y108.138 E.28893
G3 X161.854 Y108.337 I-1.496 J3.059 E.01044
G1 X154.325 Y115.866 E.27528
G1 X154.876 Y115.864 E.01424
G1 X162.2 Y108.54 E.2678
G1 X162.546 Y108.744 E.01038
G1 X155.426 Y115.863 E.26032
G1 X155.977 Y115.862 E.01424
G1 X162.877 Y108.963 E.25228
G1 X163.206 Y109.183 E.01024
G1 X156.528 Y115.861 E.24417
G1 X157.079 Y115.86 E.01424
G1 X163.534 Y109.405 E.23604
G1 X163.846 Y109.642 E.01014
G1 X157.629 Y115.859 E.22732
G1 X158.18 Y115.858 E.01424
G1 X164.159 Y109.88 E.2186
G3 X164.468 Y110.12 I-1.874 J2.734 E.01013
G1 X158.574 Y116.013 E.21549
G1 X158.798 Y116.236 E.00815
G1 X158.798 Y116.34 E.00267
G1 X164.764 Y110.374 E.21814
G1 X165.06 Y110.627 E.01008
G1 X158.799 Y116.888 E.22891
G1 X158.8 Y117.437 E.01418
G1 X165.351 Y110.886 E.23953
G1 X165.63 Y111.156 E.01005
G1 X158.801 Y117.986 E.24971
G1 X158.802 Y118.534 E.01418
G1 X165.91 Y111.426 E.25989
G3 X166.183 Y111.702 I-2.188 J2.44 E.01005
G1 X158.803 Y119.083 E.26985
G1 X158.804 Y119.631 E.01418
G1 X166.446 Y111.989 E.27943
G1 X166.709 Y112.276 E.01006
G1 X158.805 Y120.18 E.28901
G1 X158.806 Y120.729 E.01418
G1 X166.964 Y112.571 E.29827
G1 X167.208 Y112.877 E.01011
G1 X158.807 Y121.277 E.30715
G1 X158.808 Y121.826 E.01418
G1 X167.452 Y113.182 E.31604
G1 X167.696 Y113.488 E.01011
G1 X158.809 Y122.375 E.32492
G1 X158.81 Y122.923 E.01418
M73 P58 R13
G1 X167.926 Y113.807 E.3333
G1 X168.156 Y114.127 E.01018
G1 X158.811 Y123.472 E.34167
G1 X158.812 Y124.02 E.01418
G1 X168.374 Y114.458 E.34961
G1 X168.587 Y114.795 E.0103
G1 X158.813 Y124.569 E.35737
G1 X158.814 Y125.118 E.01418
G1 X168.801 Y115.131 E.36513
G3 X168.999 Y115.483 I-2.863 J1.845 E.01044
G1 X157.423 Y127.059 E.42324
G1 X157.031 Y126.901 E.01093
G1 X157.731 Y126.2 E.02562
G1 X157.339 Y126.043 E.01093
G1 X156.638 Y126.744 E.02562
G1 X156.246 Y126.586 E.01093
G1 X156.947 Y125.886 E.02562
G1 X156.555 Y125.728 E.01093
G1 X155.854 Y126.429 E.02562
G1 X155.462 Y126.272 E.01093
G1 X156.162 Y125.571 E.02562
G1 X155.77 Y125.414 E.01093
G1 X155.069 Y126.114 E.02562
G1 X154.677 Y125.957 E.01093
G1 X155.378 Y125.256 E.02562
G1 X154.985 Y125.099 E.01093
G1 X154.285 Y125.8 E.02562
G1 X153.892 Y125.642 E.01093
G1 X154.593 Y124.941 E.02562
G1 X154.201 Y124.784 E.01093
G1 X151.971 Y127.014 E.08154
G1 X151.972 Y127.563 E.01418
G1 X152.841 Y126.694 E.03176
G1 X152.842 Y127.243 E.01418
G1 X151.973 Y128.111 E.03176
G1 X151.974 Y128.66 E.01418
G1 X152.843 Y127.791 E.03176
G1 X152.844 Y128.34 E.01418
G1 X151.975 Y129.209 E.03176
G1 X151.976 Y129.757 E.01418
G1 X152.845 Y128.888 E.03177
G1 X152.846 Y129.437 E.01418
G1 X151.977 Y130.306 E.03177
G1 X151.978 Y130.854 E.01418
G1 X152.847 Y129.985 E.03177
G1 X152.848 Y130.534 E.01418
G1 X151.979 Y131.403 E.03177
G1 X151.98 Y131.952 E.01418
G1 X152.849 Y131.083 E.03177
G1 X152.85 Y131.631 E.01418
G1 X143.035 Y141.446 E.35887
G2 X143.386 Y141.645 I1.843 J-2.854 E.01044
G1 X152.851 Y132.18 E.34607
G1 X152.852 Y132.541 E.00933
G1 X152.946 Y132.634 E.00344
G1 X143.75 Y141.831 E.33624
G1 X144.114 Y142.017 E.01056
G1 X153.222 Y132.909 E.333
G1 X153.442 Y133.128 E.00804
G1 X153.552 Y133.128 E.00284
G1 X144.487 Y142.193 E.33142
G1 X144.87 Y142.36 E.01079
G1 X154.103 Y133.127 E.33759
G1 X154.653 Y133.126 E.01424
G1 X145.252 Y142.528 E.34375
G2 X145.65 Y142.679 I1.474 J-3.272 E.01102
G1 X155.204 Y133.125 E.34933
G1 X155.755 Y133.124 E.01424
G1 X146.051 Y142.827 E.35479
G2 X146.456 Y142.972 I1.42 J-3.342 E.01113
G1 X156.305 Y133.123 E.36011
G1 X156.856 Y133.122 E.01424
G1 X146.878 Y143.1 E.36482
G1 X147.3 Y143.228 E.01139
G1 X157.407 Y133.121 E.36954
G1 X157.957 Y133.12 E.01424
G1 X147.735 Y143.342 E.37376
G1 X148.178 Y143.448 E.01179
G1 X171.003 Y120.624 E.83452
G1 X171.099 Y121.077 E.01198
G1 X148.625 Y143.551 E.82171
G1 X149.092 Y143.634 E.01225
G1 X171.193 Y121.533 E.80808
G1 X171.265 Y122.01 E.01248
G1 X149.559 Y143.717 E.79366
G2 X150.045 Y143.781 I.778 J-4.062 E.01268
G1 X171.338 Y122.488 E.77852
G3 X171.39 Y122.985 I-4.163 J.688 E.01294
G1 X150.537 Y143.838 E.76245
G2 X151.042 Y143.882 I.624 J-4.235 E.01313
G1 X171.436 Y123.489 E.74564
G3 X171.466 Y124.008 I-4.36 J.517 E.01345
G1 X151.562 Y143.912 E.72775
G2 X152.092 Y143.932 I.433 J-4.449 E.01371
G1 X171.483 Y124.541 E.709
G3 X171.487 Y125.087 I-4.599 J.303 E.01413
G1 X152.642 Y143.931 E.68899
G2 X153.202 Y143.921 I.192 J-4.727 E.01449
G1 X171.471 Y125.653 E.66794
G3 X171.44 Y126.233 I-4.91 J.03 E.01504
G1 X153.788 Y143.885 E.6454
G2 X154.387 Y143.835 I-.118 J-5.072 E.01555
G1 X171.387 Y126.835 E.62157
G3 X171.312 Y127.461 I-5.306 J-.325 E.0163
G1 X155.013 Y143.76 E.59594
G2 X155.673 Y143.649 I-.784 J-6.717 E.01731
G1 X171.217 Y128.105 E.56834
G3 X171.081 Y128.79 I-5.843 J-.8 E.01807
G1 X156.336 Y143.536 E.53912
G2 X157.056 Y143.365 I-.874 J-5.295 E.01915
G1 X170.923 Y129.498 E.50701
G1 X170.719 Y130.252 E.0202
G1 X157.809 Y143.162 E.47201
G2 X158.605 Y142.915 I-1.68 J-6.835 E.02156
G1 X170.457 Y131.064 E.43333
G3 X170.133 Y131.937 I-7.522 J-2.29 E.02408
G1 X159.483 Y142.588 E.38942
G2 X160.45 Y142.17 I-3.035 J-8.36 E.02725
G1 X169.719 Y132.901 E.3389
G3 X169.159 Y134.011 I-9.637 J-4.167 E.03215
G1 X161.552 Y141.618 E.27814
G1 X162.643 Y140.98 E.03269
G1 X162.94 Y140.779 E.00928
G1 X168.344 Y135.375 E.19756
G3 X166.159 Y138.11 I-15.521 J-10.161 E.09063
G1 X164.111 Y140.158 E.07487
G1 X146.474 Y132.717 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.4142
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X151.227 Y132.708 E.26625
G1 X151.563 Y132.37 E.0267
G1 X151.563 Y132.243 E.00713
G1 X146.422 Y132.252 E.28797
G1 X146.422 Y131.788 E.026
G1 X151.562 Y131.778 E.28797
G1 X151.561 Y131.314 E.026
G1 X146.421 Y131.324 E.28797
G1 X146.42 Y130.86 E.026
G1 X151.56 Y130.85 E.28798
G1 X151.559 Y130.386 E.026
G1 X146.419 Y130.396 E.28798
G1 X146.418 Y129.931 E.026
G1 X151.559 Y129.922 E.28798
G1 X151.558 Y129.457 E.026
G1 X146.417 Y129.467 E.28798
G1 X146.416 Y129.003 E.026
G1 X151.557 Y128.993 E.28798
G1 X151.556 Y128.529 E.026
G1 X146.415 Y128.539 E.28798
G1 X146.414 Y128.075 E.026
G1 X151.555 Y128.065 E.28799
G1 X151.554 Y127.601 E.026
G1 X146.413 Y127.61 E.28799
G1 X146.412 Y127.146 E.026
G1 X151.553 Y127.136 E.28799
G1 X151.552 Y126.672 E.026
G1 X146.412 Y126.682 E.28799
G1 X146.411 Y126.218 E.026
G1 X151.552 Y126.208 E.28799
G1 X151.551 Y125.744 E.026
G1 X146.41 Y125.754 E.28799
G1 X146.409 Y125.289 E.026
G1 X151.55 Y125.28 E.288
G1 X151.549 Y124.815 E.026
G1 X146.574 Y124.825 E.27868
G1 X146.617 Y124.761 E.00432
G1 X147.609 Y124.359 E.05994
G1 X151.548 Y124.351 E.22067
G1 X151.547 Y123.887 E.026
G1 X148.759 Y123.892 E.1562
G1 X149.909 Y123.426 E.06952
G1 X151.749 Y123.423 E.10307
M106 S209.1
G1 X151.785 Y120.604 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
; LAYER_HEIGHT: 0.16
G1 F7200
G1 X152.827 Y119.562 E.0381
G1 X152.826 Y119.013 E.01418
G1 X151.957 Y119.882 E.03176
G1 X151.956 Y119.333 E.01418
G1 X152.825 Y118.465 E.03176
G1 X152.824 Y117.916 E.01418
G1 X151.955 Y118.785 E.03176
G1 X151.954 Y118.236 E.01418
G1 X152.823 Y117.368 E.03176
G1 X152.822 Y116.819 E.01418
G1 X151.953 Y117.688 E.03176
G1 X151.952 Y117.139 E.01418
G1 X161.139 Y107.952 E.33589
G1 X160.775 Y107.767 E.01056
G1 X151.951 Y116.59 E.32262
G1 X151.951 Y116.248 E.00885
G1 X151.847 Y116.145 E.00378
G1 X160.4 Y107.592 E.31272
G1 X160.015 Y107.428 E.01083
G1 X151.571 Y115.871 E.30871
G1 X151.021 Y115.872 E.01423
G1 X159.629 Y107.263 E.31475
G2 X159.239 Y107.104 I-1.8 J3.846 E.0109
G1 X150.47 Y115.873 E.32062
G1 X149.92 Y115.874 E.01424
G1 X158.838 Y106.956 E.32608
G2 X158.433 Y106.811 I-1.418 J3.337 E.01113
G1 X149.369 Y115.875 E.3314
G1 X148.818 Y115.876 E.01424
G1 X158.011 Y106.683 E.33611
G1 X157.589 Y106.555 E.01139
G1 X148.267 Y115.877 E.34083
G1 X147.717 Y115.878 E.01424
G1 X157.154 Y106.441 E.34505
G1 X156.711 Y106.335 E.01179
G1 X147.166 Y115.879 E.34897
G1 X146.615 Y115.88 E.01424
G1 X156.264 Y106.232 E.35277
G1 X155.797 Y106.149 E.01225
G1 X133.696 Y128.25 E.80808
G2 X133.79 Y128.706 I3.89 J-.565 E.01204
G1 X145.975 Y116.521 E.44552
G1 X145.976 Y117.069 E.01418
G1 X133.886 Y129.159 E.44204
G2 X133.993 Y129.602 I3.789 J-.679 E.01179
G1 X145.977 Y117.618 E.43817
G1 X145.978 Y118.166 E.01418
G1 X134.112 Y130.033 E.43387
G1 X134.23 Y130.464 E.01156
G1 X145.979 Y118.715 E.42957
G1 X145.98 Y119.264 E.01419
G1 X134.368 Y130.875 E.42455
G1 X134.508 Y131.285 E.0112
G1 X145.981 Y119.812 E.41948
G1 X145.982 Y120.361 E.01418
G1 X134.654 Y131.689 E.41418
G1 X134.813 Y132.079 E.0109
G1 X145.983 Y120.91 E.40839
G1 X145.984 Y121.458 E.01418
G1 X134.973 Y132.47 E.40261
G2 X135.144 Y132.848 I3.277 J-1.258 E.01074
G1 X145.985 Y122.007 E.39637
G1 X145.986 Y122.556 E.01418
G1 X135.322 Y133.22 E.3899
G1 X135.5 Y133.591 E.01065
G1 X146.287 Y122.804 E.39441
G1 X146.616 Y123.025 E.01024
G1 X135.694 Y133.947 E.39932
G1 X135.89 Y134.3 E.01045
G1 X147.35 Y122.841 E.419
G1 X146.201 Y122.304 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41153
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X148.031 Y122.301 E.10122
G1 X149.175 Y121.837 E.06825
G1 X146.402 Y121.842 E.15332
G1 X146.402 Y121.381 E.02552
G1 X150.319 Y121.374 E.21661
G1 X151.332 Y120.963 E.06048
G1 X151.368 Y120.91 E.0035
G1 X146.401 Y120.919 E.27466
G1 X146.4 Y120.458 E.02552
G1 X151.541 Y120.448 E.28429
G1 X151.54 Y119.987 E.02552
G1 X146.399 Y119.996 E.28428
G1 X146.398 Y119.535 E.02552
G1 X151.539 Y119.525 E.28428
G1 X151.538 Y119.064 E.02552
G1 X146.397 Y119.073 E.28428
G1 X146.397 Y118.612 E.02552
G1 X151.537 Y118.602 E.28428
G1 X151.536 Y118.141 E.02552
G1 X146.396 Y118.15 E.28428
G1 X146.395 Y117.689 E.02552
G1 X151.536 Y117.679 E.28427
G1 X151.535 Y117.217 E.02552
G1 X146.394 Y117.227 E.28427
G1 X146.393 Y116.766 E.02552
G1 X151.534 Y116.756 E.28427
G1 X151.533 Y116.422 E.01845
G1 X151.405 Y116.295 E.01001
G1 X146.234 Y116.304 E.28594
M106 S209.1
G1 X140.778 Y109.626 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
; LAYER_HEIGHT: 0.16
G1 F7200
G1 X138.731 Y111.672 E.07482
G2 X136.627 Y114.279 I15.48 J14.653 E.08671
G1 X136.55 Y114.403 E.00377
G1 X141.948 Y109.004 E.19737
G1 X142.246 Y108.803 E.00928
G1 X143.337 Y108.165 E.03269
G1 X135.73 Y115.772 E.27814
G2 X135.17 Y116.882 I9.076 J5.275 E.03215
G1 X144.439 Y107.613 E.33889
G3 X145.406 Y107.196 I4.008 J7.954 E.02725
G1 X134.756 Y117.846 E.38942
G2 X134.432 Y118.719 I7.198 J3.163 E.02408
G1 X146.284 Y106.868 E.43332
G3 X147.08 Y106.621 I2.466 J6.557 E.02156
G1 X134.171 Y119.531 E.472
G1 X133.966 Y120.285 E.0202
G1 X147.833 Y106.418 E.507
G3 X148.554 Y106.247 I1.808 J5.999 E.01918
G1 X133.815 Y120.986 E.5389
G1 X133.679 Y121.671 E.01807
G1 X149.226 Y106.125 E.56843
G3 X149.876 Y106.023 I1.179 J5.432 E.01704
G1 X133.577 Y122.322 E.59594
G2 X133.502 Y122.948 I5.236 J.951 E.01629
G1 X150.502 Y105.948 E.62157
G3 X151.101 Y105.898 I.717 J5.022 E.01555
G1 X133.449 Y123.55 E.6454
G2 X133.418 Y124.13 I4.876 J.551 E.01504
G1 X151.686 Y105.862 E.66794
G3 X152.247 Y105.852 I.368 J4.712 E.01449
G1 X133.403 Y124.696 E.68899
G2 X133.406 Y125.242 I4.6 J.244 E.01413
G1 X152.797 Y105.851 E.709
G3 X153.327 Y105.871 I.096 J4.474 E.01371
G1 X133.423 Y125.775 E.72775
G2 X133.453 Y126.294 I4.388 J.002 E.01345
G1 X153.847 Y105.901 E.74564
G3 X154.344 Y105.953 I-.273 J5.03 E.01294
G1 X133.499 Y126.798 E.76216
G2 X133.551 Y127.295 I4.215 J-.191 E.01294
G1 X154.841 Y106.006 E.7784
G3 X155.33 Y106.066 I-.19 J3.574 E.01276
G1 X133.471 Y127.925 E.79923
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X134.885 Y126.511 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X128.141 Y122.937 Z2.36 F30000
G1 X110.09 Y113.371 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
M73 P59 R13
G1 X110.45 Y113.818 E.01588
G3 X84.69 Y109.187 I-15.411 J11.76 E2.57332
G1 X85.679 Y108.602 E.03177
G3 X96.537 Y106.256 I9.344 J16.947 E.31153
G1 X96.762 Y106.269 E.00622
G3 X109.726 Y112.926 I-1.723 J19.308 E.4131
G1 X110.052 Y113.324 E.01423
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.768 Y113.575 E.01504
G3 X84.476 Y108.848 I-15.729 J12.003 E2.43695
G1 X85.486 Y108.251 E.03009
G3 X96.561 Y105.856 I9.537 J17.297 E.29484
G1 X96.798 Y105.87 E.00608
G3 X110.03 Y112.664 I-1.758 J19.707 E.3912
G1 X110.363 Y113.072 E.01351
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.768 Y113.575 E-.07368
G1 X111.454 Y114.526 E-.13371
G1 X111.551 Y114.679 E-.02062
; WIPE_END
G1 E-.012 F1800
G1 X104.008 Y113.511 Z2.36 F30000
G1 X83.376 Y110.315 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G1 X81.337 Y112.353 E.07452
G1 X80.612 Y113.145 E.02777
G2 X79.143 Y115.097 I17.199 J14.479 E.06319
G1 X84.545 Y109.695 E.1975
G3 X85.912 Y108.877 I9.354 J14.089 E.04121
G1 X78.325 Y116.464 E.2774
G2 X77.765 Y117.574 I9.071 J5.274 E.03216
G1 X87.037 Y108.302 E.33901
G3 X88.004 Y107.884 I4.006 J7.95 E.02725
G1 X77.363 Y118.526 E.38908
G2 X77.028 Y119.41 I8.742 J3.814 E.02445
G1 X88.879 Y107.56 E.43329
G3 X89.676 Y107.312 I2.48 J6.58 E.02159
G1 X76.767 Y120.221 E.47197
G1 X76.561 Y120.977 E.02027
G1 X90.43 Y107.108 E.50709
G3 X91.152 Y106.936 I1.815 J6.005 E.0192
G1 X76.404 Y121.684 E.53922
G2 X76.269 Y122.368 I5.692 J1.474 E.01804
G1 X91.822 Y106.815 E.56864
G3 X92.474 Y106.713 I1.188 J5.441 E.01707
G1 X76.173 Y123.014 E.596
G2 X76.098 Y123.638 I5.22 J.94 E.01626
G1 X93.098 Y106.639 E.62154
G3 X93.698 Y106.588 I.727 J5.031 E.01558
G1 X76.044 Y124.242 E.64546
G2 X76.015 Y124.821 I4.866 J.541 E.01501
G1 X94.282 Y106.553 E.66791
G3 X94.843 Y106.542 I.378 J4.721 E.01452
G1 X75.998 Y125.387 E.68904
G2 X76.002 Y125.932 I4.591 J.234 E.0141
G1 X95.393 Y106.542 E.70897
G3 X95.924 Y106.561 I.106 J4.481 E.01374
G1 X76.018 Y126.466 E.7278
G2 X76.05 Y126.984 I4.379 J-.008 E.01342
G1 X96.443 Y106.592 E.74561
G3 X96.941 Y106.643 I-.267 J5.055 E.01296
G1 X76.095 Y127.489 E.76219
G2 X76.148 Y127.985 I4.207 J-.201 E.01291
G1 X97.436 Y106.697 E.77836
G3 X97.927 Y106.756 I-.18 J3.582 E.01279
G1 X76.22 Y128.464 E.7937
G1 X76.291 Y128.942 E.0125
G1 X98.393 Y106.84 E.80812
G1 X98.859 Y106.923 E.01224
G1 X76.386 Y129.396 E.82168
G1 X76.482 Y129.85 E.012
G1 X99.307 Y107.025 E.83456
G1 X99.75 Y107.132 E.01177
G1 X76.589 Y130.292 E.8468
G1 X76.707 Y130.724 E.01157
G1 X100.186 Y107.245 E.85844
G1 X100.607 Y107.374 E.01138
G1 X76.826 Y131.155 E.86951
G1 X76.965 Y131.566 E.01121
G1 X101.028 Y107.502 E.87982
G3 X101.434 Y107.646 I-1.006 J3.496 E.01114
G1 X77.104 Y131.977 E.8896
G2 X77.258 Y132.372 I4.083 J-1.367 E.01098
G1 X101.835 Y107.795 E.89861
G3 X102.234 Y107.945 I-1.067 J3.431 E.01103
G1 X77.413 Y132.766 E.90751
G1 X77.569 Y133.16 E.01096
G1 X102.616 Y108.113 E.91578
G1 X102.997 Y108.282 E.01078
G1 X77.741 Y133.538 E.92346
G1 X77.918 Y133.911 E.01066
G1 X103.372 Y108.457 E.93067
G1 X103.735 Y108.643 E.01056
G1 X78.095 Y134.283 E.93746
G1 X78.291 Y134.637 E.01046
G1 X104.098 Y108.83 E.94359
G3 X104.451 Y109.027 I-1.487 J3.067 E.01045
G1 X78.486 Y134.991 E.94933
G2 X78.685 Y135.342 I3.056 J-1.504 E.01043
G1 X104.796 Y109.231 E.95469
G1 X105.142 Y109.435 E.01038
G1 X78.898 Y135.679 E.95955
G1 X79.111 Y136.016 E.0103
G1 X105.473 Y109.653 E.9639
G1 X105.802 Y109.874 E.01024
G1 X79.33 Y136.346 E.96789
G1 X79.559 Y136.666 E.01018
G1 X106.13 Y110.095 E.97151
G3 X106.443 Y110.333 I-1.861 J2.776 E.01015
G1 X79.789 Y136.986 E.97453
G2 X80.027 Y137.298 I2.742 J-1.851 E.01014
G1 X106.754 Y110.571 E.97722
G3 X107.065 Y110.81 I-1.863 J2.739 E.01014
G1 X80.274 Y137.601 E.97957
G1 X80.52 Y137.905 E.0101
G1 X107.36 Y111.064 E.98136
G1 X107.655 Y111.319 E.01008
G1 X80.776 Y138.198 E.98278
G1 X81.039 Y138.485 E.01006
G1 X107.948 Y111.576 E.98386
G1 X108.227 Y111.847 E.01005
G1 X81.301 Y138.772 E.98446
G2 X81.576 Y139.047 I2.456 J-2.175 E.01005
G1 X108.505 Y112.117 E.98462
G3 X108.78 Y112.393 I-2.183 J2.452 E.01005
G1 X81.855 Y139.318 E.98446
G1 X82.134 Y139.589 E.01005
G1 X109.042 Y112.68 E.98386
G1 X109.305 Y112.967 E.01006
G1 X82.426 Y139.846 E.98277
G1 X82.721 Y140.1 E.01008
G1 X109.562 Y113.26 E.98135
G1 X109.808 Y113.563 E.0101
G1 X83.016 Y140.355 E.97956
G2 X83.327 Y140.594 I2.162 J-2.485 E.01014
G1 X110.054 Y113.867 E.97721
G3 X110.292 Y114.178 I-2.505 J2.162 E.01014
G1 X83.639 Y140.832 E.97453
G2 X83.951 Y141.069 I2.153 J-2.512 E.01015
G1 X110.522 Y114.498 E.9715
G1 X110.751 Y114.818 E.01018
G1 X84.28 Y141.29 E.96788
G1 X84.608 Y141.511 E.01024
G1 X110.971 Y115.149 E.96389
G1 X111.183 Y115.486 E.0103
G1 X84.94 Y141.729 E.95954
G1 X85.285 Y141.933 E.01038
G1 X111.396 Y115.823 E.95468
G3 X111.595 Y116.173 I-2.856 J1.854 E.01043
G1 X85.631 Y142.137 E.94932
G2 X85.983 Y142.335 I1.837 J-2.868 E.01045
G1 X111.79 Y116.528 E.94358
G1 X111.986 Y116.882 E.01046
G1 X86.346 Y142.521 E.93744
G1 X86.71 Y142.708 E.01056
G1 X112.163 Y117.254 E.93065
G1 X112.341 Y117.626 E.01066
G1 X87.084 Y142.883 E.92344
G1 X87.466 Y143.051 E.01078
G1 X112.513 Y118.003 E.9158
G1 X112.672 Y118.395 E.01091
G1 X87.847 Y143.219 E.90764
G2 X88.246 Y143.369 I1.466 J-3.281 E.01103
G1 X112.83 Y118.786 E.89885
G3 X112.977 Y119.188 I-3.314 J1.44 E.01109
G1 X88.647 Y143.518 E.88958
G2 X89.053 Y143.662 I1.412 J-3.353 E.01114
G1 X113.116 Y119.599 E.8798
G1 X113.255 Y120.01 E.01121
G1 X89.475 Y143.79 E.86948
G1 X89.896 Y143.919 E.01138
G1 X113.374 Y120.441 E.85842
G1 X113.492 Y120.873 E.01157
G1 X90.335 Y144.029 E.84668
G1 X90.781 Y144.133 E.01185
G1 X113.599 Y121.314 E.8343
G1 X113.695 Y121.769 E.012
G1 X91.227 Y144.236 E.82147
G2 X91.688 Y144.325 I1.123 J-4.603 E.01214
G1 X113.79 Y122.223 E.80809
G1 X113.861 Y122.701 E.0125
G1 X92.154 Y144.408 E.79366
G2 X92.642 Y144.471 I.769 J-4.069 E.01271
G1 X113.933 Y123.18 E.77846
G3 X113.986 Y123.676 I-4.151 J.696 E.01292
G1 X93.133 Y144.529 E.76245
G2 X93.639 Y144.572 I.616 J-4.248 E.01315
G1 X114.031 Y124.181 E.74557
G3 X114.063 Y124.699 I-4.352 J.525 E.01343
G1 X94.158 Y144.603 E.72776
G2 X94.689 Y144.622 I.424 J-4.461 E.01374
G1 X114.078 Y125.233 E.70893
G3 X114.083 Y125.778 I-4.591 J.311 E.0141
G1 X95.239 Y144.622 E.689
G2 X95.802 Y144.608 I.182 J-4.082 E.01458
G1 X114.066 Y126.344 E.66778
G3 X114.036 Y126.924 I-4.9 J.038 E.01501
G1 X96.393 Y144.567 E.6451
G2 X96.985 Y144.525 I-.135 J-6.029 E.01535
G1 X113.982 Y127.527 E.62149
G3 X113.908 Y128.151 I-5.295 J-.317 E.01627
G1 X97.609 Y144.451 E.59594
G2 X98.261 Y144.348 I-.537 J-5.545 E.01707
G1 X113.811 Y128.798 E.56858
G3 X113.677 Y129.482 I-5.83 J-.792 E.01804
G1 X98.931 Y144.228 E.53915
G2 X99.653 Y144.055 I-1.091 J-6.167 E.0192
M73 P60 R13
G1 X113.52 Y130.189 E.50701
G1 X113.313 Y130.945 E.02027
G1 X100.407 Y143.851 E.47189
G2 X101.204 Y143.604 I-1.683 J-6.826 E.0216
G1 X113.052 Y131.756 E.4332
G3 X112.729 Y132.628 I-7.514 J-2.285 E.02407
G1 X102.078 Y143.279 E.38942
G1 X103.046 Y142.861 E.02725
G1 X112.314 Y133.592 E.33889
G3 X111.754 Y134.702 I-9.635 J-4.168 E.03217
G1 X104.147 Y142.309 E.27813
G1 X105.209 Y141.689 E.03179
G1 X105.54 Y141.466 E.01032
G1 X110.936 Y136.07 E.19729
G3 X108.73 Y138.825 I-15.485 J-10.135 E.09138
G1 X106.71 Y140.845 E.07386
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X108.124 Y139.431 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 13/18
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S211.65
G17
M73 P60 R12
G3 Z2.36 I1.217 J0 P1  F30000
; object ids of layer 13 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer13 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z2.12
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #14
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.52 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.784 Y137.574
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G3 X147.299 Y106.198 I14.66 J-12.685 E1.08036
G1 X148.415 Y105.926 E.03178
G3 X153.985 Y105.568 I4.058 J19.62 E.15483
G1 X154.13 Y105.576 E.00401
G3 X137.823 Y137.619 I-1.686 J19.313 E2.09533
G1 X137.471 Y137.83 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X136.74 Y136.927 E.02979
G3 X147.192 Y105.811 I15.704 J-12.038 E.99301
G1 X148.332 Y105.534 E.0301
G3 X154.008 Y105.168 I4.141 J20.018 E.1464
G1 X154.165 Y105.177 E.00402
G3 X137.512 Y137.872 I-1.72 J19.712 E1.98463
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X136.74 Y136.927 E-.13913
G1 X136.282 Y136.296 E-.08887
; WIPE_END
G1 E-.012 F1800
G1 X137.149 Y136.53 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423016
G1 F7200
G1 X138.863 Y138.244 E.06268
G2 X141.942 Y140.773 I13.022 J-12.714 E.10322
G1 X136.553 Y135.384 E.19704
G3 X135.731 Y134.013 I11.138 J-7.604 E.04135
G1 X143.338 Y141.62 E.27814
G1 X144.439 Y142.171 E.03183
G1 X135.17 Y132.902 E.33891
G3 X134.756 Y131.938 I7.921 J-3.975 E.02714
G1 X145.407 Y142.589 E.38945
G1 X146.278 Y142.911 E.02402
G1 X134.434 Y131.066 E.4331
G3 X134.173 Y130.256 I6.7 J-2.601 E.02202
G1 X147.077 Y143.16 E.47182
G2 X147.832 Y143.365 I2.106 J-6.256 E.02024
G1 X133.964 Y129.498 E.50706
G3 X133.808 Y128.792 I5.864 J-1.667 E.0187
G1 X148.555 Y143.538 E.5392
G1 X149.223 Y143.657 E.01756
G1 X133.675 Y128.109 E.56853
G1 X133.577 Y127.461 E.01693
G1 X149.876 Y143.761 E.596
G1 X150.499 Y143.834 E.01621
G1 X133.503 Y126.838 E.62146
G1 X133.448 Y126.233 E.0157
G1 X151.101 Y143.886 E.64547
G1 X151.684 Y143.919 E.0151
G1 X133.419 Y125.655 E.66784
G1 X133.401 Y125.087 E.01468
G1 X152.246 Y143.932 E.68906
G1 X152.795 Y143.931 E.01419
G1 X133.407 Y124.543 E.70891
G1 X133.422 Y124.008 E.01383
G1 X153.327 Y143.913 E.72782
G1 X153.845 Y143.881 E.01342
G1 X133.454 Y123.491 E.74557
G1 X133.498 Y122.986 E.01312
G1 X154.353 Y143.84 E.76252
G1 X154.843 Y143.78 E.01277
G1 X133.553 Y122.49 E.77846
G1 X133.623 Y122.011 E.01252
G1 X155.331 Y143.719 E.79373
G1 X155.796 Y143.634 E.01222
G1 X133.695 Y121.533 E.80811
G1 X133.79 Y121.078 E.01201
G1 X156.261 Y143.55 E.82166
G2 X156.71 Y143.449 I-.624 J-3.835 E.0119
G1 X133.885 Y120.624 E.83461
G3 X133.994 Y120.183 I3.767 J.696 E.01175
G1 X157.152 Y143.341 E.84679
G2 X157.59 Y143.229 I-.729 J-3.747 E.01168
G1 X134.111 Y119.75 E.85849
G3 X134.231 Y119.32 I3.688 J.792 E.01155
G1 X158.01 Y143.1 E.8695
G1 X158.431 Y142.971 E.01137
G1 X134.369 Y118.909 E.87982
G1 X134.507 Y118.497 E.01122
G1 X158.838 Y142.828 E.88966
G1 X159.238 Y142.679 E.01105
G1 X134.655 Y118.096 E.89887
G1 X134.813 Y117.704 E.01092
G1 X159.638 Y142.529 E.90772
G1 X160.019 Y142.361 E.01077
G1 X134.971 Y117.312 E.91588
G3 X135.145 Y116.936 I3.251 J1.272 E.01072
G1 X160.4 Y142.192 E.92346
G2 X160.776 Y142.018 I-1.277 J-3.249 E.01071
G1 X135.321 Y116.563 E.93073
G3 X135.5 Y116.192 I3.222 J1.32 E.01066
G1 X161.139 Y141.831 E.93747
G1 X161.501 Y141.644 E.01055
G1 X135.695 Y115.837 E.94361
G1 X135.89 Y115.482 E.01047
M73 P61 R12
G1 X161.855 Y141.447 E.9494
G1 X162.2 Y141.243 E.01037
G1 X136.09 Y115.133 E.95468
G1 X136.304 Y114.798 E.01029
G1 X162.545 Y141.038 E.95947
G2 X162.877 Y140.821 I-1.661 J-2.913 E.01028
G1 X136.518 Y114.462 E.96381
G3 X136.734 Y114.128 I3.272 J1.877 E.01028
G1 X163.205 Y140.599 E.96791
G1 X163.533 Y140.378 E.01023
G1 X136.963 Y113.808 E.97152
G1 X137.192 Y113.487 E.01019
G1 X163.847 Y140.142 E.97461
G1 X164.158 Y139.903 E.01014
G1 X137.432 Y113.177 E.97724
G1 X137.677 Y112.873 E.01011
G1 X164.469 Y139.665 E.97963
G2 X164.764 Y139.41 I-1.943 J-2.548 E.01008
G1 X137.923 Y112.569 E.98144
G3 X138.18 Y112.277 I2.596 J2.028 E.01008
G1 X165.059 Y139.155 E.9828
G2 X165.352 Y138.899 I-2.013 J-2.599 E.01008
G1 X138.443 Y111.989 E.98394
G1 X138.705 Y111.701 E.01006
G1 X165.631 Y138.627 E.98454
G1 X165.909 Y138.356 E.01005
G1 X138.98 Y111.427 E.98464
G1 X139.258 Y111.156 E.01005
G1 X166.184 Y138.082 E.98454
G1 X166.446 Y137.794 E.01006
G1 X139.537 Y110.885 E.98394
G3 X139.83 Y110.628 I2.312 J2.349 E.01008
G1 X166.709 Y137.507 E.9828
G2 X166.966 Y137.214 I-2.332 J-2.315 E.01008
G1 X140.125 Y110.373 E.98144
G3 X140.42 Y110.119 I2.287 J2.351 E.01008
G1 X167.212 Y136.91 E.97964
G1 X167.457 Y136.606 E.01011
G1 X140.731 Y109.88 E.97724
G1 X141.042 Y109.642 E.01014
G1 X167.697 Y136.296 E.97461
G1 X167.926 Y135.975 E.01019
G1 X141.356 Y109.405 E.97152
G1 X141.684 Y109.184 E.01023
G1 X168.155 Y135.655 E.96791
G2 X168.375 Y135.325 I-2.668 J-2.022 E.01025
G1 X142.012 Y108.962 E.96397
G3 X142.344 Y108.745 I1.994 J2.696 E.01028
G1 X168.587 Y134.988 E.95956
G1 X168.799 Y134.65 E.01031
G1 X142.689 Y108.54 E.9547
G1 X143.034 Y108.336 E.01037
G1 X169 Y134.301 E.9494
G1 X169.194 Y133.946 E.01047
G1 X143.392 Y108.144 E.94344
G1 X143.753 Y107.955 E.01053
G1 X169.389 Y133.591 E.93737
G2 X169.568 Y133.22 I-3.046 J-1.693 E.01066
G1 X144.114 Y107.766 E.93071
G3 X144.489 Y107.591 I1.511 J2.754 E.0107
G1 X169.744 Y132.847 E.92346
G2 X169.918 Y132.471 I-3.081 J-1.65 E.01072
G1 X144.87 Y107.423 E.91588
G1 X145.251 Y107.254 E.01077
G1 X170.076 Y132.079 E.90772
G1 X170.234 Y131.687 E.01092
G1 X145.651 Y107.104 E.89887
G1 X146.051 Y106.955 E.01104
G1 X170.382 Y131.286 E.88966
G1 X170.52 Y130.874 E.01122
G1 X146.458 Y106.812 E.87982
G1 X146.879 Y106.683 E.01137
G1 X170.659 Y130.463 E.8695
G2 X170.778 Y130.033 I-3.569 J-1.223 E.01155
G1 X147.299 Y106.554 E.8585
G3 X147.736 Y106.442 I1.164 J3.624 E.01168
G1 X170.895 Y129.6 E.84679
G2 X171.004 Y129.16 I-3.657 J-1.137 E.01175
G1 X148.178 Y106.334 E.83461
G3 X148.628 Y106.233 I1.071 J3.727 E.01191
G1 X171.099 Y128.705 E.82166
G1 X171.194 Y128.25 E.01201
G1 X149.093 Y106.149 E.80812
G1 X149.558 Y106.064 E.01222
G1 X171.266 Y127.772 E.79374
G1 X171.336 Y127.293 E.01252
G1 X150.046 Y106.003 E.77847
G1 X150.536 Y105.944 E.01277
G1 X171.391 Y126.798 E.76252
G1 X171.435 Y126.292 E.01312
G1 X151.044 Y105.902 E.74557
G1 X151.562 Y105.87 E.01342
G1 X171.467 Y125.775 E.72783
G1 X171.482 Y125.24 E.01383
G1 X152.094 Y105.852 E.70892
G1 X152.643 Y105.851 E.01419
G1 X171.488 Y124.696 E.68906
G1 X171.47 Y124.129 E.01468
G1 X153.205 Y105.864 E.66785
G1 X153.788 Y105.897 E.0151
G1 X171.441 Y123.55 E.64547
G1 X171.386 Y122.945 E.0157
G1 X154.396 Y105.956 E.62123
G1 X155.014 Y106.024 E.01607
G1 X171.312 Y122.322 E.59594
G1 X171.215 Y121.675 E.01693
G1 X155.666 Y106.126 E.56854
G1 X156.334 Y106.245 E.01756
G1 X171.081 Y120.991 E.5392
G2 X170.925 Y120.285 I-6.022 J.961 E.0187
G1 X157.057 Y106.418 E.50706
G3 X157.812 Y106.623 I-1.351 J6.462 E.02024
G1 X170.716 Y119.527 E.47183
G2 X170.456 Y118.717 I-6.96 J1.791 E.02202
G1 X158.61 Y106.872 E.43311
G3 X159.487 Y107.199 I-2.663 J8.48 E.0242
G1 X170.133 Y117.845 E.38928
G2 X169.719 Y116.881 I-8.337 J3.012 E.02714
G1 X160.452 Y107.614 E.33884
G1 X161.551 Y108.163 E.03175
G1 X169.158 Y115.77 E.27816
G2 X168.337 Y114.399 I-11.955 J6.23 E.04135
G1 X162.947 Y109.01 E.19706
G3 X165.275 Y110.813 I-11.312 J17.011 E.0762
G3 X167.714 Y113.227 I-70.974 J74.136 E.08873
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X166.3 Y111.813 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X158.67 Y112.024 Z2.52 F30000
G1 X110.09 Y113.371 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.451 Y113.817 E.01588
G3 X89.929 Y106.879 I-15.411 J11.762 E2.73245
G1 X91.047 Y106.609 E.03178
G3 X96.617 Y106.261 I4.021 J19.627 E.15483
G1 X96.762 Y106.269 E.004
G3 X109.727 Y112.925 I-1.722 J19.31 E.41311
G1 X110.052 Y113.324 E.01423
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.769 Y113.574 E.01504
G3 X89.824 Y106.492 I-15.729 J12.005 E2.58763
G1 X90.964 Y106.216 E.03009
G3 X96.641 Y105.861 I4.104 J20.025 E.1464
G1 X96.798 Y105.87 E.00402
G3 X110.03 Y112.663 I-1.757 J19.709 E.39121
G1 X110.363 Y113.072 E.01351
M204 S10000
M73 P62 R12
G1 X110.342 Y113.951 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G2 X107.898 Y111.527 I-83.095 J81.389 E.089
G2 X105.557 Y109.715 I-13.041 J14.424 E.0766
G1 X110.936 Y115.094 E.19665
G3 X111.754 Y116.461 I-11.115 J7.578 E.04123
G1 X104.147 Y108.855 E.27813
G1 X103.046 Y108.303 E.03185
G1 X112.314 Y117.572 E.33889
G3 X112.729 Y118.536 I-7.915 J3.974 E.02715
G1 X102.078 Y107.885 E.38942
G1 X101.204 Y107.56 E.02412
G1 X113.052 Y119.408 E.43319
G3 X113.313 Y120.219 I-6.696 J2.604 E.02203
G1 X100.407 Y107.313 E.47189
G2 X99.653 Y107.109 I-2.097 J6.248 E.0202
G1 X113.52 Y120.975 E.50701
G3 X113.677 Y121.682 I-5.877 J1.677 E.01873
G1 X98.931 Y106.936 E.53915
G1 X98.261 Y106.816 E.0176
G1 X113.811 Y122.366 E.56858
G1 X113.908 Y123.012 E.01689
G1 X97.611 Y106.715 E.59587
G1 X96.991 Y106.646 E.01611
G1 X113.982 Y123.637 E.62124
G1 X114.036 Y124.24 E.01566
G1 X96.384 Y106.588 E.64541
G1 X95.8 Y106.554 E.01513
G1 X114.066 Y124.82 E.66786
G1 X114.083 Y125.386 E.01465
G1 X95.239 Y106.542 E.689
G1 X94.689 Y106.542 E.01421
G1 X114.078 Y125.931 E.70893
G1 X114.063 Y126.465 E.01381
G1 X94.158 Y106.561 E.72776
G1 X93.639 Y106.592 E.01344
G1 X114.031 Y126.983 E.74557
G1 X113.986 Y127.488 E.0131
G1 X93.133 Y106.635 E.76245
G1 X92.642 Y106.693 E.01279
G1 X113.933 Y127.984 E.77846
G1 X113.861 Y128.462 E.0125
G1 X92.155 Y106.756 E.79365
G1 X91.692 Y106.842 E.01218
G1 X113.79 Y128.941 E.80797
G3 X113.695 Y129.395 I-3.885 J-.575 E.01201
G1 X91.228 Y106.929 E.82143
G2 X90.775 Y107.025 I.682 J4.353 E.012
G1 X113.599 Y129.849 E.83453
G3 X113.492 Y130.291 I-3.778 J-.687 E.01177
G1 X90.332 Y107.132 E.84678
G2 X89.896 Y107.245 I.736 J3.73 E.01166
G1 X113.374 Y130.723 E.85842
G3 X113.255 Y131.154 I-3.645 J-.769 E.01157
G1 X89.475 Y107.374 E.86948
G1 X89.054 Y107.502 E.01138
G1 X113.116 Y131.565 E.8798
G1 X112.977 Y131.976 E.01121
G1 X88.647 Y107.646 E.88958
G1 X88.246 Y107.794 E.01105
G1 X112.83 Y132.378 E.89885
G1 X112.672 Y132.769 E.01091
G1 X87.847 Y107.945 E.90764
G1 X87.466 Y108.113 E.01078
G1 X112.513 Y133.16 E.9158
G3 X112.341 Y133.537 I-3.267 J-1.267 E.01073
G1 X87.084 Y108.281 E.92344
G2 X86.71 Y108.456 I1.286 J3.24 E.0107
G1 X112.163 Y133.91 E.93065
G1 X111.986 Y134.282 E.01066
G1 X86.346 Y108.643 E.93744
G1 X85.983 Y108.829 E.01056
G1 X111.79 Y134.636 E.94358
G1 X111.595 Y134.991 E.01046
G1 X85.631 Y109.026 E.94932
G1 X85.285 Y109.231 E.01038
G1 X111.396 Y135.341 E.95468
G1 X111.183 Y135.678 E.0103
G1 X84.94 Y109.435 E.95954
G2 X84.608 Y109.652 I1.672 J2.908 E.01027
G1 X110.971 Y136.015 E.96389
G3 X110.751 Y136.346 I-2.894 J-1.682 E.01026
G1 X84.28 Y109.874 E.96788
G1 X83.951 Y110.095 E.01024
G1 X110.522 Y136.666 E.9715
G1 X110.292 Y136.986 E.01018
G1 X83.639 Y110.332 E.97453
G1 X83.327 Y110.57 E.01014
G1 X110.054 Y137.297 E.97721
G1 X109.808 Y137.6 E.0101
G1 X83.016 Y110.809 E.97956
G1 X82.721 Y111.064 E.01008
G1 X109.562 Y137.904 E.98136
G3 X109.305 Y138.197 I-2.599 J-2.015 E.01008
G1 X82.426 Y111.318 E.98277
G2 X82.134 Y111.576 I1.806 J2.34 E.01008
G1 X109.042 Y138.484 E.98385
G1 X108.78 Y138.771 E.01006
G1 X81.857 Y111.848 E.98438
G1 X81.58 Y112.121 E.01005
G1 X108.505 Y139.046 E.98447
G1 X108.227 Y139.317 E.01005
G1 X81.303 Y112.393 E.98441
G2 X81.039 Y112.679 I2.574 J2.644 E.01006
G1 X107.948 Y139.588 E.98386
G3 X107.655 Y139.845 I-2.31 J-2.329 E.01007
G1 X80.776 Y112.966 E.98277
G2 X80.52 Y113.259 I2.343 J2.309 E.01008
G1 X107.36 Y140.1 E.98136
G1 X107.065 Y140.354 E.01008
G1 X80.274 Y113.563 E.97957
G1 X80.027 Y113.866 E.0101
G1 X106.754 Y140.593 E.97722
G1 X106.443 Y140.831 E.01014
G1 X79.789 Y114.178 E.97453
G1 X79.559 Y114.498 E.01018
G1 X106.13 Y141.068 E.97151
G1 X105.802 Y141.29 E.01024
G1 X79.33 Y114.818 E.96789
G2 X79.111 Y115.148 I2.672 J2.011 E.01026
G1 X105.473 Y141.511 E.9639
G3 X105.142 Y141.729 I-2 J-2.683 E.01027
G1 X78.898 Y115.485 E.95955
G1 X78.685 Y115.822 E.0103
G1 X104.796 Y141.933 E.95469
G1 X104.451 Y142.137 E.01038
G1 X78.486 Y116.172 E.94933
G1 X78.291 Y116.527 E.01046
G1 X104.098 Y142.334 E.9436
G1 X103.735 Y142.521 E.01056
G1 X78.095 Y116.881 E.93746
G1 X77.918 Y117.253 E.01066
G1 X103.372 Y142.707 E.93067
G3 X102.997 Y142.882 I-1.661 J-3.065 E.0107
G1 X77.741 Y117.626 E.92346
G2 X77.568 Y118.003 I3.089 J1.642 E.01073
G1 X102.616 Y143.05 E.91582
G1 X102.234 Y143.218 E.01078
G1 X77.409 Y118.394 E.90766
G1 X77.251 Y118.785 E.01091
G1 X101.835 Y143.369 E.89887
G1 X101.434 Y143.518 E.01105
G1 X77.104 Y119.187 E.8896
G1 X76.965 Y119.598 E.01121
G1 X101.028 Y143.661 E.87982
G1 X100.607 Y143.79 E.01138
G1 X76.826 Y120.009 E.86951
G2 X76.707 Y120.44 I3.553 J1.208 E.01157
G1 X100.186 Y143.919 E.85844
G3 X99.75 Y144.032 I-1.172 J-3.615 E.01166
G1 X76.589 Y120.872 E.8468
G2 X76.482 Y121.313 I3.669 J1.129 E.01176
G1 X99.307 Y144.139 E.83456
G3 X98.859 Y144.241 I-1.08 J-3.72 E.01188
G1 X76.386 Y121.768 E.82168
G2 X76.291 Y122.222 I3.745 J1.021 E.01201
G1 X98.393 Y144.324 E.80812
G1 X97.927 Y144.408 E.01224
G1 X76.22 Y122.7 E.7937
G1 X76.148 Y123.179 E.0125
G1 X97.44 Y144.471 E.7785
G1 X96.949 Y144.529 E.01279
G1 X76.095 Y123.675 E.76249
G1 X76.05 Y124.18 E.0131
G1 X96.437 Y144.567 E.74542
G1 X95.922 Y144.601 E.01336
G1 X76.018 Y124.698 E.72772
G1 X76.002 Y125.231 E.01381
G1 X95.393 Y144.622 E.70897
G1 X94.843 Y144.622 E.01421
G1 X75.998 Y125.776 E.68905
G1 X76.015 Y126.343 E.01465
M73 P63 R12
G1 X94.282 Y144.61 E.66791
G1 X93.698 Y144.576 E.01513
G1 X76.044 Y126.922 E.64546
G1 X76.098 Y127.526 E.01566
G1 X93.098 Y144.525 E.62154
G1 X92.474 Y144.451 E.01625
G1 X76.173 Y128.15 E.596
G1 X76.269 Y128.796 E.01689
G1 X91.822 Y144.348 E.56864
G3 X91.144 Y144.22 I.877 J-6.497 E.01784
G1 X76.404 Y129.48 E.53894
G2 X76.561 Y130.187 I6.034 J-.969 E.01872
G1 X90.426 Y144.052 E.50694
G3 X89.676 Y143.852 I1.141 J-5.78 E.02008
G1 X76.767 Y130.943 E.47197
G2 X77.028 Y131.754 I6.962 J-1.794 E.02203
G1 X88.879 Y143.604 E.43329
G1 X88.004 Y143.28 E.02412
G1 X77.359 Y132.634 E.38922
G2 X77.765 Y133.59 I7.445 J-2.599 E.02686
G1 X87.037 Y142.862 E.33901
G1 X85.936 Y142.311 E.03184
G1 X78.325 Y134.7 E.27828
G2 X79.143 Y136.067 I11.927 J-6.204 E.04122
G1 X84.545 Y141.469 E.1975
G3 X81.487 Y138.961 I9.749 J-15.003 E.10246
G1 X79.735 Y137.209 E.06405
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
M73 P63 R11
G1 F7200
G1 X81.149 Y138.623 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 14/18
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z2.52 I1.217 J0 P1  F30000
; object ids of layer 14 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer14 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z2.28
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #15
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.68 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.78 Y137.576
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G1 X137.061 Y136.681 E.03174
G3 X152.982 Y105.51 I15.384 J-11.794 E1.20738
G1 X154.065 Y105.572 E.02999
G1 X154.13 Y105.576 E.00179
G3 X137.821 Y137.612 I-1.685 J19.311 E2.09535
G1 X137.47 Y137.829 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X136.742 Y136.926 E.02975
G3 X147.192 Y105.811 I15.702 J-12.038 E.99296
G1 X148.332 Y105.534 E.0301
G3 X154.088 Y105.172 I4.152 J20.098 E.14846
G1 X154.165 Y105.177 E.00196
G3 X137.513 Y137.869 I-1.72 J19.711 E1.9845
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X136.742 Y136.926 E-.13885
G1 X136.282 Y136.294 E-.08915
; WIPE_END
G1 E-.012 F1800
G1 X143.842 Y137.343 Z2.68 F30000
G1 X164.111 Y140.158 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F7200
G1 X166.158 Y138.11 E.07486
G2 X168.344 Y135.375 I-13.337 J-12.897 E.09063
G1 X162.94 Y140.779 E.19755
G1 X162.643 Y140.98 E.00928
G1 X161.552 Y141.618 E.03268
G1 X169.159 Y134.011 E.27813
G2 X169.719 Y132.901 I-9.072 J-5.274 E.03215
G1 X160.45 Y142.17 E.33888
G3 X159.483 Y142.587 I-4.005 J-7.947 E.02725
G1 X170.133 Y131.937 E.38941
G2 X170.457 Y131.064 I-7.195 J-3.162 E.02408
G1 X158.605 Y142.915 E.43331
G3 X157.809 Y143.162 I-2.477 J-6.592 E.02156
G1 X170.718 Y130.252 E.47199
G1 X170.923 Y129.498 E.0202
G1 X157.056 Y143.365 E.50699
G3 X156.335 Y143.536 I-1.804 J-5.986 E.01917
G1 X171.081 Y128.791 E.53913
G2 X171.217 Y128.105 I-5.705 J-1.484 E.01807
G1 X155.664 Y143.658 E.56864
G3 X155.013 Y143.76 I-1.179 J-5.431 E.01704
G1 X171.312 Y127.461 E.59592
G2 X171.387 Y126.835 I-5.23 J-.95 E.01629
G1 X154.387 Y143.835 E.62155
G3 X153.788 Y143.885 I-.717 J-5.021 E.01555
G1 X171.44 Y126.233 E.64538
G2 X171.471 Y125.653 I-4.878 J-.551 E.01504
G1 X153.203 Y143.921 E.66791
G3 X152.643 Y143.931 I-.368 J-4.712 E.01449
G1 X171.486 Y125.087 E.68896
G2 X171.483 Y124.541 I-4.603 J-.244 E.01413
G1 X152.092 Y143.932 E.70897
G3 X151.562 Y143.912 I-.096 J-4.473 E.01371
G1 X171.466 Y124.008 E.72772
G2 X171.436 Y123.489 I-4.389 J-.002 E.01345
G1 X151.042 Y143.882 E.74561
G3 X150.537 Y143.838 I.119 J-4.281 E.01313
G1 X171.39 Y122.986 E.76242
G2 X171.338 Y122.488 I-4.218 J.191 E.01294
G1 X150.045 Y143.781 E.77849
G3 X149.559 Y143.717 I.292 J-4.124 E.01268
G1 X171.265 Y122.011 E.79363
G1 X171.193 Y121.533 E.01248
G1 X149.092 Y143.634 E.80805
G1 X148.626 Y143.551 E.01225
G1 X171.099 Y121.078 E.82168
G1 X171.003 Y120.624 E.01198
G1 X148.179 Y143.448 E.83449
G1 X147.735 Y143.342 E.01179
G1 X170.896 Y120.181 E.8468
G1 X170.777 Y119.75 E.01156
G1 X147.3 Y143.228 E.85838
M73 P64 R11
G1 X146.878 Y143.1 E.01139
G1 X170.659 Y119.319 E.86946
G2 X170.521 Y118.908 I-3.539 J.961 E.01123
G1 X146.457 Y142.972 E.87982
G3 X146.051 Y142.827 I1.016 J-3.49 E.01113
G1 X170.381 Y118.498 E.88953
G2 X170.235 Y118.094 I-3.473 J1.029 E.0111
G1 X145.65 Y142.679 E.89887
G3 X145.252 Y142.528 I1.079 J-3.432 E.01102
G1 X170.076 Y117.704 E.9076
G1 X169.917 Y117.313 E.0109
G1 X144.87 Y142.36 E.91575
G1 X144.488 Y142.193 E.01079
G1 X169.745 Y116.935 E.92345
G1 X169.567 Y116.564 E.01065
G1 X144.114 Y142.017 E.9306
G1 X143.75 Y141.831 E.01056
G1 X169.389 Y116.192 E.9374
G2 X169.195 Y115.837 I-3.079 J1.454 E.01048
G1 X143.387 Y141.645 E.94359
G3 X143.035 Y141.447 I1.495 J-3.059 E.01044
G1 X168.999 Y115.483 E.94927
G2 X168.801 Y115.131 I-3.059 J1.492 E.01044
G1 X142.689 Y141.243 E.95468
G1 X142.343 Y141.039 E.01038
G1 X168.588 Y114.795 E.95954
G1 X168.374 Y114.459 E.0103
G1 X142.012 Y140.821 E.96384
G1 X141.683 Y140.6 E.01024
G1 X168.156 Y114.127 E.96789
G1 X167.926 Y113.808 E.01018
G1 X141.355 Y140.379 E.97148
G1 X141.043 Y140.141 E.01014
G1 X167.696 Y113.488 E.97448
G2 X167.456 Y113.178 I-2.88 J1.975 E.01014
G1 X140.731 Y139.904 E.97714
G3 X140.421 Y139.664 I1.873 J-2.733 E.01013
G1 X167.211 Y112.874 E.97947
G1 X166.965 Y112.57 E.0101
G1 X140.125 Y139.41 E.98129
G1 X139.83 Y139.156 E.01008
G1 X166.71 Y112.276 E.98278
G1 X166.447 Y111.989 E.01006
G1 X139.538 Y138.897 E.98381
G1 X139.259 Y138.627 E.01005
G1 X166.183 Y111.703 E.9844
G2 X165.91 Y111.427 I-2.462 J2.164 E.01005
G1 X138.98 Y138.357 E.98462
G3 X138.706 Y138.081 I2.189 J-2.441 E.01005
G1 X165.631 Y111.156 E.98441
G1 X165.351 Y110.886 E.01005
G1 X138.443 Y137.794 E.98381
G1 X138.18 Y137.508 E.01006
G1 X165.06 Y110.628 E.98278
G1 X164.764 Y110.374 E.01008
G1 X137.924 Y137.214 E.98131
G1 X137.678 Y136.911 E.0101
G1 X164.468 Y110.12 E.97952
G2 X164.159 Y109.88 I-2.176 J2.484 E.01013
G1 X137.431 Y136.608 E.97722
G3 X137.194 Y136.295 I2.515 J-2.156 E.01015
G1 X163.847 Y109.642 E.97448
G1 X163.535 Y109.405 E.01014
G1 X136.964 Y135.976 E.97148
G1 X136.733 Y135.656 E.01018
G1 X163.206 Y109.184 E.9679
G1 X162.877 Y108.963 E.01024
G1 X136.515 Y135.325 E.96385
G1 X136.302 Y134.989 E.0103
G1 X162.547 Y108.744 E.95955
G1 X162.2 Y108.541 E.01038
G1 X136.089 Y134.652 E.95469
G3 X135.891 Y134.301 I2.861 J-1.844 E.01044
G1 X161.854 Y108.337 E.94928
G2 X161.503 Y108.139 I-1.845 J2.857 E.01044
G1 X135.695 Y133.947 E.9436
G3 X135.5 Y133.592 I2.886 J-1.811 E.01047
G1 X161.139 Y107.953 E.93741
G1 X160.776 Y107.767 E.01056
G1 X135.322 Y133.22 E.93062
G1 X135.144 Y132.848 E.01065
G1 X160.402 Y107.591 E.92347
G1 X160.02 Y107.423 E.01079
G1 X134.973 Y132.47 E.91577
G1 X134.814 Y132.08 E.0109
G1 X159.638 Y107.256 E.90761
G2 X159.24 Y107.104 I-1.477 J3.277 E.01102
G1 X134.654 Y131.689 E.89888
G3 X134.508 Y131.286 I3.329 J-1.434 E.0111
G1 X158.838 Y106.956 E.88955
G2 X158.433 Y106.811 I-1.419 J3.339 E.01113
G1 X134.369 Y130.876 E.87984
G3 X134.23 Y130.465 I3.392 J-1.37 E.01123
G1 X158.012 Y106.684 E.86948
G1 X157.59 Y106.556 E.01139
G1 X134.112 Y130.034 E.8584
G1 X133.993 Y129.603 E.01156
G1 X157.155 Y106.441 E.84682
G1 X156.711 Y106.335 E.01179
G1 X133.886 Y129.16 E.83452
G1 X133.79 Y128.706 E.01198
G1 X156.264 Y106.232 E.8217
G1 X155.798 Y106.149 E.01225
G1 X133.696 Y128.251 E.80808
G1 X133.624 Y127.773 E.01248
G1 X155.331 Y106.066 E.79365
G2 X154.844 Y106.004 I-.744 J3.868 E.01271
G1 X133.552 Y127.296 E.77848
G3 X133.499 Y126.799 I4.162 J-.689 E.01294
G1 X154.351 Y105.947 E.76235
G2 X153.848 Y105.901 I-.667 J4.45 E.01307
G1 X133.454 Y126.295 E.74564
G3 X133.423 Y125.776 I4.361 J-.517 E.01345
G1 X153.328 Y105.871 E.72776
G2 X152.798 Y105.851 I-.434 J4.458 E.01371
G1 X133.406 Y125.243 E.70901
G3 X133.403 Y124.697 I4.596 J-.303 E.01413
G1 X152.248 Y105.852 E.689
G2 X151.688 Y105.862 I-.193 J4.722 E.01449
G1 X133.418 Y124.131 E.66796
G3 X133.449 Y123.551 I4.909 J-.03 E.01504
G1 X151.102 Y105.898 E.64542
G2 X150.503 Y105.948 I.118 J5.072 E.01555
G1 X133.502 Y122.949 E.62159
G3 X133.577 Y122.324 I5.302 J.324 E.01629
G1 X149.878 Y106.023 E.59597
G2 X149.227 Y106.124 I.527 J5.531 E.01704
G1 X133.672 Y121.679 E.5687
G3 X133.808 Y120.994 I5.839 J.798 E.01806
G1 X148.555 Y106.246 E.53919
G2 X147.834 Y106.418 I1.083 J6.16 E.01917
G1 X133.967 Y120.285 E.50702
G1 X134.175 Y119.528 E.02031
G1 X147.081 Y106.621 E.4719
G2 X146.286 Y106.867 I1.684 J6.852 E.02155
G1 X134.432 Y118.721 E.43339
G3 X134.755 Y117.848 I7.517 J2.287 E.02408
G1 X145.408 Y107.195 E.38949
G2 X144.441 Y107.612 I3.034 J8.358 E.02725
G1 X135.17 Y116.884 E.33898
G3 X135.729 Y115.775 I9.633 J4.164 E.03214
G1 X143.34 Y108.164 E.27825
G1 X142.246 Y108.803 E.03275
G1 X141.952 Y109.002 E.00917
G1 X136.544 Y114.41 E.19773
G1 X136.626 Y114.28 E.00398
G3 X138.72 Y111.685 I17.544 J12.013 E.08631
G1 X140.783 Y109.622 E.07541
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X139.368 Y111.036 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X131.76 Y111.643 Z2.68 F30000
G1 X110.09 Y113.371 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.451 Y113.818 E.01588
G3 X95.615 Y106.201 I-15.41 J11.761 E2.8912
M73 P65 R11
G1 X96.697 Y106.266 E.02999
G1 X96.762 Y106.269 E.00179
G3 X109.727 Y112.925 I-1.722 J19.309 E.41311
G1 X110.052 Y113.324 E.01423
G1 X110.401 Y113.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.769 Y113.574 E.01504
G3 X95.627 Y105.801 I-15.729 J12.003 E2.73787
G1 X96.721 Y105.866 E.02813
G1 X96.798 Y105.87 E.00196
G3 X110.03 Y112.663 I-1.757 J19.707 E.39121
G1 X110.363 Y113.072 E.01351
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X110.769 Y113.574 E-.07369
G1 X111.454 Y114.526 E-.13369
G1 X111.551 Y114.679 E-.02062
; WIPE_END
G1 E-.012 F1800
G1 X104.008 Y113.511 Z2.68 F30000
G1 X83.376 Y110.315 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422996
G1 F7200
G1 X81.338 Y112.353 E.07451
G2 X79.242 Y114.941 I15.424 J14.635 E.08619
G1 X79.143 Y115.097 E.00478
G1 X84.545 Y109.695 E.1975
G1 X84.872 Y109.475 E.0102
G1 X85.936 Y108.853 E.03186
G1 X78.325 Y116.464 E.27827
G2 X77.765 Y117.574 I9.071 J5.274 E.03216
G1 X87.037 Y108.302 E.33901
G3 X88.004 Y107.884 I4 J7.935 E.02725
G1 X77.351 Y118.538 E.38952
G2 X77.028 Y119.41 I7.19 J3.156 E.02406
G1 X88.879 Y107.56 E.43329
G3 X89.676 Y107.312 I2.48 J6.581 E.02159
G1 X76.767 Y120.221 E.47197
G1 X76.561 Y120.977 E.02027
G1 X90.43 Y107.108 E.50709
G3 X91.152 Y106.936 I1.806 J5.969 E.0192
G1 X76.404 Y121.684 E.53922
G2 X76.269 Y122.368 I5.695 J1.475 E.01804
G1 X91.822 Y106.815 E.56864
G3 X92.474 Y106.713 I1.188 J5.446 E.01707
G1 X76.173 Y123.014 E.596
G2 X76.098 Y123.638 I5.22 J.94 E.01626
G1 X93.098 Y106.639 E.62154
G3 X93.698 Y106.588 I.727 J5.034 E.01558
G1 X76.044 Y124.242 E.64546
G2 X76.015 Y124.821 I4.866 J.541 E.01501
G1 X94.282 Y106.553 E.66791
G3 X94.843 Y106.542 I.378 J4.721 E.01452
G1 X75.998 Y125.387 E.68904
G2 X76.002 Y125.932 I4.591 J.234 E.0141
G1 X95.393 Y106.542 E.70897
G3 X95.924 Y106.561 I.106 J4.481 E.01374
G1 X76.018 Y126.466 E.7278
G2 X76.052 Y126.982 I4.608 J-.047 E.01336
G1 X96.443 Y106.592 E.74552
G3 X96.946 Y106.637 I-.154 J4.505 E.01309
G1 X76.096 Y127.488 E.76235
G2 X76.148 Y127.985 I4.004 J-.169 E.01294
G1 X97.439 Y106.694 E.77845
G3 X97.927 Y106.756 I-.247 J3.941 E.01273
G1 X76.22 Y128.464 E.7937
G1 X76.291 Y128.942 E.0125
G1 X98.393 Y106.84 E.80812
G1 X98.859 Y106.923 E.01224
G1 X76.386 Y129.396 E.82168
G1 X76.482 Y129.85 E.012
G1 X99.307 Y107.025 E.83456
G1 X99.75 Y107.132 E.01177
G1 X76.589 Y130.292 E.8468
G1 X76.707 Y130.724 E.01157
G1 X100.186 Y107.245 E.85844
G1 X100.607 Y107.374 E.01138
G1 X76.826 Y131.155 E.86951
G1 X76.965 Y131.566 E.01121
G1 X101.028 Y107.502 E.87982
G3 X101.434 Y107.646 I-1.006 J3.496 E.01114
G1 X77.104 Y131.977 E.8896
G2 X77.253 Y132.377 I3.636 J-1.13 E.01105
G1 X101.835 Y107.795 E.89879
G3 X102.234 Y107.945 I-1.067 J3.431 E.01103
G1 X77.411 Y132.769 E.90761
G1 X77.568 Y133.161 E.01092
G1 X102.616 Y108.113 E.9158
G1 X102.997 Y108.282 E.01078
G1 X77.741 Y133.538 E.92346
G1 X77.918 Y133.911 E.01066
G1 X103.372 Y108.457 E.93067
G1 X103.735 Y108.643 E.01056
G1 X78.095 Y134.283 E.93746
G1 X78.291 Y134.637 E.01046
G1 X104.098 Y108.83 E.94359
G3 X104.451 Y109.027 I-1.487 J3.067 E.01045
G1 X78.486 Y134.991 E.94933
G2 X78.685 Y135.342 I3.06 J-1.506 E.01043
G1 X104.796 Y109.231 E.95469
G1 X105.142 Y109.435 E.01038
G1 X78.898 Y135.679 E.95955
G1 X79.111 Y136.016 E.0103
G1 X105.473 Y109.653 E.9639
G1 X105.802 Y109.874 E.01024
G1 X79.33 Y136.346 E.96789
G1 X79.559 Y136.666 E.01018
G1 X106.13 Y110.095 E.97151
G3 X106.443 Y110.333 I-1.861 J2.776 E.01015
G1 X79.789 Y136.986 E.97453
G2 X80.027 Y137.298 I2.741 J-1.85 E.01014
G1 X106.754 Y110.571 E.97722
G3 X107.065 Y110.81 I-1.863 J2.739 E.01014
G1 X80.274 Y137.601 E.97957
G1 X80.52 Y137.905 E.0101
G1 X107.36 Y111.064 E.98136
G1 X107.655 Y111.319 E.01008
G1 X80.776 Y138.198 E.98278
G1 X81.039 Y138.485 E.01006
G1 X107.948 Y111.576 E.98386
G1 X108.227 Y111.847 E.01005
G1 X81.301 Y138.772 E.98446
G2 X81.576 Y139.047 I2.456 J-2.175 E.01005
G1 X108.505 Y112.117 E.98462
G3 X108.78 Y112.393 I-2.183 J2.452 E.01005
G1 X81.855 Y139.318 E.98446
G1 X82.134 Y139.589 E.01005
G1 X109.042 Y112.68 E.98386
G1 X109.305 Y112.967 E.01006
G1 X82.426 Y139.846 E.98277
G1 X82.721 Y140.1 E.01008
G1 X109.562 Y113.26 E.98136
G1 X109.808 Y113.563 E.0101
G1 X83.016 Y140.355 E.97956
G2 X83.327 Y140.594 I2.172 J-2.498 E.01014
G1 X110.054 Y113.867 E.97721
G3 X110.292 Y114.178 I-2.509 J2.165 E.01014
G1 X83.639 Y140.832 E.97453
G2 X83.951 Y141.069 I2.17 J-2.535 E.01015
G1 X110.522 Y114.498 E.9715
G1 X110.751 Y114.818 E.01018
G1 X84.28 Y141.29 E.96788
G1 X84.608 Y141.511 E.01024
G1 X110.971 Y115.149 E.96389
G1 X111.183 Y115.486 E.0103
G1 X84.94 Y141.729 E.95954
G1 X85.285 Y141.933 E.01038
G1 X111.396 Y115.823 E.95468
G3 X111.595 Y116.173 I-2.856 J1.854 E.01043
G1 X85.631 Y142.137 E.94932
G2 X85.983 Y142.335 I1.837 J-2.868 E.01045
G1 X111.79 Y116.528 E.94358
G1 X111.986 Y116.882 E.01046
G1 X86.346 Y142.521 E.93744
G1 X86.71 Y142.708 E.01056
G1 X112.163 Y117.254 E.93065
G1 X112.341 Y117.626 E.01066
G1 X87.084 Y142.883 E.92344
G1 X87.466 Y143.051 E.01078
G1 X112.513 Y118.003 E.9158
G1 X112.672 Y118.395 E.01091
G1 X87.847 Y143.219 E.90764
G2 X88.246 Y143.369 I1.466 J-3.281 E.01103
G1 X112.83 Y118.786 E.89885
G3 X112.977 Y119.188 I-3.319 J1.441 E.01109
G1 X88.647 Y143.518 E.88958
G2 X89.053 Y143.662 I1.412 J-3.353 E.01114
G1 X113.116 Y119.599 E.8798
G1 X113.255 Y120.01 E.01121
G1 X89.475 Y143.79 E.86948
G1 X89.896 Y143.919 E.01138
G1 X113.374 Y120.441 E.85842
G1 X113.492 Y120.873 E.01157
G1 X90.332 Y144.032 E.84678
G1 X90.775 Y144.139 E.01177
G1 X113.599 Y121.314 E.83453
G1 X113.695 Y121.769 E.012
G1 X91.223 Y144.241 E.82165
G1 X91.688 Y144.325 E.01224
G1 X113.79 Y122.223 E.80809
M73 P66 R11
G1 X113.861 Y122.701 E.0125
G1 X92.154 Y144.408 E.79366
G2 X92.642 Y144.471 I.769 J-4.069 E.01271
G1 X113.933 Y123.18 E.77846
G3 X113.986 Y123.676 I-4.154 J.696 E.01292
G1 X93.133 Y144.529 E.76245
G2 X93.639 Y144.572 I.616 J-4.248 E.01315
G1 X114.031 Y124.181 E.74557
G3 X114.063 Y124.699 I-4.352 J.525 E.01343
G1 X94.158 Y144.603 E.72776
G2 X94.689 Y144.622 I.424 J-4.461 E.01374
G1 X114.078 Y125.233 E.70893
G3 X114.083 Y125.778 I-4.591 J.311 E.0141
G1 X95.239 Y144.622 E.689
G2 X95.8 Y144.61 I.183 J-4.732 E.01452
G1 X114.066 Y126.344 E.66786
G3 X114.036 Y126.924 I-4.9 J.038 E.01501
G1 X96.384 Y144.576 E.64541
G2 X96.985 Y144.525 I-.128 J-5.086 E.01559
G1 X113.982 Y127.527 E.62149
G3 X113.908 Y128.151 I-5.295 J-.317 E.01627
G1 X97.609 Y144.451 E.59594
G2 X98.261 Y144.348 I-.537 J-5.545 E.01707
G1 X113.811 Y128.798 E.56858
G3 X113.677 Y129.482 I-5.83 J-.792 E.01804
G1 X98.931 Y144.228 E.53915
G2 X99.653 Y144.055 I-1.089 J-6.161 E.0192
G1 X113.52 Y130.189 E.50701
G1 X113.313 Y130.945 E.02027
G1 X100.407 Y143.851 E.47189
G2 X101.204 Y143.604 I-1.683 J-6.825 E.0216
G1 X113.052 Y131.756 E.4332
G3 X112.729 Y132.628 I-7.51 J-2.283 E.02407
G1 X102.078 Y143.279 E.38942
G1 X103.046 Y142.861 E.02725
G1 X112.314 Y133.592 E.33889
G3 X111.754 Y134.702 I-9.635 J-4.168 E.03217
M73 P66 R10
G1 X104.147 Y142.309 E.27813
G1 X105.209 Y141.689 E.03179
G1 X105.54 Y141.466 E.01032
G1 X110.936 Y136.07 E.19729
G3 X108.73 Y138.825 I-15.485 J-10.136 E.09138
G1 X106.71 Y140.845 E.07386
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X108.124 Y139.431 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 15/18
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S178.5
G17
G3 Z2.68 I1.217 J0 P1  F30000
; object ids of layer 15 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer15 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z2.44
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X40.500 Y206.500  E1.0532 F5400
G1  Y198.500  E0.2478
G1  X74.500  E1.0532
G1  Y206.500  E0.2478
G1  X41.500 Y198.500  
;--------------------
; CP EMPTY GRID START
; layer #16
G1  Y206.500  E0.2478
G1  X49.500 
G1  Y198.500  E0.2478
G1  X57.500 
G1  Y206.500  E0.2478
G1  X65.500 
G1  Y198.500  E0.2478
G1  X73.500 
G1  Y206.500  E0.2478
; CP EMPTY GRID END
;------------------






G1  X75.000 Y207.500  
G1  X40.000  E1.0842
G1  Y198.000  E0.2943
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END

G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X75 Y205.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.84 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
G1 X153.95 Y123.481
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G1 X153.938 Y116.757 E.18593
G1 X157.683 Y116.75 E.10356
G1 X157.696 Y123.777 E.19431
G1 X157.698 Y124.985 E.03339
G1 X154.006 Y123.504 E.11
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X153.986 Y121.504 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X153.972 Y129.136 Z2.84 F30000
G1 X153.967 Y132.026 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F12000
G1 X153.957 Y126.87 E.14256
G1 X156.859 Y128.034 E.08645
G1 X157.705 Y128.374 E.02521
G1 X157.712 Y132.019 E.1008
G1 X154.027 Y132.026 E.10189
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X153.999 Y130.026 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X147.12 Y132.039 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F12000
G1 X147.107 Y125.315 E.18591
G1 X150.849 Y123.798 E.11166
G1 X150.861 Y130.301 E.17981
G1 X150.865 Y132.032 E.04786
G1 X147.18 Y132.039 E.10189
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X147.158 Y130.039 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X147.104 Y122.407 Z2.84 F30000
G1 X147.1 Y121.925 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F12000
G1 X147.091 Y116.77 E.14254
G1 X150.836 Y116.763 E.10355
G1 X150.842 Y119.733 E.08212
G1 X150.843 Y120.408 E.01867
G1 X147.156 Y121.903 E.11
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X147.131 Y119.903 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X143.509 Y126.621 Z2.84 F30000
G1 X137.469 Y137.828 Z2.84
M73 P67 R10
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X136.742 Y136.926 E.02972
G3 X152.994 Y105.109 I15.701 J-12.039 E1.14346
G1 X154.162 Y105.176 E.03003
G3 X137.512 Y137.868 I-1.719 J19.711 E1.98455
M204 S10000
G1 X137.76 Y137.641 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.317661
G1 F18000
G1 X137.736 Y137.615 E.00065
G1 X137.009 Y136.722 E.02172
G1 X136.335 Y135.786 E.02173
G1 X135.718 Y134.813 E.02172
G1 X135.159 Y133.805 E.02172
G1 X134.662 Y132.765 E.02173
G1 X134.227 Y131.698 E.02172
G1 X133.855 Y130.606 E.02173
G1 X133.55 Y129.495 E.02172
G1 X133.31 Y128.365 E.02177
G1 X133.138 Y127.228 E.02168
G1 X133.033 Y126.08 E.02171
G1 X132.997 Y124.924 E.02181
G3 X141.14 Y140.716 I19.444 J-.03 E1.9547
G1 X140.219 Y140.016 E.0218
G1 X139.345 Y139.265 E.02173
G1 X138.516 Y138.464 E.02172
G1 X137.8 Y137.685 E.01994
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X137.736 Y137.615 E-.01079
G1 X137.009 Y136.722 E-.13137
G1 X136.569 Y136.111 E-.08584
; WIPE_END
G1 E-.012 F1800
G1 X142.579 Y131.407 Z2.84 F30000
G1 X149.235 Y126.199 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54206
G1 F7200
G1 X148.728 Y126.405 E.01849
G1 X148.735 Y130.417 E.13552
G1 X149.243 Y130.416 E.01714
G1 X149.235 Y126.259 E.14041
G1 X149.68 Y125.536 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X148.28 Y126.104 E.03876
G1 X148.29 Y130.865 E.12213
G1 X149.69 Y130.862 E.03594
G1 X149.681 Y125.596 E.13509
G1 X150.065 Y124.964 F30000
G1 F7200
G1 X147.894 Y125.845 E.0601
G1 X147.905 Y131.251 E.1387
G1 X150.077 Y131.247 E.05573
G1 X150.065 Y125.024 E.15964
G1 X150.45 Y124.392 F30000
G1 F7200
G1 X147.508 Y125.585 E.08144
G1 X147.52 Y131.638 E.15527
G1 X150.463 Y131.632 E.07551
G1 X150.45 Y124.452 E.18419
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X150.454 Y126.452 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X149.222 Y119.318 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.542025
G1 F7200
G1 X149.22 Y118.385 E.03154
G1 X148.713 Y118.386 E.01714
G1 X148.715 Y119.524 E.03845
G1 X149.167 Y119.341 E.01646
G1 X149.669 Y119.619 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X149.666 Y117.937 E.04315
G1 X148.265 Y117.94 E.03594
G1 X148.269 Y120.187 E.05764
G1 X149.614 Y119.642 E.03722
G1 X150.055 Y119.879 F30000
G1 F7200
G1 X150.051 Y117.551 E.05972
G1 X147.879 Y117.555 E.05573
G1 X147.885 Y120.759 E.0822
G1 X150 Y119.901 E.05855
G1 X150.442 Y120.138 F30000
G1 F7200
G1 X150.436 Y117.164 E.07629
G1 X147.493 Y117.17 E.07551
G1 X147.5 Y121.331 E.10675
G1 X150.386 Y120.161 E.07989
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X148.533 Y120.912 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.567 Y122.386 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.542105
G1 F7200
G1 X156.075 Y122.59 E.01849
G1 X156.067 Y118.372 E.14247
G1 X155.559 Y118.373 E.01715
G1 X155.567 Y122.326 E.13353
G1 X155.121 Y122.688 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X156.523 Y123.251 E.03876
G1 X156.513 Y117.924 E.13665
G1 X155.112 Y117.927 E.03595
G1 X155.121 Y122.628 E.12061
G1 X154.736 Y122.949 F30000
G1 F7200
G1 X156.91 Y123.821 E.06009
G1 X156.898 Y117.538 E.1612
G1 X154.725 Y117.542 E.05574
G1 X154.736 Y122.889 E.13718
G1 X154.351 Y123.21 F30000
G1 F7200
G1 X157.297 Y124.392 E.08143
G1 X157.283 Y117.151 E.18575
G1 X154.339 Y117.157 E.07552
G1 X154.35 Y123.15 E.15375
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X154.347 Y121.15 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.493 Y128.696 Z2.84 F30000
G1 X155.58 Y129.265 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.542022
G1 F7200
G1 X155.582 Y130.404 E.03847
G1 X156.09 Y130.403 E.01714
G1 X156.088 Y129.469 E.03155
G1 X155.636 Y129.288 E.01646
G1 X155.132 Y128.604 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X155.136 Y130.852 E.05766
G1 X156.537 Y130.849 E.03594
G1 X156.534 Y129.167 E.04316
G1 X155.188 Y128.627 E.03722
G1 X154.745 Y128.034 F30000
G1 F7200
G1 X154.751 Y131.238 E.08221
G1 X156.924 Y131.234 E.05573
G1 X156.919 Y128.906 E.05973
G1 X154.801 Y128.056 E.05856
G1 X154.358 Y127.463 F30000
G1 F7200
G1 X154.367 Y131.625 E.10677
G1 X157.31 Y131.619 E.07551
G1 X157.305 Y128.645 E.0763
G1 X154.414 Y127.485 E.0799
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X156.27 Y128.23 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X160.939 Y122.191 Z2.84 F30000
G1 X167.829 Y113.278 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X164.082 Y109.532 E.13593
M204 S10000
G1 X162.389 Y108.383 F30000
G1 F3600
M204 S2000
G1 X168.965 Y114.96 E.23861
M204 S10000
G1 X169.639 Y116.179 F30000
G1 F3600
M204 S2000
G1 X161.168 Y107.708 E.30732
G1 X160.137 Y107.223
G1 X170.123 Y117.209 E.3623
G1 X170.498 Y118.13
G1 X159.22 Y106.851 E.4092
G1 X158.377 Y106.553
G1 X170.781 Y118.958 E.45004
G1 X171.012 Y119.734
G1 X157.594 Y106.316 E.48684
G1 X156.868 Y106.135
G1 X171.207 Y120.474 E.52023
G1 X171.354 Y121.167
G1 X156.168 Y105.981 E.55096
G1 X155.505 Y105.863
G1 X171.471 Y121.829 E.57929
G1 X171.568 Y122.472
G1 X154.87 Y105.773 E.60585
G1 X154.252 Y105.701
G1 X171.63 Y123.079 E.63049
G1 X171.684 Y123.679
G1 X153.665 Y105.659 E.65377
G1 X153.086 Y105.626
G1 X171.704 Y124.244 E.67548
G1 X171.722 Y124.807
G1 X152.535 Y105.621 E.69611
G1 X151.991 Y105.622
G1 X171.71 Y125.341 E.71542
G1 X171.695 Y125.871
G1 X151.469 Y105.645 E.73385
G1 X150.955 Y105.676
G1 X171.659 Y126.38 E.75116
G1 X171.615 Y126.882
G1 X150.454 Y105.721 E.76772
G1 X149.968 Y105.78
G1 X171.558 Y127.37 E.78331
G1 X171.488 Y127.846
G1 X149.485 Y105.843 E.79827
G1 X149.024 Y105.927
G1 X171.415 Y128.318 E.81238
G1 X171.321 Y128.77
G1 X148.562 Y106.011 E.82571
G1 X148.118 Y106.111
G1 X171.227 Y129.221 E.83843
G1 X171.119 Y129.658
G1 X147.679 Y106.218 E.85041
G1 X147.245 Y106.329
G1 X157.439 Y116.523 E.36985
G1 X156.894 Y116.524
G1 X146.828 Y106.458 E.36523
G1 X146.41 Y106.586
G1 X156.35 Y116.525 E.36061
G1 X155.806 Y116.526
G1 X146.005 Y106.726 E.35558
G1 X145.608 Y106.874
G1 X155.261 Y116.527 E.35023
G1 X154.717 Y116.528
G1 X145.211 Y107.022 E.34489
G1 X144.831 Y107.188
G1 X154.172 Y116.529 E.33893
G1 X153.71 Y116.613
G1 X144.453 Y107.355 E.33587
G1 X144.077 Y107.525
G1 X153.711 Y117.159 E.34954
G1 X153.712 Y117.705
G1 X143.717 Y107.71 E.36264
G1 X143.357 Y107.896
G1 X153.713 Y118.252 E.37573
G1 X153.714 Y118.798
G1 X143.002 Y108.087 E.38863
G1 X142.66 Y108.29
G1 X150.906 Y116.536 E.29917
G1 X150.362 Y116.537
G1 X142.318 Y108.493 E.29184
G1 X141.983 Y108.703
G1 X149.817 Y116.538 E.28425
G1 X149.273 Y116.539
G1 X141.657 Y108.923 E.2763
G1 X141.332 Y109.143
G1 X148.729 Y116.54 E.26836
G1 X148.184 Y116.541
G1 X141.015 Y109.372 E.2601
G1 X140.706 Y109.608
G1 X147.64 Y116.542 E.25155
G1 X147.095 Y116.543
G1 X140.398 Y109.845 E.243
G1 X140.098 Y110.091
G1 X146.864 Y116.857 E.24547
G1 X146.865 Y117.403
G1 X139.806 Y110.344 E.25611
G1 X139.514 Y110.597
G1 X146.866 Y117.95 E.26676
G1 X146.867 Y118.496
G1 X139.231 Y110.86 E.27703
G1 X138.955 Y111.129
G1 X146.868 Y119.042 E.28709
G1 X146.869 Y119.589
G1 X138.679 Y111.399 E.29715
G1 X138.413 Y111.679
G1 X146.87 Y120.135 E.30682
G1 X146.871 Y120.682
G1 X138.153 Y111.964 E.31629
G1 X137.893 Y112.249
G1 X146.872 Y121.228 E.32576
G1 X146.873 Y121.774
G1 X137.645 Y112.546 E.33481
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X139.059 Y113.96 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X146.501 Y115.654 Z2.84 F30000
G1 X151.063 Y116.693 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X153.715 Y119.345 E.09623
G1 X153.716 Y119.891
G1 X151.064 Y117.239 E.09623
G1 X151.065 Y117.785
G1 X153.717 Y120.438 E.09623
G1 X153.718 Y120.984
G1 X151.066 Y118.332 E.09623
G1 X151.067 Y118.878
G1 X153.719 Y121.531 E.09623
G1 X153.721 Y122.077
G1 X151.068 Y119.425 E.09623
G1 X151.069 Y119.971
G1 X153.722 Y122.624 E.09623
G1 X153.723 Y123.17
G1 X151.07 Y120.518 E.09623
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X152.484 Y121.932 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X157.91 Y116.995 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
M73 P68 R10
G1 F3600
M204 S2000
G1 X171.002 Y130.087 E.47498
G1 X170.885 Y130.515
G1 X157.912 Y117.542 E.47067
G1 X157.913 Y118.088
G1 X170.747 Y130.923 E.46566
G1 X170.61 Y131.331
G1 X157.914 Y118.634 E.46065
G1 X157.915 Y119.181
G1 X170.465 Y131.731 E.45534
G1 X170.308 Y132.12
G1 X157.916 Y119.727 E.44961
G1 X157.917 Y120.274
G1 X170.151 Y132.509 E.44389
G1 X169.982 Y132.884
G1 X157.918 Y120.82 E.4377
G1 X157.919 Y121.367
G1 X169.806 Y133.254 E.4313
G1 X169.631 Y133.624
G1 X157.92 Y121.913 E.4249
G1 X157.921 Y122.459
G1 X169.44 Y133.978 E.41791
G1 X169.246 Y134.33
G1 X157.922 Y123.006 E.41087
G1 X157.923 Y123.552
G1 X169.052 Y134.682 E.40378
G1 X168.842 Y135.017
G1 X157.924 Y124.099 E.39611
G1 X157.925 Y124.645
G1 X168.631 Y135.351 E.38843
G1 X168.418 Y135.684
G1 X157.926 Y125.192 E.38066
G1 X157.231 Y125.042
G1 X158.755 Y126.566 E.05528
G1 X158.808 Y126.619
G1 X168.191 Y136.002 E.34041
G1 X167.963 Y136.32
G1 X156.321 Y124.677 E.42241
G1 X155.41 Y124.312
G1 X167.732 Y136.634 E.44706
G1 X167.488 Y136.936
G1 X154.499 Y123.946 E.47126
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X155.913 Y125.361 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X150.713 Y120.706 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X167.244 Y137.237 E.59977
G1 X166.996 Y137.534
G1 X157.932 Y128.47 E.32884
G1 X157.933 Y129.017
G1 X166.736 Y137.819 E.31937
G1 X166.476 Y138.105
G1 X157.934 Y129.563 E.30989
G1 X157.935 Y130.11
G1 X166.21 Y138.385 E.30022
G1 X165.934 Y138.654
G1 X157.936 Y130.656 E.29017
G1 X157.937 Y131.202
G1 X165.658 Y138.923 E.28011
G1 X165.375 Y139.186
G1 X157.938 Y131.749 E.26983
G1 X157.89 Y132.246
G1 X165.083 Y139.439 E.26097
G1 X164.791 Y139.692
G1 X157.346 Y132.247 E.27011
G1 X156.801 Y132.248
G1 X164.491 Y139.938 E.27901
G1 X164.183 Y140.175
G1 X156.257 Y132.249 E.28755
G1 X155.712 Y132.25
G1 X163.874 Y140.411 E.2961
G1 X163.557 Y140.64
G1 X155.168 Y132.251 E.30436
G1 X154.624 Y132.252
G1 X163.232 Y140.86 E.31231
G1 X162.906 Y141.08
G1 X154.079 Y132.253 E.32025
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X155.493 Y133.667 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X157.514 Y128.052 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X150.325 Y120.863 E.26083
G1 X149.937 Y121.02
G1 X156.603 Y127.687 E.24187
G1 X155.693 Y127.322
G1 X149.549 Y121.178 E.22291
G1 X149.161 Y121.335
G1 X154.782 Y126.956 E.20394
G1 X153.871 Y126.591
G1 X151.076 Y123.796 E.1014
G1 X151.077 Y124.343
G1 X153.73 Y126.995 E.09622
G1 X153.731 Y127.541
G1 X151.078 Y124.889 E.09623
G1 X151.079 Y125.436
G1 X153.732 Y128.088 E.09623
G1 X153.733 Y128.634
G1 X151.081 Y125.982 E.09623
G1 X151.082 Y126.528
G1 X153.734 Y129.181 E.09623
G1 X153.735 Y129.727
G1 X151.083 Y127.075 E.09623
G1 X151.084 Y127.621
G1 X153.736 Y130.274 E.09623
G1 X153.737 Y130.82
G1 X151.085 Y128.168 E.09624
G1 X151.086 Y128.714
G1 X153.738 Y131.367 E.09624
G1 X153.739 Y131.913
G1 X151.087 Y129.261 E.09624
G1 X151.088 Y129.807
G1 X162.571 Y141.291 E.41663
G1 X162.229 Y141.494
G1 X151.089 Y130.353 E.40418
G1 X151.09 Y130.9
G1 X161.887 Y141.697 E.39172
G1 X161.532 Y141.887
G1 X151.091 Y131.446 E.37882
G1 X151.092 Y131.993
G1 X161.172 Y142.073 E.36572
G1 X160.812 Y142.259
G1 X150.813 Y132.259 E.36278
G1 X150.269 Y132.26
G1 X160.436 Y142.428 E.3689
G1 X160.058 Y142.596
G1 X149.724 Y132.261 E.37494
G1 X149.18 Y132.262
G1 X159.678 Y142.761 E.38089
G1 X159.281 Y142.909
G1 X148.635 Y132.263 E.38624
G1 X148.091 Y132.264
G1 X158.884 Y143.057 E.39158
G1 X158.479 Y143.197
G1 X147.547 Y132.265 E.39662
G1 X147.002 Y132.266
G1 X158.061 Y143.326 E.40124
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X156.647 Y141.911 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X154.344 Y134.635 Z2.84 F30000
G1 X150.837 Y123.557 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X148.773 Y121.492 E.07491
G1 X148.385 Y121.65
G1 X150.449 Y123.715 E.07492
G1 X150.061 Y123.872
G1 X147.996 Y121.807 E.07492
G1 X147.608 Y121.964
G1 X149.673 Y124.029 E.07492
G1 X149.285 Y124.187
G1 X147.22 Y122.122 E.07492
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X148.635 Y123.536 E-.228
; WIPE_END
G1 E-.012 F1800
M73 P69 R10
G1 X148.897 Y124.344 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X137.401 Y112.848 E.4171
G1 X137.157 Y113.149
G1 X148.509 Y124.501 E.41187
G1 X148.121 Y124.659
G1 X136.926 Y113.463 E.40618
G1 X136.698 Y113.781
G1 X147.733 Y124.816 E.40035
G1 X147.345 Y124.974
G1 X136.471 Y114.1 E.39452
G1 X136.258 Y114.432
G1 X146.957 Y125.131 E.38818
G1 X146.88 Y125.599
G1 X136.047 Y114.767 E.39302
G1 X135.837 Y115.101
G1 X146.881 Y126.146 E.4007
G1 X146.882 Y126.692
G1 X135.643 Y115.453 E.40778
G1 X135.449 Y115.805
G1 X146.883 Y127.239 E.41483
G1 X146.884 Y127.785
G1 X135.258 Y116.159 E.42182
G1 X135.083 Y116.529
G1 X146.885 Y128.332 E.42822
G1 X146.886 Y128.878
G1 X134.907 Y116.899 E.43462
G1 X134.738 Y117.275
G1 X146.888 Y129.425 E.44081
G1 X146.889 Y129.971
G1 X134.581 Y117.663 E.44654
G1 X134.424 Y118.052
G1 X146.89 Y130.518 E.45226
G1 X146.891 Y131.064
G1 X134.279 Y118.452 E.45757
G1 X134.142 Y118.86
G1 X146.892 Y131.611 E.46259
G1 X146.893 Y132.157
G1 X134.004 Y119.269 E.4676
G1 X133.887 Y119.696
G1 X157.644 Y143.454 E.86194
G1 X157.21 Y143.565
G1 X133.77 Y120.125 E.85041
G1 X133.662 Y120.562
G1 X156.771 Y143.672 E.83843
G1 X156.327 Y143.772
G1 X133.568 Y121.014 E.8257
G1 X133.474 Y121.465
G1 X155.865 Y143.856 E.81237
G1 X155.404 Y143.94
G1 X133.401 Y121.938 E.79827
G1 X133.331 Y122.413
G1 X154.921 Y144.003 E.78331
G1 X154.435 Y144.062
G1 X133.274 Y122.902 E.76772
G1 X133.23 Y123.403
G1 X153.934 Y144.107 E.75115
G1 X153.42 Y144.139
G1 X133.194 Y123.912 E.73384
G1 X133.179 Y124.442
G1 X152.898 Y144.161 E.71542
G1 X152.353 Y144.162
G1 X133.167 Y124.976 E.6961
G1 X133.185 Y125.539
G1 X151.803 Y144.157 E.67548
G1 X151.224 Y144.124
G1 X133.205 Y126.104 E.65376
G1 X133.259 Y126.704
G1 X150.637 Y144.082 E.63048
G1 X150.019 Y144.01
G1 X133.321 Y127.311 E.60584
G1 X133.418 Y127.954
G1 X149.384 Y143.92 E.57928
M73 P69 R9
G1 X148.721 Y143.802
G1 X133.535 Y128.617 E.55096
G1 X133.682 Y129.309
G1 X148.021 Y143.648 E.52022
G1 X147.295 Y143.467
G1 X133.877 Y130.049 E.48683
G1 X134.108 Y130.826
G1 X146.512 Y143.23 E.45003
G1 X145.669 Y142.932
G1 X134.391 Y131.654 E.40919
G1 X134.766 Y132.575
G1 X144.752 Y142.56 E.36228
G1 X143.721 Y142.075
G1 X135.25 Y133.604 E.30731
M204 S10000
G1 X135.924 Y134.823 F30000
G1 F3600
M204 S2000
G1 X142.5 Y141.399 E.23859
M204 S10000
G1 X140.806 Y140.251 F30000
G1 F3600
M204 S2000
G1 X137.06 Y136.505 E.1359
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X138.475 Y137.919 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X144.452 Y133.174 Z2.84 F30000
G1 X168.438 Y114.131 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0831641
G1 F18000
G1 X168.409 Y114.095 E.00015
; LINE_WIDTH: 0.109661
G1 X168.195 Y113.843 E.00166
; LINE_WIDTH: 0.157581
G1 X167.981 Y113.592 E.00271
; LINE_WIDTH: 0.205502
G1 X167.767 Y113.34 E.00376
G1 X169.284 Y115.524 F30000
; LINE_WIDTH: 0.104371
G1 F18000
G1 X169.177 Y115.381 E.00083
; LINE_WIDTH: 0.151895
G1 X169.07 Y115.239 E.00139
; LINE_WIDTH: 0.209364
G1 X168.963 Y115.097 E.00207
G1 X168.983 Y114.952 E.0017
G1 X169.864 Y116.65 F30000
; LINE_WIDTH: 0.102345
G1 F18000
G1 X169.768 Y116.514 E.00075
; LINE_WIDTH: 0.145815
G1 X169.672 Y116.378 E.00123
; LINE_WIDTH: 0.189286
G1 X169.576 Y116.242 E.00172
G1 X171.365 Y121.451 F30000
; LINE_WIDTH: 0.13802
G1 F18000
G1 X171.365 Y121.155 E.00204
G1 X171.423 Y121.485 F30000
; LINE_WIDTH: 0.0867178
G1 F18000
G1 X171.293 Y121.228 E.001
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X171.423 Y121.485 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X166.119 Y126.974 Z2.84 F30000
G1 X149.69 Y143.975 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.092525
G1 F18000
G1 X149.447 Y143.858 E.00104
G1 X145.19 Y142.753 F30000
; LINE_WIDTH: 0.101762
G1 F18000
G1 X145.065 Y142.667 E.00068
; LINE_WIDTH: 0.144082
G1 X144.94 Y142.582 E.00111
; LINE_WIDTH: 0.186403
G1 X144.815 Y142.497 E.00153
G1 X143.09 Y141.745 F30000
; LINE_WIDTH: 0.103818
G1 F18000
G1 X142.914 Y141.609 E.00103
; LINE_WIDTH: 0.150232
G1 X142.738 Y141.473 E.00171
; LINE_WIDTH: 0.196646
G1 X142.563 Y141.337 E.0024
G1 X141.655 Y140.857 F30000
; LINE_WIDTH: 0.104069
G1 F18000
G1 X141.46 Y140.696 E.00117
; LINE_WIDTH: 0.150975
G1 X141.264 Y140.535 E.00196
; LINE_WIDTH: 0.188857
G1 X141.066 Y140.362 E.0027
; LINE_WIDTH: 0.217716
G1 X140.868 Y140.189 E.00321
G1 X137.122 Y136.443 F30000
; LINE_WIDTH: 0.205485
G1 F18000
G1 X136.908 Y136.192 E.00376
; LINE_WIDTH: 0.157532
G1 X136.694 Y135.94 E.00271
; LINE_WIDTH: 0.109578
G1 X136.48 Y135.688 E.00165
; LINE_WIDTH: 0.0831142
G1 X136.451 Y135.652 E.00015
G1 X135.906 Y134.831 F30000
; LINE_WIDTH: 0.221803
M73 P70 R9
G1 F18000
G1 X135.927 Y134.687 E.00182
; LINE_WIDTH: 0.199448
G1 X135.819 Y134.544 E.00196
; LINE_WIDTH: 0.151912
G1 X135.712 Y134.402 E.00139
; LINE_WIDTH: 0.104377
G1 X135.605 Y134.26 E.00083
G1 X135.314 Y133.541 F30000
; LINE_WIDTH: 0.189284
G1 F18000
G1 X135.217 Y133.405 E.00172
; LINE_WIDTH: 0.145814
G1 X135.121 Y133.269 E.00123
; LINE_WIDTH: 0.102344
G1 X135.025 Y133.134 E.00075
G1 X133.596 Y128.555 F30000
; LINE_WIDTH: 0.0866554
G1 F18000
G1 X133.466 Y128.298 E.001
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X133.596 Y128.555 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X138.897 Y123.064 Z2.84 F30000
G1 X155.442 Y105.926 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.0925834
G1 F18000
G1 X155.199 Y105.808 E.00104
G1 X158.277 Y106.653 F30000
; LINE_WIDTH: 0.13784
G1 F18000
G1 X158.062 Y106.438 E.0021
G1 X160.074 Y107.286 F30000
; LINE_WIDTH: 0.186405
G1 F18000
G1 X159.948 Y107.201 E.00153
; LINE_WIDTH: 0.144083
G1 X159.823 Y107.115 E.00111
; LINE_WIDTH: 0.101762
G1 X159.698 Y107.03 E.00068
G1 X162.326 Y108.446 F30000
; LINE_WIDTH: 0.196646
G1 F18000
G1 X162.15 Y108.31 E.0024
; LINE_WIDTH: 0.150232
G1 X161.975 Y108.174 E.00171
; LINE_WIDTH: 0.103818
G1 X161.799 Y108.038 E.00103
G1 X164.021 Y109.593 F30000
; LINE_WIDTH: 0.217754
G1 F18000
G1 X163.823 Y109.421 E.00321
; LINE_WIDTH: 0.188947
G1 X163.625 Y109.248 E.0027
; LINE_WIDTH: 0.151066
G1 X163.429 Y109.087 E.00197
; LINE_WIDTH: 0.104099
G1 X163.233 Y108.926 E.00118
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X163.429 Y109.087 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X160.975 Y116.314 Z2.84 F30000
G1 X158.022 Y125.015 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.0856118
G1 F18000
G1 X157.906 Y124.952 E.00045
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X158.022 Y125.015 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X158.004 Y128.27 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.0811569
G1 F18000
G1 X157.578 Y127.988 E.00159
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X158.004 Y128.27 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X150.832 Y130.879 Z2.84 F30000
G1 X146.992 Y132.277 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.137764
G1 F18000
G1 X146.929 Y132.289 E.00044
; LINE_WIDTH: 0.166123
G1 X146.858 Y132.293 E.00063
; LINE_WIDTH: 0.164275
G1 X146.862 Y132.27 E.0002
; LINE_WIDTH: 0.121386
G3 X146.912 Y132.138 I.363 J.061 E.00083
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X146.862 Y132.27 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X154.343 Y130.758 Z2.84 F30000
G1 X170.668 Y127.457 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X170.668 Y122.322 E.00769
G1 X170.518 Y121.408 F30000
G1 F3600
G1 X170.518 Y128.369 E.01042
G1 X170.368 Y129.088 F30000
G1 F3600
G1 X170.368 Y120.702 E.01255
G1 X170.218 Y120.119 F30000
G1 F3600
G1 X170.218 Y129.663 E.01429
G1 X170.068 Y130.216 F30000
G1 F3600
G1 X170.068 Y119.574 E.01593
G1 X169.918 Y119.115 F30000
G1 F3600
G1 X169.918 Y130.666 E.01729
G1 X169.768 Y131.113 F30000
G1 F3600
G1 X169.768 Y118.674 E.01862
G1 X169.618 Y118.269 F30000
G1 F3600
G1 X169.618 Y131.33 E.01955
G1 X169.468 Y131.702 E.0006
G1 X169.468 Y118.08 E.02039
G1 X169.318 Y117.712 E.00059
G1 X169.318 Y132.074 E.0215
G3 X169.168 Y132.417 I-2.97 J-1.093 E.00056
G1 X169.168 Y117.362 E.02253
G1 X169.018 Y117.049 E.00052
G1 X169.018 Y132.734 E.02348
G1 X168.868 Y133.05 E.00052
G1 X168.868 Y116.736 E.02442
G2 X168.718 Y116.431 I-2.643 J1.111 E.00051
G1 X168.718 Y133.349 E.02532
G1 X168.568 Y133.622 E.00047
G1 X168.568 Y116.16 E.02614
G1 X168.418 Y115.889 E.00046
G1 X168.418 Y133.896 E.02695
G1 X168.268 Y134.169 E.00047
G1 X168.268 Y115.618 E.02776
G2 X168.118 Y115.371 I-2.159 J1.141 E.00043
G1 X168.118 Y134.41 E.0285
G1 X167.968 Y134.649 E.00042
G1 X167.968 Y115.134 E.02921
G1 X167.818 Y114.898 E.00042
G1 X167.818 Y134.887 E.02992
G3 X167.668 Y135.124 I-2.074 J-1.148 E.00042
G1 X167.668 Y114.661 E.03063
G2 X167.518 Y114.447 I-1.876 J1.157 E.00039
G1 X167.518 Y135.334 E.03126
G1 X167.368 Y135.544 E.00039
G1 X167.368 Y114.239 E.03189
G1 X167.218 Y114.031 E.00038
G1 X167.218 Y135.754 E.03251
G1 X167.069 Y135.963 E.00039
G1 X167.069 Y113.823 E.03314
G2 X166.919 Y113.628 I-1.714 J1.167 E.00037
G1 X166.919 Y136.153 E.03371
G1 X166.769 Y136.338 E.00036
G1 X166.769 Y113.444 E.03427
G1 X166.619 Y113.26 E.00036
G1 X166.619 Y136.524 E.03482
G1 X166.469 Y136.709 E.00036
G1 X166.469 Y113.076 E.03537
G1 X166.319 Y112.892 E.00036
G1 X166.319 Y136.889 E.03592
G1 X166.169 Y137.053 E.00033
G1 X166.169 Y112.728 E.03641
G1 X166.019 Y112.565 E.00033
G1 X166.019 Y137.218 E.0369
G1 X165.869 Y137.383 E.00033
G1 X165.869 Y112.401 E.03739
G1 X165.719 Y112.238 E.00033
G1 X165.719 Y137.547 E.03788
G3 X165.569 Y137.704 I-1.399 J-1.186 E.00033
G1 X165.569 Y112.076 E.03836
G1 X165.419 Y111.931 E.00031
G1 X165.419 Y137.85 E.03879
G1 X165.269 Y137.996 E.00031
G1 X165.269 Y111.786 E.03923
G1 X165.119 Y111.641 E.00031
G1 X165.119 Y138.143 E.03966
G1 X164.969 Y138.289 E.00031
G1 X164.969 Y111.496 E.0401
G1 X164.819 Y111.351 E.00031
G1 X164.819 Y138.431 E.04053
G1 X164.669 Y138.561 E.0003
G1 X164.669 Y111.22 E.04092
G1 X164.519 Y111.092 E.0003
G1 X164.519 Y138.691 E.04131
G1 X164.369 Y138.821 E.0003
G1 X164.369 Y110.963 E.04169
G1 X164.219 Y110.834 E.0003
G1 X164.219 Y138.95 E.04208
G1 X164.069 Y139.08 E.0003
G1 X164.069 Y110.705 E.04247
G2 X163.919 Y110.582 I-1.114 J1.203 E.00029
G1 X163.919 Y139.199 E.04283
G1 X163.769 Y139.314 E.00028
G1 X163.769 Y110.468 E.04317
G1 X163.619 Y110.354 E.00028
G1 X163.619 Y139.429 E.04352
G1 X163.469 Y139.544 E.00028
G1 X163.469 Y110.24 E.04386
G1 X163.319 Y110.126 E.00028
G1 X163.319 Y139.659 E.0442
G1 X163.169 Y139.774 E.00028
G1 X163.169 Y110.012 E.04454
G2 X163.019 Y109.906 I-.966 J1.211 E.00027
G1 X163.019 Y139.875 E.04486
G1 X162.869 Y139.977 E.00027
G1 X162.869 Y109.805 E.04516
G1 X162.719 Y109.705 E.00027
G1 X162.719 Y140.078 E.04546
G1 X162.569 Y140.18 E.00027
G1 X162.569 Y109.604 E.04576
G1 X162.419 Y109.504 E.00027
G1 X162.419 Y140.281 E.04606
G1 X162.269 Y140.382 E.00027
G1 X162.269 Y109.403 E.04637
G2 X162.119 Y109.31 I-.86 J1.216 E.00026
G1 X162.119 Y140.472 E.04664
G1 X161.969 Y140.561 E.00026
G1 X161.969 Y109.221 E.04691
G1 X161.819 Y109.133 E.00026
G1 X161.819 Y140.65 E.04717
G1 X161.669 Y140.739 E.00026
G1 X161.669 Y109.045 E.04744
G1 X161.519 Y108.957 E.00026
G1 X161.519 Y140.828 E.0477
G1 X161.369 Y140.916 E.00026
G1 X161.369 Y108.869 E.04797
G2 X161.219 Y108.784 I-.786 J1.224 E.00026
G1 X161.219 Y140.997 E.04821
G1 X161.069 Y141.074 E.00025
G1 X161.069 Y108.708 E.04844
G1 X160.919 Y108.631 E.00025
G1 X160.919 Y141.151 E.04867
G1 X160.769 Y141.229 E.00025
G1 X160.769 Y108.555 E.0489
G1 X160.619 Y108.478 E.00025
G1 X160.619 Y141.306 E.04913
G1 X160.469 Y141.383 E.00025
G1 X160.469 Y108.401 E.04936
G1 X160.319 Y108.325 E.00025
G1 X160.319 Y141.457 E.04959
G1 X160.169 Y141.524 E.00025
G1 X160.169 Y108.258 E.04979
G1 X160.019 Y108.192 E.00025
G1 X160.019 Y141.59 E.04999
G1 X159.869 Y141.657 E.00025
G1 X159.869 Y108.126 E.05019
G1 X159.719 Y108.06 E.00025
G1 X159.719 Y141.723 E.05038
G1 X159.569 Y141.79 E.00025
G1 X159.569 Y107.995 E.05058
G1 X159.419 Y107.929 E.00025
G1 X159.419 Y141.856 E.05078
G3 X159.269 Y141.915 I-.576 J-1.235 E.00024
G1 X159.269 Y107.866 E.05096
G1 X159.119 Y107.811 E.00024
G1 X159.119 Y141.971 E.05113
G1 X158.969 Y142.027 E.00024
G1 X158.969 Y107.755 E.0513
G1 X158.819 Y107.7 E.00024
G1 X158.819 Y142.083 E.05146
G1 X158.669 Y142.139 E.00024
G1 X158.669 Y133.18 E.01341
G1 X158.519 Y133.18 E.00022
G1 X158.519 Y142.196 E.01349
G1 X158.369 Y142.252 E.00024
G1 X158.369 Y133.18 E.01358
G1 X158.219 Y133.18 E.00022
G1 X158.219 Y142.299 E.01365
G1 X158.069 Y142.345 E.00023
M73 P71 R9
G1 X158.069 Y133.181 E.01372
G1 X157.919 Y133.181 E.00022
G1 X157.919 Y142.391 E.01378
G1 X157.769 Y142.437 E.00023
G1 X157.769 Y133.181 E.01385
G1 X157.619 Y133.182 E.00022
G1 X157.619 Y142.483 E.01392
G1 X157.469 Y142.529 E.00023
G1 X157.469 Y133.182 E.01399
G1 X157.319 Y133.182 E.00022
G1 X157.319 Y142.575 E.01406
G1 X157.169 Y142.612 E.00023
G1 X157.169 Y133.182 E.01411
G1 X157.019 Y133.183 E.00022
G1 X157.019 Y142.649 E.01417
G1 X156.869 Y142.685 E.00023
G1 X156.869 Y133.183 E.01422
G1 X156.719 Y133.183 E.00022
G1 X156.719 Y142.722 E.01428
G1 X156.569 Y142.759 E.00023
G1 X156.569 Y133.184 E.01433
G1 X156.419 Y133.184 E.00022
G1 X156.419 Y142.795 E.01439
G1 X156.269 Y142.832 E.00023
G1 X156.269 Y133.184 E.01444
G1 X156.119 Y133.184 E.00022
G1 X156.119 Y142.86 E.01448
G1 X155.969 Y142.887 E.00023
G1 X155.969 Y133.185 E.01452
G1 X155.819 Y133.185 E.00022
G1 X155.819 Y142.914 E.01456
G1 X155.669 Y142.941 E.00023
G1 X155.669 Y133.185 E.0146
G1 X155.519 Y133.185 E.00022
G1 X155.519 Y142.969 E.01464
G1 X155.369 Y142.996 E.00023
G1 X155.369 Y133.186 E.01468
G1 X155.219 Y133.186 E.00022
G1 X155.219 Y143.023 E.01472
G3 X155.069 Y143.043 I-.244 J-1.251 E.00023
G1 X155.069 Y133.186 E.01475
G1 X154.919 Y133.187 E.00022
G1 X154.919 Y143.061 E.01478
G1 X154.769 Y143.08 E.00023
G1 X154.769 Y133.187 E.01481
G1 X154.619 Y133.187 E.00022
G1 X154.619 Y143.098 E.01483
G1 X154.469 Y143.116 E.00023
G1 X154.469 Y133.187 E.01486
G1 X154.319 Y133.188 E.00022
G1 X154.319 Y143.134 E.01489
G1 X154.169 Y143.152 E.00023
G1 X154.169 Y133.188 E.01491
G1 X154.019 Y133.188 E.00022
G1 X154.019 Y143.165 E.01493
G1 X153.869 Y143.174 E.00022
G1 X153.869 Y133.189 E.01495
G1 X153.719 Y133.189 E.00022
G1 X153.719 Y143.183 E.01496
G1 X153.569 Y143.193 E.00022
G1 X153.569 Y133.189 E.01497
G1 X153.419 Y133.189 E.00022
G1 X153.419 Y143.202 E.01499
G1 X153.269 Y143.211 E.00022
G1 X153.269 Y133.19 E.015
G1 X153.119 Y133.19 E.00022
G1 X153.119 Y143.22 E.01501
G3 X152.969 Y143.226 I-.126 J-1.261 E.00022
G1 X152.969 Y133.123 E.01512
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X152.969 Y135.123 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X157.571 Y129.034 Z2.84 F30000
G1 X158.669 Y127.581 Z2.84
G1 Z2.44
M73 P72 R9
G1 E.8 F1800
G1 F3600
G1 X158.669 Y126.627 E.00143
G1 X158.519 Y126.567 E.00024
G1 X158.519 Y127.448 E.00132
G1 X158.369 Y127.388 E.00024
G1 X158.369 Y126.506 E.00132
G1 X158.219 Y126.446 E.00024
G1 X158.219 Y127.328 E.00132
G1 X158.069 Y127.267 E.00024
G1 X158.069 Y126.386 E.00132
G1 X157.919 Y126.326 E.00024
G1 X157.919 Y127.207 E.00132
G1 X157.769 Y127.147 E.00024
G1 X157.769 Y126.266 E.00132
G1 X157.619 Y126.206 E.00024
G1 X157.619 Y127.087 E.00132
G1 X157.469 Y127.027 E.00024
G1 X157.469 Y126.145 E.00132
G1 X157.319 Y126.085 E.00024
G1 X157.319 Y126.967 E.00132
G1 X157.169 Y126.906 E.00024
G1 X157.169 Y126.025 E.00132
G1 X157.019 Y125.965 E.00024
G1 X157.019 Y126.846 E.00132
G1 X156.869 Y126.786 E.00024
G1 X156.869 Y125.905 E.00132
G1 X156.719 Y125.845 E.00024
G1 X156.719 Y126.726 E.00132
G1 X156.569 Y126.666 E.00024
G1 X156.569 Y125.784 E.00132
G1 X156.419 Y125.724 E.00024
G1 X156.419 Y126.606 E.00132
G1 X156.269 Y126.545 E.00024
G1 X156.269 Y125.664 E.00132
G1 X156.119 Y125.604 E.00024
G1 X156.119 Y126.485 E.00132
G1 X155.969 Y126.425 E.00024
G1 X155.969 Y125.544 E.00132
G1 X155.819 Y125.484 E.00024
G1 X155.819 Y126.365 E.00132
G1 X155.669 Y126.305 E.00024
G1 X155.669 Y125.423 E.00132
G1 X155.519 Y125.363 E.00024
G1 X155.519 Y126.245 E.00132
G1 X155.369 Y126.184 E.00024
G1 X155.369 Y125.303 E.00132
G1 X155.219 Y125.243 E.00024
G1 X155.219 Y126.124 E.00132
G1 X155.069 Y126.064 E.00024
G1 X155.069 Y125.183 E.00132
G1 X154.919 Y125.123 E.00024
G1 X154.919 Y126.004 E.00132
G1 X154.769 Y125.944 E.00024
G1 X154.769 Y125.062 E.00132
G1 X154.619 Y125.002 E.00024
G1 X154.619 Y125.884 E.00132
G1 X154.469 Y125.823 E.00024
G1 X154.469 Y124.942 E.00132
G1 X154.319 Y124.882 E.00024
G1 X154.319 Y125.763 E.00132
G1 X154.169 Y125.703 E.00024
G1 X154.169 Y124.822 E.00132
G1 X154.019 Y124.761 E.00024
G1 X154.019 Y125.643 E.00132
G1 X153.869 Y125.583 E.00024
G1 X153.869 Y124.701 E.00132
G1 X153.719 Y124.641 E.00024
G1 X153.719 Y125.523 E.00132
G1 X153.569 Y125.462 E.00024
M73 P72 R8
G1 X153.569 Y124.581 E.00132
G1 X153.419 Y124.521 E.00024
G1 X153.419 Y125.402 E.00132
G1 X153.269 Y125.342 E.00024
G1 X153.269 Y124.461 E.00132
G1 X153.119 Y124.4 E.00024
G1 X153.119 Y125.282 E.00132
G1 X152.969 Y125.222 E.00024
G1 X152.969 Y124.268 E.00143
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X152.969 Y125.222 E-.10878
G1 X153.119 Y125.282 E-.01842
G1 X153.119 Y124.4 E-.10048
G1 X153.122 Y124.401 E-.00032
; WIPE_END
G1 E-.012 F1800
G1 X157.209 Y117.956 Z2.84 F30000
G1 X158.669 Y115.653 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X158.669 Y107.644 E.01199
G1 X158.519 Y107.589 E.00024
G1 X158.519 Y115.586 E.01197
G1 X158.369 Y115.586 E.00022
G1 X158.369 Y107.534 E.01205
G2 X158.219 Y107.483 I-.504 J1.238 E.00024
G1 X158.219 Y115.587 E.01213
G1 X158.069 Y115.587 E.00022
G1 X158.069 Y107.437 E.0122
G1 X157.919 Y107.392 E.00023
G1 X157.919 Y115.587 E.01227
G1 X157.769 Y115.588 E.00022
G1 X157.769 Y107.346 E.01234
G1 X157.619 Y107.301 E.00023
G1 X157.619 Y115.588 E.0124
G1 X157.469 Y115.588 E.00022
G1 X157.469 Y107.255 E.01247
G1 X157.319 Y107.21 E.00023
G1 X157.319 Y115.588 E.01254
G1 X157.169 Y115.589 E.00022
G1 X157.169 Y107.169 E.0126
G1 X157.019 Y107.133 E.00023
G1 X157.019 Y115.589 E.01266
G1 X156.869 Y115.589 E.00022
G1 X156.869 Y107.097 E.01271
G1 X156.719 Y107.061 E.00023
G1 X156.719 Y115.59 E.01276
G1 X156.569 Y115.59 E.00022
G1 X156.569 Y107.025 E.01282
G1 X156.419 Y106.989 E.00023
G1 X156.419 Y115.59 E.01287
G1 X156.269 Y115.59 E.00022
G1 X156.269 Y106.953 E.01293
G2 X156.119 Y106.922 I-.342 J1.249 E.00023
G1 X156.119 Y115.591 E.01297
G1 X155.969 Y115.591 E.00022
G1 X155.969 Y106.895 E.01302
G1 X155.819 Y106.868 E.00023
G1 X155.819 Y115.591 E.01306
G1 X155.669 Y115.592 E.00022
G1 X155.669 Y106.842 E.0131
G1 X155.519 Y106.815 E.00023
G1 X155.519 Y115.592 E.01314
G1 X155.369 Y115.592 E.00022
G1 X155.369 Y106.788 E.01318
G1 X155.219 Y106.762 E.00023
G1 X155.219 Y115.592 E.01322
G1 X155.069 Y115.593 E.00022
G1 X155.069 Y106.738 E.01325
G1 X154.919 Y106.721 E.00023
G1 X154.919 Y115.593 E.01328
G1 X154.769 Y115.593 E.00022
G1 X154.769 Y106.703 E.01331
G1 X154.619 Y106.685 E.00023
G1 X154.619 Y115.594 E.01333
G1 X154.469 Y115.594 E.00022
G1 X154.469 Y106.668 E.01336
G1 X154.319 Y106.65 E.00023
G1 X154.319 Y115.594 E.01339
G1 X154.169 Y115.594 E.00022
G1 X154.169 Y106.633 E.01341
G2 X154.019 Y106.616 I-.213 J1.252 E.00023
G1 X154.019 Y115.595 E.01344
G1 X153.869 Y115.595 E.00022
G1 X153.869 Y106.608 E.01345
G1 X153.719 Y106.599 E.00022
G1 X153.719 Y115.595 E.01346
G1 X153.569 Y115.595 E.00022
G1 X153.569 Y106.59 E.01348
G1 X153.419 Y106.582 E.00022
G1 X153.419 Y115.596 E.01349
G1 X153.269 Y115.596 E.00022
G1 X153.269 Y106.573 E.0135
G1 X153.119 Y106.565 E.00022
G1 X153.119 Y115.596 E.01352
G1 X152.969 Y115.597 E.00022
G1 X152.969 Y106.556 E.01353
G2 X152.819 Y106.555 I-.081 J1.265 E.00022
G1 X152.819 Y143.226 E.05489
G1 X152.669 Y143.227 E.00022
G1 X152.669 Y106.556 E.05489
G1 X152.519 Y106.556 E.00022
G1 X152.519 Y143.227 E.05489
G1 X152.369 Y143.227 E.00022
G1 X152.369 Y106.556 E.05489
G1 X152.219 Y106.556 E.00022
G1 X152.219 Y143.228 E.05489
G1 X152.07 Y143.228 E.00022
G1 X152.07 Y106.557 E.05489
G1 X151.92 Y106.557 E.00022
G1 X151.92 Y115.599 E.01353
G1 X151.77 Y115.599 E.00022
G1 X151.77 Y106.563 E.01352
G1 X151.62 Y106.572 E.00022
G1 X151.62 Y115.599 E.01351
G1 X151.47 Y115.599 E.00022
G1 X151.47 Y106.581 E.0135
G1 X151.32 Y106.591 E.00022
G1 X151.32 Y115.6 E.01348
G1 X151.17 Y115.6 E.00022
G1 X151.17 Y106.6 E.01347
G1 X151.02 Y106.609 E.00022
G1 X151.02 Y115.6 E.01346
G1 X150.87 Y115.601 E.00022
G1 X150.87 Y106.618 E.01344
G2 X150.72 Y106.631 I.033 J1.269 E.00023
G1 X150.72 Y115.601 E.01343
G1 X150.57 Y115.601 E.00022
G1 X150.57 Y106.649 E.0134
G1 X150.42 Y106.667 E.00023
G1 X150.42 Y115.601 E.01337
G1 X150.27 Y115.602 E.00022
G1 X150.27 Y106.685 E.01335
G1 X150.12 Y106.704 E.00023
G1 X150.12 Y115.602 E.01332
G1 X149.97 Y115.602 E.00022
G1 X149.97 Y106.722 E.01329
G1 X149.82 Y106.74 E.00023
G1 X149.82 Y115.603 E.01326
G1 X149.67 Y115.603 E.00022
G1 X149.67 Y106.76 E.01324
G1 X149.52 Y106.787 E.00023
G1 X149.52 Y115.603 E.01319
G1 X149.37 Y115.603 E.00022
G1 X149.37 Y106.814 E.01315
G1 X149.22 Y106.842 E.00023
G1 X149.22 Y115.604 E.01311
G1 X149.07 Y115.604 E.00022
G1 X149.07 Y106.869 E.01307
G1 X148.92 Y106.896 E.00023
G1 X148.92 Y115.604 E.01303
G1 X148.77 Y115.605 E.00022
G1 X148.77 Y106.923 E.01299
G2 X148.62 Y106.952 I.161 J1.275 E.00023
G1 X148.62 Y115.605 E.01295
G1 X148.47 Y115.605 E.00022
G1 X148.47 Y106.988 E.0129
G1 X148.32 Y107.025 E.00023
G1 X148.32 Y115.605 E.01284
G1 X148.17 Y115.606 E.00022
G1 X148.17 Y107.061 E.01279
G1 X148.02 Y107.098 E.00023
G1 X148.02 Y115.606 E.01273
G1 X147.87 Y115.606 E.00022
G1 X147.87 Y107.134 E.01268
G1 X147.72 Y107.171 E.00023
G1 X147.72 Y115.607 E.01263
G1 X147.57 Y115.607 E.00022
G1 X147.57 Y107.208 E.01257
G1 X147.42 Y107.254 E.00023
G1 X147.42 Y115.607 E.0125
G1 X147.27 Y115.607 E.00022
G1 X147.27 Y107.3 E.01243
G1 X147.12 Y107.346 E.00023
G1 X147.12 Y115.608 E.01237
G1 X146.97 Y115.608 E.00022
G1 X146.97 Y107.392 E.0123
G1 X146.82 Y107.438 E.00023
G1 X146.82 Y115.608 E.01223
G1 X146.67 Y115.608 E.00022
G1 X146.67 Y107.484 E.01216
G2 X146.52 Y107.532 I.322 J1.284 E.00024
G1 X146.52 Y115.609 E.01209
G1 X146.37 Y115.609 E.00022
G1 X146.37 Y107.588 E.01201
G1 X146.22 Y107.644 E.00024
G1 X146.22 Y115.609 E.01192
G1 X146.07 Y115.61 E.00022
G1 X146.07 Y107.628 E.01195
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X146.07 Y109.628 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X149.524 Y116.434 Z2.84 F30000
G1 X151.92 Y121.153 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X151.92 Y122.109 E.00143
G1 X151.77 Y122.17 E.00024
M73 P73 R8
G1 X151.77 Y121.286 E.00132
G1 X151.62 Y121.347 E.00024
G1 X151.62 Y122.231 E.00132
G1 X151.47 Y122.292 E.00024
G1 X151.47 Y121.408 E.00132
G1 X151.32 Y121.469 E.00024
G1 X151.32 Y122.353 E.00132
G1 X151.17 Y122.414 E.00024
G1 X151.17 Y121.53 E.00132
G1 X151.02 Y121.591 E.00024
G1 X151.02 Y122.474 E.00132
G1 X150.87 Y122.535 E.00024
G1 X150.87 Y121.651 E.00132
G1 X150.72 Y121.712 E.00024
G1 X150.72 Y122.596 E.00132
G1 X150.57 Y122.657 E.00024
G1 X150.57 Y121.773 E.00132
G1 X150.42 Y121.834 E.00024
G1 X150.42 Y122.718 E.00132
G1 X150.27 Y122.778 E.00024
G1 X150.27 Y121.895 E.00132
G1 X150.12 Y121.955 E.00024
G1 X150.12 Y122.839 E.00132
G1 X149.97 Y122.9 E.00024
G1 X149.97 Y122.016 E.00132
G1 X149.82 Y122.077 E.00024
G1 X149.82 Y122.961 E.00132
G1 X149.67 Y123.022 E.00024
G1 X149.67 Y122.138 E.00132
G1 X149.52 Y122.199 E.00024
G1 X149.52 Y123.083 E.00132
G1 X149.37 Y123.143 E.00024
G1 X149.37 Y122.259 E.00132
G1 X149.22 Y122.32 E.00024
G1 X149.22 Y123.204 E.00132
G1 X149.07 Y123.265 E.00024
G1 X149.07 Y122.381 E.00132
G1 X148.92 Y122.442 E.00024
G1 X148.92 Y123.326 E.00132
G1 X148.77 Y123.387 E.00024
G1 X148.77 Y122.503 E.00132
G1 X148.62 Y122.563 E.00024
G1 X148.62 Y123.448 E.00132
G1 X148.47 Y123.508 E.00024
G1 X148.47 Y122.624 E.00132
G1 X148.32 Y122.685 E.00024
G1 X148.32 Y123.569 E.00132
G1 X148.17 Y123.63 E.00024
G1 X148.17 Y122.746 E.00132
G1 X148.02 Y122.807 E.00024
G1 X148.02 Y123.691 E.00132
G1 X147.87 Y123.752 E.00024
G1 X147.87 Y122.868 E.00132
G1 X147.72 Y122.928 E.00024
G1 X147.72 Y123.813 E.00132
G1 X147.57 Y123.873 E.00024
G1 X147.57 Y122.989 E.00132
G1 X147.42 Y123.05 E.00024
G1 X147.42 Y123.934 E.00132
G1 X147.27 Y123.995 E.00024
G1 X147.27 Y123.111 E.00132
G1 X147.12 Y123.172 E.00024
G1 X147.12 Y124.056 E.00132
G1 X146.97 Y124.117 E.00024
G1 X146.97 Y123.232 E.00132
G1 X146.82 Y123.293 E.00024
G1 X146.82 Y124.177 E.00132
G1 X146.67 Y124.238 E.00024
G1 X146.67 Y123.354 E.00132
G1 X146.52 Y123.415 E.00024
G1 X146.52 Y124.299 E.00132
G1 X146.37 Y124.36 E.00024
G1 X146.37 Y123.476 E.00132
G1 X146.22 Y123.536 E.00024
G1 X146.22 Y124.421 E.00132
G1 X146.07 Y124.482 E.00024
G1 X146.07 Y123.524 E.00143
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X146.07 Y124.482 E-.10912
G1 X146.22 Y124.421 E-.01845
G1 X146.22 Y123.54 E-.10043
; WIPE_END
G1 E-.012 F1800
G1 X150.121 Y130.1 Z2.84 F30000
G1 X151.92 Y133.125 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X151.92 Y143.227 E.01512
G1 X151.77 Y143.219 E.00022
G1 X151.77 Y133.193 E.01501
G1 X151.62 Y133.193 E.00022
G1 X151.62 Y143.21 E.01499
G1 X151.47 Y143.201 E.00022
G1 X151.47 Y133.193 E.01498
G1 X151.32 Y133.193 E.00022
G1 X151.32 Y143.193 E.01497
G1 X151.17 Y143.184 E.00022
G1 X151.17 Y133.194 E.01495
G1 X151.02 Y133.194 E.00022
G1 X151.02 Y143.176 E.01494
G1 X150.87 Y143.167 E.00022
G1 X150.87 Y133.194 E.01493
G1 X150.72 Y133.194 E.00022
G1 X150.72 Y143.15 E.0149
G1 X150.57 Y143.133 E.00023
G1 X150.57 Y133.195 E.01487
G1 X150.42 Y133.195 E.00022
G1 X150.42 Y143.115 E.01485
G1 X150.27 Y143.098 E.00023
G1 X150.27 Y133.195 E.01482
G1 X150.12 Y133.196 E.00022
G1 X150.12 Y143.08 E.01479
G1 X149.97 Y143.063 E.00023
G1 X149.97 Y133.196 E.01477
G1 X149.82 Y133.196 E.00022
G1 X149.82 Y143.045 E.01474
G3 X149.67 Y143.021 I.125 J-1.277 E.00023
G1 X149.67 Y133.196 E.0147
G1 X149.52 Y133.197 E.00022
G1 X149.52 Y142.995 E.01466
G1 X149.37 Y142.968 E.00023
G1 X149.37 Y133.197 E.01462
G1 X149.22 Y133.197 E.00022
G1 X149.22 Y142.941 E.01458
G1 X149.07 Y142.915 E.00023
G1 X149.07 Y133.198 E.01454
G1 X148.92 Y133.198 E.00022
G1 X148.92 Y142.888 E.0145
G1 X148.77 Y142.861 E.00023
G1 X148.77 Y133.198 E.01446
G1 X148.62 Y133.198 E.00022
G1 X148.62 Y142.83 E.01442
G1 X148.47 Y142.794 E.00023
G1 X148.47 Y133.199 E.01436
G1 X148.32 Y133.199 E.00022
G1 X148.32 Y142.758 E.01431
G1 X148.17 Y142.722 E.00023
G1 X148.17 Y133.199 E.01425
G1 X148.02 Y133.2 E.00022
G1 X148.02 Y142.686 E.0142
G1 X147.87 Y142.65 E.00023
G1 X147.87 Y133.2 E.01414
G1 X147.72 Y133.2 E.00022
G1 X147.72 Y142.614 E.01409
G3 X147.57 Y142.573 I.267 J-1.283 E.00023
G1 X147.57 Y133.2 E.01403
G1 X147.42 Y133.201 E.00022
G1 X147.42 Y142.528 E.01396
G1 X147.27 Y142.482 E.00023
G1 X147.27 Y133.201 E.01389
G1 X147.12 Y133.201 E.00022
G1 X147.12 Y142.437 E.01382
G1 X146.97 Y142.391 E.00023
G1 X146.97 Y133.202 E.01375
G1 X146.82 Y133.202 E.00022
G1 X146.82 Y142.346 E.01369
G1 X146.67 Y142.3 E.00023
G1 X146.67 Y133.202 E.01362
G1 X146.52 Y133.202 E.00022
G1 X146.52 Y142.25 E.01354
G1 X146.37 Y142.194 E.00024
G1 X146.37 Y133.203 E.01346
G1 X146.22 Y133.203 E.00022
G1 X146.22 Y142.139 E.01337
G1 X146.07 Y142.083 E.00024
G1 X146.07 Y133.136 E.01339
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X146.07 Y135.136 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X145.92 Y142.1 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X145.92 Y107.756 E.0514
G1 X145.77 Y107.812 E.00024
G1 X145.77 Y141.973 E.05113
G1 X145.62 Y141.917 E.00024
G1 X145.62 Y107.868 E.05096
G2 X145.47 Y107.927 I.426 J1.295 E.00024
G1 X145.47 Y141.854 E.05078
G1 X145.32 Y141.788 E.00025
G1 X145.32 Y107.994 E.05058
G1 X145.17 Y108.06 E.00025
G1 X145.17 Y141.723 E.05038
G1 X145.02 Y141.657 E.00025
G1 X145.02 Y108.126 E.05019
G1 X144.87 Y108.193 E.00025
G1 X144.87 Y141.591 E.04999
G1 X144.72 Y141.525 E.00025
G1 X144.72 Y108.259 E.04979
G1 X144.57 Y108.326 E.00025
G1 X144.57 Y141.458 E.04959
G1 X144.42 Y141.382 E.00025
G1 X144.42 Y108.4 E.04936
G1 X144.27 Y108.477 E.00025
G1 X144.27 Y141.305 E.04913
G1 X144.12 Y141.229 E.00025
G1 X144.12 Y108.554 E.0489
G1 X143.97 Y108.632 E.00025
G1 X143.97 Y141.152 E.04867
G1 X143.82 Y141.075 E.00025
G1 X143.82 Y108.709 E.04844
G1 X143.67 Y108.786 E.00025
G1 X143.67 Y140.999 E.04821
G3 X143.52 Y140.914 I.634 J-1.306 E.00026
G1 X143.52 Y108.867 E.04797
G1 X143.37 Y108.956 E.00026
G1 X143.37 Y140.826 E.0477
G1 X143.22 Y140.738 E.00026
G1 X143.22 Y109.045 E.04744
G1 X143.07 Y109.134 E.00026
G1 X143.07 Y140.65 E.04717
G1 X142.92 Y140.562 E.00026
G1 X142.92 Y109.223 E.04691
G1 X142.77 Y109.312 E.00026
G1 X142.77 Y140.473 E.04664
G3 X142.62 Y140.38 I.711 J-1.311 E.00026
G1 X142.62 Y109.401 E.04637
G1 X142.47 Y109.502 E.00027
G1 X142.47 Y140.279 E.04606
G1 X142.32 Y140.179 E.00027
G1 X142.32 Y109.604 E.04576
G1 X142.17 Y109.705 E.00027
G1 X142.17 Y140.078 E.04546
G1 X142.02 Y139.978 E.00027
G1 X142.02 Y109.806 E.04516
G1 X141.87 Y109.908 E.00027
G1 X141.87 Y139.877 E.04485
G3 X141.72 Y139.771 I.818 J-1.318 E.00027
G1 X141.72 Y110.01 E.04454
G1 X141.57 Y110.125 E.00028
G1 X141.57 Y139.657 E.0442
G1 X141.42 Y139.543 E.00028
G1 X141.42 Y110.239 E.04386
G1 X141.27 Y110.354 E.00028
G1 X141.27 Y139.429 E.04352
G1 X141.12 Y139.315 E.00028
G1 X141.12 Y110.469 E.04317
G1 X140.97 Y110.584 E.00028
G1 X140.97 Y139.201 E.04283
G3 X140.82 Y139.078 I.962 J-1.325 E.00029
G1 X140.82 Y110.703 E.04247
G1 X140.67 Y110.833 E.0003
G1 X140.67 Y138.949 E.04208
G1 X140.52 Y138.82 E.0003
G1 X140.52 Y110.963 E.04169
G1 X140.37 Y111.092 E.0003
G1 X140.37 Y138.691 E.04131
G1 X140.22 Y138.563 E.0003
G1 X140.22 Y111.222 E.04092
G1 X140.07 Y111.352 E.0003
G1 X140.07 Y138.432 E.04053
G1 X139.92 Y138.287 E.00031
G1 X139.92 Y111.494 E.0401
G1 X139.77 Y111.641 E.00031
G1 X139.77 Y138.142 E.03966
G1 X139.62 Y137.997 E.00031
G1 X139.62 Y111.787 E.03923
G1 X139.47 Y111.933 E.00031
G1 X139.47 Y137.852 E.03879
G1 X139.32 Y137.707 E.00031
G1 X139.32 Y112.079 E.03836
G2 X139.17 Y112.236 I1.248 J1.342 E.00033
G1 X139.17 Y137.545 E.03788
G1 X139.02 Y137.382 E.00033
G1 X139.02 Y112.401 E.03739
G1 X138.87 Y112.565 E.00033
G1 X138.87 Y137.218 E.0369
G1 X138.72 Y137.055 E.00033
G1 X138.72 Y112.73 E.03641
G1 X138.57 Y112.894 E.00033
G1 X138.57 Y136.891 E.03592
G1 X138.42 Y136.707 E.00036
G1 X138.42 Y113.074 E.03537
G1 X138.27 Y113.259 E.00036
G1 X138.27 Y136.523 E.03482
G1 X138.12 Y136.339 E.00036
G1 X138.12 Y113.445 E.03427
G1 X137.97 Y113.631 E.00036
G1 X137.97 Y136.155 E.03371
G3 X137.82 Y135.96 I1.564 J-1.361 E.00037
M73 P74 R8
G1 X137.82 Y113.82 E.03314
G1 X137.67 Y114.03 E.00039
G1 X137.67 Y135.752 E.03251
G1 X137.52 Y135.544 E.00038
G1 X137.52 Y114.24 E.03189
G1 X137.37 Y114.449 E.00039
G1 X137.37 Y135.336 E.03126
G3 X137.22 Y135.122 I1.724 J-1.37 E.00039
G1 X137.22 Y114.659 E.03063
G2 X137.071 Y114.896 I1.92 J1.382 E.00042
G1 X137.071 Y134.885 E.02992
G1 X136.921 Y134.649 E.00042
G1 X136.921 Y115.135 E.02921
G1 X136.771 Y115.373 E.00042
G1 X136.771 Y134.412 E.0285
G3 X136.621 Y134.165 I2.009 J-1.388 E.00043
G1 X136.621 Y115.614 E.02776
G1 X136.471 Y115.888 E.00047
G1 X136.471 Y133.894 E.02695
G1 X136.321 Y133.623 E.00046
G1 X136.321 Y116.161 E.02614
G1 X136.171 Y116.434 E.00047
G1 X136.171 Y133.352 E.02532
G3 X136.021 Y133.047 I2.494 J-1.416 E.00051
G1 X136.021 Y116.733 E.02442
G1 X135.871 Y117.05 E.00052
G1 X135.871 Y132.734 E.02348
G1 X135.721 Y132.421 E.00052
G1 X135.721 Y117.366 E.02253
G2 X135.571 Y117.709 I2.818 J1.435 E.00056
G1 X135.571 Y132.071 E.02149
G1 X135.421 Y131.703 E.00059
G1 X135.421 Y118.081 E.02039
G1 X135.271 Y118.453 E.0006
G1 X135.271 Y131.514 E.01955
G1 X135.121 Y131.108 F30000
G1 F3600
G1 X135.121 Y118.671 E.01862
G1 X134.971 Y119.117 F30000
G1 F3600
G1 X134.971 Y130.668 E.01729
G1 X134.821 Y130.209 F30000
G1 F3600
G1 X134.821 Y119.567 E.01593
G1 X134.671 Y120.12 F30000
G1 F3600
G1 X134.671 Y129.664 E.01428
G1 X134.521 Y129.081 F30000
G1 F3600
G1 X134.521 Y120.695 E.01255
G1 X134.371 Y121.414 F30000
G1 F3600
G1 X134.371 Y128.374 E.01042
G1 X134.221 Y127.46 F30000
G1 F3600
G1 X134.221 Y122.327 E.00768
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X134.221 Y124.327 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X126.608 Y124.871 Z2.84 F30000
G1 X90.471 Y127.456 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G1 X90.472 Y129.505 E.05666
G1 X87.985 Y129.506 E.06875
G1 X88.294 Y128.648 E.02519
G1 X87.257 Y127.932 E.03485
G1 X87.225 Y127.766 E.00467
G1 X87.253 Y127.459 E.00853
G1 X90.411 Y127.456 E.08731
G1 E-.56 F1800
; WIPE_START
G1 F12000
M73 P75 R8
G1 X90.47 Y129.456 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.101 Y121.947 Z2.84 F30000
G1 X88.867 Y120.665 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F12000
G1 X88.868 Y122.58 E.05296
G1 X88.864 Y122.716 E.00377
G2 X86.38 Y122.714 I-1.33 J92.539 E.06867
G1 X86.689 Y121.856 E.0252
G1 X85.652 Y121.14 E.03485
G1 X85.641 Y121.082 E.00163
G3 X85.639 Y120.665 I2.242 J-.219 E.01155
G1 X88.807 Y120.665 E.0876
G1 E-.56 F1800
; WIPE_START
G1 F12000
G1 X88.868 Y122.58 E-.21847
G1 X88.865 Y122.664 E-.00953
; WIPE_END
G1 E-.012 F1800
G1 X95.843 Y119.571 Z2.84 F30000
G1 X110.401 Y113.118 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X110.77 Y113.577 E.0151
G3 X95.627 Y105.801 I-15.731 J12 E2.73781
G1 X96.795 Y105.87 E.03003
G3 X110.03 Y112.664 I-1.756 J19.707 E.39126
G1 X110.363 Y113.072 E.01351
M204 S10000
G1 X110.429 Y113.973 F30000
; FEATURE: Top surface
G1 F3600
M204 S2000
G1 X106.677 Y110.222 E.13609
M204 S10000
G1 X104.985 Y109.075 F30000
G1 F3600
M204 S2000
G1 X111.559 Y115.648 E.23848
M204 S10000
G1 X112.236 Y116.871 F30000
G1 F3600
M204 S2000
G1 X103.764 Y108.398 E.3074
G1 X102.733 Y107.913
G1 X112.72 Y117.901 E.36236
G1 X113.092 Y118.818
G1 X101.816 Y107.542 E.40912
G1 X100.973 Y107.245
G1 X113.376 Y119.647 E.44998
G1 X113.608 Y120.425
G1 X100.188 Y107.005 E.48689
G1 X99.464 Y106.825
G1 X113.804 Y121.166 E.52027
G1 X113.949 Y121.856
G1 X98.765 Y106.672 E.55091
G1 X98.1 Y106.552
G1 X114.068 Y122.52 E.57933
G1 X114.163 Y123.161
G1 X97.466 Y106.464 E.6058
G1 X96.847 Y106.39
M73 P75 R7
G1 X114.226 Y123.769 E.63053
G1 X114.279 Y124.368
G1 X96.261 Y106.35 E.65372
G1 X95.681 Y106.315
G1 X114.3 Y124.935 E.67552
G1 X114.317 Y125.497
G1 X95.132 Y106.311 E.69607
G1 X94.586 Y106.311
G1 X114.306 Y126.031 E.71546
G1 X114.29 Y126.561
G1 X94.065 Y106.335 E.73381
G1 X93.55 Y106.366
G1 X114.255 Y127.071 E.75119
G1 X114.21 Y127.571
G1 X93.051 Y106.412 E.76768
G1 X92.563 Y106.47
G1 X114.154 Y128.061 E.78335
G1 X114.084 Y128.536
G1 X92.082 Y106.534 E.79824
G1 X91.62 Y106.617
G1 X114.012 Y129.009 E.81241
G1 X113.917 Y129.46
G1 X91.157 Y106.7 E.82574
G1 X90.714 Y106.802
G1 X113.822 Y129.911 E.8384
G1 X113.715 Y130.349
G1 X90.274 Y106.908 E.85044
G1 X89.841 Y107.02
G1 X113.598 Y130.777 E.86191
G1 X113.481 Y131.206
G1 X89.423 Y107.148 E.87283
G1 X89.006 Y107.276
G1 X113.343 Y131.613 E.883
G1 X113.206 Y132.021
G1 X88.601 Y107.417 E.89267
G1 X88.203 Y107.564
G1 X113.061 Y132.422 E.90187
G1 X112.904 Y132.81
G1 X87.806 Y107.712 E.91059
G1 X87.427 Y107.878
G1 X112.747 Y133.198 E.91863
G1 X112.578 Y133.575
G1 X87.048 Y108.045 E.92625
G1 X86.673 Y108.216
G1 X112.402 Y133.945 E.93347
G1 X112.226 Y134.314
G1 X86.313 Y108.401 E.94016
G1 X85.952 Y108.586
G1 X112.036 Y134.669 E.94633
G1 X111.842 Y135.021
G1 X85.599 Y108.778 E.95212
G1 X85.256 Y108.98
G1 X111.648 Y135.372 E.95753
G1 X111.438 Y135.707
G1 X84.913 Y109.183 E.96234
G1 X84.579 Y109.394
G1 X111.227 Y136.042 E.9668
G1 X111.014 Y136.375
G1 X84.253 Y109.613 E.97092
G1 X83.927 Y109.833
G1 X110.787 Y136.692 E.97448
G1 X110.559 Y137.01
G1 X83.611 Y110.063 E.97767
G1 X83.302 Y110.299
G1 X110.328 Y137.325 E.98054
G1 X110.084 Y137.626
G1 X82.993 Y110.535 E.98289
G1 X82.695 Y110.782
G1 X109.84 Y137.927 E.98485
G1 X109.592 Y138.225
G1 X82.402 Y111.034 E.9865
G1 X82.109 Y111.287
G1 X109.332 Y138.51 E.98767
G1 X109.071 Y138.795
G1 X81.828 Y111.551 E.98842
G1 X81.551 Y111.82
G1 X108.807 Y139.076 E.98887
G1 X108.53 Y139.344
G1 X81.274 Y112.088 E.98887
G1 X81.01 Y112.369
G1 X89.078 Y120.437 E.29272
G1 X88.532 Y120.438
G1 X80.749 Y112.654 E.28239
G1 X80.488 Y112.939
G1 X87.987 Y120.438 E.27206
G1 X87.442 Y120.438
G1 X80.241 Y113.237 E.26125
G1 X79.997 Y113.538
G1 X86.896 Y120.438 E.25033
G1 X86.351 Y120.438
G1 X79.752 Y113.839 E.23941
G1 X79.522 Y114.154
G1 X85.806 Y120.438 E.22798
G1 X85.431 Y120.608
G1 X79.294 Y114.472 E.22263
G1 X79.066 Y114.789
G1 X85.421 Y121.144 E.23056
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X84.007 Y119.73 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X86.22 Y122.488 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X78.854 Y115.122 E.26724
G1 X78.643 Y115.457
G1 X86.076 Y122.889 E.26966
M73 P76 R7
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X84.661 Y121.475 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.094 Y120.453 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X108.253 Y139.613 E.69512
G1 X107.972 Y139.877
G1 X89.094 Y120.999 E.6849
G1 X89.095 Y121.545
G1 X107.679 Y140.13 E.67425
G1 X107.386 Y140.382
G1 X89.095 Y122.091 E.66361
G1 X89.094 Y122.635
G1 X107.088 Y140.629 E.65284
G1 X106.778 Y140.865
G1 X88.85 Y122.937 E.65045
G1 X88.309 Y122.941
G1 X106.469 Y141.101 E.65886
G1 X106.153 Y141.331
G1 X87.764 Y122.941 E.6672
G1 X87.218 Y122.941
G1 X105.828 Y141.551 E.67516
G1 X105.502 Y141.77
G1 X86.673 Y122.941 E.68313
G1 X86.127 Y122.941
G1 X90.415 Y127.229 E.15557
G1 X89.87 Y127.229
G1 X78.433 Y115.792 E.41496
G1 X78.239 Y116.143
G1 X89.325 Y127.229 E.40221
G1 X88.779 Y127.229
G1 X78.045 Y116.495 E.38945
G1 X77.855 Y116.85
G1 X88.234 Y127.229 E.37657
G1 X87.688 Y127.229
G1 X77.679 Y117.219 E.36317
G1 X77.503 Y117.589
G1 X87.169 Y127.255 E.35071
G1 X87.008 Y127.64
G1 X77.334 Y117.966 E.351
G1 X77.177 Y118.354
G1 X87.899 Y129.076 E.389
G1 X87.754 Y129.477
G1 X77.019 Y118.742 E.38947
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X78.434 Y120.156 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X84.979 Y124.082 Z2.84 F30000
G1 X90.698 Y127.512 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X105.168 Y141.981 E.52495
G1 X104.825 Y142.184
G1 X90.699 Y128.058 E.51251
G1 X90.699 Y128.603
G1 X104.482 Y142.386 E.50006
G1 X104.128 Y142.578
M73 P77 R7
G1 X90.699 Y129.149 E.48722
G1 X90.635 Y129.63
G1 X103.768 Y142.763 E.47648
G1 X103.407 Y142.948
G1 X90.192 Y129.733 E.47947
G1 X89.647 Y129.733
G1 X103.033 Y143.119 E.48566
G1 X102.654 Y143.286
G1 X89.101 Y129.733 E.49171
G1 X88.556 Y129.733
G1 X102.275 Y143.452 E.49774
G1 X101.877 Y143.6
G1 X88.01 Y129.733 E.5031
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X89.425 Y131.147 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X83.909 Y125.871 Z2.84 F30000
G1 X76.875 Y119.143 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X101.479 Y143.747 E.89267
G1 X101.075 Y143.888
G1 X76.737 Y119.551 E.883
G1 X76.6 Y119.959
G1 X100.657 Y144.016 E.87282
G1 X100.239 Y144.143
G1 X76.483 Y120.387 E.86191
G1 X76.366 Y120.815
G1 X99.806 Y144.256 E.85044
G1 X99.367 Y144.362
G1 X76.259 Y121.253 E.83839
G1 X76.164 Y121.704
G1 X98.923 Y144.464 E.82574
G1 X98.461 Y144.547
G1 X76.069 Y122.155 E.8124
G1 X75.997 Y122.628
G1 X97.999 Y144.63 E.79823
G1 X97.517 Y144.694
G1 X75.926 Y123.103 E.78334
G1 X75.871 Y123.593
G1 X97.03 Y144.752 E.76768
G1 X96.531 Y144.798
G1 X75.826 Y124.093 E.75119
G1 X75.79 Y124.603
G1 X96.016 Y144.829 E.7338
G1 X95.494 Y144.853
G1 X75.775 Y125.133 E.71546
G1 X75.764 Y125.667
G1 X94.949 Y144.853 E.69606
G1 X94.4 Y144.849
G1 X75.78 Y126.229 E.67552
G1 X75.801 Y126.796
G1 X93.82 Y144.814 E.65372
G1 X93.234 Y144.774
G1 X75.855 Y127.395 E.63053
G1 X75.918 Y128.003
G1 X80.883 Y132.968 E.18015
G1 X80.921 Y133.006
G1 X92.615 Y144.7 E.42426
G1 X91.981 Y144.612
G1 X76.013 Y128.644 E.57932
G1 X76.132 Y129.308
G1 X91.316 Y144.492 E.5509
G1 X90.617 Y144.338
G1 X76.277 Y129.998 E.52027
G1 X76.472 Y130.739
G1 X89.892 Y144.159 E.48688
G1 X89.107 Y143.919
G1 X76.705 Y131.517 E.44997
G1 X76.988 Y132.346
G1 X88.265 Y143.622 E.40911
G1 X87.348 Y143.251
G1 X77.361 Y133.264 E.36235
G1 X77.844 Y134.293
G1 X86.317 Y142.765 E.30738
M204 S10000
G1 X85.095 Y142.089 F30000
G1 F3600
M204 S2000
G1 X78.522 Y135.516 E.23846
M204 S10000
G1 X79.653 Y137.192 F30000
G1 F3600
M204 S2000
G1 X83.403 Y140.942 E.13605
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X81.988 Y139.528 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X83.853 Y132.126 Z2.84 F30000
G1 X86.375 Y122.114 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.344611
G1 F18000
G1 X86.158 Y121.933 E.00583
; LINE_WIDTH: 0.301583
G1 X85.941 Y121.752 E.00502
; LINE_WIDTH: 0.258555
G1 X85.724 Y121.571 E.00421
; LINE_WIDTH: 0.207603
G1 X85.403 Y121.28 E.00499
; LINE_WIDTH: 0.184818
G1 X85.407 Y121.253 E.00028
; LINE_WIDTH: 0.14339
G1 X85.415 Y121.21 E.00031
; LINE_WIDTH: 0.0942304
G1 X85.434 Y121.131 E.00033
G1 X85.431 Y120.629 F30000
; LINE_WIDTH: 0.0875388
G1 F18000
G3 X85.312 Y120.762 I-.244 J-.099 E.00065
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X85.431 Y120.629 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X86.095 Y122.922 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.107663
G1 F18000
G1 X85.965 Y123.052 E.00089
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X86.095 Y122.922 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X87.354 Y127.167 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.0878535
G1 F18000
G2 X87.206 Y127.243 I.553 J1.265 E.00059
G1 X87.022 Y127.626 F30000
; LINE_WIDTH: 0.149825
G1 F18000
G1 X86.956 Y127.776 E.00126
G1 X87.017 Y127.907 E.00111
G1 X88.016 Y128.807 F30000
; LINE_WIDTH: 0.165818
G1 F18000
G1 X87.83 Y128.651 E.00212
; LINE_WIDTH: 0.133392
G1 X87.671 Y128.519 E.00136
; LINE_WIDTH: 0.0982044
G1 X87.512 Y128.387 E.00088
G1 E-.56 F1800
; WIPE_START
M73 P78 R7
G1 F18000
G1 X87.671 Y128.519 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X93.17 Y123.226 Z2.84 F30000
G1 X106.616 Y110.283 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.219395
G1 F18000
G1 X106.432 Y110.122 E.00301
; LINE_WIDTH: 0.185208
G2 X106.154 Y109.884 I-5.148 J5.722 E.00368
; LINE_WIDTH: 0.137855
G1 X105.992 Y109.75 E.00145
; LINE_WIDTH: 0.0996962
G1 X105.83 Y109.617 E.00091
G1 X104.923 Y109.137 F30000
; LINE_WIDTH: 0.196802
G1 F18000
G1 X104.746 Y109 E.00242
; LINE_WIDTH: 0.150332
G1 X104.569 Y108.863 E.00173
; LINE_WIDTH: 0.103861
G1 X104.392 Y108.726 E.00104
G1 X102.669 Y107.976 F30000
; LINE_WIDTH: 0.186559
G1 F18000
G1 X102.544 Y107.89 E.00154
; LINE_WIDTH: 0.144182
G1 X102.418 Y107.804 E.00111
; LINE_WIDTH: 0.101806
G1 X102.292 Y107.719 E.00068
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X102.418 Y107.804 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X97.435 Y113.586 Z2.84 F30000
G1 X78.584 Y135.454 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.218854
G1 F18000
G1 X78.501 Y135.35 E.00164
; LINE_WIDTH: 0.192262
G1 X78.401 Y135.217 E.00175
; LINE_WIDTH: 0.147601
G1 X78.301 Y135.083 E.00126
; LINE_WIDTH: 0.10294
G1 X78.2 Y134.95 E.00076
G1 X79.714 Y137.13 F30000
; LINE_WIDTH: 0.204501
G1 F18000
G1 X79.491 Y136.867 E.0039
; LINE_WIDTH: 0.154944
G1 X79.268 Y136.605 E.00277
; LINE_WIDTH: 0.105387
G1 X79.045 Y136.342 E.00163
G1 X84.251 Y141.547 F30000
; LINE_WIDTH: 0.105569
G1 F18000
G1 X84.041 Y141.375 E.00128
; LINE_WIDTH: 0.155473
G1 X83.832 Y141.202 E.00218
; LINE_WIDTH: 0.193413
G1 X83.648 Y141.041 E.00259
; LINE_WIDTH: 0.219374
G1 X83.464 Y140.88 E.00301
G1 X85.688 Y142.438 F30000
; LINE_WIDTH: 0.103864
G1 F18000
G1 X85.511 Y142.301 E.00104
; LINE_WIDTH: 0.150339
G1 X85.334 Y142.164 E.00173
; LINE_WIDTH: 0.196813
G1 X85.157 Y142.027 E.00242
G1 X86.813 Y143.016 F30000
; LINE_WIDTH: 0.0894732
G1 F18000
G1 X86.755 Y142.976 E.00026
; LINE_WIDTH: 0.117575
G1 X86.63 Y142.885 E.00086
; LINE_WIDTH: 0.15611
G1 X86.505 Y142.793 E.00125
; LINE_WIDTH: 0.194645
G1 X86.38 Y142.702 E.00165
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X86.505 Y142.793 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X94.078 Y143.745 Z2.84 F30000
G1 X99.11 Y144.377 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.0940743
G1 F18000
G1 X98.947 Y144.462 E.00073
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X99.11 Y144.377 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X105.173 Y139.741 Z2.84 F30000
G1 X112.202 Y134.366 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.0921025
G1 F18000
G1 X112.118 Y134.478 E.00054
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X112.202 Y134.366 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X112.317 Y126.735 Z2.84 F30000
G1 X112.46 Y117.34 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.102326
G1 F18000
G1 X112.364 Y117.205 E.00075
; LINE_WIDTH: 0.145732
G1 X112.269 Y117.07 E.00123
; LINE_WIDTH: 0.189139
G1 X112.173 Y116.934 E.0017
G1 X111.88 Y116.214 F30000
; LINE_WIDTH: 0.102954
G1 F18000
G1 X111.78 Y116.081 E.00076
; LINE_WIDTH: 0.147645
G1 X111.68 Y115.947 E.00126
; LINE_WIDTH: 0.192336
G1 X111.579 Y115.814 E.00176
; LINE_WIDTH: 0.218906
G1 X111.496 Y115.71 E.00163
G1 X111.036 Y114.822 F30000
; LINE_WIDTH: 0.0966773
G1 F18000
G1 X110.901 Y114.663 E.00087
; LINE_WIDTH: 0.128813
G1 X110.765 Y114.504 E.00131
; LINE_WIDTH: 0.165981
G1 X110.566 Y114.269 E.0027
; LINE_WIDTH: 0.208172
G1 X110.367 Y114.034 E.00356
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X110.566 Y114.269 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X104.263 Y118.574 Z2.84 F30000
G1 X90.244 Y128.149 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X89.779 Y127.684 E.01687
G1 X89.234 Y127.684
G1 X90.245 Y128.695 E.03665
G1 X90.245 Y129.24
G1 X88.689 Y127.685 E.05643
G1 X88.145 Y127.685
G1 X89.738 Y129.278 E.0578
G1 X89.192 Y129.278
G1 X88.542 Y128.628 E.02359
M204 S10000
G1 X88.54 Y128.581 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0741576
G1 F18000
G1 X88.567 Y128.57 E.00008
; LINE_WIDTH: 0.0952571
G1 X88.57 Y128.548 E.00009
; LINE_WIDTH: 0.1224
G1 X88.572 Y128.527 E.00013
; LINE_WIDTH: 0.149228
G1 X88.571 Y128.509 E.00013
; LINE_WIDTH: 0.175763
M73 P78 R6
G1 X88.569 Y128.492 E.00016
; LINE_WIDTH: 0.208513
G1 X88.359 Y128.317 E.00318
; LINE_WIDTH: 0.247467
G1 X88.148 Y128.141 E.00389
G1 X87.926 Y128.084 F30000
; LINE_WIDTH: 0.21259
G1 F18000
G1 X87.441 Y127.684 E.00744
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X87.926 Y128.084 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X88.64 Y121.636 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X87.896 Y120.892 E.02701
G1 X87.351 Y120.892
G1 X88.641 Y122.182 E.04681
G1 X88.402 Y122.489
G1 X86.805 Y120.892 E.05793
G1 X86.26 Y120.892
G1 X87.856 Y122.488 E.05791
G1 X87.31 Y122.488
G1 X86.863 Y122.041 E.01621
M204 S10000
G1 X86.542 Y121.477 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0906899
G1 F18000
G1 X86.411 Y121.368 E.00064
G1 X86.219 Y120.873 F30000
; LINE_WIDTH: 0.23038
G1 F18000
G1 X86.115 Y120.932 E.00156
; LINE_WIDTH: 0.257714
G1 X86.011 Y120.991 E.00178
; LINE_WIDTH: 0.25041
G1 X86.04 Y121.037 E.00078
; LINE_WIDTH: 0.208491
G1 X86.069 Y121.083 E.00063
; LINE_WIDTH: 0.173713
G1 X86.217 Y121.205 E.00178
; LINE_WIDTH: 0.146034
G1 X86.364 Y121.328 E.00142
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X86.217 Y121.205 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X79.31 Y117.957 Z2.84 F30000
G1 X77.537 Y117.124 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.317664
G1 F18000
G1 X77.743 Y116.709 E.00874
G3 X92.172 Y106.347 I17.324 J8.896 E.34763
G1 X93.318 Y106.211 E.02175
G1 X94.464 Y106.143 E.02164
G1 X95.613 Y106.143 E.02164
G1 X96.765 Y106.211 E.02175
G1 X97.912 Y106.347 E.02177
G1 X99.05 Y106.552 E.0218
G1 X100.167 Y106.822 E.02164
G1 X101.265 Y107.157 E.02164
G1 X102.349 Y107.56 E.0218
G1 X103.408 Y108.026 E.0218
G1 X104.433 Y108.553 E.02173
G1 X105.422 Y109.137 E.02165
G1 X106.375 Y109.779 E.02164
G1 X107.294 Y110.48 E.0218
G1 X108.17 Y111.236 E.0218
G1 X108.994 Y112.036 E.02165
G1 X109.769 Y112.883 E.02164
G1 X110.5 Y113.783 E.02185
G1 X111.173 Y114.721 E.02176
G1 X111.786 Y115.692 E.02164
G1 X112.34 Y116.698 E.02164
G1 X112.838 Y117.742 E.0218
G1 X113.272 Y118.814 E.0218
G1 X113.64 Y119.902 E.02164
G1 X113.943 Y121.01 E.02165
G1 X114.181 Y122.142 E.0218
G1 X114.352 Y123.286 E.0218
G1 X114.454 Y124.43 E.02165
G1 X114.488 Y125.578 E.02164
G1 X114.454 Y126.734 E.0218
G1 X114.352 Y127.882 E.02173
G1 X114.181 Y129.026 E.0218
G1 X113.944 Y130.15 E.02164
G1 X113.641 Y131.258 E.02165
G1 X113.27 Y132.356 E.02185
G1 X112.838 Y133.422 E.02167
G1 X112.342 Y134.462 E.02172
G1 X111.784 Y135.475 E.0218
G1 X111.17 Y136.446 E.02164
G1 X110.501 Y137.379 E.02165
G1 X109.772 Y138.278 E.02181
G1 X108.994 Y139.128 E.02171
G1 X108.164 Y139.934 E.0218
G1 X107.294 Y140.684 E.02165
G1 X106.381 Y141.381 E.02165
G1 X105.424 Y142.025 E.02174
G1 X104.426 Y142.615 E.02186
G1 X103.404 Y143.139 E.02165
G1 X102.353 Y143.602 E.02164
G1 X101.269 Y144.005 E.0218
G1 X100.163 Y144.343 E.0218
G1 X99.042 Y144.613 E.02172
G1 X97.912 Y144.817 E.02164
G1 X96.771 Y144.952 E.02165
G1 X95.617 Y145.021 E.0218
G1 X94.46 Y145.021 E.0218
G1 X93.313 Y144.953 E.02165
G1 X92.173 Y144.817 E.02164
G1 X91.035 Y144.613 E.0218
G1 X89.91 Y144.341 E.02181
G1 X88.812 Y144.005 E.02165
G1 X87.735 Y143.605 E.02164
G1 X86.676 Y143.139 E.02181
G1 X85.648 Y142.611 E.0218
G1 X84.659 Y142.027 E.02165
G1 X83.706 Y141.385 E.02164
G1 X82.787 Y140.684 E.0218
G1 X81.914 Y139.931 E.02172
G1 X81.083 Y139.125 E.02181
G1 X80.309 Y138.278 E.02164
G1 X79.585 Y137.386 E.02165
G1 X78.91 Y136.446 E.02181
G1 X78.293 Y135.468 E.0218
G1 X77.739 Y134.462 E.02165
G1 X77.245 Y133.426 E.02164
G1 X76.81 Y132.354 E.0218
G1 X76.441 Y131.262 E.02172
G1 X76.136 Y130.147 E.02178
G1 X75.899 Y129.018 E.02175
G1 X75.729 Y127.882 E.02164
G1 X75.627 Y126.738 E.02165
G1 X75.593 Y125.582 E.0218
G3 X77.249 Y117.745 I19.474 J.023 E.15205
G1 X77.512 Y117.178 E.01177
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X77.743 Y116.709 E-.05969
G1 X78.295 Y115.692 E-.13183
G1 X78.466 Y115.421 E-.03648
; WIPE_END
G1 E-.012 F1800
G1 X85.317 Y118.786 Z2.84 F30000
G1 X88.816 Y120.504 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X88.816 Y121.253 E.00112
G1 X88.666 Y121.253 E.00022
G1 X88.666 Y120.571 E.00102
G1 X88.516 Y120.571 E.00022
G1 X88.516 Y121.253 E.00102
G1 X88.366 Y121.253 E.00022
G1 X88.366 Y120.571 E.00102
G1 X88.216 Y120.571 E.00022
G1 X88.216 Y121.253 E.00102
G1 X88.066 Y121.253 E.00022
G1 X88.066 Y120.571 E.00102
G1 X87.916 Y120.571 E.00022
G1 X87.916 Y121.253 E.00102
G1 X87.766 Y121.253 E.00022
G1 X87.766 Y120.571 E.00102
G1 X87.616 Y120.571 E.00022
G1 X87.616 Y121.253 E.00102
G1 X87.466 Y121.253 E.00022
G1 X87.466 Y120.571 E.00102
G1 X87.316 Y120.57 E.00022
G1 X87.316 Y121.253 E.00102
G1 X87.166 Y121.253 E.00022
G1 X87.166 Y120.57 E.00102
G1 X87.016 Y120.57 E.00022
G1 X87.016 Y121.253 E.00102
G1 X86.866 Y121.253 E.00022
G1 X86.866 Y120.57 E.00102
G1 X86.716 Y120.57 E.00022
G1 X86.716 Y121.253 E.00102
G1 X86.566 Y121.253 E.00022
G1 X86.566 Y120.57 E.00102
G1 X86.416 Y120.57 E.00022
G1 X86.416 Y121.253 E.00102
G1 X86.266 Y121.253 E.00022
G1 X86.266 Y120.57 E.00102
G1 X86.116 Y120.57 E.00022
G1 X86.116 Y121.253 E.00102
G1 X85.966 Y121.253 E.00022
G1 X85.966 Y120.57 E.00102
G1 X85.816 Y120.57 E.00022
G1 X85.816 Y121.32 E.00112
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X85.816 Y120.57 E-.08556
G1 X85.966 Y120.57 E-.0171
G1 X85.966 Y121.253 E-.07786
G1 X86.116 Y121.253 E-.0171
G1 X86.116 Y120.986 E-.03038
; WIPE_END
G1 E-.012 F1800
G1 X84.034 Y128.33 Z2.84 F30000
G1 X84.016 Y128.394 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X84.016 Y127.72 E.00101
G2 X83.866 Y127.515 I-.539 J.238 E.00038
G1 X83.866 Y128.464 E.00142
G3 X83.716 Y128.562 I-.605 J-.763 E.00027
G1 X83.716 Y127.415 E.00172
G2 X83.566 Y127.372 I-.197 J.404 E.00023
G1 X83.566 Y128.602 E.00184
G3 X83.416 Y128.617 I-.128 J-.556 E.00023
G1 X83.416 Y127.36 E.00188
G1 X83.266 Y127.36 E.00022
G1 X83.266 Y128.616 E.00188
G1 X83.116 Y128.616 E.00022
G1 X83.116 Y127.36 E.00188
G1 X82.966 Y127.36 E.00022
G1 X82.966 Y128.616 E.00188
G1 X82.816 Y128.616 E.00022
G1 X82.816 Y127.36 E.00188
G1 X82.666 Y127.361 E.00022
G1 X82.666 Y128.616 E.00188
G1 X82.516 Y128.616 E.00022
G1 X82.516 Y127.361 E.00188
G1 X82.366 Y127.361 E.00022
G1 X82.366 Y128.616 E.00188
G1 X82.216 Y128.616 E.00022
G1 X82.216 Y127.361 E.00188
G1 X82.066 Y127.361 E.00022
G1 X82.066 Y128.615 E.00188
G1 X81.916 Y128.615 E.00022
G1 X81.916 Y127.361 E.00188
G1 X81.766 Y127.361 E.00022
G1 X81.766 Y128.615 E.00188
G1 X81.616 Y128.615 E.00022
G1 X81.616 Y127.361 E.00188
G1 X81.466 Y127.361 E.00022
G1 X81.466 Y128.615 E.00188
G1 X81.316 Y128.615 E.00022
G1 X81.316 Y127.361 E.00188
G1 X81.166 Y127.361 E.00022
G1 X81.166 Y128.615 E.00188
G1 X81.016 Y128.615 E.00022
G1 X81.016 Y127.294 E.00198
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X81.016 Y128.615 E-.15056
G1 X81.166 Y128.615 E-.0171
G1 X81.166 Y128.085 E-.06034
; WIPE_END
G1 E-.012 F1800
G1 X83.716 Y130.745 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X83.716 Y129.895 E.00127
G2 X83.566 Y129.773 I-.575 J.55 E.00029
G1 X83.566 Y130.776 E.0015
G3 X83.416 Y130.838 I-.287 J-.479 E.00024
G1 X83.416 Y129.715 E.00168
G2 X83.266 Y129.701 I-.124 J.533 E.00023
G1 X83.266 Y130.852 E.00172
G1 X83.116 Y130.852 E.00022
G1 X83.116 Y129.701 E.00172
G1 X82.966 Y129.701 E.00022
G1 X82.966 Y130.852 E.00172
G1 X82.816 Y130.852 E.00022
G1 X82.816 Y129.701 E.00172
G1 X82.666 Y129.701 E.00022
G1 X82.666 Y130.852 E.00172
G1 X82.516 Y130.852 E.00022
G1 X82.516 Y129.701 E.00172
G1 X82.366 Y129.701 E.00022
G1 X82.366 Y130.852 E.00172
G1 X82.216 Y130.852 E.00022
G1 X82.216 Y129.701 E.00172
G1 X82.066 Y129.701 E.00022
G1 X82.066 Y130.852 E.00172
G1 X81.916 Y130.852 E.00022
G1 X81.916 Y129.701 E.00172
G1 X81.766 Y129.701 E.00022
G1 X81.766 Y130.852 E.00172
G1 X81.616 Y130.852 E.00022
G1 X81.616 Y129.701 E.00172
G1 X81.466 Y129.701 E.00022
G1 X81.466 Y130.852 E.00172
G1 X81.316 Y130.852 E.00022
G1 X81.316 Y129.701 E.00172
G1 X81.166 Y129.7 E.00022
G1 X81.166 Y130.852 E.00172
G1 X81.016 Y130.852 E.00022
G1 X81.016 Y129.633 E.00182
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X81.016 Y130.852 E-.13893
G1 X81.166 Y130.852 E-.0171
G1 X81.166 Y130.22 E-.07197
; WIPE_END
G1 E-.012 F1800
G1 X88.604 Y128.506 Z2.84 F30000
G1 X90.316 Y128.112 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X90.316 Y127.363 E.00112
G1 X90.166 Y127.363 E.00022
G1 X90.166 Y128.045 E.00102
G1 X90.016 Y128.045 E.00022
G1 X90.016 Y127.363 E.00102
G1 X89.866 Y127.363 E.00022
G1 X89.866 Y128.045 E.00102
G1 X89.716 Y128.045 E.00022
G1 X89.716 Y127.363 E.00102
G1 X89.566 Y127.363 E.00022
G1 X89.566 Y128.045 E.00102
G1 X89.416 Y128.045 E.00022
G1 X89.416 Y127.362 E.00102
G1 X89.266 Y127.362 E.00022
G1 X89.266 Y128.045 E.00102
G1 X89.116 Y128.045 E.00022
G1 X89.116 Y127.362 E.00102
G1 X88.966 Y127.362 E.00022
G1 X88.966 Y128.045 E.00102
G1 X88.816 Y128.045 E.00022
G1 X88.816 Y127.362 E.00102
G1 X88.666 Y127.362 E.00022
G1 X88.666 Y128.045 E.00102
G1 X88.516 Y128.045 E.00022
G1 X88.516 Y127.362 E.00102
G1 X88.366 Y127.362 E.00022
G1 X88.366 Y128.045 E.00102
G1 X88.216 Y128.045 E.00022
G1 X88.216 Y127.362 E.00102
G1 X88.066 Y127.362 E.00022
G1 X88.066 Y128.045 E.00102
G1 X87.916 Y128.045 E.00022
G1 X87.916 Y127.362 E.00102
G1 X87.766 Y127.362 E.00022
G1 X87.766 Y128.045 E.00102
G1 X87.616 Y128.045 E.00022
G1 X87.616 Y127.362 E.00102
G1 X87.466 Y127.362 E.00022
G1 X87.466 Y128.045 E.00102
G1 X87.343 Y128.045 E.00018
G1 X87.316 Y128.044 E.00004
G1 X87.316 Y127.296 E.00112
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X87.316 Y128.044 E-.08524
G1 X87.343 Y128.045 E-.0031
G1 X87.466 Y128.045 E-.014
G1 X87.466 Y127.362 E-.07786
G1 X87.616 Y127.362 E-.0171
G1 X87.616 Y127.631 E-.0307
; WIPE_END
G1 E-.012 F1800
G1 X92.924 Y122.147 Z2.84 F30000
G1 X94.515 Y120.503 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X94.515 Y122.799 E.00344
G1 X94.365 Y122.799 E.00022
G1 X94.365 Y120.57 E.00334
G1 X94.215 Y120.57 E.00022
G1 X94.215 Y122.799 E.00334
G1 X94.065 Y122.799 E.00022
G1 X94.065 Y120.57 E.00334
G1 X93.915 Y120.57 E.00022
G1 X93.915 Y122.799 E.00334
G1 X93.765 Y122.799 E.00022
G1 X93.765 Y120.57 E.00334
G1 X93.615 Y120.57 E.00022
G1 X93.615 Y122.799 E.00334
G1 X93.465 Y122.799 E.00022
G1 X93.465 Y120.57 E.00334
G1 X93.315 Y120.57 E.00022
G1 X93.315 Y122.799 E.00334
G1 X93.165 Y122.799 E.00022
G1 X93.165 Y120.57 E.00334
G1 X93.015 Y120.57 E.00022
G1 X93.015 Y122.799 E.00334
G1 X92.865 Y122.799 E.00022
G1 X92.865 Y120.57 E.00334
G1 X92.715 Y120.571 E.00022
G1 X92.715 Y122.799 E.00334
G1 X92.565 Y122.799 E.00022
G1 X92.565 Y120.571 E.00334
G1 X92.415 Y120.571 E.00022
G1 X92.415 Y122.799 E.00334
G1 X92.266 Y122.799 E.00022
G1 X92.266 Y120.503 E.00344
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X92.266 Y122.503 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X99.315 Y125.428 Z2.84 F30000
G1 X103.815 Y127.295 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X103.815 Y129.591 E.00344
G1 X103.665 Y129.591 E.00022
G1 X103.665 Y127.362 E.00334
G1 X103.515 Y127.362 E.00022
G1 X103.515 Y129.591 E.00334
G1 X103.365 Y129.591 E.00022
G1 X103.365 Y127.362 E.00334
G1 X103.215 Y127.362 E.00022
G1 X103.215 Y129.591 E.00334
G1 X103.065 Y129.591 E.00022
G1 X103.065 Y127.362 E.00334
G1 X102.915 Y127.362 E.00022
G1 X102.915 Y129.591 E.00334
G1 X102.765 Y129.591 E.00022
G1 X102.765 Y127.362 E.00334
G1 X102.615 Y127.362 E.00022
G1 X102.615 Y129.591 E.00334
G1 X102.465 Y129.591 E.00022
G1 X102.465 Y127.362 E.00334
G1 X102.315 Y127.362 E.00022
G1 X102.315 Y129.591 E.00334
G1 X102.165 Y129.591 E.00022
G1 X102.165 Y127.362 E.00334
G1 X102.015 Y127.362 E.00022
G1 X102.015 Y129.591 E.00334
G1 X101.865 Y129.591 E.00022
G1 X101.865 Y127.362 E.00334
G1 X101.715 Y127.362 E.00022
G1 X101.715 Y129.591 E.00334
G1 X101.565 Y129.591 E.00022
G1 X101.565 Y127.295 E.00344
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X101.565 Y129.295 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X108.29 Y125.685 Z2.84 F30000
G1 X113.264 Y123.015 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X113.264 Y128.149 E.00769
G1 X113.114 Y129.062 F30000
G1 F3600
G1 X113.114 Y122.102 E.01042
G1 X112.964 Y121.389 F30000
G1 F3600
G1 X112.964 Y129.775 E.01255
G1 X112.814 Y130.354 F30000
G1 F3600
G1 X112.814 Y120.81 E.01428
G1 X112.664 Y120.261 F30000
G1 F3600
G1 X112.664 Y130.903 E.01593
G1 X112.514 Y131.357 F30000
G1 F3600
G1 X112.514 Y119.806 E.01729
G1 X112.364 Y119.363 F30000
G1 F3600
G1 X112.364 Y131.801 E.01862
G1 X112.214 Y132.203 F30000
G1 F3600
G1 X112.214 Y119.141 E.01955
G1 X112.064 Y118.771 E.0006
G1 X112.064 Y132.393 E.02039
G1 X111.914 Y132.763 E.0006
G1 X111.914 Y118.401 E.0215
G2 X111.764 Y118.054 I-2.995 J1.09 E.00057
G1 X111.764 Y133.109 E.02253
G1 X111.614 Y133.424 E.00052
G1 X111.614 Y117.74 E.02348
G1 X111.464 Y117.425 E.00052
G1 X111.464 Y133.739 E.02442
G3 X111.314 Y134.041 I-2.621 J-1.114 E.0005
G1 X111.314 Y117.123 E.02532
G1 X111.164 Y116.851 E.00047
G1 X111.164 Y134.313 E.02614
G1 X111.014 Y134.585 E.00047
G1 X111.014 Y116.579 E.02695
G1 X110.864 Y116.307 E.00047
G1 X110.864 Y126.822 E.01574
G2 X110.714 Y126.641 I-1.042 J.711 E.00035
G1 X110.714 Y116.062 E.01583
G1 X110.564 Y115.825 E.00042
G1 X110.564 Y126.512 E.016
G2 X110.414 Y126.42 I-.763 J1.077 E.00026
G1 X110.414 Y115.587 E.01621
G1 X110.264 Y115.35 E.00042
G1 X110.264 Y126.356 E.01647
G2 X110.114 Y126.316 I-.387 J1.15 E.00023
G1 X110.114 Y115.139 E.01673
G1 X109.964 Y114.93 E.00039
G1 X109.964 Y126.297 E.01701
G2 X109.814 Y126.294 I-.124 J2.503 E.00022
G1 X109.814 Y114.721 E.01732
G1 X109.664 Y114.512 E.00039
G1 X109.664 Y126.294 E.01763
G1 X109.514 Y126.294 E.00022
G1 X109.514 Y114.32 E.01792
G1 X109.364 Y114.135 E.00036
G1 X109.364 Y126.294 E.0182
G1 X109.214 Y126.294 E.00022
G1 X109.214 Y113.95 E.01848
G1 X109.064 Y113.765 E.00036
G1 X109.064 Y126.294 E.01875
G1 X108.914 Y126.294 E.00022
G1 X108.914 Y113.583 E.01902
G1 X108.764 Y113.419 E.00033
G1 X108.764 Y126.294 E.01927
G1 X108.614 Y126.294 E.00022
G1 X108.614 Y113.255 E.01951
G1 X108.464 Y113.091 E.00033
G1 X108.464 Y126.294 E.01976
G1 X108.314 Y126.294 E.00022
G1 X108.314 Y112.927 E.02001
G2 X108.164 Y112.768 I-1.418 J1.184 E.00033
G1 X108.164 Y126.294 E.02024
G1 X108.014 Y126.294 E.00022
G1 X108.014 Y112.623 E.02046
G1 X107.864 Y112.477 E.00031
G1 X107.864 Y126.294 E.02068
G1 X107.714 Y126.294 E.00022
G1 X107.714 Y112.331 E.0209
G1 X107.564 Y112.186 E.00031
G1 X107.564 Y126.294 E.02112
G1 X107.414 Y126.294 E.00022
G1 X107.414 Y112.041 E.02133
G1 X107.265 Y111.912 E.0003
G1 X107.265 Y126.294 E.02153
G2 X107.115 Y126.296 I-.056 J1.544 E.00022
G1 X107.115 Y111.782 E.02172
G1 X106.965 Y111.653 E.0003
G1 X106.965 Y126.308 E.02193
G2 X106.815 Y126.342 I.081 J.716 E.00023
G1 X106.815 Y111.524 E.02218
G1 X106.665 Y111.395 E.0003
G1 X106.665 Y126.397 E.02245
G2 X106.515 Y126.478 I.388 J.898 E.00026
G1 X106.515 Y111.274 E.02276
G1 X106.365 Y111.159 E.00028
G1 X106.365 Y126.594 E.0231
G2 X106.215 Y126.756 I.837 J.927 E.00033
G1 X106.215 Y111.045 E.02352
G1 X106.065 Y110.93 E.00028
G1 X106.065 Y127.203 E.02436
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X106.065 Y125.203 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X110.864 Y130.601 Z2.84 F30000
G1 Z2.44
M73 P79 R6
G1 E.8 F1800
G1 F3600
G1 X110.864 Y134.857 E.00637
G3 X110.714 Y135.102 I-2.132 J-1.141 E.00043
G1 X110.714 Y130.668 E.00664
G1 X110.564 Y130.668 E.00022
G1 X110.564 Y135.339 E.00699
G1 X110.414 Y135.577 E.00042
G1 X110.414 Y130.668 E.00735
G1 X110.264 Y130.668 E.00022
G1 X110.264 Y135.814 E.0077
G3 X110.114 Y136.025 I-1.852 J-1.158 E.00039
G1 X110.114 Y130.668 E.00802
G1 X109.964 Y130.668 E.00022
G1 X109.964 Y136.234 E.00833
G1 X109.814 Y136.443 E.00039
G1 X109.814 Y127.362 E.01359
G1 X109.664 Y127.362 E.00022
G1 X109.664 Y136.652 E.01391
G3 X109.514 Y136.844 I-1.691 J-1.168 E.00036
G1 X109.514 Y127.362 E.01419
G1 X109.364 Y127.362 E.00022
G1 X109.364 Y137.029 E.01447
G1 X109.214 Y137.214 E.00036
G1 X109.214 Y127.362 E.01475
G1 X109.064 Y127.362 E.00022
G1 X109.064 Y137.399 E.01502
G3 X108.914 Y137.581 I-1.608 J-1.173 E.00035
G1 X108.914 Y127.362 E.01529
G1 X108.764 Y127.362 E.00022
G1 X108.764 Y137.745 E.01554
G1 X108.614 Y137.908 E.00033
G1 X108.614 Y127.362 E.01578
G1 X108.464 Y127.362 E.00022
G1 X108.464 Y138.072 E.01603
G1 X108.314 Y138.236 E.00033
G1 X108.314 Y127.362 E.01628
G1 X108.164 Y127.363 E.00022
G1 X108.164 Y138.396 E.01651
G1 X108.014 Y138.541 E.00031
G1 X108.014 Y127.363 E.01673
G1 X107.864 Y127.363 E.00022
G1 X107.864 Y138.687 E.01695
G1 X107.714 Y138.833 E.00031
G1 X107.714 Y127.363 E.01717
G1 X107.564 Y127.363 E.00022
G1 X107.564 Y138.978 E.01738
G3 X107.414 Y139.123 I-1.293 J-1.189 E.00031
G1 X107.414 Y127.363 E.0176
G1 X107.265 Y127.363 E.00022
G1 X107.265 Y139.252 E.01779
G1 X107.115 Y139.381 E.0003
G1 X107.115 Y130.668 E.01304
G1 X106.965 Y130.668 E.00022
G1 X106.965 Y139.511 E.01323
G1 X106.815 Y139.64 E.0003
G1 X106.815 Y130.668 E.01343
G1 X106.665 Y130.668 E.00022
G1 X106.665 Y139.769 E.01362
G3 X106.515 Y139.89 I-1.095 J-1.204 E.00029
G1 X106.515 Y130.668 E.0138
G1 X106.365 Y130.668 E.00022
G1 X106.365 Y140.005 E.01397
G1 X106.215 Y140.119 E.00028
G1 X106.215 Y130.668 E.01415
G1 X106.065 Y130.668 E.00022
G1 X106.065 Y140.234 E.01432
G1 X105.915 Y140.348 E.00028
G1 X105.915 Y110.816 E.0442
G1 X105.765 Y110.701 E.00028
G1 X105.765 Y140.463 E.04454
G3 X105.615 Y140.567 I-.948 J-1.21 E.00027
G1 X105.615 Y110.597 E.04486
G1 X105.465 Y110.496 E.00027
G1 X105.465 Y140.668 E.04516
G1 X105.315 Y140.769 E.00027
G1 X105.315 Y110.395 E.04546
G1 X105.165 Y110.294 E.00027
G1 X105.165 Y140.87 E.04576
G1 X105.015 Y140.971 E.00027
G1 X105.015 Y130.04 E.01636
G3 X104.865 Y130.258 I-1.154 J-.636 E.0004
G1 X104.865 Y141.072 E.01619
G3 X104.715 Y141.163 I-.844 J-1.218 E.00026
G1 X104.715 Y130.402 E.01611
G3 X104.565 Y130.509 I-.558 J-.629 E.00028
G1 X104.565 Y141.251 E.01608
G1 X104.415 Y141.34 E.00026
G1 X104.415 Y130.582 E.0161
G3 X104.265 Y130.629 I-.27 J-.597 E.00024
G1 X104.265 Y141.429 E.01616
G1 X104.115 Y141.517 E.00026
G1 X104.115 Y130.661 E.01625
G3 X103.965 Y130.668 I-.141 J-1.447 E.00022
G1 X103.965 Y141.606 E.01637
G3 X103.815 Y141.688 I-.767 J-1.221 E.00026
G1 X103.815 Y130.668 E.01649
G1 X103.665 Y130.668 E.00022
G1 X103.665 Y141.765 E.01661
G1 X103.515 Y141.842 E.00025
G1 X103.515 Y130.668 E.01672
G1 X103.365 Y130.668 E.00022
G1 X103.365 Y141.919 E.01684
G1 X103.215 Y141.996 E.00025
G1 X103.215 Y130.668 E.01695
G1 X103.065 Y130.668 E.00022
G1 X103.065 Y142.073 E.01707
G3 X102.915 Y142.149 I-.717 J-1.23 E.00025
G1 X102.915 Y130.668 E.01718
G1 X102.765 Y130.668 E.00022
G1 X102.765 Y142.215 E.01728
G1 X102.615 Y142.281 E.00025
G1 X102.615 Y130.668 E.01738
G1 X102.465 Y130.668 E.00022
G1 X102.465 Y142.347 E.01748
G1 X102.315 Y142.413 E.00025
G1 X102.315 Y130.668 E.01758
G1 X102.165 Y130.668 E.00022
G1 X102.165 Y142.479 E.01768
G1 X102.015 Y142.545 E.00025
G1 X102.015 Y130.668 E.01778
G1 X101.865 Y130.668 E.00022
G1 X101.865 Y142.607 E.01787
G1 X101.715 Y142.662 E.00024
G1 X101.715 Y130.668 E.01795
G1 X101.565 Y130.668 E.00022
G1 X101.565 Y142.718 E.01804
G1 X101.415 Y142.774 E.00024
G1 X101.415 Y131.722 E.01654
G1 X101.265 Y131.722 E.00022
G1 X101.265 Y142.829 E.01662
G1 X101.115 Y142.885 E.00024
G1 X101.115 Y131.722 E.01671
G1 X100.965 Y131.722 E.00022
G1 X100.965 Y142.941 E.01679
G3 X100.815 Y142.99 I-.488 J-1.238 E.00024
G1 X100.815 Y131.722 E.01686
G1 X100.665 Y131.722 E.00022
G1 X100.665 Y143.036 E.01693
G1 X100.515 Y143.082 E.00023
G1 X100.515 Y131.722 E.017
G1 X100.365 Y131.722 E.00022
G1 X100.365 Y143.198 E.01718
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X100.365 Y141.198 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X95.348 Y135.446 Z2.84 F30000
G1 X90.316 Y129.677 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X90.316 Y129.106 E.00085
G1 X90.166 Y129.106 E.00022
G1 X90.166 Y129.609 E.00075
G1 X90.016 Y129.609 E.00022
G1 X90.016 Y129.106 E.00075
G1 X89.866 Y129.107 E.00022
G1 X89.866 Y129.609 E.00075
G1 X89.716 Y129.609 E.00022
G1 X89.716 Y129.107 E.00075
G1 X89.566 Y129.107 E.00022
G1 X89.566 Y129.609 E.00075
G1 X89.416 Y129.609 E.00022
G1 X89.416 Y129.107 E.00075
G1 X89.266 Y129.107 E.00022
G1 X89.266 Y129.609 E.00075
G1 X89.116 Y129.609 E.00022
G1 X89.116 Y129.107 E.00075
G1 X88.966 Y129.107 E.00022
G1 X88.966 Y129.609 E.00075
G1 X88.816 Y129.609 E.00022
G1 X88.816 Y129.107 E.00075
G1 X88.666 Y129.107 E.00022
G1 X88.666 Y129.609 E.00075
G1 X88.516 Y129.609 E.00022
G1 X88.516 Y129.107 E.00075
G1 X88.366 Y129.107 E.00022
G1 X88.366 Y129.609 E.00075
G1 X88.216 Y129.609 E.00022
M73 P80 R6
G1 X88.216 Y129.107 E.00075
G1 X88.066 Y129.107 E.00022
G1 X88.066 Y129.609 E.00075
G1 X87.916 Y129.609 E.00022
G1 X87.916 Y129.107 E.00075
G1 X87.766 Y129.107 E.00022
G1 X87.766 Y129.609 E.00075
G1 X87.616 Y129.609 E.00022
G1 X87.616 Y129.107 E.00075
G1 X87.466 Y129.107 E.00022
G1 X87.466 Y129.609 E.00075
G1 X87.316 Y129.609 E.00022
G1 X87.316 Y129.107 E.00075
G3 X87.166 Y129.098 I-.046 J-.506 E.00023
G1 X87.166 Y129.609 E.00076
G1 X87.016 Y129.609 E.00022
G1 X87.016 Y129.076 E.0008
G3 X86.866 Y129.033 I.093 J-.606 E.00023
G1 X86.866 Y129.609 E.00086
G1 X86.716 Y129.609 E.00022
G1 X86.716 Y128.964 E.00097
G3 X86.566 Y128.866 I.658 J-1.167 E.00027
G1 X86.566 Y130.217 E.00202
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X86.566 Y128.866 E-.15411
G1 X86.716 Y128.964 E-.02045
G1 X86.716 Y129.433 E-.05345
; WIPE_END
G1 E-.012 F1800
G1 X80.716 Y130.86 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X80.716 Y131.711 E.00127
G1 X80.566 Y131.65 E.00024
G1 X80.566 Y130.873 E.00116
G1 X80.416 Y130.812 E.00024
G1 X80.416 Y131.589 E.00116
G1 X80.266 Y131.529 E.00024
G1 X80.266 Y130.752 E.00116
G1 X80.116 Y130.691 E.00024
G1 X80.116 Y131.468 E.00116
G1 X79.966 Y131.408 E.00024
G1 X79.966 Y130.631 E.00116
G1 X79.816 Y130.57 E.00024
G1 X79.816 Y131.42 E.00127
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X79.816 Y130.57 E-.09691
G1 X79.966 Y130.631 E-.01844
G1 X79.966 Y131.408 E-.08861
G1 X80.116 Y131.468 E-.01844
G1 X80.116 Y131.419 E-.0056
; WIPE_END
G1 E-.012 F1800
G1 X85.564 Y126.073 Z2.84 F30000
G1 X88.816 Y122.883 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X88.816 Y122.315 E.00085
G1 X88.666 Y122.315 E.00022
G1 X88.666 Y122.818 E.00075
G1 X88.516 Y122.818 E.00022
G1 X88.516 Y122.315 E.00075
G1 X88.366 Y122.315 E.00022
G1 X88.366 Y122.818 E.00075
G1 X88.216 Y122.818 E.00022
G1 X88.216 Y122.315 E.00075
G1 X88.066 Y122.315 E.00022
G1 X88.066 Y122.818 E.00075
G1 X87.916 Y122.818 E.00022
G1 X87.916 Y122.315 E.00075
G1 X87.766 Y122.315 E.00022
G1 X87.766 Y122.818 E.00075
G1 X87.616 Y122.817 E.00022
G1 X87.616 Y122.315 E.00075
G1 X87.466 Y122.315 E.00022
G1 X87.466 Y122.817 E.00075
G1 X87.316 Y122.817 E.00022
G1 X87.316 Y122.315 E.00075
G1 X87.166 Y122.315 E.00022
G1 X87.166 Y122.817 E.00075
G1 X87.016 Y122.817 E.00022
G1 X87.016 Y122.315 E.00075
G1 X86.866 Y122.315 E.00022
G1 X86.866 Y122.817 E.00075
G1 X86.716 Y122.817 E.00022
G1 X86.716 Y122.315 E.00075
G1 X86.566 Y122.315 E.00022
G1 X86.566 Y122.817 E.00075
G1 X86.416 Y122.817 E.00022
G1 X86.416 Y122.315 E.00075
G1 X86.266 Y122.315 E.00022
G1 X86.266 Y122.817 E.00075
G1 X86.116 Y122.817 E.00022
G1 X86.116 Y122.315 E.00075
G1 X85.966 Y122.315 E.00022
G1 X85.966 Y122.817 E.00075
G1 X85.816 Y122.817 E.00022
G1 X85.816 Y122.315 E.00075
G1 X85.666 Y122.315 E.00022
G1 X85.666 Y122.817 E.00075
G1 X85.516 Y122.817 E.00022
G1 X85.516 Y122.3 E.00077
G3 X85.366 Y122.272 I.051 J-.696 E.00023
G1 X85.366 Y122.817 E.00082
G1 X85.216 Y122.817 E.00022
G1 X85.216 Y122.223 E.00089
G3 X85.066 Y122.146 I.44 J-1.043 E.00025
G1 X85.066 Y122.933 E.00118
G1 X84.916 Y123.351 E.00066
G1 X84.916 Y121.948 E.0021
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X84.916 Y123.351 E-.15994
G1 X85.066 Y122.933 E-.05053
G1 X85.066 Y122.78 E-.01754
; WIPE_END
G1 E-.012 F1800
G1 X91.509 Y118.688 Z2.84 F30000
G1 X105.015 Y110.112 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X105.015 Y126.923 E.02516
G2 X104.865 Y126.705 I-1.873 J1.127 E.0004
G1 X104.865 Y110.092 E.02486
G2 X104.715 Y110.001 I-.844 J1.218 E.00026
G1 X104.715 Y126.559 E.02478
G2 X104.565 Y126.454 I-.754 J.918 E.00027
G1 X104.565 Y109.912 E.02476
G1 X104.415 Y109.824 E.00026
G1 X104.409 Y126.376 E.02477
G2 X104.265 Y126.33 I-.326 J.777 E.00023
G1 X104.265 Y109.735 E.02484
G1 X104.115 Y109.647 E.00026
G1 X104.107 Y126.303 E.02493
G2 X103.965 Y126.293 I-.114 J.624 E.00021
G1 X103.965 Y109.558 E.02505
G2 X103.815 Y109.476 I-.767 J1.221 E.00026
G1 X103.815 Y126.293 E.02517
G1 X103.665 Y126.293 E.00022
G1 X103.665 Y109.399 E.02529
G1 X103.515 Y109.322 E.00025
G1 X103.515 Y126.293 E.0254
G1 X103.365 Y126.293 E.00022
G1 X103.365 Y109.245 E.02552
G1 X103.215 Y109.168 E.00025
G1 X103.215 Y126.293 E.02563
G1 X103.065 Y126.293 E.00022
G1 X103.065 Y109.091 E.02575
G2 X102.915 Y109.015 I-.718 J1.232 E.00025
G1 X102.915 Y126.293 E.02586
G1 X102.765 Y126.293 E.00022
G1 X102.765 Y108.949 E.02596
G1 X102.615 Y108.883 E.00025
G1 X102.615 Y126.293 E.02606
G1 X102.465 Y126.293 E.00022
G1 X102.465 Y108.817 E.02616
G1 X102.315 Y108.751 E.00025
G1 X102.315 Y126.293 E.02626
G1 X102.165 Y126.293 E.00022
G1 X102.165 Y108.685 E.02636
G1 X102.015 Y108.619 E.00025
G1 X102.015 Y126.293 E.02645
G1 X101.865 Y126.293 E.00022
G1 X101.865 Y108.557 E.02655
G1 X101.715 Y108.502 E.00024
G1 X101.715 Y126.293 E.02663
G1 X101.565 Y126.293 E.00022
G1 X101.565 Y108.446 E.02671
G1 X101.415 Y108.39 E.00024
G1 X101.415 Y126.294 E.0268
G1 X101.265 Y126.294 E.00022
G1 X101.265 Y108.334 E.02688
G1 X101.115 Y108.279 E.00024
G1 X101.115 Y126.294 E.02696
G1 X100.965 Y126.294 E.00022
G1 X100.965 Y108.223 E.02705
G2 X100.815 Y108.174 I-.489 J1.24 E.00024
G1 X100.815 Y126.294 E.02712
G1 X100.665 Y126.294 E.00022
G1 X100.665 Y108.128 E.02719
G1 X100.515 Y108.082 E.00023
G1 X100.515 Y126.294 E.02726
G1 X100.365 Y126.294 E.00022
G1 X100.365 Y108.036 E.02733
G1 X100.215 Y107.991 E.00023
G1 X100.215 Y143.173 E.05266
G1 X100.065 Y143.219 E.00023
G1 X100.065 Y107.945 E.05279
G1 X99.915 Y107.899 E.00023
G1 X99.915 Y143.265 E.05293
G3 X99.765 Y143.304 I-.402 J-1.245 E.00023
G1 X99.765 Y107.86 E.05305
G1 X99.615 Y107.824 E.00023
G1 X99.615 Y143.34 E.05316
G1 X99.465 Y143.376 E.00023
G1 X99.465 Y107.788 E.05327
G1 X99.315 Y107.752 E.00023
G1 X99.315 Y126.294 E.02775
G1 X99.165 Y126.294 E.00022
G1 X99.165 Y107.715 E.02781
G1 X99.015 Y107.679 E.00023
G1 X99.015 Y126.294 E.02786
G1 X98.865 Y126.294 E.00022
G1 X98.865 Y107.643 E.02792
G2 X98.715 Y107.613 I-.326 J1.247 E.00023
G1 X98.715 Y126.294 E.02796
G1 X98.565 Y126.294 E.00022
G1 X98.565 Y107.586 E.028
G1 X98.415 Y107.559 E.00023
G1 X98.415 Y126.294 E.02804
G1 X98.265 Y126.294 E.00022
G1 X98.265 Y107.532 E.02808
G1 X98.115 Y107.505 E.00023
G1 X98.111 Y129.584 E.03304
G3 X97.965 Y129.591 I-.091 J-.347 E.00022
G1 X97.965 Y107.478 E.0331
G1 X97.815 Y107.451 E.00023
G1 X97.815 Y129.591 E.03314
G1 X97.665 Y129.591 E.00022
G1 X97.665 Y107.429 E.03317
G1 X97.515 Y107.412 E.00023
G1 X97.515 Y129.591 E.0332
G1 X97.365 Y129.591 E.00022
G1 X97.365 Y107.394 E.03322
G1 X97.215 Y107.376 E.00023
G1 X97.215 Y129.591 E.03325
G1 X97.065 Y129.591 E.00022
G1 X97.065 Y107.358 E.03328
G1 X96.915 Y107.34 E.00023
G1 X96.915 Y129.591 E.0333
G1 X96.765 Y129.591 E.00022
G1 X96.765 Y107.322 E.03333
G2 X96.615 Y107.308 I-.198 J1.258 E.00023
G1 X96.615 Y129.656 E.03345
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X96.615 Y127.656 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X96.465 Y126.361 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X96.465 Y107.299 E.02853
G1 X96.315 Y107.29 E.00022
G1 X96.315 Y126.294 E.02844
G1 X96.165 Y126.294 E.00022
G1 X96.165 Y107.281 E.02846
G1 X96.015 Y107.272 E.00022
G1 X96.015 Y126.294 E.02847
G1 X95.865 Y126.294 E.00022
G1 X95.865 Y107.263 E.02848
G1 X95.715 Y107.254 E.00022
G1 X95.715 Y120.077 E.01919
G2 X95.565 Y119.878 I-1.088 J.665 E.00037
G1 X95.565 Y107.246 E.01891
G1 X95.415 Y107.246 E.00022
G1 X95.415 Y119.742 E.0187
G2 X95.265 Y119.644 I-1.005 J1.384 E.00027
G1 X95.265 Y107.246 E.01856
G1 X95.115 Y107.246 E.00022
G1 X95.115 Y119.575 E.01845
G2 X94.965 Y119.532 I-.333 J.885 E.00023
G1 X94.965 Y107.246 E.01839
G1 X94.815 Y107.246 E.00022
G1 X94.815 Y119.51 E.01835
G2 X94.665 Y119.502 I-.099 J.495 E.00023
G1 X94.665 Y107.246 E.01834
G1 X94.515 Y107.246 E.00022
G1 X94.515 Y119.502 E.01834
G1 X94.365 Y119.502 E.00022
G1 X94.365 Y107.254 E.01833
G1 X94.215 Y107.263 E.00022
G1 X94.215 Y119.502 E.01832
G1 X94.065 Y119.502 E.00022
G1 X94.065 Y107.272 E.01831
G1 X93.915 Y107.281 E.00022
G1 X93.915 Y119.502 E.01829
G1 X93.765 Y119.502 E.00022
G1 X93.765 Y107.29 E.01828
G1 X93.615 Y107.299 E.00022
G1 X93.615 Y119.502 E.01827
G1 X93.465 Y119.502 E.00022
G1 X93.465 Y107.308 E.01825
G2 X93.315 Y107.322 I.049 J1.274 E.00023
G1 X93.315 Y119.502 E.01823
G1 X93.165 Y119.502 E.00022
G1 X93.165 Y107.34 E.0182
G1 X93.015 Y107.358 E.00023
G1 X93.015 Y119.502 E.01818
M73 P81 R6
G1 X92.865 Y119.502 E.00022
G1 X92.865 Y107.376 E.01815
G1 X92.715 Y107.394 E.00023
G1 X92.715 Y119.502 E.01812
G1 X92.565 Y119.502 E.00022
G1 X92.565 Y107.412 E.0181
G1 X92.415 Y107.429 E.00023
G1 X92.415 Y119.502 E.01807
G1 X92.266 Y119.502 E.00022
G1 X92.266 Y107.451 E.01804
G1 X92.116 Y107.478 E.00023
G1 X92.116 Y119.502 E.018
G1 X91.966 Y119.502 E.00022
G1 X91.966 Y107.505 E.01796
G1 X91.816 Y107.532 E.00023
G1 X91.816 Y119.502 E.01792
G1 X91.666 Y119.502 E.00022
G1 X91.666 Y107.559 E.01788
G1 X91.516 Y107.586 E.00023
G1 X91.516 Y119.502 E.01783
G1 X91.366 Y119.502 E.00022
G1 X91.366 Y107.613 E.01779
G2 X91.216 Y107.643 I.176 J1.28 E.00023
G1 X91.216 Y119.502 E.01775
G1 X91.066 Y119.502 E.00022
G1 X91.066 Y107.61 E.0178
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X91.066 Y109.61 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X93.543 Y116.829 Z2.84 F30000
G1 X95.715 Y123.16 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X95.715 Y126.294 E.00469
G1 X95.565 Y126.294 E.00022
G1 X95.565 Y123.501 E.00418
G3 X95.415 Y123.636 I-.795 J-.731 E.0003
G1 X95.415 Y126.361 E.00408
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X95.415 Y124.361 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X95.265 Y129.657 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X95.265 Y123.733 E.00887
G3 X95.115 Y123.804 I-.394 J-.648 E.00025
G1 X95.115 Y129.591 E.00866
G1 X94.965 Y129.591 E.00022
G1 X94.965 Y123.846 E.0086
G3 X94.815 Y123.872 I-.227 J-.877 E.00023
G1 X94.815 Y129.591 E.00856
G1 X94.665 Y129.591 E.00022
G1 X94.665 Y123.876 E.00855
G1 X94.515 Y123.877 E.00022
G1 X94.515 Y129.591 E.00855
G1 X94.365 Y129.591 E.00022
G1 X94.365 Y123.877 E.00855
G1 X94.215 Y123.877 E.00022
G1 X94.215 Y129.591 E.00855
G1 X94.065 Y129.591 E.00022
G1 X94.065 Y123.877 E.00855
G1 X93.915 Y123.877 E.00022
G1 X93.915 Y129.591 E.00855
G3 X93.765 Y129.584 I-.017 J-1.226 E.00022
G1 X93.765 Y123.877 E.00854
G1 X93.615 Y123.877 E.00022
G1 X93.615 Y126.294 E.00362
G1 X93.465 Y126.294 E.00022
G1 X93.465 Y123.877 E.00362
G1 X93.315 Y123.877 E.00022
G1 X93.315 Y126.294 E.00362
G1 X93.165 Y126.294 E.00022
G1 X93.165 Y123.877 E.00362
G1 X93.015 Y123.877 E.00022
G1 X93.015 Y126.294 E.00362
G1 X92.865 Y126.294 E.00022
G1 X92.865 Y123.877 E.00362
M73 P81 R5
G1 X92.715 Y123.877 E.00022
G1 X92.715 Y126.294 E.00362
G1 X92.565 Y126.294 E.00022
G1 X92.565 Y123.809 E.00372
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X92.565 Y125.809 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X99.214 Y129.557 Z2.84 F30000
G1 X99.315 Y129.614 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X99.315 Y143.412 E.02065
G1 X99.165 Y143.449 E.00023
G1 X99.165 Y130.163 E.01988
G3 X99.015 Y130.336 I-.94 J-.662 E.00034
G1 X99.015 Y143.485 E.01968
G1 X98.865 Y143.521 E.00023
G1 X98.863 Y130.462 E.01955
G3 X98.715 Y130.546 I-.55 J-.802 E.00026
G1 X98.715 Y143.551 E.01946
G1 X98.565 Y143.578 E.00023
G1 X98.565 Y130.61 E.01941
G3 X98.415 Y130.649 I-.21 J-.489 E.00023
G1 X98.415 Y143.605 E.01939
G1 X98.265 Y143.632 E.00023
G1 X98.265 Y130.665 E.01941
G3 X98.115 Y130.667 I-.099 J-1.354 E.00022
G1 X98.115 Y143.659 E.01944
G1 X97.965 Y143.686 E.00023
G1 X97.965 Y130.668 E.01948
G1 X97.815 Y130.668 E.00022
G1 X97.815 Y143.713 E.01952
G3 X97.665 Y143.734 I-.26 J-1.253 E.00023
G1 X97.665 Y130.668 E.01956
G1 X97.515 Y130.668 E.00022
G1 X97.515 Y143.752 E.01958
G1 X97.365 Y143.77 E.00023
G1 X97.365 Y130.668 E.01961
G1 X97.215 Y130.668 E.00022
G1 X97.215 Y143.788 E.01964
G1 X97.065 Y143.806 E.00023
G1 X97.065 Y130.668 E.01966
G1 X96.915 Y130.668 E.00022
G1 X96.915 Y143.824 E.01969
G1 X96.765 Y143.842 E.00023
G1 X96.765 Y130.668 E.01972
G1 X96.615 Y130.668 E.00022
G1 X96.615 Y143.856 E.01974
G1 X96.465 Y143.865 E.00022
G1 X96.465 Y130.668 E.01975
G1 X96.315 Y130.668 E.00022
G1 X96.315 Y143.874 E.01977
G1 X96.165 Y143.883 E.00022
G1 X96.165 Y130.668 E.01978
G1 X96.015 Y130.668 E.00022
G1 X96.015 Y143.892 E.01979
G1 X95.865 Y143.901 E.00022
G1 X95.865 Y130.668 E.01981
G1 X95.715 Y130.668 E.00022
G1 X95.715 Y143.91 E.01982
G3 X95.565 Y143.918 I-.141 J-1.259 E.00022
G1 X95.565 Y130.668 E.01983
G1 X95.415 Y130.668 E.00022
G1 X95.415 Y143.918 E.01983
G1 X95.265 Y143.918 E.00022
G1 X95.265 Y130.668 E.01983
G1 X95.115 Y130.668 E.00022
G1 X95.115 Y143.918 E.01983
G1 X94.965 Y143.918 E.00022
G1 X94.965 Y130.668 E.01983
G1 X94.815 Y130.668 E.00022
G1 X94.815 Y143.918 E.01983
G1 X94.665 Y143.918 E.00022
G1 X94.665 Y130.668 E.01983
G1 X94.515 Y130.668 E.00022
G1 X94.515 Y143.918 E.01983
G3 X94.365 Y143.91 I-.009 J-1.268 E.00022
G1 X94.365 Y130.668 E.01982
G1 X94.215 Y130.668 E.00022
G1 X94.215 Y143.901 E.01981
G1 X94.065 Y143.892 E.00022
G1 X94.065 Y130.668 E.01979
G1 X93.915 Y130.668 E.00022
G1 X93.915 Y143.883 E.01978
G1 X93.765 Y143.874 E.00022
G1 X93.765 Y130.668 E.01977
G1 X93.615 Y130.668 E.00022
G1 X93.615 Y143.865 E.01975
G1 X93.465 Y143.856 E.00022
G1 X93.465 Y130.668 E.01974
G1 X93.315 Y130.668 E.00022
G1 X93.315 Y143.842 E.01972
G1 X93.165 Y143.824 E.00023
G1 X93.165 Y130.668 E.01969
G1 X93.015 Y130.668 E.00022
G1 X93.015 Y143.806 E.01966
G1 X92.865 Y143.788 E.00023
G1 X92.865 Y130.668 E.01964
G1 X92.715 Y130.668 E.00022
G1 X92.715 Y143.77 E.01961
G1 X92.565 Y143.752 E.00023
G1 X92.565 Y130.601 E.01968
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X92.565 Y132.601 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X92.435 Y124.969 Z2.84 F30000
G1 X92.415 Y123.809 Z2.84
G1 Z2.44
M73 P82 R5
G1 E.8 F1800
G1 F3600
G1 X92.415 Y143.734 E.02982
G3 X92.266 Y143.713 I.11 J-1.275 E.00023
G1 X92.266 Y123.809 E.02979
G1 X92.116 Y123.809 F30000
G1 F3600
G1 X92.116 Y143.686 E.02975
G1 X91.966 Y143.659 E.00023
G1 X91.966 Y124.93 E.02803
G1 X91.816 Y124.93 E.00022
G1 X91.816 Y143.632 E.02799
G1 X91.666 Y143.605 E.00023
G1 X91.666 Y124.93 E.02795
G1 X91.516 Y124.93 E.00022
G1 X91.516 Y126.294 E.00204
G1 X91.366 Y126.294 E.00022
G1 X91.366 Y124.93 E.00204
G1 X91.216 Y124.93 E.00022
G1 X91.216 Y126.294 E.00204
G1 X91.066 Y126.294 E.00022
G1 X91.066 Y124.863 E.00214
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X91.066 Y126.294 E-.16315
G1 X91.216 Y126.294 E-.0171
G1 X91.216 Y125.875 E-.04775
; WIPE_END
G1 E-.012 F1800
G1 X90.916 Y126.362 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X90.916 Y107.715 E.02791
G1 X90.766 Y107.752 E.00023
G1 X90.766 Y126.294 E.02775
G1 X90.616 Y126.294 E.00022
G1 X90.616 Y107.788 E.0277
G1 X90.466 Y107.824 E.00023
G1 X90.466 Y126.294 E.02764
G1 X90.316 Y126.294 E.00022
G1 X90.316 Y107.86 E.02759
G2 X90.166 Y107.899 I.252 J1.285 E.00023
G1 X90.166 Y126.294 E.02753
G1 X90.016 Y126.294 E.00022
G1 X90.016 Y107.945 E.02746
G1 X89.866 Y107.991 E.00023
G1 X89.866 Y119.502 E.01723
G1 X89.716 Y119.502 E.00022
G1 X89.716 Y108.037 E.01716
G1 X89.566 Y108.082 E.00023
G1 X89.566 Y119.502 E.01709
G1 X89.416 Y119.502 E.00022
G1 X89.416 Y108.128 E.01702
G1 X89.266 Y108.174 E.00023
G1 X89.266 Y119.502 E.01696
G1 X89.116 Y119.502 E.00022
G1 X89.116 Y108.223 E.01688
G1 X88.966 Y108.279 E.00024
G1 X88.966 Y119.502 E.0168
G1 X88.816 Y119.502 E.00022
G1 X88.816 Y108.334 E.01672
G1 X88.666 Y108.39 E.00024
G1 X88.666 Y119.502 E.01663
G1 X88.516 Y119.502 E.00022
G1 X88.516 Y108.446 E.01655
G1 X88.366 Y108.502 E.00024
G1 X88.366 Y119.502 E.01647
G1 X88.216 Y119.502 E.00022
G1 X88.216 Y108.557 E.01638
G2 X88.066 Y108.619 I.441 J1.295 E.00024
G1 X88.066 Y119.503 E.01629
G1 X87.916 Y119.503 E.00022
G1 X87.916 Y108.685 E.01619
G1 X87.766 Y108.751 E.00025
G1 X87.766 Y119.503 E.01609
G1 X87.616 Y119.503 E.00022
G1 X87.616 Y108.817 E.01599
G1 X87.466 Y108.883 E.00025
G1 X87.466 Y119.503 E.01589
G1 X87.316 Y119.503 E.00022
G1 X87.316 Y108.949 E.0158
G1 X87.166 Y109.015 E.00025
G1 X87.166 Y119.503 E.0157
G1 X87.016 Y119.503 E.00022
G1 X87.016 Y109.091 E.01558
G1 X86.866 Y109.168 E.00025
G1 X86.866 Y119.503 E.01547
G1 X86.716 Y119.503 E.00022
G1 X86.716 Y109.245 E.01535
G1 X86.566 Y109.322 E.00025
G1 X86.566 Y119.503 E.01524
G1 X86.416 Y119.503 E.00022
G1 X86.416 Y109.399 E.01512
G1 X86.266 Y109.476 E.00025
G1 X86.266 Y119.503 E.01501
G1 X86.116 Y119.503 E.00022
G1 X86.116 Y109.558 E.01488
G1 X85.966 Y109.647 E.00026
G1 X85.966 Y119.503 E.01475
G1 X85.816 Y119.503 E.00022
G1 X85.816 Y109.735 E.01462
G1 X85.666 Y109.824 E.00026
G1 X85.659 Y119.503 E.01449
G2 X85.516 Y119.513 I-.008 J.917 E.00021
G1 X85.516 Y109.912 E.01437
G1 X85.366 Y110.001 E.00026
G1 X85.366 Y119.544 E.01428
G2 X85.216 Y119.594 I.189 J.804 E.00024
G1 X85.216 Y110.092 E.01422
G1 X85.066 Y110.193 E.00027
G1 X85.066 Y119.671 E.01419
G2 X84.916 Y119.779 I.722 J1.155 E.00028
G1 X84.916 Y110.294 E.0142
G1 X84.766 Y110.395 E.00027
G1 X84.761 Y119.936 E.01428
G2 X84.616 Y120.159 I1.06 J.849 E.0004
G1 X84.616 Y110.415 E.01458
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X84.616 Y112.415 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X87.98 Y119.266 Z2.84 F30000
G1 X89.866 Y123.107 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X89.866 Y126.294 E.00477
G1 X89.716 Y126.294 E.00022
G1 X89.716 Y123.477 E.00422
G3 X89.566 Y123.621 I-1.336 J-1.242 E.00031
G1 X89.566 Y126.294 E.004
G1 X89.416 Y126.294 E.00022
G1 X89.416 Y123.723 E.00385
G3 X89.266 Y123.792 I-.419 J-.714 E.00025
G1 X89.266 Y126.294 E.00374
G1 X89.116 Y126.294 E.00022
G1 X89.116 Y123.836 E.00368
G1 X88.966 Y123.869 E.00023
G1 X88.966 Y126.294 E.00363
G1 X88.816 Y126.294 E.00022
G1 X88.816 Y123.878 E.00362
G1 X88.666 Y123.876 E.00022
G1 X88.666 Y126.294 E.00362
G1 X88.516 Y126.294 E.00022
G1 X88.516 Y123.876 E.00362
G1 X88.366 Y123.876 E.00022
G1 X88.366 Y126.294 E.00362
G1 X88.216 Y126.294 E.00022
G1 X88.216 Y123.876 E.00362
G1 X88.066 Y123.876 E.00022
G1 X88.066 Y126.294 E.00362
G1 X87.916 Y126.294 E.00022
G1 X87.916 Y123.876 E.00362
G1 X87.766 Y123.876 E.00022
G1 X87.766 Y126.294 E.00362
G1 X87.616 Y126.294 E.00022
G1 X87.616 Y123.876 E.00362
G1 X87.466 Y123.876 E.00022
G1 X87.466 Y126.294 E.00362
G1 X87.316 Y126.295 E.00022
G1 X87.316 Y123.876 E.00362
G1 X87.166 Y123.876 E.00022
G1 X87.166 Y126.299 E.00363
G2 X87.016 Y126.324 I.101 J1.101 E.00023
G1 X87.016 Y123.876 E.00366
G1 X86.866 Y123.876 E.00022
G1 X86.866 Y126.368 E.00373
G2 X86.716 Y126.437 I.394 J1.065 E.00025
G1 X86.716 Y123.876 E.00383
G1 X86.566 Y123.876 E.00022
G1 X86.566 Y126.535 E.00398
G2 X86.416 Y126.674 I.512 J.701 E.00031
G1 X86.416 Y123.876 E.00419
G1 X86.266 Y123.876 E.00022
G1 X86.266 Y127.014 E.0047
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X86.266 Y125.014 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X91.516 Y129.757 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X91.516 Y143.578 E.02069
G1 X91.366 Y143.551 E.00023
G1 X91.366 Y130.213 E.01996
G3 X91.216 Y130.374 I-.991 J-.775 E.00033
G1 X91.216 Y143.521 E.01968
G1 X91.066 Y143.485 E.00023
G1 X91.066 Y130.486 E.01946
M73 P83 R5
G3 X90.916 Y130.567 I-.488 J-.72 E.00026
G1 X90.916 Y143.449 E.01928
G1 X90.766 Y143.412 E.00023
G1 X90.766 Y130.616 E.01915
G3 X90.616 Y130.652 I-.343 J-1.107 E.00023
G1 X90.616 Y143.376 E.01904
G1 X90.466 Y143.34 E.00023
G1 X90.466 Y130.67 E.01896
G2 X90.316 Y130.668 I-.118 J3.101 E.00022
G1 X90.316 Y143.304 E.01891
G3 X90.166 Y143.265 I.252 J-1.283 E.00023
G1 X90.166 Y130.668 E.01885
G1 X90.016 Y130.668 E.00022
G1 X90.016 Y143.219 E.01879
G1 X89.866 Y143.173 E.00023
G1 X89.866 Y130.668 E.01872
G1 X89.716 Y130.668 E.00022
G1 X89.716 Y143.127 E.01865
G1 X89.566 Y143.082 E.00023
G1 X89.566 Y130.668 E.01858
G1 X89.416 Y130.668 E.00022
G1 X89.416 Y143.036 E.01851
G1 X89.266 Y142.99 E.00023
G1 X89.266 Y130.668 E.01844
G1 X89.116 Y130.668 E.00022
G1 X89.116 Y142.941 E.01837
G1 X88.966 Y142.885 E.00024
G1 X88.966 Y130.668 E.01829
G1 X88.816 Y130.668 E.00022
G1 X88.816 Y142.829 E.0182
G1 X88.666 Y142.774 E.00024
G1 X88.666 Y130.668 E.01812
G1 X88.516 Y130.668 E.00022
G1 X88.516 Y142.718 E.01804
G1 X88.366 Y142.662 E.00024
G1 X88.366 Y130.668 E.01795
G1 X88.216 Y130.668 E.00022
G1 X88.216 Y142.607 E.01787
G3 X88.066 Y142.545 I.441 J-1.294 E.00024
G1 X88.066 Y130.668 E.01778
G1 X87.916 Y130.668 E.00022
G1 X87.916 Y142.479 E.01768
G1 X87.766 Y142.413 E.00025
G1 X87.766 Y130.668 E.01758
G1 X87.616 Y130.668 E.00022
G1 X87.616 Y142.347 E.01748
G1 X87.466 Y142.281 E.00025
G1 X87.466 Y130.668 E.01738
G1 X87.316 Y130.668 E.00022
G1 X87.316 Y142.215 E.01728
G1 X87.166 Y142.149 E.00025
G1 X87.166 Y130.668 E.01718
G1 X87.016 Y130.668 E.00022
G1 X87.016 Y142.073 E.01707
G1 X86.866 Y141.996 E.00025
G1 X86.866 Y130.668 E.01695
G1 X86.716 Y130.668 E.00022
G1 X86.716 Y141.919 E.01684
G1 X86.566 Y141.842 E.00025
G1 X86.566 Y130.601 E.01683
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X86.566 Y132.601 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X86.416 Y128.625 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X86.416 Y141.765 E.01967
G1 X86.266 Y141.688 E.00025
G1 X86.266 Y128.387 E.01991
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X86.266 Y130.387 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X86.116 Y123.809 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X86.116 Y141.606 E.02664
G1 X85.966 Y141.517 E.00026
G1 X85.966 Y123.876 E.0264
G1 X85.816 Y123.876 E.00022
G1 X85.816 Y141.429 E.02627
G1 X85.666 Y141.34 E.00026
G1 X85.666 Y123.876 E.02614
G1 X85.516 Y123.876 E.00022
G1 X85.516 Y141.251 E.02601
G1 X85.366 Y141.163 E.00026
G1 X85.366 Y123.876 E.02587
G1 X85.216 Y123.876 E.00022
G1 X85.216 Y127.162 E.00492
G2 X85.066 Y126.917 I-.93 J.401 E.00043
G1 X85.066 Y123.876 E.00455
G1 X84.916 Y123.876 E.00022
G1 X84.916 Y126.741 E.00429
G2 X84.766 Y126.61 I-.512 J.433 E.0003
G1 X84.766 Y121.885 E.00707
G3 X84.616 Y121.657 I1.199 J-.952 E.00041
G1 X84.616 Y126.504 E.00725
G2 X84.466 Y126.424 I-.565 J.876 E.00025
G1 X84.466 Y110.597 E.02369
G2 X84.316 Y110.701 I.799 J1.315 E.00027
G1 X84.316 Y126.371 E.02345
G3 X84.166 Y126.33 I.31 J-1.411 E.00023
G1 X84.166 Y110.816 E.02322
G1 X84.016 Y110.93 E.00028
G1 X84.016 Y119.502 E.01283
G1 X84.119 Y119.502 E.00015
G1 X84.016 Y119.789 E.00046
G1 X84.016 Y126.303 E.00975
G2 X83.866 Y126.294 I-.223 J2.436 E.00022
G1 X83.866 Y120.21 E.00911
G1 X83.716 Y120.63 E.00067
G1 X83.716 Y126.294 E.00848
G1 X83.566 Y126.294 E.00022
G1 X83.566 Y120.653 E.00844
G1 X83.416 Y120.653 E.00022
G1 X83.416 Y126.294 E.00844
G1 X83.266 Y126.294 E.00022
G1 X83.266 Y120.653 E.00844
G1 X83.116 Y120.653 E.00022
G1 X83.116 Y126.294 E.00844
G1 X82.966 Y126.294 E.00022
G1 X82.966 Y120.653 E.00844
G1 X82.816 Y120.653 E.00022
G1 X82.816 Y126.294 E.00844
G1 X82.666 Y126.294 E.00022
G1 X82.666 Y120.653 E.00844
G1 X82.516 Y120.653 E.00022
G1 X82.516 Y126.294 E.00844
G1 X82.366 Y126.294 E.00022
G1 X82.366 Y120.653 E.00844
G1 X82.216 Y120.653 E.00022
G1 X82.216 Y126.294 E.00844
G1 X82.066 Y126.294 E.00022
G1 X82.066 Y120.653 E.00844
G1 X81.916 Y120.653 E.00022
G1 X81.916 Y126.294 E.00844
G1 X81.766 Y126.294 E.00022
G1 X81.766 Y120.653 E.00844
G1 X81.616 Y120.653 E.00022
G1 X81.616 Y126.294 E.00844
G1 X81.466 Y126.294 E.00022
G1 X81.466 Y120.653 E.00844
G1 X81.316 Y120.653 E.00022
G1 X81.316 Y126.294 E.00844
G1 X81.166 Y126.294 E.00022
G1 X81.166 Y120.585 E.00854
G1 X81.016 Y120.585 F30000
G1 F3600
G1 X81.016 Y126.294 E.00854
G1 X80.866 Y126.294 E.00022
G1 X80.866 Y124.927 E.00205
G1 X80.716 Y124.927 E.00022
G1 X80.716 Y126.294 E.00205
G1 X80.566 Y126.294 E.00022
G1 X80.566 Y124.927 E.00205
G1 X80.416 Y124.927 E.00022
G1 X80.416 Y126.294 E.00205
G1 X80.266 Y126.294 E.00022
G1 X80.266 Y124.927 E.00205
G1 X80.116 Y124.927 E.00022
G1 X80.116 Y126.294 E.00205
G1 X79.966 Y126.294 E.00022
G1 X79.966 Y124.859 E.00215
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X79.966 Y126.294 E-.16356
G1 X80.116 Y126.294 E-.0171
G1 X80.116 Y125.879 E-.04734
; WIPE_END
G1 E-.012 F1800
G1 X85.216 Y128.533 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X85.216 Y141.072 E.01877
G1 X85.066 Y140.971 E.00027
G1 X85.065 Y130.69 E.01539
G3 X84.916 Y131.012 I-1.7 J-.593 E.00053
G1 X84.916 Y140.87 E.01475
G1 X84.766 Y140.769 E.00027
G1 X84.766 Y131.224 E.01429
G3 X84.616 Y131.384 I-1.679 J-1.421 E.00033
G1 X84.616 Y140.668 E.01389
G1 X84.466 Y140.566 E.00027
G1 X84.466 Y131.513 E.01355
G3 X84.316 Y131.618 I-.617 J-.72 E.00027
G1 X84.316 Y140.463 E.01324
G1 X84.166 Y140.348 E.00028
G1 X84.166 Y131.705 E.01294
G1 X84.016 Y131.775 E.00025
G1 X84.016 Y140.234 E.01266
G1 X83.866 Y140.119 E.00028
G1 X83.866 Y131.83 E.01241
G3 X83.716 Y131.873 I-.306 J-.784 E.00023
G1 X83.716 Y140.005 E.01217
G1 X83.566 Y139.89 E.00028
G1 X83.566 Y131.907 E.01195
G3 X83.416 Y131.928 I-.331 J-1.786 E.00023
G1 X83.416 Y139.769 E.01174
G1 X83.266 Y139.64 E.0003
G1 X83.266 Y131.937 E.01153
G3 X83.116 Y131.941 I-.11 J-1.329 E.00022
G1 X83.116 Y139.511 E.01133
G1 X82.966 Y139.381 E.0003
G1 X82.966 Y131.941 E.01114
G1 X82.816 Y131.941 E.00022
G1 X82.816 Y139.252 E.01094
G1 X82.666 Y139.123 E.0003
G1 X82.666 Y131.941 E.01075
G1 X82.516 Y131.941 E.00022
G1 X82.516 Y138.978 E.01053
G1 X82.366 Y138.832 E.00031
G1 X82.366 Y131.941 E.01031
G1 X82.216 Y131.941 E.00022
G1 X82.216 Y138.687 E.0101
G1 X82.066 Y138.541 E.00031
G1 X82.066 Y131.941 E.00988
G1 X81.916 Y131.941 E.00022
G1 X81.916 Y138.396 E.00966
G3 X81.766 Y138.236 I1.267 J-1.342 E.00033
G1 X81.766 Y131.941 E.00942
G1 X81.616 Y131.941 E.00022
G1 X81.616 Y138.072 E.00918
G1 X81.466 Y137.908 E.00033
G1 X81.466 Y131.941 E.00893
G1 X81.316 Y131.941 E.00022
G1 X81.316 Y137.744 E.00869
G1 X81.166 Y137.58 E.00033
G1 X81.166 Y131.942 E.00844
G1 X81.016 Y131.942 E.00022
G1 X81.016 Y137.399 E.00817
G1 X80.866 Y137.214 E.00036
G1 X80.866 Y133.073 E.0062
G1 X80.716 Y133.012 E.00024
G1 X80.716 Y137.029 E.00601
G1 X80.566 Y136.844 E.00036
G1 X80.566 Y132.951 E.00583
G1 X80.416 Y132.891 E.00024
G1 X80.416 Y136.652 E.00563
G1 X80.266 Y136.443 E.00039
G1 X80.266 Y132.83 E.00541
G1 X80.116 Y132.77 E.00024
G1 X80.116 Y136.234 E.00519
G1 X79.966 Y136.025 E.00039
G1 X79.966 Y132.709 E.00496
G1 X79.816 Y132.649 E.00024
G1 X79.816 Y135.932 E.00491
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X79.816 Y133.932 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X85.066 Y129.889 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X85.066 Y128.933 E.00143
G3 X84.916 Y129.105 I-.894 J-.628 E.00034
G1 X84.916 Y129.345 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X84.916 Y129.105 E-.03846
G1 X85.066 Y128.933 E-.03654
G1 X85.066 Y129.889 E-.15301
; WIPE_END
G1 E-.012 F1800
G1 X84.184 Y122.308 Z2.84 F30000
G1 X83.866 Y119.57 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X83.866 Y111.045 E.01276
G1 X83.716 Y111.159 E.00028
G1 X83.716 Y119.502 E.01249
G1 X83.566 Y119.502 E.00022
G1 X83.566 Y111.274 E.01232
G2 X83.416 Y111.395 I.944 J1.324 E.00029
G1 X83.416 Y119.502 E.01213
G1 X83.266 Y119.502 E.00022
G1 X83.266 Y111.524 E.01194
G1 X83.116 Y111.653 E.0003
G1 X83.116 Y119.502 E.01175
G1 X82.966 Y119.502 E.00022
G1 X82.966 Y111.783 E.01155
G1 X82.816 Y111.912 E.0003
G1 X82.816 Y119.502 E.01136
G1 X82.666 Y119.502 E.00022
G1 X82.666 Y112.041 E.01117
G2 X82.516 Y112.186 I1.147 J1.339 E.00031
G1 X82.516 Y119.502 E.01095
G1 X82.366 Y119.502 E.00022
G1 X82.366 Y112.331 E.01073
G1 X82.216 Y112.477 E.00031
G1 X82.216 Y119.502 E.01051
G1 X82.066 Y119.502 E.00022
G1 X82.066 Y112.623 E.0103
M73 P84 R5
G1 X81.916 Y112.768 E.00031
G1 X81.916 Y119.502 E.01008
G1 X81.766 Y119.502 E.00022
G1 X81.766 Y112.928 E.00984
G1 X81.616 Y113.092 E.00033
G1 X81.616 Y119.502 E.00959
G1 X81.466 Y119.502 E.00022
G1 X81.466 Y113.256 E.00935
G1 X81.316 Y113.419 E.00033
G1 X81.316 Y119.502 E.0091
G1 X81.166 Y119.502 E.00022
G1 X81.166 Y113.583 E.00886
G2 X81.016 Y113.765 I1.46 J1.357 E.00035
G1 X81.016 Y119.502 E.00859
G1 X80.866 Y119.502 E.00022
G1 X80.866 Y113.95 E.00831
G1 X80.716 Y114.135 E.00036
G1 X80.716 Y119.502 E.00803
G1 X80.566 Y119.502 E.00022
G1 X80.566 Y114.32 E.00776
G2 X80.416 Y114.512 I1.543 J1.361 E.00036
G1 X80.416 Y119.502 E.00747
G1 X80.266 Y119.502 E.00022
G1 X80.266 Y114.721 E.00716
G1 X80.116 Y114.93 E.00039
G1 X80.116 Y119.502 E.00684
G1 X79.966 Y119.502 E.00022
G1 X79.966 Y115.139 E.00653
G2 X79.816 Y115.35 I1.701 J1.369 E.00039
G1 X79.816 Y126.361 E.01648
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X79.816 Y124.361 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X79.715 Y131.993 Z2.84 F30000
G1 X79.666 Y135.703 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F3600
G1 X79.666 Y115.587 E.03011
G1 X79.516 Y115.825 E.00042
G1 X79.516 Y135.339 E.02921
G1 X79.366 Y135.101 E.00042
G1 X79.366 Y116.062 E.0285
G2 X79.216 Y116.307 I1.982 J1.385 E.00043
G1 X79.216 Y134.857 E.02776
G1 X79.066 Y134.585 E.00047
G1 X79.066 Y116.579 E.02695
G1 X78.916 Y116.851 E.00047
G1 X78.916 Y134.313 E.02614
G1 X78.766 Y134.041 E.00047
G1 X78.766 Y117.123 E.02532
G2 X78.616 Y117.425 I2.471 J1.416 E.0005
G1 X78.616 Y133.739 E.02442
G1 X78.466 Y133.424 E.00052
G1 X78.466 Y117.74 E.02347
G1 X78.316 Y118.055 E.00052
G1 X78.316 Y133.109 E.02253
G3 X78.166 Y132.763 I2.847 J-1.438 E.00057
G1 X78.166 Y118.401 E.02149
G1 X78.016 Y118.771 E.0006
G1 X78.016 Y132.393 E.02039
G1 X77.866 Y132.023 E.0006
G1 X77.866 Y118.961 E.01955
G1 X77.716 Y119.363 F30000
G1 F3600
G1 X77.716 Y131.801 E.01862
G1 X77.566 Y131.357 F30000
G1 F3600
G1 X77.566 Y119.807 E.01729
G1 X77.416 Y120.261 F30000
G1 F3600
G1 X77.416 Y130.903 E.01593
G1 X77.267 Y130.354 F30000
G1 F3600
G1 X77.267 Y120.81 E.01428
G1 X77.117 Y121.389 F30000
G1 F3600
G1 X77.117 Y129.774 E.01255
G1 X76.967 Y129.062 F30000
G1 F3600
G1 X76.967 Y122.102 E.01042
G1 X76.817 Y123.015 F30000
G1 F3600
G1 X76.817 Y128.149 E.00768
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X76.817 Y126.149 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 16/18
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S209.1
G17
G3 Z2.84 I1.217 J0 P1  F30000
; object ids of layer 16 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer16 end: 145,179
M625
M204 S10000
G1 X74.5 Y206.5
G1 Z2.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X75.000 Y207.500  
G1  X40.750  E1.0609 F5400
G1 E-0.8000 F1800
G1  X40.000 Y205.750   F600
G1 E0.8000 F1800
G1  Y198.000  E0.2401 F5400
G1  X75.000  E1.0842
G1  Y207.500  E0.2943
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.160000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3 I1.217 J0 P1  F5400
; filament end gcode 
;M106 P3 S0

;=X1 20251031=
M620 S1A
M204 S9000
G1 Z5.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220


M620.11 S0

M400
G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000
G1 X20 Y50 F21000
G1 Y-3

M620.1 E F668.524 T240
T1
M73 E0
M620.1 E F668.524 T240



M620.11 S0

G92 E0

M83
; FLUSH_START
; always use highest temperature to flush
M400

M109 S240


G1 E23.7 F668.524 ; do not need pulsatile flushing for start part
G1 E0.73168 F50
G1 E8.41432 F668.524
G1 E0.73168 F50
G1 E8.41432 F668.524
G1 E0.73168 F50
G1 E8.41432 F668.524
G1 E0.73168 F50
G1 E8.41432 F668.524

; FLUSH_END
G1 E-2 F1800
G1 E2 F300




G91
G1 X3 F12000; move aside to extrude
G90
M83

; FLUSH_START
G1 E10.8511 F668.524
G1 E1.20568 F50
G1 E10.8511 F668.524
G1 E1.20568 F50
G1 E10.8511 F668.524
G1 E1.20568 F50
G1 E10.8511 F668.524
G1 E1.20568 F50
G1 E10.8511 F668.524
G1 E1.20568 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S220
G1 E2 F668.524 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X105 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000

G1 X70 F10000
G1 X80 F15000
G1 X60
G1 X80
G1 X60
G1 X80 ; shake to put down garbage
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z5.6 F3000

M204 S10000


M621 S1A
M106 S209.1
G1 X49.945 Y212.699 F30000
G1 Z2.6
G1 X42.312 Y212.699 Z3
G1 X34.801 Y212.699 Z3
G1 X34.801 Y207

; filament start gcode
;Prevent PLA from jamming
G1 X40.5 Y207
G1 Z2.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S10000
G1  X43.500 Y207.000  E0.0929 F1782
G1 E-0.8000 F1800
G1  X39.000  F600
G1  X43.500  F240
G1 E0.8000 F1800
G1  X74.500  E0.9603 F1782
G1  Y206.500  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X40.500  E1.2922 F2025
; LAYER_HEIGHT: 0.160000
G1  Y206.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922 F2473
; LAYER_HEIGHT: 0.160000
G1  Y205.500  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X40.500  E1.2922 F4725
; LAYER_HEIGHT: 0.160000
G1  Y205.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922 F4775
; LAYER_HEIGHT: 0.160000
G1  Y204.500  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X40.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y204.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y203.500  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X40.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y203.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y202.500  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X40.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y202.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y201.500  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X40.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y201.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y200.500  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X40.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y200.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y199.500  E0.0155
; LAYER_HEIGHT: 0.200000
M73 P84 R4
G1  X40.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y199.000  E0.0155
; LAYER_HEIGHT: 0.200000
G1  X74.500  E1.2922
; LAYER_HEIGHT: 0.160000
G1  Y198.500  E0.0155
G1  X40.500  E1.0532
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X42.5 Y198.5 E-.228
; WIPE_END
M73 P87 R4
G1 E-.012 F1800
G17
M73 P87 R3
G3 Z3 I1.217 J0 P1  F30000
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
M204 S10000
M73 P88 R3
G1 X138.045 Y137.333
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G1 X137.346 Y136.463 E.03086
G3 X152.673 Y105.87 I15.099 J-11.572 E1.17651
G3 X166.836 Y112.441 I-.245 J19.076 E.44477
G1 X167.026 Y112.674 E.00828
G3 X138.088 Y137.373 I-14.581 J12.218 E1.64289
G1 X138.362 Y137.074 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X152.674 Y106.27 I14.09 J-12.18 E1.09685
G3 X166.533 Y112.704 I-.246 J18.675 E.40384
G3 X138.401 Y137.12 I-14.081 J12.19 E1.4999
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.658 Y136.223 E-.13269
G1 X137.17 Y135.545 E-.09532
; WIPE_END
G1 E-.012 F1800
G1 X144.565 Y137.435 Z3 F30000
G1 X161.835 Y141.849 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P89 R3
G1 F12000
G3 X137.733 Y112.262 I-9.397 J-16.955 E1.49364
G3 X153.27 Y105.526 I14.714 J12.654 E.4845
G3 X161.887 Y141.82 I-.832 J19.367 E1.38796
G1 X162.029 Y142.2 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X136.692 Y112.913 I-9.591 J-17.306 E1.38438
G3 X153.293 Y105.126 I15.766 J12.024 E.48901
G3 X162.081 Y142.171 I-.855 J19.767 E1.3143
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X160.989 Y142.742 E-.14049
G1 X160.287 Y143.052 E-.08751
; WIPE_END
G1 E-.012 F1800
G1 X156.043 Y136.709 Z3 F30000
G1 X146.625 Y122.632 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X146.614 Y116.294 E.17523
G1 X151.312 Y116.286 E.12989
G1 X151.318 Y119.732 E.09529
G1 X151.32 Y120.729 E.02756
G1 X146.681 Y122.609 E.13841
G1 X146.226 Y123.226 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X146.212 Y115.895 E.18809
G1 X151.711 Y115.884 E.14107
G1 X151.719 Y119.731 E.09869
G1 X151.721 Y120.998 E.03251
G1 X146.281 Y123.204 E.15059
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X146.262 Y121.204 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X148.968 Y119.148 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459986
G1 F7200
G1 X148.967 Y118.699 E.0127
G1 X149.374 Y119.421 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X149.372 Y118.233 E.03048
G1 X148.561 Y118.234 E.02081
G1 X148.563 Y119.749 E.03887
G1 X149.319 Y119.443 E.0209
G1 X149.76 Y119.68 F30000
G1 F7200
G1 X149.757 Y117.846 E.04705
G1 X148.174 Y117.849 E.0406
G1 X148.179 Y120.321 E.06342
G1 X149.705 Y119.703 E.04224
G1 X150.146 Y119.94 F30000
G1 F7200
G1 X150.142 Y117.46 E.06362
G1 X147.788 Y117.464 E.06039
G1 X147.794 Y120.893 E.08798
G1 X150.091 Y119.962 E.06358
G1 X150.533 Y120.199 F30000
G1 F7200
G1 X150.527 Y117.073 E.0802
G1 X147.402 Y117.079 E.08017
G1 X147.409 Y121.466 E.11253
G1 X150.477 Y120.222 E.08491
G1 X150.919 Y120.459 F30000
G1 F7200
G1 X150.912 Y116.687 E.09677
G1 X147.015 Y116.694 E.09996
M73 P90 R3
G1 X147.025 Y122.038 E.13708
G1 X150.863 Y120.482 E.10625
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X149.01 Y121.233 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.874 Y124.571 Z3 F30000
G1 X158.176 Y125.69 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X153.475 Y123.804 E.14007
G1 X153.46 Y116.282 E.20799
G1 X158.158 Y116.273 E.12991
G1 X158.172 Y123.777 E.20748
G1 X158.176 Y125.63 E.05125
G1 X158.578 Y126.283 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X153.074 Y124.075 E.15212
G1 X153.059 Y115.882 E.2102
G1 X158.558 Y115.871 E.14109
G1 X158.573 Y123.776 E.20278
G1 X158.578 Y126.223 E.06278
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X156.715 Y125.496 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.821 Y122.214 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.460146
G1 F7200
G1 X155.814 Y118.686 E.09993
G1 X155.415 Y122.489 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X156.227 Y122.814 E.02245
G1 X156.219 Y118.22 E.11787
G1 X155.407 Y118.221 E.02082
G1 X155.415 Y122.429 E.10794
G1 X155.03 Y122.75 F30000
G1 F7200
G1 X156.614 Y123.385 E.04378
G1 X156.604 Y117.833 E.14243
G1 X155.021 Y117.836 E.04061
G1 X155.03 Y122.69 E.12451
G1 X154.645 Y123.011 F30000
G1 F7200
G1 X157.001 Y123.956 E.06512
G1 X156.989 Y117.447 E.16698
G1 X154.634 Y117.451 E.0604
G1 X154.645 Y122.951 E.14108
G1 X154.26 Y123.272 F30000
G1 F7200
G1 X157.388 Y124.526 E.08645
G1 X157.374 Y117.061 E.19153
G1 X154.248 Y117.066 E.08018
G1 X154.26 Y123.212 E.15765
G1 X153.875 Y123.533 F30000
G1 F7200
G1 X157.774 Y125.097 E.10779
G1 X157.758 Y116.674 E.21609
G1 X153.862 Y116.681 E.09997
G1 X153.875 Y123.473 E.17423
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X153.871 Y121.473 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X153.479 Y126.165 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X157.036 Y127.592 E.10597
G1 X158.181 Y128.051 E.0341
G1 X158.189 Y132.495 E.12286
G1 X153.491 Y132.503 E.12989
G1 X153.479 Y126.225 E.1736
G1 X153.077 Y125.572 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X157.185 Y127.22 E.11356
G1 X158.581 Y127.78 E.03858
G1 X158.59 Y132.895 E.13121
G1 X153.091 Y132.905 E.14107
G1 X153.077 Y125.632 E.18658
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X154.943 Y126.353 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.836 Y130.15 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459986
G1 F7200
G1 X155.835 Y129.701 E.01272
G1 X155.428 Y129.041 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X155.431 Y130.556 E.03889
G1 X156.242 Y130.555 E.02081
G1 X156.24 Y129.366 E.03049
G1 X155.483 Y129.063 E.02091
G1 X155.041 Y128.47 F30000
G1 F7200
G1 X155.046 Y130.943 E.06344
G1 X156.628 Y130.94 E.0406
G1 X156.625 Y129.105 E.04706
G1 X155.097 Y128.492 E.04224
G1 X154.654 Y127.899 F30000
G1 F7200
G1 X154.661 Y131.329 E.08799
G1 X157.015 Y131.325 E.06039
G1 X157.01 Y128.844 E.06363
G1 X154.71 Y127.922 E.06358
G1 X154.267 Y127.329 F30000
G1 F7200
G1 X154.276 Y131.716 E.11255
G1 X157.401 Y131.71 E.08017
G1 X157.395 Y128.583 E.08021
G1 X154.323 Y127.351 E.08492
G1 X153.881 Y126.758 F30000
G1 F7200
G1 X153.891 Y132.102 E.1371
G1 X157.787 Y132.095 E.09996
G1 X157.78 Y128.322 E.09678
G1 X153.936 Y126.78 E.10626
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X155.792 Y127.525 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X151.324 Y123.091 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X151.338 Y130.3 E.19933
G1 X151.342 Y132.507 E.06104
G1 X146.644 Y132.516 E.12989
G1 X146.63 Y124.995 E.20797
G1 X151.269 Y123.113 E.13842
G1 X151.724 Y122.497 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X151.739 Y130.299 E.20017
G1 X151.743 Y132.907 E.06691
G1 X146.244 Y132.918 E.14107
G1 X146.228 Y124.725 E.21018
G1 X151.668 Y122.519 E.15059
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X151.686 Y124.519 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X148.989 Y130.163 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.460076
G1 F7200
G1 X148.982 Y126.636 E.09989
G1 X149.386 Y125.974 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X148.576 Y126.303 E.02245
G1 X148.584 Y130.569 E.10946
G1 X149.395 Y130.568 E.02081
G1 X149.387 Y126.034 E.11632
G1 X149.771 Y125.402 F30000
G1 F7200
G1 X148.189 Y126.043 E.04379
G1 X148.199 Y130.956 E.12603
G1 X149.781 Y130.953 E.0406
G1 X149.771 Y125.462 E.14087
G1 X150.156 Y124.83 F30000
G1 F7200
G1 X147.803 Y125.783 E.06512
G1 X147.814 Y131.342 E.1426
G1 X150.168 Y131.338 E.06039
G1 X150.156 Y124.89 E.16542
G1 X150.54 Y124.257 F30000
G1 F7200
G1 X147.417 Y125.524 E.08646
G1 X147.429 Y131.729 E.15917
G1 X150.554 Y131.723 E.08017
G1 X150.54 Y124.317 E.18998
G1 X150.925 Y123.685 F30000
G1 F7200
G1 X147.031 Y125.264 E.1078
G1 X147.044 Y132.115 E.17574
G1 X150.941 Y132.108 E.09996
G1 X150.925 Y123.745 E.21453
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X150.929 Y125.745 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X143.609 Y123.583 Z3 F30000
G1 X109.811 Y113.597 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.166 Y114.035 E.01559
G3 X94.477 Y106.56 I-15.124 J11.543 E2.80632
G3 X104.941 Y109.338 I.564 J18.977 E.30358
G1 X105.199 Y109.49 E.00828
G3 X109.455 Y113.159 I-10.158 J16.087 E.15594
G1 X109.773 Y113.55 E.01394
G1 X109.5 Y113.849 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X109.847 Y114.278 E.01416
G3 X94.488 Y106.961 I-14.806 J11.3 E2.54893
G3 X104.737 Y109.683 I.552 J18.578 E.27588
G1 X104.985 Y109.829 E.00738
G3 X109.152 Y113.421 I-9.944 J15.748 E.14164
G1 X109.462 Y113.803 E.01263
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X109.847 Y114.278 E-.06975
G1 X110.491 Y115.175 E-.12587
G1 X110.643 Y115.415 E-.03237
; WIPE_END
G1 E-.012 F1800
G1 X103.17 Y113.864 Z3 F30000
G1 X83.739 Y109.831 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G3 X95.902 Y106.218 I11.304 J15.774 E.3574
G3 X80.353 Y112.924 I-.869 J19.366 E2.88325
G3 X83.69 Y109.866 I14.689 J12.681 E.12544
G1 X83.507 Y109.508 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X95.926 Y105.818 I11.546 J16.119 E.33857
G3 X79.31 Y113.573 I-.892 J19.766 E2.70022
G3 X83.458 Y109.543 I15.743 J12.053 E.1489
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X84.476 Y108.848 E-.14051
G1 X85.137 Y108.457 E-.08749
; WIPE_END
G1 E-.012 F1800
G1 X89.313 Y114.846 Z3 F30000
G1 X94.685 Y123.066 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9600
M204 S5000
G3 X94.597 Y123.084 I-.113 J-.329 E.00231
G1 X91.889 Y123.084 E.06947
G1 X91.889 Y120.285 E.0718
G1 X94.553 Y120.285 E.06833
G3 X94.918 Y120.607 I.036 J.328 E.01408
G1 X94.917 Y122.778 E.05569
G3 X94.74 Y123.041 I-.346 J-.041 E.00845
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X94.597 Y123.084 E-.01701
G1 X92.746 Y123.084 E-.21099
; WIPE_END
G1 E-.012 F1800
G1 X91.889 Y123.591 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X91.889 Y124.645 E.02704
G1 X91.169 Y124.645 E.01848
G1 X91.169 Y119.787 E.12463
G1 X94.746 Y119.788 E.09178
G3 X95.615 Y120.743 I-.064 J.931 E.03659
G1 X95.617 Y122.621 E.04818
G3 X94.588 Y123.591 I-.938 J.035 E.04108
G1 X91.949 Y123.591 E.06769
M204 S10000
G1 X91.658 Y123.338 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.142623
G1 F18000
G1 X94.765 Y123.325 E.02239
G2 X94.893 Y123.284 I-.219 J-.897 E.00097
; LINE_WIDTH: 0.208899
G1 X94.926 Y123.269 E.00042
G2 X95.051 Y123.183 I-.317 J-.595 E.00177
; LINE_WIDTH: 0.245497
G2 X95.171 Y123.036 I-.36 J-.415 E.00268
; LINE_WIDTH: 0.28906
G1 X95.214 Y122.95 E.00163
G2 X95.255 Y122.798 I-1.118 J-.388 E.00266
; LINE_WIDTH: 0.328648
G2 X95.267 Y122.613 I-1.402 J-.18 E.00364
G1 X95.267 Y120.753 E.0364
G2 X95.223 Y120.453 I-.82 J-.035 E.00598
; LINE_WIDTH: 0.258906
G2 X95.089 Y120.232 I-.506 J.155 E.0039
; LINE_WIDTH: 0.210228
G1 X95.029 Y120.173 E.00098
G2 X94.922 Y120.103 I-.56 J.742 E.0015
; LINE_WIDTH: 0.162012
G1 X94.877 Y120.082 E.00042
G2 X94.699 Y120.04 I-.734 J2.713 E.00155
; LINE_WIDTH: 0.131617
G1 X91.689 Y120.036 E.01948
; LINE_WIDTH: 0.156261
G1 X91.529 Y120.116 E.00145
; LINE_WIDTH: 0.205029
G1 X91.369 Y120.196 E.00203
G1 X91.529 Y119.988 F30000
; LINE_WIDTH: 0.354162
G1 F18000
G1 X91.529 Y123.285 E.07014
G3 X91.529 Y123.391 I-.318 J.053 E.00227
G1 X91.529 Y124.445 E.02242
G1 X91.533 Y123.338 F30000
; LINE_WIDTH: 0.340672
G1 F18000
G1 X91.564 Y123.338 E.00063
; LINE_WIDTH: 0.296229
G1 X91.595 Y123.338 E.00054
; LINE_WIDTH: 0.251785
G1 X91.627 Y123.338 E.00045
; LINE_WIDTH: 0.207342
G1 X91.658 Y123.338 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X91.627 Y123.338 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.122 Y121.538 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X85.734 Y121.538 E.08691
G3 X85.386 Y121.266 I-.022 J-.331 E.01241
G3 X85.383 Y120.579 I6.999 J-.367 E.01762
G3 X85.606 Y120.3 I.342 J.045 E.00962
G1 X85.708 Y120.285 E.00265
G1 X89.122 Y120.286 E.08759
G1 X89.122 Y121.478 E.03058
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X87.122 Y121.513 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.034 Y123.002 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F9600
M204 S5000
G2 X89.124 Y122.808 I-.241 J-.23 E.0056
G1 X89.122 Y122.029 E.01997
G1 X85.641 Y122.03 E.0893
G3 X84.762 Y121.108 I.058 J-.934 E.03594
G3 X84.865 Y120.299 I1.675 J-.198 E.02112
G3 X85.665 Y119.788 I.81 J.386 E.02567
G1 X89.743 Y119.787 E.10462
G1 X89.745 Y122.595 E.07204
G3 X88.683 Y123.591 I-.95 J.051 E.04255
G1 X85.133 Y123.591 E.09108
G1 X85.308 Y123.102 E.01333
G1 X88.835 Y123.103 E.09049
G2 X88.988 Y123.042 I-.043 J-.33 E.00426
M204 S10000
G1 X89.237 Y123.181 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.182626
G1 F18000
G2 X89.371 Y122.983 I-.564 J-.526 E.00236
; LINE_WIDTH: 0.223617
G2 X89.432 Y122.715 I-.769 J-.318 E.00348
; LINE_WIDTH: 0.255949
G3 X89.433 Y120.098 I458.236 J-1.221 E.03858
G1 X89.42 Y120.086 E.00026
; LINE_WIDTH: 0.20564
G1 X89.371 Y120.061 E.00062
; LINE_WIDTH: 0.156688
G1 X89.322 Y120.037 E.00045
; LINE_WIDTH: 0.133044
G1 X85.67 Y120.038 E.02398
G2 X85.283 Y120.193 I.036 J.65 E.00279
; LINE_WIDTH: 0.186832
G2 X85.123 Y120.427 I.446 J.476 E.0029
; LINE_WIDTH: 0.239922
G2 X85.128 Y121.404 I1.87 J.478 E.01351
; LINE_WIDTH: 0.180467
G1 X85.165 Y121.483 E.00085
G2 X85.306 Y121.645 I.515 J-.304 E.0021
; LINE_WIDTH: 0.126916
G2 X85.732 Y121.784 I.4 J-.504 E.00282
G1 X89.322 Y121.784 E.02211
; LINE_WIDTH: 0.148521
G1 X89.358 Y121.784 E.00027
; LINE_WIDTH: 0.19557
G1 X89.393 Y121.784 E.00038
; LINE_WIDTH: 0.24262
G1 X89.429 Y121.785 E.00049
G1 X89.237 Y123.181 F30000
; LINE_WIDTH: 0.125352
G1 F18000
G3 X88.874 Y123.346 I-.52 J-.658 E.00244
G1 X85.433 Y123.347 E.02083
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X87.433 Y123.347 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.767 Y120.367 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X80.767 Y124.642 E.10965
G1 X80.047 Y124.642 E.01848
G1 X80.047 Y119.787 E.12453
G1 X83.714 Y119.787 E.09408
G1 X83.549 Y120.249 E.01257
G1 X83.507 Y120.367 E.00322
G1 X80.827 Y120.367 E.06875
M204 S10000
G1 X80.567 Y120.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23726
G1 F18000
G1 X80.514 Y120.101 E.00078
; LINE_WIDTH: 0.284426
G1 X80.461 Y120.125 E.00097
; LINE_WIDTH: 0.353759
G1 X80.408 Y120.148 E.00123
G1 X80.407 Y120.167 E.0004
G1 X80.407 Y124.441 E.09082
G1 X80.567 Y120.077 F30000
; LINE_WIDTH: 0.213666
G1 F18000
G1 X83.398 Y120.077 E.03377
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X81.398 Y120.077 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.691 Y127.076 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X83.473 Y127.075 E.07136
G3 X83.477 Y128.902 I-.029 J.913 E.07205
G1 X80.691 Y128.899 E.07147
G1 X80.691 Y127.136 E.04523
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X82.691 Y127.092 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.691 Y129.415 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X80.691 Y130.616 E.0308
G1 X79.971 Y130.325 E.01993
G1 X79.971 Y126.579 E.0961
G1 X83.912 Y126.581 E.10109
G3 X85.106 Y128.054 I-.106 J1.307 E.05437
G3 X84.765 Y128.853 I-1.473 J-.155 E.02261
G1 X84.515 Y129.101 E.00905
G3 X84.63 Y130.931 I-1.236 J.997 E.05013
G3 X83.189 Y131.655 I-1.421 J-1.031 E.04301
G1 X81.111 Y131.656 E.05329
G1 X81.111 Y131.137 E.01333
G1 X83.306 Y131.137 E.05631
G2 X83.338 Y129.416 I-.034 J-.861 E.06692
G1 X80.751 Y129.415 E.06635
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X80.691 Y130.616 E-.13703
G1 X79.971 Y130.325 E-.08854
G1 X79.971 Y130.304 E-.00243
; WIPE_END
G1 E-.012 F1800
G1 X80.691 Y132.694 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X79.971 Y132.404 E.01993
G1 X79.971 Y131.717 E.01761
G1 X80.691 Y132.008 E.01993
G1 X80.691 Y132.634 E.01607
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X79.971 Y132.404 E-.08622
G1 X79.971 Y131.717 E-.07824
G1 X80.488 Y131.926 E-.06354
; WIPE_END
G1 E-.012 F1800
G1 X81.312 Y131.397 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.151151
G1 F18000
G1 X83.181 Y131.396 E.01453
G2 X83.891 Y131.225 I.057 J-1.323 E.00575
; LINE_WIDTH: 0.189188
G2 X84.031 Y131.132 I-.709 J-1.218 E.00173
G1 X84.136 Y131.04 E.00143
; LINE_WIDTH: 0.236682
G2 X84.261 Y130.901 I-1.331 J-1.311 E.00252
G1 X84.294 Y130.855 E.00076
; LINE_WIDTH: 0.286531
G2 X84.413 Y130.636 I-1.015 J-.695 E.00419
G1 X84.42 Y130.62 E.00028
; LINE_WIDTH: 0.337802
G2 X84.454 Y130.515 I-1.44 J-.536 E.00224
G1 X84.493 Y130.295 E.00452
; LINE_WIDTH: 0.375505
G2 X84.466 Y129.927 I-2.278 J-.021 E.00838
; LINE_WIDTH: 0.427364
G2 X84.28 Y129.49 I-1.063 J.196 E.01251
; LINE_WIDTH: 0.468922
G1 X84.12 Y129.286 E.00751
; LINE_WIDTH: 0.515012
G1 X84.058 Y129.201 E.00336
; LINE_WIDTH: 0.493868
G1 X84.065 Y129.18 E.00068
; LINE_WIDTH: 0.461489
G1 X84.072 Y129.158 E.00063
; LINE_WIDTH: 0.426562
G1 X84.082 Y129.132 E.00073
; LINE_WIDTH: 0.38987
G1 X84.098 Y129.101 E.00082
; LINE_WIDTH: 0.353982
G1 X84.114 Y129.071 E.00074
; LINE_WIDTH: 0.318093
G1 X84.13 Y129.04 E.00065
; LINE_WIDTH: 0.270481
G2 X84.48 Y128.677 I-3.083 J-3.329 E.00792
G1 X84.533 Y128.608 E.00137
; LINE_WIDTH: 0.326847
G1 X84.655 Y128.383 E.00498
; LINE_WIDTH: 0.380311
G2 X84.653 Y127.52 I-1.108 J-.428 E.02032
; LINE_WIDTH: 0.371803
G2 X84.368 Y127.108 I-1.056 J.426 E.01134
; LINE_WIDTH: 0.320795
G2 X84.199 Y126.983 I-.82 J.928 E.004
M73 P90 R2
G1 X84.174 Y126.969 E.00055
; LINE_WIDTH: 0.269409
G1 X84.021 Y126.903 E.00261
; LINE_WIDTH: 0.226255
G1 X83.548 Y126.781 E.00624
G1 X84.403 Y126.943 F30000
; LINE_WIDTH: 0.175706
G1 F18000
G2 X83.674 Y126.838 I-1.557 J8.224 E.00693
; LINE_WIDTH: 0.129845
G1 X80.491 Y126.828 E.02022
; LINE_WIDTH: 0.154863
G1 X80.331 Y126.908 E.00143
; LINE_WIDTH: 0.203117
G1 X80.172 Y126.988 E.00201
G1 X80.331 Y126.78 F30000
; LINE_WIDTH: 0.354032
G1 F18000
G1 X80.336 Y129.157 E.05056
G1 X80.331 Y130.254 F30000
; LINE_WIDTH: 0.353867
G1 F18000
G1 X80.331 Y129.215 E.0221
G1 X80.336 Y129.157 E.00123
G1 X80.367 Y129.157 E.00066
; LINE_WIDTH: 0.299807
G1 X80.398 Y129.157 E.00055
; LINE_WIDTH: 0.256833
G1 X80.429 Y129.157 E.00046
; LINE_WIDTH: 0.213858
G1 X80.46 Y129.157 E.00037
; LINE_WIDTH: 0.170884
G1 X80.491 Y129.157 E.00028
; LINE_WIDTH: 0.148952
G1 X83.459 Y129.164 E.02263
; LINE_WIDTH: 0.198268
G2 X84.358 Y129.228 I1.564 J-15.63 E.00982
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X83.459 Y129.164 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X90.727 Y128.33 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X87.339 Y128.33 E.08691
G3 X86.989 Y128.043 I-.024 J-.329 E.0128
G1 X86.988 Y127.371 E.01724
G3 X87.211 Y127.092 I.342 J.045 E.00963
G1 X87.313 Y127.076 E.00265
G1 X90.727 Y127.078 E.08759
G1 X90.727 Y128.27 E.03058
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X88.727 Y128.305 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X90.7 Y129.704 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F9600
M204 S5000
G2 X90.729 Y129.6 I-.303 J-.14 E.0028
G1 X90.727 Y128.821 E.01997
G1 X87.245 Y128.822 E.0893
G3 X86.367 Y127.902 I.062 J-.939 E.03583
G3 X86.47 Y127.091 I1.749 J-.191 E.02117
G3 X87.391 Y126.579 I.828 J.405 E.02878
G1 X91.348 Y126.579 E.10151
G1 X91.348 Y126.659 E.00205
G1 X91.349 Y129.43 E.0711
G3 X90.383 Y130.383 I-.935 J.018 E.03894
G1 X86.738 Y130.383 E.09351
G1 X86.914 Y129.894 E.01333
G1 X90.443 Y129.895 E.09056
G2 X90.67 Y129.756 I-.047 J-.331 E.007
M204 S10000
G1 X90.859 Y129.953 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.195264
G1 F18000
G2 X91.017 Y129.651 I-.486 J-.446 E.00369
; LINE_WIDTH: 0.254007
G2 X91.039 Y129.425 I-1.304 J-.24 E.00331
G1 X91.037 Y128.62 E.01176
G3 X91.038 Y128.53 I.218 J-.044 E.00133
G1 X91.038 Y126.89 E.02397
G1 X91.025 Y126.878 E.00025
; LINE_WIDTH: 0.205748
G1 X90.976 Y126.853 E.00062
; LINE_WIDTH: 0.156772
G1 X90.927 Y126.829 E.00045
; LINE_WIDTH: 0.133042
G2 X87.298 Y126.829 I-1.793 J143.887 E.02383
G1 X87.291 Y126.83 E.00005
G2 X86.903 Y126.97 I.015 J.646 E.00276
; LINE_WIDTH: 0.185146
G2 X86.728 Y127.22 I.411 J.474 E.00309
; LINE_WIDTH: 0.244142
G2 X86.681 Y127.948 I1.858 J.487 E.01025
G2 X86.705 Y128.114 I.883 J-.043 E.00234
; LINE_WIDTH: 0.194163
G2 X86.843 Y128.373 I.567 J-.137 E.00316
; LINE_WIDTH: 0.127766
G1 X86.855 Y128.386 E.00011
G2 X87.337 Y128.576 I.45 J-.436 E.00331
G1 X90.927 Y128.575 E.02232
; LINE_WIDTH: 0.148353
G1 X90.963 Y128.576 E.00027
; LINE_WIDTH: 0.195066
G1 X90.998 Y128.576 E.00038
; LINE_WIDTH: 0.241778
G1 X91.033 Y128.577 E.00049
G1 X90.859 Y129.953 F30000
; LINE_WIDTH: 0.125223
G1 F18000
G3 X90.486 Y130.138 I-.515 J-.572 E.00255
G1 X87.039 Y130.139 E.02084
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X89.039 Y130.138 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X96.667 Y129.88 Z3 F30000
G1 X98.26 Y129.826 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G2 X98.416 Y129.552 I-.175 J-.282 E.00846
G1 X98.416 Y126.579 E.07626
G1 X99.111 Y126.579 E.01783
G1 X99.111 Y129.504 E.07503
G3 X98.209 Y130.382 I-.94 J-.063 E.03538
G1 X92.774 Y130.383 E.13943
G1 X92.774 Y126.579 E.09758
G1 X93.461 Y126.579 E.01764
G1 X93.461 Y129.312 E.07011
G2 X93.546 Y129.773 I.667 J.116 E.01228
G2 X93.858 Y129.876 I.262 J-.27 E.00874
G1 X95.263 Y129.876 E.03604
G2 X95.603 Y129.472 I-.012 J-.355 E.0153
G1 X95.603 Y126.579 E.0742
G1 X96.296 Y126.579 E.01779
G1 X96.296 Y129.554 E.07632
G2 X96.631 Y129.876 I.35 J-.029 E.01303
G1 X98.079 Y129.877 E.03715
G2 X98.206 Y129.853 I.005 J-.332 E.00333
M204 S10000
G1 X98.425 Y130.063 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.144051
G1 F18000
G1 X98.394 Y130.079 E.00025
G3 X98.087 Y130.129 I-.284 J-.764 E.00229
G3 X96.616 Y130.129 I-.734 J-30.703 E.01073
G1 X96.493 Y130.123 E.0009
; LINE_WIDTH: 0.175193
G1 X96.353 Y130.101 E.00133
; LINE_WIDTH: 0.203625
G1 X95.642 Y129.93 E.00823
G1 X95.466 Y130.117 F30000
; LINE_WIDTH: 0.141625
G1 F18000
G3 X95.273 Y130.13 I-.363 J-4.252 E.00138
G1 X93.852 Y130.129 E.01014
G3 X93.66 Y130.124 I-.064 J-1.248 E.00137
; LINE_WIDTH: 0.164439
G1 X93.58 Y130.111 E.00071
; LINE_WIDTH: 0.21127
G3 X92.974 Y129.959 I.587 J-3.634 E.00736
G1 X93.234 Y130.183 F30000
; LINE_WIDTH: 0.405252
G1 F18000
G3 X93.144 Y129.81 I3.258 J-.987 E.00947
; LINE_WIDTH: 0.360936
G1 X93.131 Y129.744 E.00144
; LINE_WIDTH: 0.321968
G1 X93.126 Y129.706 E.00074
G3 X93.118 Y126.779 I68.165 J-1.661 E.056
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X93.123 Y128.779 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X95.949 Y126.779 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.327723
G1 F18000
G1 X95.949 Y129.589 E.05483
G3 X95.949 Y129.699 I-.661 J.056 E.00215
; LINE_WIDTH: 0.370154
G1 X95.937 Y130.182 E.0108
G1 X98.425 Y130.063 F30000
; LINE_WIDTH: 0.213072
G1 F18000
G2 X98.581 Y129.941 I-.984 J-1.432 E.00236
; LINE_WIDTH: 0.257157
G2 X98.718 Y129.716 I-.365 J-.374 E.00395
; LINE_WIDTH: 0.325397
G1 X98.763 Y129.498 E.0043
G1 X98.764 Y126.779 E.05264
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X98.763 Y128.779 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X104.147 Y127.245 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X104.187 Y127.398 I-.285 J.157 E.00411
G1 X104.187 Y129.545 E.05509
G3 X103.833 Y129.877 I-.334 J-.002 E.01393
G1 X101.157 Y129.876 E.06863
G1 X101.157 Y127.077 E.0718
G1 X103.847 Y127.077 E.069
G3 X104.113 Y127.195 I.015 J.324 E.00774
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X104.187 Y127.398 E-.02464
G1 X104.187 Y129.182 E-.20336
; WIPE_END
G1 E-.012 F1800
G1 X101.157 Y130.383 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X101.157 Y131.437 E.02704
G1 X100.437 Y131.437 E.01848
G1 X100.437 Y126.579 E.12463
G1 X104.067 Y126.585 E.09313
G3 X104.884 Y127.564 I-.118 J.928 E.03598
G3 X104.881 Y129.52 I-37.012 J.912 E.05017
G3 X103.976 Y130.383 I-.928 J-.066 E.03519
G1 X101.217 Y130.383 E.07077
M204 S10000
G1 X100.926 Y130.129 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.14163
G1 F18000
G1 X100.957 Y130.129 E.00022
G2 X103.841 Y130.13 I1.452 J-99.061 E.02058
G1 X103.969 Y130.123 E.00092
G2 X104.107 Y130.098 I-.016 J-.48 E.001
; LINE_WIDTH: 0.198966
G2 X104.298 Y129.995 I-.446 J-1.052 E.00239
; LINE_WIDTH: 0.244453
G1 X104.327 Y129.971 E.00052
G2 X104.454 Y129.806 I-1.349 J-1.172 E.0029
; LINE_WIDTH: 0.292596
G1 X104.479 Y129.751 E.00104
G2 X104.526 Y129.562 I-1.049 J-.36 E.00335
; LINE_WIDTH: 0.328169
G2 X104.536 Y129.365 I-1.076 J-.151 E.00386
G2 X104.533 Y127.461 I-40.48 J-.887 E.03722
G1 X104.522 Y127.362 E.00195
G2 X104.493 Y127.249 I-.706 J.12 E.00227
; LINE_WIDTH: 0.266012
G1 X104.485 Y127.228 E.00036
G2 X104.408 Y127.082 I-.819 J.34 E.00254
; LINE_WIDTH: 0.225227
G2 X104.254 Y126.932 I-.443 J.301 E.00275
; LINE_WIDTH: 0.177264
G2 X104.031 Y126.843 I-.315 J.463 E.00231
; LINE_WIDTH: 0.132869
G1 X103.856 Y126.828 E.00115
G2 X100.957 Y126.828 I-1.442 J88.729 E.019
; LINE_WIDTH: 0.156378
G1 X100.797 Y126.908 E.00145
; LINE_WIDTH: 0.205181
G1 X100.637 Y126.988 E.00203
G1 X100.797 Y126.779 F30000
; LINE_WIDTH: 0.354013
G1 F18000
G1 X100.797 Y130.076 E.07011
G3 X100.797 Y130.183 I-.318 J.053 E.00228
G1 X100.797 Y131.237 E.02241
G1 X100.802 Y130.129 F30000
; LINE_WIDTH: 0.340602
G1 F18000
G1 X100.833 Y130.129 E.00063
; LINE_WIDTH: 0.296227
G1 X100.864 Y130.129 E.00054
; LINE_WIDTH: 0.251853
G1 X100.895 Y130.129 E.00045
; LINE_WIDTH: 0.207478
G1 X100.926 Y130.129 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X100.895 Y130.129 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X107.057 Y127.105 Z3 F30000
G1 Z2.6
M73 P91 R2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G2 X106.864 Y127.419 I.141 J.302 E.01
G1 X106.865 Y130.383 E.07604
G1 X106.236 Y130.383 E.01614
G1 X106.236 Y127.662 E.0698
G3 X107.16 Y126.579 I.946 J-.128 E.0412
G1 X109.95 Y126.582 E.07159
G3 X110.795 Y127.549 I-.092 J.934 E.03628
G1 X110.795 Y130.383 E.07271
G1 X110.174 Y130.383 E.01593
G1 X110.175 Y127.378 E.0771
G2 X109.87 Y127.077 I-.329 J.029 E.01196
G1 X107.149 Y127.078 E.0698
G2 X107.113 Y127.085 I.048 J.33 E.00095
M204 S10000
G1 X106.776 Y126.974 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193978
G1 F18000
G1 X106.695 Y127.056 E.00122
G2 X106.603 Y127.216 I.634 J.474 E.00197
; LINE_WIDTH: 0.260915
G2 X106.551 Y127.665 I.873 J.328 E.00687
G1 X106.551 Y130.183 E.03795
G1 X106.776 Y126.974 F30000
; LINE_WIDTH: 0.133349
G1 F18000
G3 X107.068 Y126.837 I.409 J.494 E.00215
G1 X109.934 Y126.833 E.01888
; LINE_WIDTH: 0.155749
G3 X110.336 Y127.055 I-.088 J.633 E.00379
; LINE_WIDTH: 0.200083
G3 X110.457 Y127.291 I-.425 J.368 E.00295
; LINE_WIDTH: 0.252634
G3 X110.484 Y127.498 I-.772 J.207 E.00304
G3 X110.485 Y130.183 I-80.026 J1.354 E.03898
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X110.484 Y128.183 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 17/18
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S247.35
G17
G3 Z3 I1.217 J0 P1  F30000
; object ids of layer 17 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer17 end: 145,179
M625
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
G1 X138.045 Y137.333
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.16
G1 F12000
G1 X137.346 Y136.463 E.03086
G3 X152.382 Y105.87 I15.105 J-11.567 E1.16822
G3 X169.845 Y117.187 I.076 J19.015 E.60884
G3 X138.088 Y137.373 I-17.394 J7.708 E1.49583
G1 X138.361 Y137.075 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X152.383 Y106.271 I14.09 J-12.18 E1.08938
G3 X169.479 Y117.35 I.075 J18.614 E.55301
G3 X138.4 Y137.121 I-17.028 J7.546 E1.35827
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.658 Y136.223 E-.13269
G1 X137.17 Y135.545 E-.09531
; WIPE_END
G1 E-.012 F1800
G1 X138.299 Y127.997 Z3.16 F30000
G1 X141.116 Y109.166 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G3 X153.585 Y105.545 I11.328 J15.725 E.36609
G3 X134.92 Y116.616 I-1.141 J19.347 E2.73011
G3 X141.068 Y109.202 I17.525 J8.276 E.26914
G1 X140.881 Y108.84 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X153.608 Y105.145 I11.565 J16.067 E.34668
G3 X133.88 Y118.035 I-1.17 J19.751 E2.54164
G3 X140.832 Y108.875 I18.566 J6.871 E.29934
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X141.849 Y108.177 E-.14054
G1 X142.509 Y107.786 E-.08746
; WIPE_END
G1 E-.012 F1800
G1 X144.548 Y115.141 Z3.16 F30000
G1 X146.625 Y122.632 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X146.614 Y116.294 E.17523
G1 X151.312 Y116.286 E.12989
G1 X151.315 Y118.274 E.05499
G1 X151.32 Y120.729 E.06786
G1 X146.681 Y122.609 E.13841
G1 X146.226 Y123.226 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X146.212 Y115.895 E.18809
G1 X151.711 Y115.884 E.14107
G1 X151.716 Y118.274 E.0613
G1 X151.721 Y120.998 E.06991
G1 X146.281 Y123.204 E.15059
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X146.262 Y121.204 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X148.968 Y119.148 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459986
G1 F7200
G1 X148.967 Y118.699 E.0127
G1 X149.374 Y119.421 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X149.372 Y118.233 E.03048
G1 X148.561 Y118.234 E.02081
G1 X148.563 Y119.749 E.03887
G1 X149.319 Y119.443 E.0209
G1 X149.76 Y119.68 F30000
G1 F7200
G1 X149.757 Y117.846 E.04705
G1 X148.174 Y117.849 E.0406
G1 X148.179 Y120.321 E.06342
G1 X149.705 Y119.703 E.04224
G1 X150.146 Y119.94 F30000
G1 F7200
G1 X150.142 Y117.46 E.06362
G1 X147.788 Y117.464 E.06039
G1 X147.794 Y120.893 E.08798
G1 X150.091 Y119.962 E.06358
G1 X150.533 Y120.199 F30000
G1 F7200
G1 X150.527 Y117.073 E.0802
G1 X147.402 Y117.079 E.08017
G1 X147.409 Y121.466 E.11253
G1 X150.477 Y120.222 E.08491
G1 X150.919 Y120.459 F30000
G1 F7200
G1 X150.912 Y116.687 E.09677
G1 X147.015 Y116.694 E.09996
G1 X147.025 Y122.038 E.13708
G1 X150.863 Y120.482 E.10625
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X149.01 Y121.233 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.874 Y124.571 Z3.16 F30000
G1 X158.176 Y125.69 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X153.475 Y123.804 E.14007
G1 X153.46 Y116.282 E.20799
G1 X158.158 Y116.273 E.12991
G1 X158.167 Y120.861 E.12687
G1 X158.176 Y125.63 E.13186
G1 X158.578 Y126.283 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X153.074 Y124.075 E.15212
G1 X153.059 Y115.882 E.2102
G1 X158.558 Y115.871 E.14109
G1 X158.568 Y120.86 E.12799
G1 X158.578 Y126.223 E.13757
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X156.715 Y125.496 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.821 Y122.214 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.460146
G1 F7200
G1 X155.814 Y118.686 E.09993
G1 X155.415 Y122.489 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X156.227 Y122.814 E.02244
G1 X156.219 Y118.22 E.11787
G1 X155.407 Y118.221 E.02082
G1 X155.415 Y122.429 E.10794
G1 X155.03 Y122.75 F30000
G1 F7200
G1 X156.614 Y123.385 E.04378
G1 X156.604 Y117.833 E.14243
G1 X155.021 Y117.836 E.04061
G1 X155.03 Y122.69 E.12451
G1 X154.645 Y123.011 F30000
G1 F7200
G1 X157.001 Y123.956 E.06512
G1 X156.989 Y117.447 E.16698
G1 X154.634 Y117.451 E.0604
G1 X154.645 Y122.951 E.14108
G1 X154.26 Y123.272 F30000
G1 F7200
G1 X157.388 Y124.526 E.08645
G1 X157.374 Y117.061 E.19153
G1 X154.248 Y117.066 E.08018
G1 X154.26 Y123.212 E.15765
G1 X153.875 Y123.533 F30000
G1 F7200
G1 X157.774 Y125.097 E.10779
G1 X157.758 Y116.674 E.21609
G1 X153.862 Y116.681 E.09997
G1 X153.875 Y123.473 E.17423
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X153.871 Y121.473 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X153.479 Y126.165 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X155.456 Y126.958 E.05891
G1 X158.181 Y128.051 E.08116
G1 X158.189 Y132.495 E.12286
G1 X153.491 Y132.503 E.12989
G1 X153.479 Y126.225 E.1736
G1 X153.077 Y125.572 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X155.605 Y126.586 E.06989
G1 X158.581 Y127.78 E.08224
G1 X158.59 Y132.895 E.13121
G1 X153.091 Y132.905 E.14107
G1 X153.077 Y125.632 E.18658
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X154.948 Y126.338 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.836 Y130.15 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459986
G1 F7200
G1 X155.835 Y129.701 E.01272
G1 X155.428 Y129.041 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X155.431 Y130.556 E.03889
G1 X156.242 Y130.555 E.02081
G1 X156.24 Y129.366 E.03049
G1 X155.483 Y129.063 E.02091
G1 X155.041 Y128.47 F30000
G1 F7200
G1 X155.046 Y130.943 E.06344
G1 X156.628 Y130.94 E.0406
G1 X156.625 Y129.105 E.04706
G1 X155.097 Y128.492 E.04224
G1 X154.654 Y127.899 F30000
G1 F7200
G1 X154.661 Y131.329 E.08799
G1 X157.015 Y131.325 E.06039
G1 X157.01 Y128.844 E.06363
G1 X154.71 Y127.922 E.06358
G1 X154.267 Y127.329 F30000
G1 F7200
G1 X154.276 Y131.716 E.11255
G1 X157.401 Y131.71 E.08017
G1 X157.395 Y128.583 E.08021
G1 X154.323 Y127.351 E.08492
G1 X153.881 Y126.758 F30000
G1 F7200
G1 X153.891 Y132.102 E.1371
G1 X157.787 Y132.095 E.09996
G1 X157.78 Y128.322 E.09678
G1 X153.936 Y126.78 E.10626
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X155.792 Y127.525 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X151.324 Y123.091 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X151.332 Y127.385 E.11873
G1 X151.342 Y132.507 E.14164
G1 X146.644 Y132.516 E.12989
G1 X146.63 Y124.995 E.20797
G1 X151.269 Y123.113 E.13842
G1 X151.724 Y122.497 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X151.733 Y127.384 E.12539
G1 X151.743 Y132.907 E.1417
G1 X146.244 Y132.918 E.14107
G1 X146.228 Y124.725 E.21018
G1 X151.668 Y122.519 E.15059
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X151.695 Y124.519 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X148.989 Y130.163 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.460076
G1 F7200
G1 X148.982 Y126.636 E.09989
G1 X149.386 Y125.974 F30000
; LINE_WIDTH: 0.419996
G1 F7200
G1 X148.576 Y126.303 E.02245
G1 X148.584 Y130.569 E.10946
G1 X149.395 Y130.568 E.02081
G1 X149.387 Y126.034 E.11632
G1 X149.771 Y125.402 F30000
G1 F7200
G1 X148.189 Y126.043 E.04379
G1 X148.199 Y130.956 E.12603
G1 X149.781 Y130.953 E.0406
G1 X149.771 Y125.462 E.14087
G1 X150.156 Y124.83 F30000
G1 F7200
G1 X147.803 Y125.783 E.06512
G1 X147.814 Y131.342 E.1426
G1 X150.168 Y131.338 E.06039
G1 X150.156 Y124.89 E.16542
G1 X150.54 Y124.257 F30000
G1 F7200
G1 X147.417 Y125.524 E.08646
G1 X147.429 Y131.729 E.15917
G1 X150.554 Y131.723 E.08017
G1 X150.54 Y124.317 E.18998
G1 X150.925 Y123.685 F30000
G1 F7200
G1 X147.031 Y125.264 E.1078
G1 X147.044 Y132.115 E.17574
G1 X150.941 Y132.108 E.09996
G1 X150.925 Y123.745 E.21453
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F7200
G1 X150.929 Y125.745 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X143.609 Y123.583 Z3.16 F30000
G1 X109.811 Y113.597 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G1 X110.159 Y114.04 E.01558
G3 X110.511 Y114.515 I-15.142 J11.569 E.01633
G1 X110.824 Y114.951 E.01486
G3 X94.477 Y106.56 I-15.781 J10.627 E2.77515
G3 X109.449 Y113.165 I.54 J19.049 E.46767
G1 X109.772 Y113.551 E.01393
G1 X109.5 Y113.849 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X109.841 Y114.283 E.01415
G3 X110.185 Y114.748 I-14.823 J11.326 E.01484
G1 X110.491 Y115.175 E.01348
G3 X94.488 Y106.961 I-15.449 J10.403 E2.52062
G3 X109.145 Y113.426 I.529 J18.647 E.42478
G1 X109.461 Y113.803 E.01262
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X109.841 Y114.283 E-.06973
G1 X110.185 Y114.748 E-.06596
G1 X110.491 Y115.175 E-.05989
G1 X110.643 Y115.415 E-.03242
; WIPE_END
G1 E-.012 F1800
G1 X105.146 Y120.71 Z3.16 F30000
G1 X83.742 Y141.328 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12000
G3 X77.556 Y117.221 I11.298 J-15.746 E.74726
G3 X96.217 Y106.237 I17.479 J8.352 E.63532
G3 X83.791 Y141.363 I-1.177 J19.345 E1.9828
G1 X83.502 Y141.663 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X76.489 Y118.691 I11.532 J-16.077 E.66214
G3 X96.241 Y105.837 I18.558 J6.914 E.64753
G3 X83.551 Y141.698 I-1.207 J19.749 E1.87795
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X82.571 Y140.949 E-.14055
G1 X81.99 Y140.449 E-.08745
; WIPE_END
G1 E-.012 F1800
G1 X86.51 Y134.299 Z3.16 F30000
G1 X94.823 Y122.988 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F9600
M204 S5000
G3 X94.591 Y123.084 I-.232 J-.234 E.00661
G1 X91.889 Y123.084 E.06931
G1 X91.889 Y120.285 E.07181
G1 X94.616 Y120.287 E.06996
G3 X94.918 Y120.603 I-.018 J.319 E.01236
G1 X94.919 Y122.723 E.05438
G3 X94.861 Y122.942 I-.328 J.031 E.00593
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X94.685 Y123.074 E-.02506
G1 X94.591 Y123.084 E-.01085
G1 X92.906 Y123.084 E-.19209
; WIPE_END
G1 E-.012 F1800
G1 X91.889 Y123.591 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X91.889 Y124.645 E.02704
G1 X91.169 Y124.645 E.01848
G1 X91.169 Y119.787 E.12463
G1 X94.749 Y119.788 E.09186
G3 X95.615 Y120.767 I-.072 J.936 E.03711
G1 X95.616 Y122.633 E.04787
G3 X94.627 Y123.592 I-.934 J.026 E.03973
G1 X91.949 Y123.591 E.0687
M204 S10000
G1 X91.658 Y123.338 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.142802
G1 F18000
G1 X94.76 Y123.326 E.02239
G2 X94.904 Y123.279 I-.261 J-1.045 E.00109
; LINE_WIDTH: 0.211205
G1 X94.928 Y123.267 E.00031
G2 X95.056 Y123.177 I-.252 J-.494 E.00185
; LINE_WIDTH: 0.253587
G2 X95.204 Y122.972 I-.395 J-.441 E.00372
; LINE_WIDTH: 0.303466
G1 X95.214 Y122.949 E.00044
G2 X95.265 Y122.71 I-.7 J-.273 E.00439
; LINE_WIDTH: 0.328281
G1 X95.268 Y122.622 E.00173
G2 X95.265 Y120.683 I-42.526 J-.908 E.03791
G1 X95.249 Y120.543 E.00276
G2 X95.219 Y120.439 I-.795 J.176 E.00212
; LINE_WIDTH: 0.258471
G2 X95.096 Y120.238 I-.549 J.197 E.00353
; LINE_WIDTH: 0.213059
G1 X95.043 Y120.184 E.0009
G2 X94.935 Y120.111 I-.641 J.829 E.00156
; LINE_WIDTH: 0.16623
G1 X94.891 Y120.088 E.00044
G2 X94.731 Y120.044 I-.483 J1.453 E.00145
; LINE_WIDTH: 0.132468
G1 X91.689 Y120.036 E.01986
; LINE_WIDTH: 0.155816
G1 X91.529 Y120.116 E.00144
; LINE_WIDTH: 0.204417
G1 X91.369 Y120.196 E.00202
G1 X91.529 Y119.988 F30000
; LINE_WIDTH: 0.354162
G1 F18000
G1 X91.529 Y123.285 E.07014
G3 X91.529 Y123.391 I-.318 J.053 E.00227
G1 X91.529 Y124.445 E.02242
G1 X91.533 Y123.338 F30000
; LINE_WIDTH: 0.340678
G1 F18000
G1 X91.564 Y123.338 E.00063
; LINE_WIDTH: 0.296233
G1 X91.595 Y123.338 E.00054
; LINE_WIDTH: 0.251788
G1 X91.627 Y123.338 E.00045
; LINE_WIDTH: 0.207344
G1 X91.658 Y123.338 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X91.627 Y123.338 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.122 Y121.538 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X85.765 Y121.538 E.08612
G3 X85.386 Y121.264 I-.046 J-.336 E.01327
G3 X85.383 Y120.579 I6.798 J-.364 E.01757
G3 X85.605 Y120.301 I.342 J.045 E.00961
G1 X85.705 Y120.285 E.00259
G1 X89.122 Y120.286 E.08766
G1 X89.122 Y121.478 E.03058
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X87.122 Y121.514 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.056 Y122.975 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
G1 F9600
M204 S5000
G2 X89.124 Y122.807 I-.266 J-.205 E.00472
G1 X89.121 Y122.029 E.01995
G1 X85.628 Y122.029 E.08961
G3 X84.762 Y121.098 I.08 J-.943 E.03578
G3 X84.89 Y120.252 I1.539 J-.2 E.02226
G3 X85.608 Y119.79 I.786 J.434 E.02282
G3 X89.743 Y119.787 I2.462 J583.198 E.10608
G1 X89.745 Y122.601 E.07218
G3 X88.671 Y123.591 I-.944 J.054 E.04281
G1 X85.133 Y123.591 E.09079
G1 X85.308 Y123.102 E.01333
G1 X88.834 Y123.103 E.09044
G2 X89.015 Y123.019 I-.044 J-.333 E.00519
M204 S10000
G1 X89.281 Y123.131 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.19972
G1 F18000
G2 X89.417 Y122.833 I-.513 J-.415 E.00364
; LINE_WIDTH: 0.254898
G2 X89.433 Y121.829 I-6.744 J-.608 E.01475
G3 X89.433 Y121.738 I.218 J-.044 E.00134
G1 X89.433 Y120.098 E.02406
G1 X89.42 Y120.086 E.00026
; LINE_WIDTH: 0.205558
G1 X89.371 Y120.061 E.00062
; LINE_WIDTH: 0.156603
G1 X89.322 Y120.037 E.00044
; LINE_WIDTH: 0.132373
G1 X85.682 Y120.038 E.02374
G2 X85.263 Y120.215 I.014 J.617 E.00304
; LINE_WIDTH: 0.196804
G2 X85.093 Y120.522 I.382 J.412 E.00386
; LINE_WIDTH: 0.244287
G1 X85.086 Y120.556 E.00049
G2 X85.115 Y121.37 I2.376 J.323 E.01144
; LINE_WIDTH: 0.185248
G1 X85.16 Y121.474 E.00113
G2 X85.288 Y121.63 I.543 J-.315 E.00203
; LINE_WIDTH: 0.127442
G2 X85.655 Y121.783 I.419 J-.488 E.00251
G1 X89.322 Y121.784 E.02271
; LINE_WIDTH: 0.148562
G1 X89.358 Y121.784 E.00027
; LINE_WIDTH: 0.195495
G1 X89.393 Y121.785 E.00038
; LINE_WIDTH: 0.242427
G1 X89.428 Y121.785 E.00049
G1 X89.281 Y123.131 F30000
; LINE_WIDTH: 0.125137
G1 F18000
G3 X89.018 Y123.31 I-.467 J-.401 E.00194
G1 X88.859 Y123.348 E.00099
G1 X85.433 Y123.347 E.02069
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X87.433 Y123.348 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.767 Y120.367 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X80.767 Y124.642 E.10965
G1 X80.047 Y124.642 E.01848
G1 X80.047 Y119.787 E.12453
G1 X83.714 Y119.787 E.09408
G1 X83.644 Y119.982 E.00531
G1 X83.507 Y120.367 E.01049
G1 X80.827 Y120.367 E.06875
M204 S10000
G1 X80.567 Y120.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23726
G1 F18000
G1 X80.514 Y120.101 E.00078
; LINE_WIDTH: 0.284426
G1 X80.461 Y120.125 E.00097
; LINE_WIDTH: 0.353759
G1 X80.408 Y120.148 E.00123
G1 X80.407 Y120.167 E.0004
G1 X80.407 Y124.441 E.09082
G1 X80.567 Y120.077 F30000
; LINE_WIDTH: 0.213666
G1 F18000
G1 X83.398 Y120.077 E.03377
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X81.398 Y120.077 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.971 Y127.698 Z3.16 F30000
G1 X80.691 Y132.694 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X79.971 Y132.404 E.01993
G1 X79.971 Y131.717 E.01761
G1 X80.691 Y132.008 E.01993
G1 X80.691 Y132.634 E.01607
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X79.971 Y132.404 E-.08622
G1 X79.971 Y131.717 E-.07824
G1 X80.488 Y131.926 E-.06354
; WIPE_END
G1 E-.012 F1800
G1 X80.691 Y127.076 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X83.435 Y127.076 E.07038
G3 X83.477 Y128.902 I.008 J.913 E.07293
G1 X80.691 Y128.899 E.07145
G1 X80.691 Y127.136 E.04524
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X82.691 Y127.092 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.691 Y129.415 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X80.691 Y130.616 E.0308
G1 X79.971 Y130.325 E.01993
G1 X79.971 Y126.579 E.09609
G1 X83.899 Y126.581 E.10075
G3 X85.107 Y127.949 I-.089 J1.296 E.0519
G3 X84.513 Y129.099 I-1.462 J-.026 E.03442
G3 X84.632 Y130.928 I-1.243 J1 E.05009
G3 X83.169 Y131.656 I-1.447 J-1.074 E.0435
G1 X81.111 Y131.656 E.05279
G1 X81.111 Y131.137 E.01333
G1 X83.349 Y131.136 E.05741
G2 X83.143 Y129.415 I-.083 J-.863 E.07091
G1 X80.751 Y129.415 E.06135
M204 S10000
G1 X80.491 Y129.157 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171029
G1 F18000
G1 X80.46 Y129.157 E.00028
; LINE_WIDTH: 0.213976
G1 X80.429 Y129.157 E.00037
; LINE_WIDTH: 0.256922
G1 X80.398 Y129.157 E.00046
; LINE_WIDTH: 0.299868
G1 X80.367 Y129.157 E.00055
; LINE_WIDTH: 0.353869
G1 X80.336 Y129.157 E.00066
G1 X80.331 Y129.215 E.00123
G1 X80.331 Y130.254 E.02209
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X80.331 Y129.215 E-.21006
G1 X80.336 Y129.157 E-.01169
G1 X80.367 Y129.157 E-.00625
; WIPE_END
G1 E-.012 F1800
G1 X81.312 Y131.397 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.151788
G1 F18000
G1 X83.163 Y131.396 E.01446
G2 X83.853 Y131.246 I.072 J-1.333 E.00559
G1 X83.922 Y131.206 E.00062
; LINE_WIDTH: 0.193363
G1 X84.147 Y131.031 E.00302
; LINE_WIDTH: 0.239883
G2 X84.283 Y130.871 I-1.225 J-1.177 E.00287
G1 X84.301 Y130.845 E.00044
; LINE_WIDTH: 0.286584
G2 X84.397 Y130.672 I-1.044 J-.693 E.00332
G1 X84.416 Y130.628 E.00081
; LINE_WIDTH: 0.338357
G2 X84.493 Y130.29 I-.999 J-.407 E.00704
; LINE_WIDTH: 0.376462
G2 X84.484 Y130.059 I-1.427 J-.055 E.00526
G1 X84.466 Y129.927 E.00304
; LINE_WIDTH: 0.425384
G2 X84.378 Y129.657 I-1.064 J.198 E.00741
G1 X84.314 Y129.543 E.00342
; LINE_WIDTH: 0.464622
G2 X84.123 Y129.289 I-1.711 J1.091 E.0091
; LINE_WIDTH: 0.501956
G1 X84.094 Y129.257 E.00134
G1 X83.979 Y129.472 F30000
; LINE_WIDTH: 0.515448
G1 F18000
G1 X84.059 Y129.194 E.00925
; LINE_WIDTH: 0.479602
G1 X84.068 Y129.169 E.00079
; LINE_WIDTH: 0.440801
G1 X84.076 Y129.143 E.00072
; LINE_WIDTH: 0.398718
G1 X84.089 Y129.11 E.00086
; LINE_WIDTH: 0.357538
G1 X84.118 Y129.068 E.00108
; LINE_WIDTH: 0.320548
G1 X84.147 Y129.027 E.00096
; LINE_WIDTH: 0.265546
G2 X84.491 Y128.666 I-7.417 J-7.427 E.00767
; LINE_WIDTH: 0.312193
G2 X84.613 Y128.474 I-.724 J-.596 E.00422
; LINE_WIDTH: 0.366032
G2 X84.731 Y127.95 I-.962 J-.491 E.01197
; LINE_WIDTH: 0.381415
G1 X84.726 Y127.818 E.00306
G2 X84.389 Y127.129 I-1.12 J.122 E.01806
; LINE_WIDTH: 0.327242
G2 X84.199 Y126.986 I-.594 J.588 E.00466
; LINE_WIDTH: 0.278641
G1 X84.068 Y126.923 E.00236
; LINE_WIDTH: 0.23652
G2 X83.908 Y126.871 I-.472 J1.177 E.00227
; LINE_WIDTH: 0.19024
G1 X83.785 Y126.849 E.0013
; LINE_WIDTH: 0.131167
G1 X83.473 Y126.827 E.00201
G1 X80.491 Y126.828 E.01921
; LINE_WIDTH: 0.154507
G1 X80.331 Y126.908 E.00143
; LINE_WIDTH: 0.202608
G1 X80.172 Y126.988 E.002
G1 X80.331 Y126.78 F30000
; LINE_WIDTH: 0.354033
G1 F18000
G1 X80.336 Y129.157 E.05056
G1 X80.491 Y129.157 F30000
; LINE_WIDTH: 0.150036
G1 F18000
G1 X83.345 Y129.159 E.02197
G1 X83.581 Y129.173 E.00182
; LINE_WIDTH: 0.212848
G1 X83.664 Y129.179 E.00099
; LINE_WIDTH: 0.242086
G1 X84.386 Y129.273 E.01006
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X83.664 Y129.179 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X90.727 Y128.33 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G1 X87.37 Y128.33 E.08611
G3 X86.991 Y128.056 I-.047 J-.336 E.01327
G3 X86.988 Y127.371 I6.803 J-.365 E.01757
G3 X87.199 Y127.096 I.346 J.047 E.00931
G1 X87.309 Y127.077 E.00286
G1 X90.727 Y127.078 E.0877
G1 X90.727 Y128.27 E.03058
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X88.727 Y128.306 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X90.664 Y129.763 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
G1 F9600
M204 S5000
G2 X90.729 Y129.599 I-.269 J-.202 E.00458
G1 X90.727 Y128.821 E.01995
G1 X87.233 Y128.821 E.08961
G3 X86.367 Y127.89 I.08 J-.943 E.03578
G3 X86.495 Y127.043 I1.539 J-.2 E.02226
G3 X87.213 Y126.582 I.786 J.434 E.02282
G1 X88.002 Y126.579 E.02024
G1 X91.348 Y126.579 E.08583
G3 X91.346 Y129.529 I-115.034 J1.411 E.07567
G3 X90.382 Y130.383 I-.919 J-.066 E.03659
G1 X86.738 Y130.383 E.09349
G1 X86.914 Y129.894 E.01333
G1 X90.439 Y129.895 E.09044
G2 X90.623 Y129.808 I-.045 J-.334 E.00532
M204 S10000
G1 X90.878 Y129.932 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.198097
G1 F18000
G1 X90.892 Y129.916 E.00022
G2 X91.02 Y129.639 I-.547 J-.423 E.00336
; LINE_WIDTH: 0.254218
G1 X91.023 Y129.625 E.00021
G2 X91.038 Y126.89 I-59.078 J-1.688 E.04001
G1 X91.025 Y126.878 E.00026
; LINE_WIDTH: 0.205539
G1 X90.976 Y126.853 E.00062
; LINE_WIDTH: 0.156584
G1 X90.927 Y126.829 E.00044
; LINE_WIDTH: 0.132397
G1 X87.283 Y126.83 E.02377
G2 X86.868 Y127.006 I.016 J.613 E.00302
; LINE_WIDTH: 0.196817
G2 X86.698 Y127.313 I.383 J.412 E.00386
; LINE_WIDTH: 0.244274
G1 X86.691 Y127.347 E.00048
G2 X86.72 Y128.162 I2.373 J.323 E.01144
; LINE_WIDTH: 0.185236
G1 X86.765 Y128.265 E.00113
G2 X86.893 Y128.422 I.544 J-.315 E.00203
; LINE_WIDTH: 0.127441
G2 X87.26 Y128.575 I.419 J-.488 E.00251
G1 X90.927 Y128.575 E.02271
; LINE_WIDTH: 0.148451
G1 X90.963 Y128.576 E.00027
; LINE_WIDTH: 0.19516
G1 X90.998 Y128.576 E.00038
; LINE_WIDTH: 0.241869
G1 X91.033 Y128.577 E.00049
G1 X90.878 Y129.932 F30000
; LINE_WIDTH: 0.125733
G1 F18000
G3 X90.487 Y130.136 I-.467 J-.417 E.00275
G1 X87.039 Y130.139 E.02096
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X89.039 Y130.137 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X96.667 Y129.886 Z3.16 F30000
G1 X98.25 Y129.834 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G2 X98.416 Y129.563 I-.162 J-.286 E.00852
G1 X98.416 Y126.579 E.07654
G1 X99.111 Y126.579 E.01783
G1 X99.111 Y129.49 E.07467
G3 X98.223 Y130.382 I-.946 J-.054 E.03531
G1 X92.774 Y130.383 E.1398
G1 X92.774 Y126.579 E.09758
G1 X93.461 Y126.579 E.01764
G1 X93.461 Y129.406 E.07251
G2 X93.605 Y129.822 I.403 J.094 E.01193
G2 X93.742 Y129.874 I.163 J-.228 E.00379
G1 X95.257 Y129.876 E.03888
G2 X95.603 Y129.517 I.015 J-.332 E.01449
G1 X95.603 Y126.579 E.07537
G1 X96.296 Y126.579 E.01779
G1 X96.296 Y129.561 E.07649
G2 X96.635 Y129.876 I.327 J-.011 E.01319
G1 X98.071 Y129.877 E.03685
G2 X98.195 Y129.859 I.016 J-.328 E.00323
M204 S10000
G1 X98.314 Y130.103 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.143036
G1 F18000
G1 X98.077 Y130.129 E.00172
G3 X96.624 Y130.129 I-.727 J-39.527 E.01051
G1 X96.38 Y130.107 E.00177
; LINE_WIDTH: 0.190187
G1 X95.628 Y129.943 E.00797
G1 X98.314 Y130.103 F30000
; LINE_WIDTH: 0.188713
G1 F18000
G1 X98.489 Y130.017 E.00201
; LINE_WIDTH: 0.231502
G2 X98.644 Y129.863 I-.249 J-.406 E.00288
; LINE_WIDTH: 0.269446
G2 X98.727 Y129.68 I-.325 J-.257 E.00318
; LINE_WIDTH: 0.326363
G2 X98.751 Y129.583 I-.918 J-.277 E.00193
G1 X98.764 Y126.779 E.05447
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X98.754 Y128.779 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X95.95 Y126.779 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.327162
G1 F18000
G3 X95.95 Y129.531 I-99.731 J1.384 E.05359
G1 X95.951 Y129.671 E.00274
; LINE_WIDTH: 0.370382
M73 P92 R2
G2 X95.949 Y129.762 I.782 J.064 E.00202
; LINE_WIDTH: 0.413088
G3 X95.959 Y130.182 I-5.01 J.328 E.0106
G1 X96.242 Y129.914 F30000
; LINE_WIDTH: 0.217559
G1 F18000
G1 X95.241 Y130.182 E.01263
G1 X95.436 Y130.121 F30000
; LINE_WIDTH: 0.1514
G1 F18000
G3 X95.266 Y130.129 I-.347 J-5.057 E.00133
G1 X93.706 Y130.127 E.01214
G3 X92.974 Y130.002 I.573 J-5.53 E.00579
G1 X93.229 Y130.183 F30000
; LINE_WIDTH: 0.396094
G1 F18000
G1 X93.149 Y129.845 E.00834
; LINE_WIDTH: 0.371054
G1 X93.136 Y129.765 E.00183
; LINE_WIDTH: 0.322203
G3 X93.118 Y129.407 I3.339 J-.35 E.00686
G1 X93.118 Y126.779 E.05031
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X93.118 Y128.779 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X100.669 Y127.669 Z3.16 F30000
G1 X104.074 Y127.169 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X104.186 Y127.387 I-.236 J.26 E.00644
G1 X104.187 Y129.56 E.05575
G3 X103.772 Y129.876 I-.343 J-.02 E.0152
G1 X101.157 Y129.876 E.06707
G1 X101.157 Y127.077 E.0718
G1 X103.846 Y127.077 E.06897
G3 X104.026 Y127.132 I-.009 J.351 E.0049
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X104.17 Y127.299 E-.02504
G1 X104.186 Y127.387 E-.01021
G1 X104.187 Y129.078 E-.19275
; WIPE_END
G1 E-.012 F1800
G1 X101.157 Y130.383 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X101.157 Y131.437 E.02704
G1 X100.437 Y131.437 E.01848
G1 X100.437 Y126.579 E.12463
G1 X104.066 Y126.585 E.0931
G3 X104.884 Y127.549 I-.116 J.927 E.0356
G3 X104.878 Y129.536 I-36.75 J.895 E.05098
G3 X103.928 Y130.383 I-.924 J-.08 E.036
G1 X101.217 Y130.383 E.06955
M204 S10000
G1 X100.926 Y130.129 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.142926
G1 F18000
G1 X103.776 Y130.13 E.02059
G2 X104.171 Y130.073 I.076 J-.875 E.00291
; LINE_WIDTH: 0.211329
G1 X104.188 Y130.064 E.00022
G2 X104.333 Y129.962 I-.346 J-.649 E.00209
; LINE_WIDTH: 0.251688
G2 X104.465 Y129.784 I-.542 J-.538 E.00322
; LINE_WIDTH: 0.293751
G2 X104.524 Y129.581 I-1.439 J-.526 E.00366
; LINE_WIDTH: 0.328983
G1 X104.534 Y129.478 E.00201
G2 X104.519 Y127.344 I-64.105 J-.592 E.04185
G1 X104.503 Y127.28 E.00129
; LINE_WIDTH: 0.273398
G2 X104.422 Y127.105 I-.55 J.148 E.00308
; LINE_WIDTH: 0.231865
G1 X104.378 Y127.044 E.00098
G2 X104.282 Y126.952 I-1.654 J1.643 E.00174
; LINE_WIDTH: 0.189822
G1 X104.252 Y126.931 E.00038
G2 X104.105 Y126.86 I-.479 J.797 E.00169
; LINE_WIDTH: 0.133489
G1 X103.856 Y126.828 E.00166
G2 X100.957 Y126.828 I-1.444 J93.727 E.01912
; LINE_WIDTH: 0.156372
G1 X100.797 Y126.908 E.00145
; LINE_WIDTH: 0.205165
G1 X100.637 Y126.988 E.00203
G1 X100.797 Y126.779 F30000
; LINE_WIDTH: 0.354012
G1 F18000
G1 X100.797 Y130.076 E.07011
G3 X100.797 Y130.183 I-.318 J.053 E.00227
G1 X100.797 Y131.237 E.02241
G1 X100.802 Y130.129 F30000
; LINE_WIDTH: 0.340567
G1 F18000
G1 X100.833 Y130.129 E.00063
; LINE_WIDTH: 0.296165
G1 X100.864 Y130.129 E.00054
; LINE_WIDTH: 0.251763
G1 X100.895 Y130.129 E.00045
; LINE_WIDTH: 0.20736
G1 X100.926 Y130.129 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X100.895 Y130.129 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X107.053 Y127.109 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G2 X106.865 Y127.372 I.146 J.303 E.00864
G1 X106.865 Y130.383 E.07724
G1 X106.236 Y130.383 E.01614
G1 X106.239 Y127.464 E.07489
G3 X107.333 Y126.579 I.953 J.059 E.04059
G1 X109.91 Y126.579 E.06611
G3 X110.795 Y127.533 I-.057 J.94 E.03684
G1 X110.795 Y130.383 E.0731
G1 X110.174 Y130.383 E.01593
G1 X110.175 Y127.381 E.07702
G2 X109.84 Y127.076 I-.33 J.027 E.0128
G1 X107.207 Y127.076 E.06753
G2 X107.109 Y127.088 I-.008 J.336 E.00256
M204 S10000
G1 X106.765 Y126.983 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13327
G1 F18000
G3 X107.053 Y126.841 I.415 J.476 E.00214
G1 X107.198 Y126.829 E.00095
G3 X109.845 Y126.828 I1.351 J84.455 E.01742
G3 X110.065 Y126.862 I.009 J.673 E.00148
G1 X110.128 Y126.889 E.00045
; LINE_WIDTH: 0.176834
G3 X110.422 Y127.193 I-.269 J.554 E.00409
G1 X110.43 Y127.21 E.00017
; LINE_WIDTH: 0.251416
G3 X110.485 Y127.543 I-.696 J.286 E.00491
G1 X110.485 Y130.183 E.03812
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X110.485 Y128.183 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X106.551 Y130.183 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.259082
G1 F18000
G1 X106.552 Y127.481 E.04039
G3 X106.602 Y127.219 I.654 J-.01 E.00401
; LINE_WIDTH: 0.195559
G3 X106.765 Y126.983 I.635 J.263 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X106.687 Y127.068 E-.0911
G1 X106.602 Y127.219 E-.1369
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
; layer num/total_layer_count: 18/18
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S183.6
G17
G3 Z3.16 I1.217 J0 P1  F30000
; object ids of layer 18 start: 145,179
M624 AwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; object ids of this layer18 end: 145,179
M625
; OBJECT_ID: 145
; start printing object, unique label id: 145
M624 AQAAAAAAAAA=
G1 X138.361 Y137.075
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9600
M204 S5000
G3 X151.858 Y106.272 I14.084 J-12.188 E1.07633
G1 X152.092 Y106.271 E.00601
G1 X152.962 Y106.27 E.02231
G3 X138.4 Y137.12 I-.517 J18.618 E1.89598
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X137.658 Y136.223 E-.13269
G1 X137.17 Y135.545 E-.09531
; WIPE_END
G1 E-.012 F1800
G1 X144.782 Y136.106 Z3.32 F30000
G1 X167.455 Y137.779 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G3 X154.478 Y144.571 I-15.013 J-12.89 E.38491
G1 X154.239 Y144.6 E.0062
G3 X153.924 Y105.163 I-1.792 J-19.706 E1.67873
G1 X154.165 Y105.177 E.00619
G3 X167.494 Y137.733 I-1.722 J19.712 E1.11175
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X166.67 Y138.65 E-.14053
G1 X166.12 Y139.185 E-.08747
; WIPE_END
G1 E-.012 F1800
G1 X162.878 Y141.456 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Top surface
G1 F3600
M204 S2000
G1 X168.986 Y135.347 E.22161
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X167.572 Y136.762 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X167.231 Y136.557 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X169.744 Y134.044 E.09116
G1 X170.27 Y132.972
G1 X168.468 Y134.775 E.0654
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X169.882 Y133.361 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X169.209 Y133.488 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X170.652 Y132.046 E.05232
G1 X170.978 Y131.174
G1 X169.704 Y132.448 E.04623
G1 X170.072 Y131.534
G1 X171.234 Y130.372 E.04215
G1 X171.437 Y129.624
G1 X170.36 Y130.701 E.03908
G1 X170.587 Y129.929
G1 X171.594 Y128.922 E.03655
G1 X171.732 Y128.239
G1 X170.779 Y129.192 E.03458
G1 X170.931 Y128.494
G1 X171.826 Y127.599 E.03246
G1 X171.906 Y126.973
G1 X171.047 Y127.832 E.03116
G1 X171.142 Y127.192
G1 X171.959 Y126.376 E.02963
G1 X171.996 Y125.793
G1 X171.201 Y126.588 E.02885
G1 X171.253 Y125.99
G1 X172.012 Y125.232 E.02752
G1 X172.017 Y124.681
G1 X171.27 Y125.428 E.0271
G1 X171.285 Y124.867
G1 X172 Y124.152 E.02593
G1 X171.979 Y123.628
G1 X171.269 Y124.338 E.02577
G1 X171.253 Y123.809
G1 X171.934 Y123.128 E.02472
G1 X171.888 Y122.628
G1 X171.211 Y123.305 E.02458
G1 X171.165 Y122.805
G1 X171.821 Y122.149 E.0238
G1 X171.75 Y121.676
G1 X171.103 Y122.322 E.02347
G1 X171.031 Y121.849
G1 X171.669 Y121.212 E.02312
G1 X171.573 Y120.762
G1 X170.952 Y121.382 E.02252
G1 X170.857 Y120.933
G1 X171.477 Y120.312 E.02252
G1 X171.362 Y119.881
G1 X170.761 Y120.483 E.02182
G1 X170.646 Y120.053
G1 X171.245 Y119.454 E.02172
G1 X171.121 Y119.032
G1 X170.528 Y119.625 E.02153
G1 X170.403 Y119.205
G1 X170.983 Y118.625 E.02105
G1 X170.845 Y118.218
G1 X170.264 Y118.798 E.02105
G1 X170.126 Y118.391
G1 X170.695 Y117.822 E.02065
G1 X170.537 Y117.434
G1 X169.972 Y117.999 E.02049
G1 X169.814 Y117.612
G1 X170.379 Y117.047 E.02049
G1 X170.207 Y116.674
G1 X169.655 Y117.226 E.02003
G1 X169.478 Y116.857
G1 X170.03 Y116.305 E.02003
G1 X169.853 Y115.936
G1 X169.301 Y116.488 E.02003
G1 X169.118 Y116.126
G1 X169.66 Y115.585 E.01965
G1 X169.465 Y115.233
G1 X168.924 Y115.775 E.01965
G1 X168.729 Y115.424
G1 X169.27 Y114.884 E.01961
G1 X169.058 Y114.55
G1 X168.525 Y115.083 E.01936
G1 X168.313 Y114.749
G1 X168.847 Y114.216 E.01936
G1 X168.633 Y113.884
G1 X168.102 Y114.416 E.01928
G1 X167.877 Y114.095
G1 X168.405 Y113.567 E.01913
G1 X168.176 Y113.25
G1 X167.649 Y113.778 E.01913
G1 X167.421 Y113.461
G1 X167.937 Y112.944 E.01875
G1 X167.695 Y112.64
G1 X167.177 Y113.158 E.0188
G1 X166.932 Y112.858
G1 X167.453 Y112.337 E.0189
G1 X167.208 Y112.037
G1 X166.687 Y112.558 E.0189
G1 X166.426 Y112.273
G1 X166.947 Y111.752 E.0189
G1 X166.686 Y111.468
G1 X166.165 Y111.989 E.0189
G1 X165.902 Y111.707
G1 X166.422 Y111.186 E.01889
G1 X166.145 Y110.918
G1 X165.625 Y111.439 E.01889
G1 X165.347 Y111.171
G1 X165.868 Y110.65 E.01889
G1 X165.588 Y110.384
G1 X165.066 Y110.906 E.01894
G1 X164.773 Y110.654
G1 X165.295 Y110.132 E.01894
G1 X165.001 Y109.88
G1 X164.479 Y110.402 E.01894
G1 X164.18 Y110.156
G1 X164.705 Y109.631 E.01906
G1 X164.396 Y109.395
G1 X163.87 Y109.921 E.01906
G1 X163.56 Y109.685
G1 X164.086 Y109.16 E.01906
G1 X163.773 Y108.927
G1 X163.243 Y109.457 E.01925
G1 X162.916 Y109.238
G1 X163.447 Y108.708 E.01925
G1 X163.12 Y108.489
G1 X162.59 Y109.019 E.01925
G1 X162.253 Y108.811
G1 X162.79 Y108.274 E.01951
G1 X162.447 Y108.072
G1 X161.909 Y108.609 E.01951
G1 X161.566 Y108.407
G1 X162.103 Y107.87 E.01951
G1 X161.755 Y107.673
G1 X161.207 Y108.22 E.01985
G1 X160.847 Y108.036
G1 X161.394 Y107.489 E.01985
G1 X161.033 Y107.304
G1 X160.484 Y107.853 E.01991
G1 X160.105 Y107.687
G1 X160.664 Y107.128 E.02028
G1 X160.284 Y106.962
G1 X159.726 Y107.52 E.02028
G1 X159.339 Y107.362
G1 X159.905 Y106.795 E.02054
G1 X159.514 Y106.641
G1 X158.941 Y107.215 E.02079
G1 X158.542 Y107.067
G1 X159.116 Y106.494 E.02079
G1 X158.717 Y106.347
G1 X158.129 Y106.936 E.02135
G1 X157.71 Y106.809
G1 X158.301 Y106.218 E.02142
G1 X157.882 Y106.091
G1 X157.288 Y106.686 E.02157
G1 X156.848 Y106.581
G1 X157.458 Y105.97 E.02216
G1 X157.018 Y105.864
G1 X156.408 Y106.475 E.02216
G1 X155.951 Y106.387
G1 X156.578 Y105.759 E.02277
G1 X156.122 Y105.669
G1 X155.488 Y106.304 E.02303
G1 X155.015 Y106.231
G1 X155.659 Y105.587 E.02336
G1 X155.19 Y105.511
G1 X154.527 Y106.174 E.02403
G1 X154.037 Y106.119
G1 X154.697 Y105.459 E.02396
G1 X154.204 Y105.406
G1 X153.521 Y106.089 E.02479
G1 X153.005 Y106.06
G1 X153.702 Y105.362 E.0253
G1 X153.187 Y105.333
G1 X152.461 Y106.059 E.02633
G1 X151.906 Y106.069
G1 X152.652 Y105.322 E.02708
G1 X152.106 Y105.323
G1 X151.331 Y106.098 E.02811
G1 X150.756 Y106.127
G1 X151.542 Y105.341 E.02851
G1 X150.961 Y105.377
G1 X150.137 Y106.2 E.02989
G1 X149.509 Y106.284
G1 X150.361 Y105.432 E.03091
G1 X149.74 Y105.507
G1 X148.842 Y106.405 E.03258
G1 X148.147 Y106.555
G1 X149.09 Y105.612 E.03423
G1 X148.424 Y105.733
G1 X147.424 Y106.732 E.03627
G1 X146.637 Y106.974
G1 X147.706 Y105.904 E.03882
G1 X146.961 Y106.104
G1 X145.785 Y107.281 E.04268
G1 X144.872 Y107.648
G1 X146.174 Y106.346 E.04723
G1 X145.307 Y106.668
G1 X143.831 Y108.144 E.05355
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X145.245 Y106.73 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X142.562 Y108.867 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X144.359 Y107.07 E.06521
G1 X143.289 Y107.595
G1 X140.781 Y110.103 E.09097
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X142.195 Y108.688 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X146.602 Y114.921 Z3.32 F30000
G1 X164.107 Y139.681 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X161.6 Y142.188 E.09096
G1 X160.529 Y142.713
G1 X162.327 Y140.916 E.06521
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X160.913 Y142.33 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X161.058 Y141.639 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X159.582 Y143.115 E.05355
G1 X158.715 Y143.437
G1 X160.017 Y142.135 E.04722
G1 X159.096 Y142.511
G1 X157.928 Y143.679 E.04237
G1 X157.182 Y143.879
G1 X158.252 Y142.809 E.03882
G1 X157.465 Y143.051
G1 X156.465 Y144.051 E.03627
G1 X155.799 Y144.172
G1 X156.742 Y143.228 E.03422
G1 X156.047 Y143.378
G1 X155.149 Y144.276 E.03258
G1 X154.528 Y144.351
G1 X155.38 Y143.499 E.03091
G1 X154.751 Y143.583
G1 X153.937 Y144.397 E.02954
G1 X153.35 Y144.439
G1 X154.132 Y143.656 E.02839
G1 X153.551 Y143.692
G1 X152.783 Y144.46 E.02787
G1 X152.237 Y144.461
G1 X152.974 Y143.723 E.02676
G1 X152.428 Y143.725
G1 X151.702 Y144.45 E.02633
G1 X151.186 Y144.421
G1 X151.884 Y143.723 E.0253
G1 X151.368 Y143.694
G1 X150.675 Y144.387 E.02516
G1 X150.186 Y144.33
G1 X150.852 Y143.664 E.02416
G1 X150.362 Y143.609
G1 X149.698 Y144.273 E.02407
G1 X149.23 Y144.196
G1 X149.873 Y143.552 E.02336
G1 X149.401 Y143.479
G1 X148.766 Y144.114 E.02303
G1 X148.311 Y144.024
G1 X148.938 Y143.396 E.02277
G1 X148.481 Y143.308
G1 X147.871 Y143.919 E.02216
G1 X147.431 Y143.813
G1 X148.041 Y143.202 E.02216
G1 X147.601 Y143.097
G1 X147.007 Y143.692 E.02157
G1 X146.588 Y143.565
G1 X147.179 Y142.974 E.02142
G1 X146.76 Y142.848
G1 X146.172 Y143.436 E.02135
G1 X145.773 Y143.289
G1 X146.347 Y142.716 E.02079
G1 X145.948 Y142.569
G1 X145.375 Y143.142 E.02079
G1 X144.984 Y142.988
G1 X145.55 Y142.421 E.02054
G1 X145.163 Y142.263
G1 X144.604 Y142.822 E.02028
G1 X144.225 Y142.655
G1 X144.784 Y142.096 E.02028
G1 X144.405 Y141.93
G1 X143.856 Y142.479 E.01991
G1 X143.495 Y142.295
G1 X144.042 Y141.747 E.01985
G1 X143.681 Y141.563
G1 X143.139 Y142.106 E.0197
G1 X142.792 Y141.907
G1 X143.323 Y141.376 E.01927
G1 X142.98 Y141.174
G1 X142.446 Y141.708 E.01938
G1 X142.099 Y141.509
G1 X142.636 Y140.972 E.01949
G1 X142.299 Y140.764
G1 X141.769 Y141.294 E.01925
G1 X141.442 Y141.075
G1 X141.973 Y140.545 E.01925
G1 X141.646 Y140.326
G1 X141.116 Y140.856 E.01925
G1 X140.803 Y140.623
G1 X141.328 Y140.098 E.01906
G1 X141.019 Y139.862
G1 X140.493 Y140.388 E.01906
G1 X140.183 Y140.152
G1 X140.709 Y139.627 E.01906
G1 X140.41 Y139.381
G1 X139.888 Y139.903 E.01894
G1 X139.594 Y139.651
G1 X140.116 Y139.129 E.01894
G1 X139.823 Y138.877
G1 X139.301 Y139.399 E.01894
G1 X139.021 Y139.133
G1 X139.542 Y138.612 E.01889
G1 X139.264 Y138.344
G1 X138.744 Y138.865 E.01889
G1 X138.466 Y138.597
G1 X138.987 Y138.076 E.01889
G1 X138.724 Y137.794
G1 X138.203 Y138.315 E.0189
G1 X137.942 Y138.031
G1 X138.463 Y137.51 E.0189
G1 X138.202 Y137.225
G1 X137.681 Y137.746 E.0189
G1 X137.433 Y137.448
G1 X137.957 Y136.925 E.01899
G1 X137.712 Y136.625
G1 X137.188 Y137.148 E.01899
G1 X136.944 Y136.847
G1 X137.468 Y136.322 E.01904
G1 X137.24 Y136.005
G1 X136.713 Y136.533 E.01914
G1 X136.484 Y136.216
G1 X137.012 Y135.688 E.01913
G1 X136.787 Y135.367
G1 X136.256 Y135.899 E.01928
G1 X136.042 Y135.567
G1 X136.576 Y135.034 E.01936
G1 X136.364 Y134.7
G1 X135.831 Y135.233 E.01936
G1 X135.619 Y134.899
G1 X136.16 Y134.359 E.01961
G1 X135.965 Y134.008
G1 X135.424 Y134.55 E.01965
G1 X135.229 Y134.199
G1 X135.771 Y133.657 E.01965
G1 X135.588 Y133.295
G1 X135.036 Y133.847 E.02003
G1 X134.859 Y133.478
G1 X135.411 Y132.926 E.02003
G1 X135.234 Y132.557
G1 X134.682 Y133.109 E.02003
G1 X134.51 Y132.736
G1 X135.075 Y132.171 E.02049
G1 X134.917 Y131.784
G1 X134.352 Y132.349 E.02049
G1 X134.194 Y131.961
G1 X134.763 Y131.392 E.02065
G1 X134.625 Y130.985
G1 X134.044 Y131.565 E.02105
G1 X133.906 Y131.158
G1 X134.486 Y130.578 E.02105
G1 X134.361 Y130.158
G1 X133.768 Y130.751 E.02153
G1 X133.644 Y130.329
G1 X134.243 Y129.73 E.02172
G1 X134.128 Y129.3
G1 X133.527 Y129.902 E.02182
G1 X133.412 Y129.471
G1 X134.032 Y128.85 E.02252
G1 X133.937 Y128.401
G1 X133.316 Y129.021 E.02252
G1 X133.22 Y128.571
G1 X133.858 Y127.934 E.02312
G1 X133.786 Y127.461
G1 X133.139 Y128.107 E.02347
G1 X133.068 Y127.634
G1 X133.724 Y126.977 E.0238
G1 X133.678 Y126.478
G1 X133.001 Y127.155 E.02458
G1 X132.955 Y126.655
G1 X133.636 Y125.974 E.02472
G1 X133.62 Y125.445
G1 X132.91 Y126.155 E.02577
G1 X132.889 Y125.631
G1 X133.604 Y124.916 E.02593
G1 X133.619 Y124.355
G1 X132.872 Y125.102 E.0271
G1 X132.877 Y124.551
G1 X133.636 Y123.793 E.02752
G1 X133.688 Y123.195
G1 X132.893 Y123.99 E.02885
G1 X132.935 Y123.403
G1 X133.749 Y122.589 E.02953
G1 X133.851 Y121.942
G1 X132.994 Y122.799 E.0311
G1 X133.063 Y122.184
G1 X133.958 Y121.289 E.03246
G1 X134.101 Y120.6
G1 X133.157 Y121.544 E.03425
G1 X133.295 Y120.861
G1 X134.296 Y119.86 E.03631
G1 X134.529 Y119.082
G1 X133.452 Y120.159 E.03908
G1 X133.655 Y119.41
G1 X134.817 Y118.249 E.04215
G1 X135.185 Y117.335
G1 X133.911 Y118.609 E.04623
G1 X134.224 Y117.751
G1 X135.68 Y116.295 E.05283
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X134.266 Y117.709 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X136.422 Y115.008 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X134.619 Y116.81 E.06541
G1 X135.145 Y115.738
G1 X137.659 Y113.225 E.09118
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X136.244 Y114.639 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X135.903 Y114.435 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X142.011 Y108.328 E.22159
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X140.596 Y109.742 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X148.144 Y108.609 Z3.32 F30000
G1 X158.503 Y107.054 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0947744
G1 F18000
G1 X158.368 Y106.969 E.00064
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X158.503 Y107.054 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X150.871 Y107.012 Z3.32 F30000
G1 X146.651 Y106.989 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.0909632
G1 F18000
G1 X146.407 Y106.932 E.00095
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X146.651 Y106.989 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X144.801 Y106.874 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.101845
G1 F18000
G1 X144.675 Y106.96 E.00069
; LINE_WIDTH: 0.144289
G1 X144.549 Y107.047 E.00112
; LINE_WIDTH: 0.186733
G1 X144.423 Y107.133 E.00155
G1 X144.808 Y107.585 F30000
; LINE_WIDTH: 0.186734
G1 F18000
G1 X144.682 Y107.671 E.00155
; LINE_WIDTH: 0.14429
G1 X144.556 Y107.758 E.00112
; LINE_WIDTH: 0.101845
G1 X144.43 Y107.844 E.00069
G1 X143.768 Y108.081 F30000
; LINE_WIDTH: 0.191848
G1 F18000
G1 X143.62 Y108.189 E.00191
; LINE_WIDTH: 0.147353
G1 X143.473 Y108.297 E.00137
; LINE_WIDTH: 0.102857
G1 X143.326 Y108.404 E.00083
G1 X142.607 Y107.975 F30000
; LINE_WIDTH: 0.103894
G1 F18000
G1 X142.429 Y108.113 E.00104
; LINE_WIDTH: 0.150436
G1 X142.251 Y108.252 E.00174
; LINE_WIDTH: 0.196978
G1 X142.073 Y108.39 E.00244
G1 X142.5 Y108.805 F30000
; LINE_WIDTH: 0.200054
G1 F18000
G1 X142.323 Y108.944 E.00248
; LINE_WIDTH: 0.157279
G1 X142.144 Y109.085 E.00186
; LINE_WIDTH: 0.121935
G1 X142.023 Y109.184 E.00091
; LINE_WIDTH: 0.0943845
G1 X141.903 Y109.283 E.00062
G1 X141.083 Y108.953 F30000
; LINE_WIDTH: 0.087669
G1 F18000
G1 X141.008 Y109.015 E.00034
; LINE_WIDTH: 0.11377
G1 X140.79 Y109.206 E.00153
; LINE_WIDTH: 0.151864
G1 X140.572 Y109.397 E.00227
; LINE_WIDTH: 0.189957
G1 X140.353 Y109.589 E.003
; LINE_WIDTH: 0.228051
G1 X140.135 Y109.78 E.00374
; LINE_WIDTH: 0.267944
G1 X139.713 Y110.173 E.00897
; LINE_WIDTH: 0.309647
G1 X139.29 Y110.566 E.01058
; LINE_WIDTH: 0.328304
G2 X137.673 Y112.21 I26.931 J28.101 E.04509
; LINE_WIDTH: 0.271601
G1 X137.415 Y112.497 E.00609
; LINE_WIDTH: 0.230884
G1 X137.157 Y112.784 E.00504
; LINE_WIDTH: 0.190167
G1 X136.899 Y113.07 E.004
; LINE_WIDTH: 0.147493
G1 X136.717 Y113.286 E.00212
; LINE_WIDTH: 0.102904
G1 X136.534 Y113.501 E.00129
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X136.717 Y113.286 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X140.72 Y110.041 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.220098
G1 F18000
G1 X140.501 Y110.233 E.0036
; LINE_WIDTH: 0.187396
G1 X140.092 Y110.613 E.00568
; LINE_WIDTH: 0.146993
G1 X139.682 Y110.995 E.0042
; LINE_WIDTH: 0.119579
G1 X138.885 Y111.781 E.00634
; LINE_WIDTH: 0.131562
G1 X138.422 Y112.272 E.00437
; LINE_WIDTH: 0.169939
G1 X137.956 Y112.765 E.00612
; LINE_WIDTH: 0.212259
G1 X137.597 Y113.164 E.00635
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X137.956 Y112.765 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X136.806 Y114.379 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.104159
G1 F18000
G1 X136.657 Y114.568 E.00112
; LINE_WIDTH: 0.151234
G1 X136.508 Y114.757 E.00187
; LINE_WIDTH: 0.198309
G1 X136.359 Y114.945 E.00262
G1 X135.965 Y114.498 F30000
; LINE_WIDTH: 0.203657
G1 F18000
G1 X135.838 Y114.657 E.0023
; LINE_WIDTH: 0.165095
G1 X135.711 Y114.817 E.00177
; LINE_WIDTH: 0.126533
G1 X135.583 Y114.976 E.00125
; LINE_WIDTH: 0.0939259
G1 X135.513 Y115.07 E.00047
G1 X135.976 Y115.754 F30000
; LINE_WIDTH: 0.103309
G1 F18000
G1 X135.856 Y115.914 E.00091
; LINE_WIDTH: 0.1487
G1 X135.737 Y116.073 E.00151
; LINE_WIDTH: 0.194091
G1 X135.617 Y116.232 E.00212
G1 X135.406 Y116.869 F30000
; LINE_WIDTH: 0.102229
G1 F18000
G1 X135.311 Y117.003 E.00074
; LINE_WIDTH: 0.145467
G1 X135.217 Y117.137 E.00121
; LINE_WIDTH: 0.188705
G1 X135.122 Y117.271 E.00169
G1 X134.682 Y116.874 F30000
; LINE_WIDTH: 0.188719
G1 F18000
G1 X134.419 Y117.247 E.00469
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X134.682 Y116.874 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X134.186 Y124.49 Z3.32 F30000
G1 X133.933 Y128.375 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.138117
G1 F18000
G1 X133.874 Y128.264 E.00086
G1 X133.908 Y128.157 E.00078
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X133.874 Y128.264 E-.10787
G1 X133.933 Y128.375 E-.12013
; WIPE_END
G1 E-.012 F1800
G1 X138.948 Y134.128 Z3.32 F30000
G1 X146.521 Y142.814 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.0948091
G1 F18000
G1 X146.385 Y142.729 E.00064
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X146.521 Y142.814 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X153.177 Y143.793 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.103688
G1 F18000
G1 X152.958 Y143.707 E.00109
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X153.177 Y143.793 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X158.621 Y142.689 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.121507
G1 F18000
G1 X158.32 Y142.877 E.00206
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X158.621 Y142.689 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X160.466 Y142.65 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.186741
G1 F18000
G1 X160.34 Y142.736 E.00155
; LINE_WIDTH: 0.144293
G1 X160.214 Y142.823 E.00112
; LINE_WIDTH: 0.101846
G1 X160.088 Y142.909 E.00069
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X160.214 Y142.823 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X160.459 Y141.939 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.101844
G1 F18000
G1 X160.333 Y142.026 E.00069
; LINE_WIDTH: 0.144286
G1 X160.206 Y142.112 E.00112
; LINE_WIDTH: 0.186728
G1 X160.08 Y142.199 E.00155
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X160.206 Y142.112 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X161.563 Y141.379 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.102858
G1 F18000
G1 X161.416 Y141.487 E.00083
; LINE_WIDTH: 0.147355
G1 X161.268 Y141.594 E.00137
; LINE_WIDTH: 0.191852
G1 X161.121 Y141.702 E.00191
M73 P93 R2
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X161.268 Y141.594 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X162.816 Y141.393 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.196984
G1 F18000
G1 X162.638 Y141.532 E.00244
; LINE_WIDTH: 0.150439
G1 X162.459 Y141.67 E.00174
; LINE_WIDTH: 0.103895
G1 X162.281 Y141.808 E.00104
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X162.459 Y141.67 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X162.986 Y140.5 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.0943554
G1 F18000
G1 X162.866 Y140.599 E.00062
; LINE_WIDTH: 0.122068
G1 X162.743 Y140.7 E.00092
; LINE_WIDTH: 0.157429
G1 X162.566 Y140.839 E.00184
; LINE_WIDTH: 0.200024
G1 X162.389 Y140.978 E.00248
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X162.566 Y140.839 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X167.293 Y136.619 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.217513
G1 F18000
G1 X167.034 Y136.906 E.00471
; LINE_WIDTH: 0.181884
G1 X166.773 Y137.196 E.00383
; LINE_WIDTH: 0.151109
G1 X166.388 Y137.599 E.00433
; LINE_WIDTH: 0.121421
G1 X165.205 Y138.79 E.00972
; LINE_WIDTH: 0.146978
G1 X164.797 Y139.17 E.00418
; LINE_WIDTH: 0.187478
G1 X164.384 Y139.554 E.00574
; LINE_WIDTH: 0.220269
G1 X164.169 Y139.743 E.00354
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X164.384 Y139.554 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X168.355 Y136.281 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.105471
G1 F18000
G1 X168.145 Y136.529 E.00154
; LINE_WIDTH: 0.150553
G1 X167.912 Y136.791 E.0027
; LINE_WIDTH: 0.191003
G1 X167.68 Y137.052 E.00364
; LINE_WIDTH: 0.231454
G1 X167.447 Y137.313 E.00459
; LINE_WIDTH: 0.271904
G1 X167.215 Y137.574 E.00553
; LINE_WIDTH: 0.305473
G1 X166.817 Y137.991 E.01039
; LINE_WIDTH: 0.336078
G3 X165.599 Y139.217 I-21.278 J-19.915 E.03469
; LINE_WIDTH: 0.30976
G1 X165.176 Y139.61 E.01058
; LINE_WIDTH: 0.268058
G1 X164.754 Y140.003 E.00898
; LINE_WIDTH: 0.228137
G1 X164.536 Y140.194 E.00374
; LINE_WIDTH: 0.190047
G1 X164.317 Y140.386 E.003
; LINE_WIDTH: 0.151957
G1 X164.099 Y140.577 E.00227
; LINE_WIDTH: 0.113867
G1 X163.881 Y140.768 E.00153
; LINE_WIDTH: 0.087719
G1 X163.806 Y140.83 E.00035
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X163.881 Y140.768 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X168.53 Y134.837 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.198309
G1 F18000
G1 X168.381 Y135.026 E.00262
; LINE_WIDTH: 0.151234
G1 X168.232 Y135.215 E.00187
; LINE_WIDTH: 0.104159
G1 X168.083 Y135.403 E.00112
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X168.232 Y135.215 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X169.376 Y134.713 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.0939753
G1 F18000
G1 X169.306 Y134.807 E.00047
; LINE_WIDTH: 0.126607
G1 X169.178 Y134.966 E.00125
; LINE_WIDTH: 0.165139
G1 X169.051 Y135.126 E.00177
; LINE_WIDTH: 0.203672
G1 X168.924 Y135.285 E.0023
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X169.051 Y135.126 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X169.272 Y133.551 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.194091
G1 F18000
G1 X169.152 Y133.71 E.00212
; LINE_WIDTH: 0.1487
G1 X169.033 Y133.869 E.00151
; LINE_WIDTH: 0.103309
G1 X168.913 Y134.028 E.00091
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X169.033 Y133.869 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X169.767 Y132.512 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.188693
G1 F18000
G1 X169.672 Y132.646 E.00169
; LINE_WIDTH: 0.145459
G1 X169.578 Y132.78 E.00121
; LINE_WIDTH: 0.102226
G1 X169.483 Y132.914 E.00074
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X169.578 Y132.78 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X170.467 Y132.54 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.188985
G1 F18000
G1 X170.207 Y132.909 E.00465
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X170.467 Y132.54 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X170.826 Y124.916 Z3.32 F30000
G1 X170.981 Y121.627 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.138108
G1 F18000
G1 X171.015 Y121.519 E.00078
G1 X170.956 Y121.408 E.00086
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X171.015 Y121.519 E-.11975
G1 X170.981 Y121.627 E-.10825
; WIPE_END
G1 E-.012 F1800
G1 X166.659 Y127.918 Z3.32 F30000
G1 X155.291 Y144.465 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X149.582 Y144.465 E.00854
G1 X148.731 Y144.315 F30000
G1 F3600
G1 X156.154 Y144.315 E.01111
G1 X156.871 Y144.165 F30000
G1 F3600
G1 X148.021 Y144.165 E.01325
G1 X147.395 Y144.015 F30000
G1 F3600
G1 X157.487 Y144.015 E.0151
G1 X158.018 Y143.865 F30000
G1 F3600
G1 X146.874 Y143.865 E.01668
G1 X146.379 Y143.715 F30000
G1 F3600
G1 X158.506 Y143.715 E.01815
G1 X158.962 Y143.565 F30000
G1 F3600
G1 X146.126 Y143.565 E.01921
G1 X145.72 Y143.415 E.00065
G1 X150.465 Y143.415 E.0071
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X148.465 Y143.415 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X149.37 Y143.265 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X145.314 Y143.265 E.00607
G3 X144.933 Y143.115 I1.074 J-3.284 E.00061
G1 X148.556 Y143.115 E.00542
G1 X147.93 Y142.965 F30000
G1 F3600
G1 X144.591 Y142.965 E.005
G1 X144.248 Y142.815 E.00056
G1 X147.359 Y142.815 E.00466
G1 X146.865 Y142.665 F30000
G1 F3600
G1 X143.919 Y142.665 E.00441
G1 X143.626 Y142.515 E.00049
G1 X146.2 Y142.515 E.00385
G1 X145.794 Y142.365 E.00065
G1 X143.332 Y142.365 E.00368
G1 X143.039 Y142.215 E.00049
G1 X145.397 Y142.215 E.00353
G1 X145.055 Y142.065 E.00056
G1 X142.773 Y142.065 E.00342
G1 X142.518 Y141.915 E.00044
G1 X144.713 Y141.915 E.00328
G3 X144.379 Y141.765 I1.098 J-2.887 E.00055
G1 X142.263 Y141.765 E.00317
G1 X142.008 Y141.615 E.00044
G1 X144.086 Y141.615 E.00311
G1 X143.792 Y141.465 E.00049
G1 X141.777 Y141.465 E.00302
G1 X141.554 Y141.315 E.0004
G1 X143.499 Y141.315 E.00291
G3 X143.237 Y141.165 I1.132 J-2.282 E.00045
G1 X141.33 Y141.165 E.00285
G1 X141.107 Y141.015 E.0004
G1 X142.982 Y141.015 E.00281
G1 X142.726 Y140.865 E.00044
G1 X140.895 Y140.865 E.00274
G1 X140.697 Y140.715 E.00037
G1 X142.474 Y140.715 E.00266
G1 X142.25 Y140.565 E.0004
G1 X140.5 Y140.565 E.00262
G1 X140.303 Y140.415 E.00037
G1 X142.026 Y140.415 E.00258
G1 X141.803 Y140.265 E.0004
G1 X140.106 Y140.265 E.00254
G3 X139.925 Y140.115 I1.174 J-1.601 E.00035
G1 X141.579 Y140.115 E.00248
G3 X141.381 Y139.966 I1.161 J-1.743 E.00037
G1 X139.75 Y139.966 E.00244
G1 X139.575 Y139.816 E.00034
G1 X141.184 Y139.816 E.00241
G1 X140.986 Y139.666 E.00037
G1 X139.401 Y139.666 E.00237
G1 X139.226 Y139.516 E.00034
G1 X140.789 Y139.516 E.00234
G3 X140.603 Y139.366 I1.171 J-1.646 E.00036
G1 X139.064 Y139.366 E.0023
G1 X138.909 Y139.216 E.00032
G1 X140.428 Y139.216 E.00227
G1 X140.253 Y139.066 E.00034
G1 X138.754 Y139.066 E.00224
G1 X138.599 Y138.916 E.00032
G1 X140.079 Y138.916 E.00221
G1 X139.904 Y138.766 E.00034
G1 X138.444 Y138.766 E.00219
G3 X138.293 Y138.616 I1.187 J-1.346 E.00032
G1 X139.742 Y138.616 E.00217
G1 X139.587 Y138.466 E.00032
G1 X138.155 Y138.466 E.00214
G1 X138.017 Y138.316 E.0003
G1 X139.432 Y138.316 E.00212
G1 X139.277 Y138.166 E.00032
G1 X137.879 Y138.166 E.00209
G1 X137.742 Y138.016 E.0003
G1 X139.122 Y138.016 E.00207
G3 X138.976 Y137.866 I1.19 J-1.304 E.00031
G1 X137.604 Y137.866 E.00205
G3 X137.474 Y137.716 I1.199 J-1.17 E.0003
G1 X138.838 Y137.716 E.00204
G1 X138.701 Y137.566 E.0003
G1 X137.352 Y137.566 E.00202
G1 X137.23 Y137.416 E.00029
G1 X138.563 Y137.416 E.002
G1 X138.425 Y137.266 E.0003
G1 X137.107 Y137.266 E.00197
G1 X136.985 Y137.116 E.00029
G1 X138.289 Y137.116 E.00195
G1 X138.167 Y136.966 E.00029
G1 X136.863 Y136.966 E.00195
G3 X136.747 Y136.816 I1.206 J-1.05 E.00028
G1 X138.044 Y136.816 E.00194
G1 X137.922 Y136.666 E.00029
G1 X136.639 Y136.666 E.00192
G1 X136.531 Y136.516 E.00028
G1 X137.8 Y136.516 E.0019
G1 X137.678 Y136.366 E.00029
G1 X136.423 Y136.366 E.00188
G1 X136.315 Y136.216 E.00028
G1 X137.561 Y136.216 E.00186
G1 X137.453 Y136.066 E.00028
G1 X136.207 Y136.066 E.00186
G3 X136.101 Y135.916 I1.213 J-.973 E.00028
G1 X137.345 Y135.916 E.00186
G1 X137.237 Y135.766 E.00028
G1 X136.006 Y135.766 E.00184
G1 X135.911 Y135.616 E.00027
G1 X137.128 Y135.616 E.00182
G1 X137.02 Y135.466 E.00028
G1 X135.815 Y135.466 E.0018
G1 X135.72 Y135.316 E.00027
G1 X136.917 Y135.316 E.00179
G1 X136.822 Y135.166 E.00027
G1 X135.625 Y135.166 E.00179
G1 X135.53 Y135.016 E.00027
G1 X136.727 Y135.016 E.00179
G1 X136.632 Y134.866 E.00027
G1 X135.442 Y134.866 E.00178
G1 X135.359 Y134.716 E.00026
G1 X136.537 Y134.716 E.00176
G1 X136.442 Y134.566 E.00027
G1 X135.276 Y134.566 E.00174
G1 X135.193 Y134.416 E.00026
G1 X136.348 Y134.416 E.00173
G1 X136.265 Y134.266 E.00026
G1 X135.11 Y134.266 E.00173
G1 X135.027 Y134.116 E.00026
G1 X136.182 Y134.116 E.00173
G1 X136.099 Y133.966 E.00026
G1 X134.943 Y133.966 E.00173
G3 X134.869 Y133.816 I1.228 J-.705 E.00025
G1 X136.016 Y133.816 E.00172
G1 X135.933 Y133.666 E.00026
G1 X134.797 Y133.666 E.0017
G1 X134.725 Y133.516 E.00025
G1 X135.85 Y133.516 E.00168
G3 X135.774 Y133.366 I1.227 J-.713 E.00025
G1 X134.653 Y133.366 E.00168
G1 X134.582 Y133.216 E.00025
G1 X135.702 Y133.216 E.00168
G1 X135.63 Y133.066 E.00025
G1 X134.51 Y133.066 E.00168
G1 X134.438 Y132.916 E.00025
G1 X135.558 Y132.916 E.00168
G1 X135.487 Y132.766 E.00025
G1 X134.374 Y132.766 E.00167
G1 X134.313 Y132.616 E.00024
G1 X135.415 Y132.616 E.00165
G1 X135.343 Y132.466 E.00025
G1 X134.251 Y132.466 E.00163
G1 X134.19 Y132.316 E.00024
G1 X135.282 Y132.316 E.00163
G1 X135.221 Y132.166 E.00024
G1 X134.129 Y132.166 E.00163
G1 X134.068 Y132.016 E.00024
G1 X135.159 Y132.016 E.00163
G1 X135.098 Y131.866 E.00024
G1 X134.007 Y131.866 E.00163
G3 X133.951 Y131.716 I1.236 J-.548 E.00024
G1 X135.037 Y131.716 E.00163
G1 X134.976 Y131.566 E.00024
G1 X133.9 Y131.566 E.00161
G1 X133.849 Y131.416 E.00024
G1 X134.916 Y131.416 E.0016
G1 X134.865 Y131.266 E.00024
G1 X133.798 Y131.266 E.0016
G1 X133.747 Y131.116 E.00024
G1 X134.814 Y131.116 E.0016
G1 X134.763 Y130.966 E.00024
G1 X133.696 Y130.966 E.0016
G1 X133.645 Y130.816 E.00024
G1 X134.712 Y130.816 E.0016
G1 X134.661 Y130.666 E.00024
G1 X133.595 Y130.666 E.0016
G1 X133.554 Y130.516 E.00023
G1 X134.61 Y130.516 E.00158
G3 X134.56 Y130.366 I1.24 J-.494 E.00024
G1 X133.512 Y130.366 E.00157
G1 X133.471 Y130.216 E.00023
G1 X134.519 Y130.216 E.00157
G1 X134.478 Y130.066 E.00023
G1 X133.43 Y130.066 E.00157
G1 X133.388 Y129.916 E.00023
G1 X134.437 Y129.916 E.00157
G1 X134.395 Y129.766 E.00023
G1 X133.347 Y129.766 E.00157
G1 X133.306 Y129.616 E.00023
G1 X134.354 Y129.616 E.00157
G1 X134.313 Y129.466 E.00023
G1 X133.27 Y129.466 E.00156
G1 X133.238 Y129.316 E.00023
G1 X134.272 Y129.316 E.00155
G1 X134.24 Y129.166 E.00023
G1 X133.207 Y129.166 E.00155
G1 X133.175 Y129.016 E.00023
G1 X134.208 Y129.016 E.00155
G1 X134.176 Y128.866 E.00023
G1 X133.143 Y128.866 E.00155
G1 X133.111 Y128.716 E.00023
G1 X134.144 Y128.716 E.00155
G1 X134.112 Y128.566 E.00023
G1 X133.079 Y128.566 E.00155
G1 X133.047 Y128.416 E.00023
G1 X134.08 Y128.416 E.00155
G1 X134.049 Y128.266 E.00023
G1 X133.024 Y128.266 E.00153
G1 X133.002 Y128.116 E.00023
G1 X134.024 Y128.116 E.00153
G1 X134.001 Y127.966 E.00023
G1 X132.979 Y127.966 E.00153
G1 X132.956 Y127.816 E.00023
G1 X133.979 Y127.816 E.00153
G1 X133.956 Y127.666 E.00023
G1 X132.934 Y127.666 E.00153
G1 X132.911 Y127.516 E.00023
G1 X133.933 Y127.516 E.00153
G1 X133.911 Y127.366 E.00023
G1 X132.888 Y127.366 E.00153
G3 X132.868 Y127.216 I1.254 J-.244 E.00023
G1 X133.888 Y127.216 E.00153
G3 X133.87 Y127.066 I1.256 J-.23 E.00023
G1 X132.855 Y127.066 E.00152
G1 X132.841 Y126.916 E.00023
G1 X133.856 Y126.916 E.00152
G1 X133.842 Y126.766 E.00023
G1 X132.827 Y126.766 E.00152
G1 X132.814 Y126.616 E.00023
G1 X133.829 Y126.616 E.00152
G1 X133.815 Y126.466 E.00023
G1 X132.8 Y126.466 E.00152
G1 X132.786 Y126.316 E.00023
G1 X133.801 Y126.316 E.00152
G1 X133.788 Y126.166 E.00023
G1 X132.773 Y126.166 E.00152
G3 X132.764 Y126.016 I1.259 J-.15 E.00023
G1 X133.775 Y126.016 E.00151
G1 X133.77 Y125.866 E.00022
G1 X132.759 Y125.866 E.00151
G1 X132.754 Y125.716 E.00022
G1 X133.766 Y125.716 E.00151
G1 X133.761 Y125.566 E.00022
G1 X132.75 Y125.566 E.00151
G1 X132.745 Y125.416 E.00022
G1 X133.756 Y125.416 E.00151
G1 X133.751 Y125.266 E.00022
G1 X132.74 Y125.266 E.00151
G1 X132.736 Y125.116 E.00022
G1 X133.747 Y125.116 E.00151
G1 X133.742 Y124.967 E.00022
G1 X132.731 Y124.967 E.00151
G3 X132.733 Y124.817 I1.268 J-.059 E.00022
G1 X133.744 Y124.817 E.00151
G1 X133.748 Y124.667 E.00022
G1 X132.737 Y124.667 E.00151
G1 X132.741 Y124.517 E.00022
G1 X133.752 Y124.517 E.00151
G1 X133.756 Y124.367 E.00022
G1 X132.745 Y124.367 E.00151
G1 X132.749 Y124.217 E.00022
G1 X133.76 Y124.217 E.00151
G1 X133.765 Y124.067 E.00022
G1 X132.754 Y124.067 E.00151
G1 X132.758 Y123.917 E.00022
G1 X133.769 Y123.917 E.00151
G3 X133.776 Y123.767 I1.266 J-.014 E.00022
G1 X132.762 Y123.767 E.00152
G1 X132.775 Y123.617 E.00023
G1 X133.789 Y123.617 E.00152
G1 X133.802 Y123.467 E.00023
G1 X132.788 Y123.467 E.00152
G1 X132.801 Y123.317 E.00023
G1 X133.815 Y123.317 E.00152
G1 X133.828 Y123.167 E.00023
G1 X132.814 Y123.167 E.00152
G1 X132.827 Y123.017 E.00023
G1 X133.841 Y123.017 E.00152
G1 X133.854 Y122.867 E.00023
G1 X132.84 Y122.867 E.00152
G1 X132.853 Y122.717 E.00023
G1 X133.868 Y122.717 E.00152
G1 X133.89 Y122.567 E.00023
G1 X132.868 Y122.567 E.00153
G1 X132.89 Y122.417 E.00023
G1 X133.912 Y122.417 E.00153
G1 X133.934 Y122.267 E.00023
G1 X132.912 Y122.267 E.00153
G1 X132.934 Y122.117 E.00023
G1 X133.956 Y122.117 E.00153
G1 X133.978 Y121.967 E.00023
G1 X132.956 Y121.967 E.00153
G1 X132.979 Y121.817 E.00023
G1 X134 Y121.817 E.00153
G1 X134.022 Y121.667 E.00023
G1 X133.001 Y121.667 E.00153
G1 X133.023 Y121.517 E.00023
G1 X134.05 Y121.517 E.00154
G1 X134.082 Y121.367 E.00023
G1 X133.049 Y121.367 E.00155
G1 X133.081 Y121.217 E.00023
G1 X134.113 Y121.217 E.00155
G1 X134.144 Y121.067 E.00023
G1 X133.112 Y121.067 E.00155
G1 X133.143 Y120.917 E.00023
G1 X134.176 Y120.917 E.00155
G1 X134.207 Y120.767 E.00023
G1 X133.174 Y120.767 E.00155
G1 X133.206 Y120.617 E.00023
G1 X134.238 Y120.617 E.00155
G3 X134.273 Y120.467 I1.283 J.223 E.00023
G1 X133.237 Y120.467 E.00155
G1 X133.268 Y120.317 E.00023
G1 X134.314 Y120.317 E.00157
G1 X134.355 Y120.167 E.00023
G1 X133.308 Y120.167 E.00157
G1 X133.348 Y120.017 E.00023
G1 X134.396 Y120.017 E.00157
G1 X134.436 Y119.867 E.00023
G1 X133.389 Y119.867 E.00157
G1 X133.43 Y119.717 E.00023
G1 X134.477 Y119.717 E.00157
G1 X134.518 Y119.567 E.00023
G1 X133.47 Y119.567 E.00157
G1 X133.511 Y119.417 E.00023
G1 X134.561 Y119.417 E.00157
G1 X134.612 Y119.267 E.00024
G1 X133.552 Y119.267 E.00159
G3 X133.596 Y119.117 I1.286 J.296 E.00023
G1 X134.662 Y119.117 E.0016
G1 X134.712 Y118.967 E.00024
G1 X133.646 Y118.967 E.0016
G1 X133.697 Y118.817 E.00024
G1 X134.763 Y118.817 E.0016
G1 X134.813 Y118.667 E.00024
G1 X133.747 Y118.667 E.0016
G1 X133.797 Y118.517 E.00024
G1 X134.864 Y118.517 E.0016
G3 X134.917 Y118.367 I1.288 J.374 E.00024
G1 X133.848 Y118.367 E.0016
G1 X133.898 Y118.217 E.00024
G1 X134.978 Y118.217 E.00162
G1 X135.038 Y118.067 E.00024
G1 X133.949 Y118.067 E.00163
G1 X134.009 Y117.917 E.00024
G1 X135.099 Y117.917 E.00163
G1 X135.159 Y117.767 E.00024
G1 X134.069 Y117.767 E.00163
G1 X134.13 Y117.617 E.00024
G1 X135.22 Y117.617 E.00163
G1 X135.28 Y117.467 E.00024
G1 X134.19 Y117.467 E.00163
G1 X134.251 Y117.317 E.00024
G1 X135.345 Y117.317 E.00164
G1 X135.416 Y117.167 E.00025
G1 X134.311 Y117.167 E.00165
G1 X134.372 Y117.017 E.00024
G1 X135.487 Y117.017 E.00167
G1 X135.559 Y116.867 E.00025
G1 X134.44 Y116.867 E.00167
G1 X134.511 Y116.717 E.00025
G1 X135.63 Y116.717 E.00167
G1 X135.701 Y116.567 E.00025
G1 X134.582 Y116.567 E.00167
G1 X134.653 Y116.417 E.00025
G1 X135.772 Y116.417 E.00167
G3 X135.852 Y116.267 I1.307 J.599 E.00025
G1 X134.725 Y116.267 E.00169
G1 X134.796 Y116.117 E.00025
G1 X135.934 Y116.117 E.0017
G1 X136.016 Y115.967 E.00026
G1 X134.867 Y115.967 E.00172
G3 X134.946 Y115.817 I1.304 J.591 E.00025
G1 X136.099 Y115.817 E.00173
G1 X136.181 Y115.667 E.00026
G1 X135.028 Y115.667 E.00173
G1 X135.11 Y115.517 E.00026
G1 X136.263 Y115.517 E.00173
G3 X136.349 Y115.367 I1.308 J.648 E.00026
G1 X135.193 Y115.367 E.00173
G1 X135.275 Y115.217 E.00026
G1 X136.443 Y115.217 E.00175
G1 X136.538 Y115.067 E.00027
G1 X135.357 Y115.067 E.00177
G1 X135.44 Y114.917 E.00026
G1 X136.632 Y114.917 E.00178
G1 X136.726 Y114.767 E.00027
G1 X135.532 Y114.767 E.00179
G1 X135.627 Y114.617 E.00027
G1 X136.82 Y114.617 E.00179
G1 X136.915 Y114.467 E.00027
G1 X135.721 Y114.467 E.00179
G1 X135.815 Y114.317 E.00027
G1 X137.022 Y114.317 E.00181
G1 X137.13 Y114.167 E.00028
G1 X135.91 Y114.167 E.00183
G1 X136.004 Y114.017 E.00027
G1 X137.237 Y114.017 E.00185
G1 X137.344 Y113.867 E.00028
G1 X136.102 Y113.867 E.00186
G1 X136.209 Y113.717 E.00028
G1 X137.451 Y113.717 E.00186
G1 X137.559 Y113.567 E.00028
G1 X136.316 Y113.567 E.00186
G1 X136.423 Y113.417 E.00028
G1 X137.68 Y113.417 E.00188
G1 X137.801 Y113.267 E.00029
G1 X136.53 Y113.267 E.0019
G1 X136.638 Y113.117 E.00028
G1 X137.922 Y113.117 E.00192
G1 X138.044 Y112.967 E.00029
G1 X136.745 Y112.967 E.00194
G3 X136.865 Y112.817 I1.318 J.934 E.00029
G1 X138.165 Y112.817 E.00194
G3 X138.29 Y112.667 I1.326 J.981 E.00029
G1 X136.986 Y112.667 E.00195
G1 X137.108 Y112.517 E.00029
G1 X138.427 Y112.517 E.00197
G1 X138.564 Y112.367 E.0003
G1 X137.229 Y112.367 E.002
G1 X137.35 Y112.217 E.00029
G1 X138.7 Y112.217 E.00202
G1 X138.837 Y112.067 E.0003
G1 X137.471 Y112.067 E.00204
G3 X137.606 Y111.917 I1.332 J1.062 E.0003
G1 X138.974 Y111.917 E.00205
G3 X139.124 Y111.767 I1.338 J1.193 E.00032
G1 X137.743 Y111.767 E.00207
G1 X137.88 Y111.617 E.0003
G1 X139.278 Y111.617 E.00209
G1 X139.432 Y111.467 E.00032
G1 X138.016 Y111.467 E.00212
G1 X138.153 Y111.317 E.0003
G1 X139.586 Y111.317 E.00214
G1 X139.74 Y111.167 E.00032
G1 X138.292 Y111.167 E.00217
G1 X138.446 Y111.017 E.00032
G1 X139.907 Y111.017 E.00219
G1 X140.08 Y110.867 E.00034
G1 X138.6 Y110.867 E.00222
G1 X138.754 Y110.717 E.00032
G1 X140.253 Y110.717 E.00224
G1 X140.427 Y110.567 E.00034
G1 X138.908 Y110.567 E.00227
G1 X139.061 Y110.417 E.00032
G1 X140.6 Y110.417 E.0023
G3 X140.792 Y110.267 I1.359 J1.539 E.00036
G1 X139.229 Y110.267 E.00234
G1 X139.402 Y110.117 E.00034
G1 X140.987 Y110.117 E.00237
G1 X141.183 Y109.968 E.00037
G1 X139.575 Y109.968 E.00241
G1 X139.749 Y109.818 E.00034
G1 X141.379 Y109.818 E.00244
G3 X141.583 Y109.668 I1.365 J1.643 E.00038
G1 X139.922 Y109.668 E.00249
G3 X140.109 Y109.518 I1.356 J1.496 E.00036
G1 X141.805 Y109.518 E.00254
G1 X142.026 Y109.368 E.0004
G1 X140.304 Y109.368 E.00258
G1 X140.5 Y109.218 E.00037
G1 X142.248 Y109.218 E.00262
G3 X142.475 Y109.068 I1.376 J1.838 E.00041
G1 X140.696 Y109.068 E.00266
G1 X140.892 Y108.918 E.00037
G1 X142.728 Y108.918 E.00275
G1 X142.981 Y108.768 E.00044
G1 X141.109 Y108.768 E.0028
G1 X141.331 Y108.618 E.0004
G1 X143.234 Y108.618 E.00285
G3 X143.503 Y108.468 I1.399 J2.188 E.00046
G1 X141.553 Y108.468 E.00292
G1 X141.775 Y108.318 E.0004
G1 X143.793 Y108.318 E.00302
G1 X144.084 Y108.168 E.00049
G1 X142.012 Y108.168 E.0031
G1 X142.265 Y108.018 E.00044
G1 X144.376 Y108.018 E.00316
G1 X144.715 Y107.868 E.00055
G1 X142.517 Y107.868 E.00329
G1 X142.77 Y107.718 E.00044
G1 X145.054 Y107.718 E.00342
G3 X145.394 Y107.568 I1.434 J2.796 E.00056
G1 X143.043 Y107.568 E.00352
G1 X143.334 Y107.418 E.00049
G1 X145.796 Y107.418 E.00369
G1 X146.197 Y107.268 E.00064
G1 X143.624 Y107.268 E.00385
G1 X143.915 Y107.118 E.00049
G1 X146.867 Y107.118 E.00442
G1 X147.355 Y106.968 F30000
G1 F3600
G1 X144.251 Y106.968 E.00465
G1 X144.59 Y106.818 E.00055
G1 X147.933 Y106.818 E.005
G1 X148.548 Y106.668 F30000
G1 F3600
G1 X144.929 Y106.668 E.00542
G3 X145.317 Y106.518 I1.458 J3.196 E.00062
G1 X149.366 Y106.518 E.00606
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X147.366 Y106.518 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X150.459 Y106.368 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X145.526 Y106.368 E.00738
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X147.526 Y106.368 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X149.849 Y113.638 Z3.32 F30000
G1 X159.364 Y143.415 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X154.431 Y143.415 E.00738
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X156.431 Y143.415 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X155.523 Y143.265 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X159.572 Y143.265 E.00606
G2 X159.96 Y143.115 I-1.07 J-3.346 E.00062
G1 X156.341 Y143.115 E.00542
G1 X156.957 Y142.965 F30000
G1 F3600
G1 X160.299 Y142.965 E.005
G1 X160.638 Y142.815 E.00055
G1 X157.535 Y142.815 E.00464
G1 X158.023 Y142.665 F30000
G1 F3600
G1 X160.974 Y142.665 E.00442
G1 X161.265 Y142.515 E.00049
G1 X158.692 Y142.515 E.00385
G1 X159.093 Y142.365 E.00064
G1 X161.556 Y142.365 E.00369
G1 X161.847 Y142.215 E.00049
G1 X159.495 Y142.215 E.00352
G2 X159.835 Y142.065 I-1.093 J-2.944 E.00056
G1 X162.119 Y142.065 E.00342
G1 X162.372 Y141.915 E.00044
G1 X160.174 Y141.915 E.00329
G1 X160.513 Y141.765 E.00055
G1 X162.625 Y141.765 E.00316
G1 X162.877 Y141.615 E.00044
G1 X160.805 Y141.615 E.0031
G1 X161.096 Y141.465 E.00049
G1 X163.114 Y141.465 E.00302
G1 X163.336 Y141.315 E.0004
G1 X161.387 Y141.315 E.00292
G2 X161.655 Y141.165 I-1.13 J-2.337 E.00046
G1 X163.558 Y141.165 E.00285
G1 X163.78 Y141.015 E.0004
G1 X161.908 Y141.015 E.0028
G1 X162.161 Y140.865 E.00044
G1 X163.998 Y140.865 E.00275
G1 X164.193 Y140.715 E.00037
G1 X162.414 Y140.715 E.00266
G2 X162.641 Y140.565 I-1.149 J-1.988 E.00041
G1 X164.389 Y140.565 E.00262
G1 X164.585 Y140.415 E.00037
G1 X162.863 Y140.415 E.00258
G1 X163.085 Y140.265 E.0004
G1 X164.78 Y140.265 E.00254
G2 X164.967 Y140.115 I-1.171 J-1.647 E.00036
G1 X163.306 Y140.115 E.00249
G2 X163.51 Y139.966 I-1.161 J-1.793 E.00038
G1 X165.14 Y139.966 E.00244
G1 X165.314 Y139.816 E.00034
G1 X163.706 Y139.816 E.00241
G1 X163.902 Y139.666 E.00037
G1 X165.487 Y139.666 E.00237
G1 X165.66 Y139.516 E.00034
G1 X164.098 Y139.516 E.00234
G2 X164.289 Y139.366 I-1.17 J-1.692 E.00036
G1 X165.828 Y139.366 E.0023
G1 X165.982 Y139.216 E.00032
G1 X164.462 Y139.216 E.00227
G1 X164.636 Y139.066 E.00034
G1 X166.136 Y139.066 E.00224
G1 X166.289 Y138.916 E.00032
G1 X164.809 Y138.916 E.00222
G1 X164.983 Y138.766 E.00034
G1 X166.443 Y138.766 E.00219
G1 X166.597 Y138.616 E.00032
G1 X165.149 Y138.616 E.00217
G1 X165.303 Y138.466 E.00032
G1 X166.736 Y138.466 E.00214
G1 X166.873 Y138.316 E.0003
G1 X165.457 Y138.316 E.00212
G1 X165.611 Y138.166 E.00032
G1 X167.009 Y138.166 E.00209
G1 X167.146 Y138.016 E.0003
G1 X165.765 Y138.016 E.00207
G2 X165.915 Y137.866 I-1.187 J-1.342 E.00032
G1 X167.283 Y137.866 E.00205
G2 X167.418 Y137.716 I-1.194 J-1.209 E.0003
G1 X166.052 Y137.716 E.00204
G1 X166.189 Y137.566 E.0003
G1 X167.539 Y137.566 E.00202
G1 X167.66 Y137.416 E.00029
G1 X166.326 Y137.416 E.002
G1 X166.462 Y137.266 E.0003
G1 X167.781 Y137.266 E.00197
G1 X167.903 Y137.116 E.00029
G1 X166.599 Y137.116 E.00195
G2 X166.724 Y136.966 I-1.2 J-1.131 E.00029
G1 X168.024 Y136.966 E.00194
G2 X168.144 Y136.816 I-1.204 J-1.09 E.00029
G1 X166.846 Y136.816 E.00194
G1 X166.967 Y136.666 E.00029
G1 X168.251 Y136.666 E.00192
G1 X168.359 Y136.516 E.00028
G1 X167.088 Y136.516 E.0019
G1 X167.209 Y136.366 E.00029
G1 X168.466 Y136.366 E.00188
G1 X168.573 Y136.216 E.00028
G1 X167.331 Y136.216 E.00186
G1 X167.438 Y136.066 E.00028
G1 X168.68 Y136.066 E.00186
G1 X168.787 Y135.916 E.00028
G1 X167.545 Y135.916 E.00186
G1 X167.652 Y135.766 E.00028
G1 X168.885 Y135.766 E.00185
G1 X168.98 Y135.616 E.00027
G1 X167.76 Y135.616 E.00183
G1 X167.867 Y135.466 E.00028
G1 X169.074 Y135.466 E.00181
G1 X169.168 Y135.316 E.00027
G1 X167.974 Y135.316 E.00179
G1 X168.069 Y135.166 E.00027
G1 X169.262 Y135.166 E.00179
G1 X169.357 Y135.016 E.00027
G1 X168.163 Y135.016 E.00179
G1 X168.257 Y134.866 E.00027
G1 X169.449 Y134.866 E.00178
G1 X169.532 Y134.716 E.00026
G1 X168.352 Y134.716 E.00177
G1 X168.446 Y134.566 E.00027
G1 X169.614 Y134.566 E.00175
G1 X169.696 Y134.416 E.00026
G1 X168.54 Y134.416 E.00173
G2 X168.626 Y134.266 I-1.22 J-.797 E.00026
G1 X169.779 Y134.266 E.00173
G1 X169.861 Y134.116 E.00026
G1 X168.708 Y134.116 E.00173
G1 X168.791 Y133.966 E.00026
G1 X169.943 Y133.966 E.00173
G2 X170.022 Y133.816 I-1.227 J-.741 E.00025
G1 X168.873 Y133.816 E.00172
G1 X168.955 Y133.666 E.00026
G1 X170.093 Y133.666 E.0017
G1 X170.165 Y133.516 E.00025
G1 X169.038 Y133.516 E.00169
G2 X169.117 Y133.366 I-1.223 J-.746 E.00025
G1 X170.236 Y133.366 E.00167
G1 X170.307 Y133.216 E.00025
G1 X169.188 Y133.216 E.00167
G1 X169.259 Y133.066 E.00025
G1 X170.378 Y133.066 E.00167
G1 X170.449 Y132.916 E.00025
G1 X169.331 Y132.916 E.00167
G1 X169.402 Y132.766 E.00025
G1 X170.517 Y132.766 E.00167
G1 X170.578 Y132.616 E.00024
G1 X169.473 Y132.616 E.00165
G1 X169.544 Y132.466 E.00025
G1 X170.638 Y132.466 E.00164
G1 X170.699 Y132.316 E.00024
G1 X169.609 Y132.316 E.00163
G1 X169.67 Y132.166 E.00024
G1 X170.759 Y132.166 E.00163
G1 X170.82 Y132.016 E.00024
G1 X169.73 Y132.016 E.00163
G1 X169.791 Y131.866 E.00024
G1 X170.88 Y131.866 E.00163
G1 X170.94 Y131.716 E.00024
G1 X169.851 Y131.716 E.00163
G1 X169.912 Y131.566 E.00024
G1 X170.991 Y131.566 E.00162
G1 X171.041 Y131.416 E.00024
G1 X169.972 Y131.416 E.0016
G2 X170.025 Y131.266 I-1.238 J-.525 E.00024
G1 X171.092 Y131.266 E.0016
G1 X171.142 Y131.116 E.00024
G1 X170.076 Y131.116 E.0016
G1 X170.126 Y130.966 E.00024
G1 X171.192 Y130.966 E.0016
G1 X171.243 Y130.816 E.00024
G1 X170.177 Y130.816 E.0016
G1 X170.227 Y130.666 E.00024
G1 X171.293 Y130.666 E.0016
G2 X171.337 Y130.516 I-1.242 J-.446 E.00023
G1 X170.277 Y130.516 E.00159
G1 X170.328 Y130.366 E.00024
G1 X171.378 Y130.366 E.00157
G1 X171.419 Y130.216 E.00023
G1 X170.371 Y130.216 E.00157
G1 X170.412 Y130.066 E.00023
G1 X171.459 Y130.066 E.00157
G1 X171.5 Y129.916 E.00023
G1 X170.453 Y129.916 E.00157
G1 X170.494 Y129.766 E.00023
G1 X171.541 Y129.766 E.00157
G1 X171.581 Y129.616 E.00023
G1 X170.534 Y129.616 E.00157
G1 X170.575 Y129.466 E.00023
G1 X171.621 Y129.466 E.00157
G1 X171.652 Y129.316 E.00023
G1 X170.616 Y129.316 E.00155
G2 X170.651 Y129.166 I-1.245 J-.373 E.00023
G1 X171.683 Y129.166 E.00155
G1 X171.715 Y129.016 E.00023
G1 X170.682 Y129.016 E.00155
G1 X170.714 Y128.866 E.00023
G1 X171.746 Y128.866 E.00155
G1 X171.777 Y128.716 E.00023
G1 X170.745 Y128.716 E.00155
G1 X170.776 Y128.566 E.00023
G1 X171.808 Y128.566 E.00155
G1 X171.84 Y128.416 E.00023
G1 X170.807 Y128.416 E.00155
G1 X170.839 Y128.266 E.00023
G1 X171.866 Y128.266 E.00154
G1 X171.888 Y128.116 E.00023
G1 X170.867 Y128.116 E.00153
G1 X170.889 Y127.966 E.00023
G1 X171.911 Y127.966 E.00153
G1 X171.933 Y127.816 E.00023
G1 X170.911 Y127.816 E.00153
G1 X170.933 Y127.666 E.00023
G1 X171.955 Y127.666 E.00153
G1 X171.977 Y127.516 E.00023
G1 X170.955 Y127.516 E.00153
G1 X170.977 Y127.366 E.00023
G1 X171.999 Y127.366 E.00153
G1 X172.021 Y127.216 E.00023
G1 X171 Y127.216 E.00153
G1 X171.021 Y127.066 E.00023
G1 X172.036 Y127.066 E.00152
G1 X172.049 Y126.916 E.00023
G1 X171.035 Y126.916 E.00152
G1 X171.048 Y126.766 E.00023
G1 X172.062 Y126.766 E.00152
G1 X172.075 Y126.616 E.00023
G1 X171.061 Y126.616 E.00152
G1 X171.074 Y126.466 E.00023
G1 X172.088 Y126.466 E.00152
G1 X172.101 Y126.316 E.00023
G1 X171.087 Y126.316 E.00152
G1 X171.1 Y126.166 E.00023
G1 X172.114 Y126.166 E.00152
G1 X172.127 Y126.016 E.00023
G1 X171.113 Y126.016 E.00152
G2 X171.12 Y125.866 I-1.259 J-.136 E.00022
G1 X172.131 Y125.866 E.00151
G1 X172.136 Y125.716 E.00022
G1 X171.125 Y125.716 E.00151
G1 X171.129 Y125.566 E.00022
G1 X172.14 Y125.566 E.00151
G1 X172.144 Y125.416 E.00022
G1 X171.133 Y125.416 E.00151
G1 X171.137 Y125.266 E.00022
G1 X172.148 Y125.266 E.00151
G1 X172.152 Y125.116 E.00022
G1 X171.141 Y125.116 E.00151
G1 X171.145 Y124.967 E.00022
G1 X172.156 Y124.967 E.00151
G2 X172.158 Y124.817 I-1.261 J-.091 E.00022
G1 X171.147 Y124.817 E.00151
G1 X171.142 Y124.667 E.00022
G1 X172.154 Y124.667 E.00151
G1 X172.149 Y124.517 E.00022
G1 X171.138 Y124.517 E.00151
G1 X171.133 Y124.367 E.00022
G1 X172.144 Y124.367 E.00151
G1 X172.139 Y124.217 E.00022
G1 X171.128 Y124.217 E.00151
G1 X171.123 Y124.067 E.00022
G1 X172.135 Y124.067 E.00151
G1 X172.13 Y123.917 E.00022
G1 X171.119 Y123.917 E.00151
G1 X171.114 Y123.767 E.00022
G1 X172.125 Y123.767 E.00151
G2 X172.116 Y123.617 I-1.269 J0 E.00023
G1 X171.101 Y123.617 E.00152
G1 X171.088 Y123.467 E.00023
G1 X172.103 Y123.467 E.00152
G1 X172.089 Y123.317 E.00023
G1 X171.074 Y123.317 E.00152
G1 X171.06 Y123.167 E.00023
G1 X172.075 Y123.167 E.00152
G1 X172.062 Y123.017 E.00023
G1 X171.047 Y123.017 E.00152
G1 X171.033 Y122.867 E.00023
G1 X172.048 Y122.867 E.00152
G1 X172.034 Y122.717 E.00023
G1 X171.02 Y122.717 E.00152
G2 X171.001 Y122.567 I-1.271 J.079 E.00023
G1 X172.021 Y122.567 E.00153
G2 X172.001 Y122.417 I-1.274 J.094 E.00023
G1 X170.978 Y122.417 E.00153
G1 X170.956 Y122.267 E.00023
G1 X171.978 Y122.267 E.00153
G1 X171.955 Y122.117 E.00023
G1 X170.933 Y122.117 E.00153
G1 X170.91 Y121.967 E.00023
G1 X171.933 Y121.967 E.00153
G1 X171.91 Y121.817 E.00023
G1 X170.888 Y121.817 E.00153
G1 X170.865 Y121.667 E.00023
G1 X171.887 Y121.667 E.00153
G1 X171.865 Y121.517 E.00023
G1 X170.84 Y121.517 E.00153
G1 X170.809 Y121.367 E.00023
G1 X171.842 Y121.367 E.00155
G1 X171.81 Y121.217 E.00023
G1 X170.777 Y121.217 E.00155
G1 X170.745 Y121.067 E.00023
G1 X171.778 Y121.067 E.00155
G1 X171.746 Y120.917 E.00023
G1 X170.713 Y120.917 E.00155
G1 X170.681 Y120.767 E.00023
G1 X171.714 Y120.767 E.00155
G1 X171.682 Y120.617 E.00023
G1 X170.649 Y120.617 E.00155
M73 P93 R1
G1 X170.617 Y120.467 E.00023
G1 X171.651 Y120.467 E.00155
G1 X171.619 Y120.317 E.00023
G1 X170.576 Y120.317 E.00156
G1 X170.535 Y120.167 E.00023
G1 X171.583 Y120.167 E.00157
G1 X171.542 Y120.017 E.00023
G1 X170.494 Y120.017 E.00157
G1 X170.452 Y119.867 E.00023
G1 X171.501 Y119.867 E.00157
G1 X171.459 Y119.717 E.00023
G1 X170.411 Y119.717 E.00157
G1 X170.37 Y119.567 E.00023
G1 X171.418 Y119.567 E.00157
G1 X171.377 Y119.417 E.00023
G1 X170.329 Y119.417 E.00157
G2 X170.279 Y119.267 I-1.291 J.344 E.00024
G1 X171.336 Y119.267 E.00158
G1 X171.294 Y119.117 E.00023
G1 X170.228 Y119.117 E.0016
G1 X170.177 Y118.967 E.00024
G1 X171.244 Y118.967 E.0016
G1 X171.193 Y118.817 E.00024
G1 X170.126 Y118.817 E.0016
G1 X170.075 Y118.667 E.00024
G1 X171.142 Y118.667 E.0016
G1 X171.091 Y118.517 E.00024
G1 X170.024 Y118.517 E.0016
G1 X169.973 Y118.367 E.00024
G1 X171.04 Y118.367 E.0016
G1 X170.989 Y118.217 E.00024
G1 X169.913 Y118.217 E.00161
G1 X169.852 Y118.067 E.00024
G1 X170.938 Y118.067 E.00163
G2 X170.882 Y117.917 I-1.292 J.398 E.00024
G1 X169.791 Y117.917 E.00163
G1 X169.73 Y117.767 E.00024
G1 X170.821 Y117.767 E.00163
G1 X170.76 Y117.617 E.00024
G1 X169.668 Y117.617 E.00163
G1 X169.607 Y117.467 E.00024
G1 X170.699 Y117.467 E.00163
G1 X170.638 Y117.317 E.00024
G1 X169.546 Y117.317 E.00163
G1 X169.474 Y117.167 E.00025
G1 X170.576 Y117.167 E.00165
G1 X170.515 Y117.017 E.00024
G1 X169.402 Y117.017 E.00167
G1 X169.331 Y116.867 E.00025
G1 X170.451 Y116.867 E.00168
G1 X170.379 Y116.717 E.00025
G1 X169.259 Y116.717 E.00168
G1 X169.187 Y116.567 E.00025
G1 X170.307 Y116.567 E.00168
G1 X170.236 Y116.417 E.00025
G1 X169.115 Y116.417 E.00168
G2 X169.039 Y116.267 I-1.302 J.564 E.00025
G1 X170.164 Y116.267 E.00168
G1 X170.092 Y116.117 E.00025
G1 X168.956 Y116.117 E.0017
G1 X168.873 Y115.967 E.00026
G1 X170.02 Y115.967 E.00172
G2 X169.946 Y115.817 I-1.302 J.555 E.00025
G1 X168.79 Y115.817 E.00173
G1 X168.707 Y115.667 E.00026
G1 X169.862 Y115.667 E.00173
G1 X169.779 Y115.517 E.00026
G1 X168.624 Y115.517 E.00173
G1 X168.541 Y115.367 E.00026
G1 X169.696 Y115.367 E.00173
G1 X169.613 Y115.217 E.00026
G1 X168.447 Y115.217 E.00174
G1 X168.352 Y115.067 E.00027
G1 X169.53 Y115.067 E.00176
G1 X169.447 Y114.917 E.00026
G1 X168.257 Y114.917 E.00178
G1 X168.162 Y114.767 E.00027
G1 X169.359 Y114.767 E.00179
G1 X169.264 Y114.617 E.00027
G1 X168.067 Y114.617 E.00179
G1 X167.972 Y114.467 E.00027
G1 X169.169 Y114.467 E.00179
G1 X169.074 Y114.317 E.00027
G1 X167.869 Y114.317 E.0018
G1 X167.761 Y114.167 E.00028
G1 X168.978 Y114.167 E.00182
G1 X168.883 Y114.017 E.00027
G1 X167.652 Y114.017 E.00184
G1 X167.544 Y113.867 E.00028
G1 X168.788 Y113.867 E.00186
G2 X168.682 Y113.717 I-1.317 J.821 E.00028
G1 X167.436 Y113.717 E.00186
G1 X167.328 Y113.567 E.00028
G1 X168.574 Y113.567 E.00186
G1 X168.466 Y113.417 E.00028
G1 X167.211 Y113.417 E.00188
G1 X167.089 Y113.267 E.00029
G1 X168.358 Y113.267 E.0019
G1 X168.25 Y113.117 E.00028
G1 X166.967 Y113.117 E.00192
G1 X166.845 Y112.967 E.00029
G1 X168.142 Y112.967 E.00194
G2 X168.026 Y112.817 I-1.32 J.899 E.00028
G1 X166.722 Y112.817 E.00195
G1 X166.6 Y112.667 E.00029
G1 X167.904 Y112.667 E.00195
G1 X167.782 Y112.517 E.00029
G1 X166.464 Y112.517 E.00197
G1 X166.326 Y112.367 E.0003
G1 X167.659 Y112.367 E.002
G1 X167.537 Y112.217 E.00029
G1 X166.188 Y112.217 E.00202
G1 X166.051 Y112.067 E.0003
G1 X167.415 Y112.067 E.00204
G2 X167.285 Y111.917 I-1.329 J1.021 E.0003
G1 X165.913 Y111.917 E.00205
G2 X165.767 Y111.767 I-1.336 J1.154 E.00031
G1 X167.147 Y111.767 E.00207
G1 X167.01 Y111.617 E.0003
G1 X165.612 Y111.617 E.00209
G1 X165.457 Y111.467 E.00032
G1 X166.872 Y111.467 E.00212
G1 X166.734 Y111.317 E.0003
G1 X165.302 Y111.317 E.00214
G1 X165.147 Y111.167 E.00032
G1 X166.596 Y111.167 E.00217
G2 X166.445 Y111.017 I-1.339 J1.197 E.00032
G1 X164.985 Y111.017 E.00219
G1 X164.81 Y110.867 E.00034
G1 X166.29 Y110.867 E.00222
G1 X166.135 Y110.717 E.00032
G1 X164.636 Y110.717 E.00224
G1 X164.461 Y110.567 E.00034
G1 X165.98 Y110.567 E.00227
G1 X165.825 Y110.417 E.00032
G1 X164.286 Y110.417 E.0023
G2 X164.1 Y110.267 I-1.357 J1.496 E.00036
G1 X165.663 Y110.267 E.00234
G1 X165.488 Y110.117 E.00034
G1 X163.903 Y110.117 E.00237
G1 X163.705 Y109.968 E.00037
G1 X165.314 Y109.968 E.00241
G1 X165.139 Y109.818 E.00034
G1 X163.508 Y109.818 E.00244
G2 X163.31 Y109.668 I-1.359 J1.592 E.00037
G1 X164.964 Y109.668 E.00248
G2 X164.783 Y109.518 I-1.354 J1.45 E.00035
M73 P94 R1
G1 X163.086 Y109.518 E.00254
G1 X162.862 Y109.368 E.0004
G1 X164.586 Y109.368 E.00258
G1 X164.389 Y109.218 E.00037
G1 X162.639 Y109.218 E.00262
G1 X162.415 Y109.068 E.0004
G1 X164.192 Y109.068 E.00266
G1 X163.994 Y108.918 E.00037
G1 X162.162 Y108.918 E.00274
G1 X161.907 Y108.768 E.00044
G1 X163.782 Y108.768 E.00281
G1 X163.559 Y108.618 E.0004
G1 X161.652 Y108.618 E.00285
G2 X161.39 Y108.468 I-1.394 J2.132 E.00045
G1 X163.335 Y108.468 E.00291
G1 X163.111 Y108.318 E.0004
G1 X161.097 Y108.318 E.00302
G1 X160.803 Y108.168 E.00049
G1 X162.881 Y108.168 E.00311
G1 X162.626 Y108.018 E.00044
G1 X160.51 Y108.018 E.00317
G2 X160.176 Y107.868 I-1.431 J2.735 E.00055
G1 X162.371 Y107.868 E.00328
G1 X162.116 Y107.718 E.00044
G1 X159.834 Y107.718 E.00342
G1 X159.492 Y107.568 E.00056
G1 X161.85 Y107.568 E.00353
G1 X161.557 Y107.418 E.00049
G1 X159.095 Y107.418 E.00368
G1 X158.689 Y107.268 E.00065
G1 X161.263 Y107.268 E.00385
G1 X160.969 Y107.118 E.00049
G1 X158.024 Y107.118 E.00441
G1 X157.53 Y106.968 F30000
G1 F3600
G1 X160.64 Y106.968 E.00466
G1 X160.298 Y106.818 E.00056
G1 X156.959 Y106.818 E.005
G1 X156.333 Y106.668 F30000
G1 F3600
G1 X159.956 Y106.668 E.00542
G2 X159.575 Y106.518 I-1.454 J3.133 E.00061
G1 X155.518 Y106.518 E.00607
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X157.518 Y106.518 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X154.423 Y106.368 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X159.169 Y106.368 E.0071
G1 X158.763 Y106.218 E.00065
G1 X145.927 Y106.218 E.01921
G1 X146.383 Y106.068 F30000
G1 F3600
G1 X158.51 Y106.068 E.01815
G1 X158.015 Y105.918 F30000
G1 F3600
G1 X146.871 Y105.918 E.01668
G1 X147.402 Y105.768 F30000
G1 F3600
G1 X157.493 Y105.768 E.0151
G1 X156.867 Y105.618 F30000
G1 F3600
G1 X148.018 Y105.618 E.01325
G1 X148.736 Y105.468 F30000
G1 F3600
G1 X156.158 Y105.468 E.01111
G1 X155.306 Y105.318 F30000
G1 F3600
G1 X149.599 Y105.318 E.00854
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X151.599 Y105.318 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X154.01 Y112.56 Z3.32 F30000
G1 X158.578 Y126.283 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X153.074 Y124.075 E.15212
G1 X153.059 Y115.882 E.2102
G1 X158.558 Y115.871 E.14109
G1 X158.562 Y117.945 E.0532
G1 X158.578 Y126.223 E.21237
M204 S10000
G1 X157.847 Y125.761 F30000
; FEATURE: Top surface
G1 F3600
M204 S2000
G1 X158.364 Y125.244 E.01875
G1 X158.363 Y124.7
G1 X157.458 Y125.605 E.03284
G1 X157.069 Y125.449
G1 X158.362 Y124.156 E.04692
G1 X158.361 Y123.611
G1 X156.679 Y125.293 E.06101
G1 X156.29 Y125.137
G1 X158.36 Y123.067 E.07509
G1 X158.359 Y122.522
G1 X155.901 Y124.98 E.08918
G1 X155.512 Y124.824
G1 X158.358 Y121.978 E.10326
G1 X158.357 Y121.434
G1 X155.122 Y124.668 E.11735
G1 X154.733 Y124.512
G1 X158.356 Y120.889 E.13143
G1 X158.355 Y120.345
G1 X154.344 Y124.356 E.14552
G1 X153.955 Y124.2
G1 X158.354 Y119.801 E.1596
G1 X158.353 Y119.256
G1 X153.565 Y124.043 E.17369
G1 X153.286 Y123.777
G1 X158.352 Y118.712 E.18378
G1 X158.35 Y118.167
G1 X153.285 Y123.233 E.18378
G1 X153.284 Y122.689
G1 X158.349 Y117.623 E.18378
G1 X158.348 Y117.079
G1 X153.283 Y122.144 E.18378
G1 X153.282 Y121.6
G1 X158.347 Y116.534 E.18378
G1 X158.252 Y116.084
G1 X153.281 Y121.056 E.18037
G1 X153.28 Y120.511
G1 X157.706 Y116.085 E.16058
G1 X157.159 Y116.086
G1 X153.279 Y119.967 E.1408
G1 X153.278 Y119.422
G1 X156.613 Y116.087 E.12101
G1 X156.067 Y116.088
G1 X153.277 Y118.878 E.10122
G1 X153.276 Y118.334
G1 X155.52 Y116.089 E.08143
G1 X154.974 Y116.09
G1 X153.274 Y117.789 E.06165
G1 X153.273 Y117.245
G1 X154.427 Y116.091 E.04186
G1 X153.881 Y116.092
G1 X153.272 Y116.701 E.02207
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X153.881 Y116.092 E-.09809
G1 X154.427 Y116.091 E-.06229
G1 X154.008 Y116.511 E-.06762
; WIPE_END
G1 E-.012 F1800
G1 X157.112 Y123.483 Z3.32 F30000
G1 X158.307 Y126.166 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X158.503 Y126.166 E.00029
G1 X158.502 Y126.016 E.00022
G1 X158.115 Y126.016 E.00058
G1 X157.741 Y125.866 E.0006
G1 X158.502 Y125.866 E.00114
G1 X158.502 Y125.716 E.00022
G1 X157.367 Y125.716 E.0017
G1 X156.993 Y125.566 E.0006
G1 X158.502 Y125.566 E.00226
G1 X158.501 Y125.416 E.00022
G1 X156.619 Y125.416 E.00282
G1 X156.245 Y125.266 E.0006
G1 X158.501 Y125.266 E.00338
G1 X158.501 Y125.116 E.00022
G1 X155.871 Y125.116 E.00394
G1 X155.498 Y124.967 E.0006
G1 X158.5 Y124.967 E.00449
G1 X158.5 Y124.817 E.00022
G1 X155.124 Y124.817 E.00505
G1 X154.75 Y124.667 E.0006
G1 X158.5 Y124.667 E.00561
G1 X158.5 Y124.517 E.00022
G1 X154.376 Y124.517 E.00617
G1 X154.002 Y124.367 E.0006
G1 X158.499 Y124.367 E.00673
G1 X158.499 Y124.217 E.00022
G1 X153.628 Y124.217 E.00729
G1 X153.254 Y124.067 E.0006
G1 X158.499 Y124.067 E.00785
G1 X158.499 Y123.917 E.00022
G1 X153.149 Y123.917 E.00801
G1 X153.149 Y123.767 E.00022
G1 X158.498 Y123.767 E.00801
G1 X158.498 Y123.617 E.00022
G1 X153.148 Y123.617 E.00801
G1 X153.148 Y123.467 E.00022
G1 X158.498 Y123.467 E.00801
G1 X158.497 Y123.317 E.00022
G1 X153.148 Y123.317 E.00801
G1 X153.148 Y123.167 E.00022
G1 X158.497 Y123.167 E.00801
G1 X158.497 Y123.017 E.00022
G1 X153.147 Y123.017 E.00801
G1 X153.147 Y122.867 E.00022
G1 X158.497 Y122.867 E.00801
G1 X158.496 Y122.717 E.00022
G1 X153.147 Y122.717 E.00801
G1 X153.146 Y122.567 E.00022
G1 X158.496 Y122.567 E.00801
G1 X158.496 Y122.417 E.00022
G1 X153.146 Y122.417 E.00801
G1 X153.146 Y122.267 E.00022
G1 X158.495 Y122.267 E.00801
G1 X158.495 Y122.117 E.00022
G1 X153.146 Y122.117 E.00801
G1 X153.145 Y121.967 E.00022
G1 X158.495 Y121.967 E.00801
G1 X158.495 Y121.817 E.00022
G1 X153.145 Y121.817 E.00801
G1 X153.145 Y121.667 E.00022
G1 X158.494 Y121.667 E.00801
G1 X158.494 Y121.517 E.00022
G1 X153.144 Y121.517 E.00801
G1 X153.144 Y121.367 E.00022
G1 X158.494 Y121.367 E.00801
G1 X158.493 Y121.217 E.00022
G1 X153.144 Y121.217 E.00801
G1 X153.144 Y121.067 E.00022
G1 X158.493 Y121.067 E.00801
G1 X158.493 Y120.917 E.00022
G1 X153.143 Y120.917 E.00801
G1 X153.143 Y120.767 E.00022
G1 X158.493 Y120.767 E.00801
G1 X158.492 Y120.617 E.00022
G1 X153.143 Y120.617 E.00801
G1 X153.142 Y120.467 E.00022
G1 X158.492 Y120.467 E.00801
G1 X158.492 Y120.317 E.00022
G1 X153.142 Y120.317 E.00801
G1 X153.142 Y120.167 E.00022
G1 X158.491 Y120.167 E.00801
G1 X158.491 Y120.017 E.00022
G1 X153.142 Y120.017 E.00801
G1 X153.141 Y119.867 E.00022
G1 X158.491 Y119.867 E.00801
G1 X158.491 Y119.717 E.00022
G1 X153.141 Y119.717 E.00801
G1 X153.141 Y119.567 E.00022
G1 X158.49 Y119.567 E.00801
G1 X158.49 Y119.417 E.00022
G1 X153.14 Y119.417 E.00801
G1 X153.14 Y119.267 E.00022
G1 X158.49 Y119.267 E.00801
G1 X158.489 Y119.117 E.00022
G1 X153.14 Y119.117 E.00801
G1 X153.14 Y118.967 E.00022
G1 X158.489 Y118.967 E.00801
G1 X158.489 Y118.817 E.00022
G1 X153.139 Y118.817 E.00801
G1 X153.139 Y118.667 E.00022
G1 X158.489 Y118.667 E.00801
G1 X158.488 Y118.517 E.00022
G1 X153.139 Y118.517 E.00801
G1 X153.138 Y118.367 E.00022
G1 X158.488 Y118.367 E.00801
G1 X158.488 Y118.217 E.00022
G1 X153.138 Y118.217 E.00801
G1 X153.138 Y118.067 E.00022
G1 X158.488 Y118.067 E.00801
G1 X158.487 Y117.917 E.00022
G1 X153.138 Y117.917 E.00801
G1 X153.137 Y117.767 E.00022
G1 X158.487 Y117.767 E.00801
G1 X158.487 Y117.617 E.00022
G1 X153.137 Y117.617 E.00801
G1 X153.137 Y117.467 E.00022
G1 X158.486 Y117.467 E.00801
G1 X158.486 Y117.317 E.00022
G1 X153.136 Y117.317 E.00801
G1 X153.136 Y117.167 E.00022
G1 X158.486 Y117.167 E.00801
G1 X158.486 Y117.017 E.00022
G1 X153.136 Y117.017 E.00801
G1 X153.136 Y116.867 E.00022
G1 X158.485 Y116.867 E.00801
G1 X158.485 Y116.717 E.00022
G1 X153.135 Y116.717 E.00801
G1 X153.135 Y116.567 E.00022
G1 X158.485 Y116.567 E.00801
G1 X158.484 Y116.417 E.00022
G1 X153.135 Y116.417 E.00801
G1 X153.134 Y116.267 E.00022
G1 X158.484 Y116.267 E.00801
G1 X158.484 Y116.117 E.00022
G1 X153.134 Y116.117 E.00801
G1 X153.134 Y115.967 E.00022
G1 X158.551 Y115.967 E.00811
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X156.551 Y115.967 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X151.711 Y115.884 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X151.713 Y116.816 E.0239
G1 X151.721 Y120.998 E.1073
G1 X146.226 Y123.226 E.15213
G1 X146.212 Y115.895 E.18809
G1 X151.651 Y115.884 E.13954
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X151.713 Y116.816 E-.10644
G1 X151.715 Y117.882 E-.12156
; WIPE_END
G1 E-.012 F1800
G1 X151.507 Y120.102 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Top surface
G1 F3600
M204 S2000
G1 X150.239 Y121.37 E.04602
G1 X149.322 Y121.742
G1 X151.506 Y119.558 E.07926
G1 X151.505 Y119.013
G1 X148.404 Y122.114 E.1125
G1 X147.487 Y122.486
G1 X151.504 Y118.469 E.14575
G1 X151.503 Y117.924
G1 X146.57 Y122.858 E.17899
G1 X146.436 Y122.446
G1 X151.502 Y117.38 E.18379
G1 X151.501 Y116.836
G1 X146.435 Y121.901 E.18379
G1 X146.434 Y121.357
G1 X151.5 Y116.291 E.18379
G1 X151.149 Y116.097
G1 X146.433 Y120.813 E.17107
G1 X146.432 Y120.268
G1 X150.602 Y116.098 E.15128
G1 X150.056 Y116.099
G1 X146.431 Y119.724 E.13149
G1 X146.43 Y119.179
G1 X149.509 Y116.1 E.1117
G1 X148.963 Y116.101
G1 X146.429 Y118.635 E.09191
G1 X146.429 Y118.09
G1 X148.416 Y116.102 E.07213
G1 X147.87 Y116.104
G1 X146.428 Y117.546 E.05234
G1 X146.427 Y117.002
G1 X147.324 Y116.105 E.03255
G1 X146.777 Y116.106
G1 X146.426 Y116.457 E.01276
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X146.777 Y116.106 E-.05669
G1 X147.324 Y116.105 E-.06229
G1 X146.647 Y116.781 E-.10902
; WIPE_END
G1 E-.012 F1800
G1 X146.233 Y123.017 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X146.544 Y123.017 E.00047
G1 X146.914 Y122.867 E.0006
G1 X146.3 Y122.867 E.00092
G1 X146.3 Y122.717 E.00022
G1 X147.283 Y122.717 E.00147
G1 X147.653 Y122.567 E.0006
G1 X146.299 Y122.567 E.00203
G1 X146.299 Y122.417 E.00022
G1 X148.023 Y122.417 E.00258
G1 X148.393 Y122.267 E.0006
G1 X146.299 Y122.267 E.00313
G1 X146.299 Y122.117 E.00022
G1 X148.763 Y122.117 E.00369
G1 X149.133 Y121.967 E.0006
G1 X146.298 Y121.967 E.00424
G1 X146.298 Y121.817 E.00022
G1 X149.503 Y121.817 E.0048
G1 X149.873 Y121.667 E.0006
G1 X146.298 Y121.667 E.00535
G1 X146.297 Y121.517 E.00022
G1 X150.243 Y121.517 E.00591
G1 X150.613 Y121.367 E.0006
G1 X146.297 Y121.367 E.00646
G1 X146.297 Y121.217 E.00022
G1 X150.983 Y121.217 E.00701
G1 X151.353 Y121.067 E.0006
G1 X146.297 Y121.067 E.00757
G1 X146.296 Y120.917 E.00022
G1 X151.646 Y120.917 E.00801
G1 X151.646 Y120.767 E.00022
G1 X146.296 Y120.767 E.00801
G1 X146.296 Y120.617 E.00022
G1 X151.645 Y120.617 E.00801
G1 X151.645 Y120.467 E.00022
G1 X146.296 Y120.467 E.00801
G1 X146.295 Y120.317 E.00022
G1 X151.645 Y120.317 E.00801
G1 X151.645 Y120.167 E.00022
G1 X146.295 Y120.167 E.00801
G1 X146.295 Y120.017 E.00022
G1 X151.644 Y120.017 E.00801
G1 X151.644 Y119.867 E.00022
G1 X146.295 Y119.867 E.00801
G1 X146.294 Y119.717 E.00022
G1 X151.644 Y119.717 E.00801
G1 X151.643 Y119.567 E.00022
G1 X146.294 Y119.567 E.00801
G1 X146.294 Y119.417 E.00022
G1 X151.643 Y119.417 E.00801
G1 X151.643 Y119.267 E.00022
G1 X146.293 Y119.267 E.00801
G1 X146.293 Y119.117 E.00022
G1 X151.643 Y119.117 E.00801
G1 X151.642 Y118.967 E.00022
G1 X146.293 Y118.967 E.00801
G1 X146.293 Y118.817 E.00022
G1 X151.642 Y118.817 E.00801
G1 X151.642 Y118.667 E.00022
G1 X146.292 Y118.667 E.00801
G1 X146.292 Y118.517 E.00022
G1 X151.641 Y118.517 E.00801
G1 X151.641 Y118.367 E.00022
G1 X146.292 Y118.367 E.00801
G1 X146.292 Y118.217 E.00022
G1 X151.641 Y118.217 E.00801
G1 X151.641 Y118.067 E.00022
G1 X146.291 Y118.067 E.00801
G1 X146.291 Y117.917 E.00022
G1 X151.64 Y117.917 E.00801
G1 X151.64 Y117.767 E.00022
G1 X146.291 Y117.767 E.00801
G1 X146.29 Y117.617 E.00022
G1 X151.64 Y117.617 E.00801
G1 X151.639 Y117.467 E.00022
G1 X146.29 Y117.467 E.00801
G1 X146.29 Y117.317 E.00022
G1 X151.639 Y117.317 E.00801
G1 X151.639 Y117.167 E.00022
G1 X146.29 Y117.167 E.00801
G1 X146.289 Y117.017 E.00022
G1 X151.639 Y117.017 E.00801
G1 X151.638 Y116.867 E.00022
G1 X146.289 Y116.867 E.00801
G1 X146.289 Y116.717 E.00022
G1 X151.638 Y116.717 E.00801
G1 X151.638 Y116.567 E.00022
G1 X146.289 Y116.567 E.00801
G1 X146.288 Y116.417 E.00022
G1 X151.638 Y116.417 E.00801
G1 X151.637 Y116.267 E.00022
G1 X146.288 Y116.267 E.00801
G1 X146.288 Y116.117 E.00022
G1 X151.637 Y116.117 E.00801
G1 X151.637 Y115.967 E.00022
G1 X146.22 Y115.967 E.00811
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X148.22 Y115.967 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X151.724 Y122.497 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X151.728 Y124.469 E.0506
G1 X151.743 Y132.907 E.21649
G1 X146.244 Y132.918 E.14107
G1 X146.228 Y124.725 E.21018
G1 X151.668 Y122.519 E.15059
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X151.728 Y124.469 E-.22238
G1 X151.728 Y124.518 E-.00562
; WIPE_END
G1 E-.012 F1800
G1 X150.97 Y132.113 Z3.32 F30000
G1 X150.911 Y132.697 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Top surface
G1 F3600
M204 S2000
G1 X151.53 Y132.078 E.02244
G1 X151.529 Y131.534
G1 X150.365 Y132.698 E.04223
G1 X149.818 Y132.699
G1 X151.528 Y130.99 E.06201
G1 X151.527 Y130.445
G1 X149.272 Y132.7 E.0818
G1 X148.726 Y132.701
G1 X151.526 Y129.901 E.10159
G1 X151.525 Y129.356
G1 X148.179 Y132.702 E.12138
G1 X147.633 Y132.703
G1 X151.524 Y128.812 E.14117
G1 X151.523 Y128.268
G1 X147.086 Y132.704 E.16095
G1 X146.54 Y132.705
G1 X151.522 Y127.723 E.18074
G1 X151.521 Y127.179
G1 X146.455 Y132.244 E.18377
G1 X146.454 Y131.7
G1 X151.52 Y126.635 E.18378
G1 X151.519 Y126.09
G1 X146.453 Y131.156 E.18378
G1 X146.452 Y130.611
G1 X151.517 Y125.546 E.18378
G1 X151.516 Y125.001
G1 X146.451 Y130.067 E.18378
G1 X146.45 Y129.523
G1 X151.515 Y124.457 E.18378
G1 X151.514 Y123.913
G1 X146.449 Y128.978 E.18378
G1 X146.448 Y128.434
G1 X151.513 Y123.368 E.18378
G1 X151.512 Y122.824
G1 X146.447 Y127.89 E.18378
G1 X146.446 Y127.345
G1 X150.616 Y123.175 E.15131
G1 X149.699 Y123.547
G1 X146.445 Y126.801 E.11807
G1 X146.444 Y126.256
G1 X148.781 Y123.919 E.08482
G1 X147.864 Y124.291
G1 X146.443 Y125.712 E.05157
G1 X146.441 Y125.168
M73 P95 R1
G1 X146.946 Y124.663 E.01832
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X146.441 Y125.168 E-.08142
G1 X146.443 Y125.712 E-.06206
G1 X146.967 Y125.188 E-.08452
; WIPE_END
G1 E-.012 F1800
G1 X146.252 Y132.766 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X151.668 Y132.766 E.00811
G1 X151.668 Y132.616 E.00022
G1 X146.319 Y132.616 E.00801
G1 X146.318 Y132.466 E.00022
G1 X151.668 Y132.466 E.00801
G1 X151.667 Y132.316 E.00022
G1 X146.318 Y132.316 E.00801
G1 X146.318 Y132.166 E.00022
G1 X151.667 Y132.166 E.00801
G1 X151.667 Y132.016 E.00022
G1 X146.318 Y132.016 E.00801
G1 X146.317 Y131.866 E.00022
G1 X151.667 Y131.866 E.00801
G1 X151.666 Y131.716 E.00022
G1 X146.317 Y131.716 E.00801
G1 X146.317 Y131.566 E.00022
G1 X151.666 Y131.566 E.00801
G1 X151.666 Y131.416 E.00022
G1 X146.316 Y131.416 E.00801
G1 X146.316 Y131.266 E.00022
G1 X151.665 Y131.266 E.00801
G1 X151.665 Y131.116 E.00022
G1 X146.316 Y131.116 E.00801
G1 X146.316 Y130.966 E.00022
G1 X151.665 Y130.966 E.00801
G1 X151.665 Y130.816 E.00022
G1 X146.315 Y130.816 E.00801
G1 X146.315 Y130.666 E.00022
G1 X151.664 Y130.666 E.00801
G1 X151.664 Y130.516 E.00022
G1 X146.315 Y130.516 E.00801
G1 X146.314 Y130.366 E.00022
G1 X151.664 Y130.366 E.00801
G1 X151.663 Y130.216 E.00022
G1 X146.314 Y130.216 E.00801
G1 X146.314 Y130.066 E.00022
G1 X151.663 Y130.066 E.00801
G1 X151.663 Y129.916 E.00022
G1 X146.314 Y129.916 E.00801
G1 X146.313 Y129.766 E.00022
G1 X151.663 Y129.766 E.00801
G1 X151.662 Y129.616 E.00022
G1 X146.313 Y129.616 E.00801
G1 X146.313 Y129.466 E.00022
G1 X151.662 Y129.466 E.00801
G1 X151.662 Y129.316 E.00022
G1 X146.312 Y129.316 E.00801
G1 X146.312 Y129.166 E.00022
G1 X151.661 Y129.166 E.00801
G1 X151.661 Y129.016 E.00022
G1 X146.312 Y129.016 E.00801
G1 X146.311 Y128.866 E.00022
G1 X151.661 Y128.866 E.00801
G1 X151.661 Y128.716 E.00022
G1 X146.311 Y128.716 E.00801
G1 X146.311 Y128.566 E.00022
G1 X151.66 Y128.566 E.00801
G1 X151.66 Y128.416 E.00022
G1 X146.311 Y128.416 E.00801
G1 X146.31 Y128.266 E.00022
G1 X151.66 Y128.266 E.00801
G1 X151.66 Y128.116 E.00022
G1 X146.31 Y128.116 E.00801
G1 X146.31 Y127.966 E.00022
G1 X151.659 Y127.966 E.00801
G1 X151.659 Y127.816 E.00022
G1 X146.309 Y127.816 E.00801
G1 X146.309 Y127.666 E.00022
G1 X151.659 Y127.666 E.00801
G1 X151.658 Y127.516 E.00022
G1 X146.309 Y127.516 E.00801
G1 X146.309 Y127.366 E.00022
G1 X151.658 Y127.366 E.00801
G1 X151.658 Y127.216 E.00022
G1 X146.308 Y127.216 E.00801
G1 X146.308 Y127.066 E.00022
G1 X151.658 Y127.066 E.00801
G1 X151.657 Y126.916 E.00022
G1 X146.308 Y126.916 E.00801
G1 X146.307 Y126.766 E.00022
G1 X151.657 Y126.766 E.00801
G1 X151.657 Y126.616 E.00022
G1 X146.307 Y126.616 E.00801
G1 X146.307 Y126.466 E.00022
G1 X151.656 Y126.466 E.00801
G1 X151.656 Y126.316 E.00022
G1 X146.306 Y126.316 E.00801
G1 X146.306 Y126.166 E.00022
G1 X151.656 Y126.166 E.00801
G1 X151.656 Y126.016 E.00022
G1 X146.306 Y126.016 E.00801
G1 X146.306 Y125.866 E.00022
G1 X151.655 Y125.866 E.00801
G1 X151.655 Y125.716 E.00022
G1 X146.305 Y125.716 E.00801
G1 X146.305 Y125.566 E.00022
G1 X151.655 Y125.566 E.00801
G1 X151.654 Y125.416 E.00022
G1 X146.305 Y125.416 E.00801
G1 X146.304 Y125.266 E.00022
G1 X151.654 Y125.266 E.00801
G1 X151.654 Y125.116 E.00022
G1 X146.304 Y125.116 E.00801
G1 X146.304 Y124.967 E.00022
G1 X151.654 Y124.967 E.00801
G1 X151.653 Y124.817 E.00022
G1 X146.304 Y124.817 E.00801
G1 X146.303 Y124.775 E.00006
G1 X146.572 Y124.667 E.00043
G1 X151.653 Y124.667 E.0076
G1 X151.653 Y124.517 E.00022
G1 X146.942 Y124.517 E.00705
G1 X147.312 Y124.367 E.0006
G1 X151.652 Y124.367 E.0065
G1 X151.652 Y124.217 E.00022
G1 X147.682 Y124.217 E.00594
G1 X148.052 Y124.067 E.0006
G1 X151.652 Y124.067 E.00539
G1 X151.652 Y123.917 E.00022
G1 X148.421 Y123.917 E.00483
G1 X148.791 Y123.767 E.0006
G1 X151.651 Y123.767 E.00428
G1 X151.651 Y123.617 E.00022
G1 X149.161 Y123.617 E.00373
G1 X149.531 Y123.467 E.0006
G1 X151.651 Y123.467 E.00317
G1 X151.65 Y123.317 E.00022
G1 X149.901 Y123.317 E.00262
G1 X150.271 Y123.167 E.0006
G1 X151.65 Y123.167 E.00206
G1 X151.65 Y123.017 E.00022
G1 X150.641 Y123.017 E.00151
G1 X151.011 Y122.867 E.0006
G1 X151.65 Y122.867 E.00096
G1 X151.649 Y122.717 E.00022
G1 X151.201 Y122.717 E.00067
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X151.649 Y122.717 E-.05114
G1 X151.65 Y122.867 E-.0171
G1 X151.011 Y122.867 E-.07286
G1 X150.641 Y123.017 E-.0455
G1 X151.004 Y123.017 E-.0414
; WIPE_END
G1 E-.012 F1800
G1 X153.077 Y125.572 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X154.026 Y125.953 E.02622
G1 X158.581 Y127.78 E.12591
G1 X158.59 Y132.895 E.13121
G1 X153.091 Y132.905 E.14107
G1 X153.077 Y125.632 E.18658
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X154.026 Y125.953 E-.11414
G1 X154.953 Y126.325 E-.11386
; WIPE_END
G1 E-.012 F1800
G1 X158.377 Y132.321 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Top surface
G1 F3600
M204 S2000
G1 X158.015 Y132.683 E.01314
G1 X157.469 Y132.685
G1 X158.376 Y131.777 E.03293
G1 X158.375 Y131.233
G1 X156.922 Y132.686 E.05272
G1 X156.376 Y132.687
G1 X158.374 Y130.688 E.0725
G1 X158.373 Y130.144
G1 X155.829 Y132.688 E.09229
G1 X155.283 Y132.689
G1 X158.372 Y129.599 E.11208
G1 X158.371 Y129.055
G1 X154.736 Y132.69 E.13187
G1 X154.19 Y132.691
G1 X158.37 Y128.511 E.15165
G1 X158.369 Y127.966
G1 X153.643 Y132.692 E.17144
G1 X153.303 Y132.487
G1 X158.01 Y127.78 E.17079
G1 X157.621 Y127.623
G1 X153.302 Y131.943 E.15671
G1 X153.3 Y131.399
G1 X157.232 Y127.467 E.14263
G1 X156.842 Y127.311
G1 X153.299 Y130.854 E.12854
G1 X153.298 Y130.31
G1 X156.453 Y127.155 E.11446
G1 X156.064 Y126.999
G1 X153.297 Y129.766 E.10038
G1 X153.296 Y129.221
G1 X155.675 Y126.843 E.08629
G1 X155.285 Y126.687
G1 X153.295 Y128.677 E.07221
G1 X153.294 Y128.132
G1 X154.896 Y126.53 E.05812
G1 X154.507 Y126.374
G1 X153.293 Y127.588 E.04404
G1 X153.292 Y127.044
G1 X154.118 Y126.218 E.02996
G1 X153.728 Y126.062
G1 X153.291 Y126.499 E.01587
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X153.728 Y126.062 E-.07053
G1 X154.118 Y126.218 E-.04781
G1 X153.437 Y126.898 E-.10966
; WIPE_END
G1 E-.012 F1800
G1 X158.47 Y132.637 Z3.32 F30000
G1 X158.583 Y132.766 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X153.166 Y132.766 E.00811
G1 X153.166 Y132.616 E.00022
G1 X158.515 Y132.616 E.00801
G1 X158.515 Y132.466 E.00022
G1 X153.165 Y132.466 E.00801
G1 X153.165 Y132.316 E.00022
G1 X158.514 Y132.316 E.00801
G1 X158.514 Y132.166 E.00022
G1 X153.165 Y132.166 E.00801
G1 X153.164 Y132.016 E.00022
G1 X158.514 Y132.016 E.00801
G1 X158.513 Y131.866 E.00022
G1 X153.164 Y131.866 E.00801
G1 X153.164 Y131.716 E.00022
G1 X158.513 Y131.716 E.00801
G1 X158.513 Y131.566 E.00022
G1 X153.164 Y131.566 E.00801
G1 X153.163 Y131.416 E.00022
G1 X158.513 Y131.416 E.00801
G1 X158.512 Y131.266 E.00022
G1 X153.163 Y131.266 E.00801
G1 X153.163 Y131.116 E.00022
G1 X158.512 Y131.116 E.00801
G1 X158.512 Y130.966 E.00022
G1 X153.162 Y130.966 E.00801
G1 X153.162 Y130.816 E.00022
G1 X158.511 Y130.816 E.00801
G1 X158.511 Y130.666 E.00022
G1 X153.162 Y130.666 E.00801
G1 X153.162 Y130.516 E.00022
G1 X158.511 Y130.516 E.00801
G1 X158.511 Y130.366 E.00022
G1 X153.161 Y130.366 E.00801
G1 X153.161 Y130.216 E.00022
G1 X158.51 Y130.216 E.00801
G1 X158.51 Y130.066 E.00022
G1 X153.161 Y130.066 E.00801
G1 X153.16 Y129.916 E.00022
G1 X158.51 Y129.916 E.00801
G1 X158.51 Y129.766 E.00022
G1 X153.16 Y129.766 E.00801
G1 X153.16 Y129.616 E.00022
G1 X158.509 Y129.616 E.00801
G1 X158.509 Y129.466 E.00022
G1 X153.159 Y129.466 E.00801
G1 X153.159 Y129.316 E.00022
G1 X158.509 Y129.316 E.00801
G1 X158.508 Y129.166 E.00022
G1 X153.159 Y129.166 E.00801
G1 X153.159 Y129.016 E.00022
G1 X158.508 Y129.016 E.00801
G1 X158.508 Y128.866 E.00022
G1 X153.158 Y128.866 E.00801
G1 X153.158 Y128.716 E.00022
G1 X158.508 Y128.716 E.00801
G1 X158.507 Y128.566 E.00022
G1 X153.158 Y128.566 E.00801
G1 X153.157 Y128.416 E.00022
G1 X158.507 Y128.416 E.00801
G1 X158.507 Y128.266 E.00022
G1 X153.157 Y128.266 E.00801
G1 X153.157 Y128.116 E.00022
G1 X158.506 Y128.116 E.00801
G1 X158.506 Y127.966 E.00022
G1 X153.157 Y127.966 E.00801
G1 X153.156 Y127.816 E.00022
G1 X158.47 Y127.816 E.00795
G1 X158.096 Y127.666 E.0006
G1 X153.156 Y127.666 E.00739
G1 X153.156 Y127.516 E.00022
G1 X157.722 Y127.516 E.00683
G1 X157.348 Y127.366 E.0006
G1 X153.155 Y127.366 E.00628
G1 X153.155 Y127.216 E.00022
G1 X156.975 Y127.216 E.00572
G1 X156.601 Y127.066 E.0006
G1 X153.155 Y127.066 E.00516
G1 X153.154 Y126.916 E.00022
G1 X156.227 Y126.916 E.0046
G1 X155.853 Y126.766 E.0006
G1 X153.154 Y126.766 E.00404
G1 X153.154 Y126.616 E.00022
G1 X155.479 Y126.616 E.00348
G1 X155.105 Y126.466 E.0006
G1 X153.154 Y126.466 E.00292
G1 X153.153 Y126.316 E.00022
G1 X154.731 Y126.316 E.00236
G1 X154.357 Y126.166 E.0006
G1 X153.153 Y126.166 E.0018
G1 X153.153 Y126.016 E.00022
G1 X153.983 Y126.016 E.00124
G1 X153.609 Y125.866 E.0006
G1 X153.152 Y125.866 E.00068
G1 X153.152 Y125.716 E.00022
G1 X153.417 Y125.716 E.0004
; OBJECT_ID: 179
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X153.152 Y125.716 E-.03017
G1 X153.152 Y125.866 E-.0171
G1 X153.609 Y125.866 E-.0521
G1 X153.983 Y126.016 E-.04593
G1 X153.258 Y126.016 E-.08271
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 145
M625
; start printing object, unique label id: 179
M624 AgAAAAAAAAA=
G1 X145.904 Y123.972 Z3.32 F30000
G1 X109.5 Y113.849 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X109.847 Y114.278 E.01416
G3 X94.488 Y106.961 I-14.806 J11.301 E2.54914
G3 X104.034 Y109.268 I.497 J18.849 E.25489
G1 X104.985 Y109.829 E.02833
G3 X109.152 Y113.421 I-9.944 J15.75 E.14164
G1 X109.462 Y113.803 E.01263
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X109.847 Y114.278 E-.06975
G1 X110.491 Y115.175 E-.12588
G1 X110.643 Y115.415 E-.03238
; WIPE_END
G1 E-.012 F1800
G1 X110.195 Y123.034 Z3.32 F30000
G1 X109.236 Y139.363 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G3 X84.476 Y108.848 I-14.196 J-13.784 E1.71504
G1 X85.486 Y108.251 E.03009
G3 X96.557 Y105.856 I9.574 J17.466 E.29465
G1 X96.798 Y105.87 E.00619
G3 X109.278 Y139.32 I-1.758 J19.709 E1.14188
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X108.398 Y140.184 E-.14053
G1 X107.817 Y140.684 E-.08747
; WIPE_END
G1 E-.012 F1800
G1 X105.471 Y142.149 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Top surface
G1 F3600
M204 S2000
G1 X111.582 Y136.038 E.22171
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X110.168 Y137.452 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X109.83 Y137.244 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X112.341 Y134.733 E.09111
G1 X112.868 Y133.661
G1 X111.088 Y135.441 E.06456
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X112.502 Y134.027 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X111.806 Y134.177 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X113.262 Y132.722 E.05281
G1 X113.574 Y131.865
G1 X112.298 Y133.141 E.04629
G1 X112.67 Y132.223
G1 X113.829 Y131.064 E.04206
G1 X114.027 Y130.32
G1 X112.957 Y131.391 E.03885
G1 X113.189 Y130.613
G1 X114.182 Y129.62 E.03604
G1 X114.327 Y128.93
G1 X113.382 Y129.874 E.03425
G1 X113.528 Y129.183
G1 X114.422 Y128.289 E.03245
G1 X114.501 Y127.664
G1 X113.643 Y128.523 E.03115
G1 X113.739 Y127.882
G1 X114.555 Y127.066 E.02961
G1 X114.591 Y126.484
G1 X113.797 Y127.278 E.02883
G1 X113.849 Y126.681
G1 X114.608 Y125.922 E.02754
G1 X114.612 Y125.372
G1 X113.866 Y126.119 E.02707
G1 X113.881 Y125.558
G1 X114.596 Y124.843 E.02595
G1 X114.574 Y124.319
G1 X113.865 Y125.028 E.02574
G1 X113.849 Y124.499
G1 X114.53 Y123.818 E.02469
G1 X114.485 Y123.317
G1 X113.807 Y123.996 E.02462
G1 X113.762 Y123.495
G1 X114.417 Y122.84 E.02377
G1 X114.346 Y122.366
G1 X113.698 Y123.013 E.0235
G1 X113.628 Y122.539
G1 X114.264 Y121.902 E.02308
G1 X114.169 Y121.452
G1 X113.547 Y122.073 E.02255
G1 X113.453 Y121.623
G1 X114.074 Y121.001 E.02255
G1 X113.958 Y120.572
G1 X113.358 Y121.172 E.02178
G1 X113.241 Y120.743
G1 X113.841 Y120.144 E.02175
G1 X113.717 Y119.723
G1 X113.124 Y120.315 E.02149
G1 X112.998 Y119.896
G1 X113.579 Y119.315 E.02107
G1 X113.441 Y118.907
G1 X112.86 Y119.488 E.02107
M73 P96 R1
G1 X112.722 Y119.081
G1 X113.291 Y118.513 E.02061
G1 X113.133 Y118.125
G1 X112.568 Y118.69 E.02051
G1 X112.411 Y118.302
G1 X112.976 Y117.736 E.02051
G1 X112.802 Y117.365
G1 X112.25 Y117.917 E.02004
G1 X112.074 Y117.548
G1 X112.626 Y116.995 E.02004
G1 X112.449 Y116.627
G1 X111.898 Y117.178 E.02001
G1 X111.714 Y116.817
G1 X112.255 Y116.275 E.01966
G1 X112.062 Y115.924
G1 X111.52 Y116.466 E.01966
G1 X111.326 Y116.114
G1 X111.865 Y115.575 E.01956
G1 X111.654 Y115.24
G1 X111.12 Y115.774 E.01936
G1 X110.909 Y115.44
G1 X111.443 Y114.906 E.01936
G1 X111.228 Y114.575
G1 X110.698 Y115.105 E.01923
G1 X110.473 Y114.785
G1 X111 Y114.258 E.01914
G1 X110.773 Y113.94
G1 X110.245 Y114.468 E.01914
G1 X110.017 Y114.15
G1 X110.541 Y113.627 E.01899
G1 X110.296 Y113.326
G1 X109.773 Y113.849 E.01899
G1 X109.529 Y113.548
G1 X110.052 Y113.025 E.01899
G1 X109.803 Y112.728
G1 X109.282 Y113.249 E.01891
G1 X109.022 Y112.964
G1 X109.543 Y112.443 E.01891
G1 X109.282 Y112.158
G1 X108.761 Y112.679 E.01891
G1 X108.497 Y112.398
G1 X109.018 Y111.877 E.01889
G1 X108.741 Y111.609
G1 X108.22 Y112.129 E.01889
G1 X107.944 Y111.861
G1 X108.464 Y111.34 E.01889
G1 X108.183 Y111.075
G1 X107.661 Y111.597 E.01894
G1 X107.369 Y111.345
G1 X107.891 Y110.823 E.01894
G1 X107.598 Y110.57
G1 X107.076 Y111.092 E.01894
G1 X106.775 Y110.847
G1 X107.301 Y110.322 E.01906
G1 X106.991 Y110.086
G1 X106.466 Y110.611 E.01906
G1 X106.157 Y110.375
G1 X106.682 Y109.85 E.01906
G1 X106.368 Y109.618
G1 X105.838 Y110.148 E.01924
G1 X105.512 Y109.929
G1 X106.043 Y109.398 E.01924
G1 X105.717 Y109.179
G1 X105.186 Y109.709 E.01924
G1 X104.848 Y109.502
G1 X105.386 Y108.965 E.0195
G1 X105.043 Y108.762
G1 X104.505 Y109.3 E.0195
G1 X104.162 Y109.097
G1 X104.7 Y108.56 E.0195
G1 X104.35 Y108.364
G1 X103.803 Y108.911 E.01984
G1 X103.443 Y108.726
G1 X103.989 Y108.179 E.01984
G1 X103.629 Y107.994
G1 X103.079 Y108.544 E.01995
G1 X102.701 Y108.377
G1 X103.259 Y107.819 E.02026
G1 X102.88 Y107.652
G1 X102.322 Y108.21 E.02026
G1 X101.934 Y108.053
G1 X102.502 Y107.485 E.02059
G1 X102.109 Y107.332
G1 X101.537 Y107.905 E.02078
G1 X101.139 Y107.757
G1 X101.712 Y107.184 E.02078
G1 X101.314 Y107.037
G1 X100.724 Y107.626 E.02139
G1 X100.307 Y107.499
G1 X100.896 Y106.909 E.0214
G1 X100.478 Y106.781
G1 X99.883 Y107.377 E.02161
G1 X99.443 Y107.271
G1 X100.053 Y106.661 E.02213
G1 X99.614 Y106.555
G1 X99.004 Y107.165 E.02213
G1 X98.546 Y107.077
G1 X99.175 Y106.449 E.02281
G1 X98.718 Y106.36
G1 X98.084 Y106.994 E.023
G1 X97.611 Y106.922
G1 X98.256 Y106.277 E.0234
G1 X97.784 Y106.203
G1 X97.123 Y106.864 E.02399
G1 X96.632 Y106.81
G1 X97.293 Y106.149 E.02398
G1 X96.801 Y106.096
G1 X96.117 Y106.78 E.02481
G1 X95.602 Y106.749
G1 X96.298 Y106.053 E.02526
G1 X95.783 Y106.022
G1 X95.057 Y106.749 E.02636
G1 X94.511 Y106.749
G1 X95.248 Y106.013 E.02671
G1 X94.702 Y106.013
G1 X93.933 Y106.782 E.02789
G1 X93.353 Y106.817
G1 X94.138 Y106.032 E.02848
G1 X93.558 Y106.066
G1 X92.733 Y106.891 E.02991
G1 X92.104 Y106.975
G1 X92.956 Y106.123 E.03092
G1 X92.337 Y106.197
G1 X91.439 Y107.095 E.03258
G1 X90.742 Y107.246
G1 X91.686 Y106.302 E.03423
G1 X91.021 Y106.422
G1 X90.018 Y107.424 E.03637
G1 X89.233 Y107.664
G1 X90.303 Y106.594 E.0388
G1 X89.544 Y106.808
G1 X88.389 Y107.962 E.04188
G1 X87.468 Y108.339
G1 X88.771 Y107.035 E.04728
G1 X87.903 Y107.357
G1 X86.412 Y108.849 E.0541
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X87.827 Y107.434 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X85.185 Y109.53 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X86.956 Y107.76 E.06424
G1 X85.865 Y108.305
G1 X83.38 Y110.79 E.09018
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X84.794 Y109.376 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.199 Y115.609 Z3.32 F30000
G1 X106.7 Y140.374 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X104.195 Y142.879 E.09089
G1 X103.125 Y143.404
G1 X104.895 Y141.634 E.06424
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X103.481 Y143.048 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X103.668 Y142.316 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X102.177 Y143.807 E.0541
G1 X101.309 Y144.129
G1 X102.613 Y142.825 E.04729
G1 X101.691 Y143.202
G1 X100.524 Y144.369 E.04233
G1 X99.778 Y144.569
G1 X100.847 Y143.5 E.0388
G1 X100.062 Y143.74
G1 X99.06 Y144.742 E.03637
G1 X98.395 Y144.862
G1 X99.338 Y143.918 E.03423
G1 X98.642 Y144.069
G1 X97.744 Y144.967 E.03258
G1 X97.125 Y145.041
G1 X97.977 Y144.189 E.03092
G1 X97.347 Y144.273
G1 X96.533 Y145.088 E.02955
G1 X95.947 Y145.128
G1 X96.728 Y144.347 E.02835
G1 X96.147 Y144.382
G1 X95.378 Y145.151 E.02789
G1 X94.833 Y145.151
G1 X95.569 Y144.415 E.02671
G1 X95.024 Y144.415
G1 X94.297 Y145.141 E.02636
G1 X93.782 Y145.111
G1 X94.479 Y144.415 E.02526
G1 X93.964 Y144.384
G1 X93.269 Y145.078 E.02519
G1 X92.782 Y145.02
G1 X93.449 Y144.354 E.02419
G1 X92.957 Y144.3
G1 X92.295 Y144.962 E.02404
G1 X91.825 Y144.887
G1 X92.47 Y144.242 E.0234
G1 X91.997 Y144.17
G1 X91.363 Y144.804 E.023
G1 X90.915 Y144.706
G1 X91.534 Y144.086 E.02249
G1 X91.076 Y143.999
G1 X90.472 Y144.604 E.02194
G1 X90.029 Y144.502
G1 X90.637 Y143.893 E.02208
G1 X90.198 Y143.787
G1 X89.602 Y144.382 E.02161
G1 X89.184 Y144.255
G1 X89.774 Y143.665 E.0214
G1 X89.356 Y143.538
G1 X88.767 Y144.127 E.02139
G1 X88.369 Y143.979
G1 X88.942 Y143.407 E.02078
G1 X88.544 Y143.259
G1 X87.971 Y143.832 E.02078
G1 X87.579 Y143.679
G1 X88.146 Y143.111 E.02059
G1 X87.759 Y142.954
G1 X87.2 Y143.512 E.02026
G1 X86.822 Y143.345
G1 X87.38 Y142.787 E.02026
G1 X87.001 Y142.62
G1 X86.452 Y143.17 E.01995
G1 X86.091 Y142.985
G1 X86.638 Y142.438 E.01984
G1 X86.278 Y142.253
G1 X85.731 Y142.8 E.01984
G1 X85.381 Y142.604
G1 X85.918 Y142.067 E.0195
G1 X85.576 Y141.864
G1 X85.038 Y142.402 E.0195
G1 X84.695 Y142.199
G1 X85.233 Y141.662 E.0195
G1 X84.894 Y141.455
G1 X84.364 Y141.985 E.01924
G1 X84.038 Y141.766
G1 X84.568 Y141.235 E.01924
G1 X84.243 Y141.016
G1 X83.712 Y141.546 E.01924
G1 X83.399 Y141.314
G1 X83.924 Y140.789 E.01906
G1 X83.615 Y140.553
G1 X83.089 Y141.078 E.01906
G1 X82.78 Y140.842
G1 X83.305 Y140.317 E.01906
G1 X83.005 Y140.071
G1 X82.483 Y140.593 E.01894
G1 X82.19 Y140.341
G1 X82.712 Y139.819 E.01894
G1 X82.419 Y139.567
G1 X81.897 Y140.089 E.01894
G1 X81.616 Y139.824
G1 X82.137 Y139.303 E.01889
G1 X81.86 Y139.035
G1 X81.34 Y139.555 E.01889
G1 X81.063 Y139.287
G1 X81.584 Y138.766 E.01889
G1 X81.319 Y138.485
G1 X80.798 Y139.006 E.01891
G1 X80.538 Y138.721
G1 X81.059 Y138.2 E.01891
G1 X80.798 Y137.915
G1 X80.277 Y138.436 E.01891
G1 X80.029 Y138.139
G1 X80.552 Y137.616 E.01899
G1 X80.308 Y137.315
G1 X79.784 Y137.838 E.01899
G1 X79.54 Y137.537
G1 X80.064 Y137.014 E.01899
G1 X79.836 Y136.696
G1 X79.308 Y137.224 E.01914
G1 X79.08 Y136.906
G1 X79.608 Y136.378 E.01914
G1 X79.382 Y136.058
G1 X78.852 Y136.588 E.01923
G1 X78.638 Y136.258
G1 X79.171 Y135.724 E.01936
G1 X78.96 Y135.39
G1 X78.427 Y135.923 E.01936
G1 X78.216 Y135.589
G1 X78.755 Y135.05 E.01956
G1 X78.561 Y134.698
G1 X78.019 Y135.24 E.01966
G1 X77.825 Y134.889
G1 X78.369 Y134.345 E.01973
G1 X78.19 Y133.979
G1 X77.631 Y134.537 E.02026
G1 X77.455 Y134.168
G1 X78.011 Y133.612 E.02018
G1 X77.832 Y133.246
G1 X77.279 Y133.799 E.02006
G1 X77.105 Y133.427
G1 X77.67 Y132.862 E.02049
G1 X77.513 Y132.474
G1 X76.951 Y133.036 E.02037
G1 X76.797 Y132.644
G1 X77.358 Y132.083 E.02036
G1 X77.22 Y131.676
G1 X76.643 Y132.253 E.02095
G1 X76.502 Y131.849
G1 X77.083 Y131.268 E.02107
G1 X76.956 Y130.849
G1 X76.364 Y131.441 E.02149
G1 X76.24 Y131.02
G1 X76.839 Y130.421 E.02175
G1 X76.723 Y129.991
G1 X76.123 Y130.592 E.02178
G1 X76.007 Y130.162
G1 X76.628 Y129.541 E.02255
G1 X76.533 Y129.09
G1 X75.912 Y129.712 E.02255
G1 X75.817 Y129.261
G1 X76.453 Y128.625 E.02308
G1 X76.382 Y128.151
G1 X75.735 Y128.798 E.0235
G1 X75.664 Y128.324
G1 X76.319 Y127.669 E.02377
G1 X76.274 Y127.168
G1 X75.596 Y127.846 E.02462
G1 X75.551 Y127.346
G1 X76.231 Y126.665 E.02469
G1 X76.216 Y126.136
G1 X75.506 Y126.845 E.02574
G1 X75.485 Y126.321
G1 X76.21 Y125.595 E.02634
G1 X76.221 Y125.039
G1 X75.469 Y125.791 E.02729
G1 X75.473 Y125.242
G1 X76.232 Y124.483 E.02754
G1 X76.284 Y123.885
G1 X75.489 Y124.68 E.02883
G1 X75.526 Y124.098
G1 X76.342 Y123.282 E.02961
G1 X76.438 Y122.641
G1 X75.579 Y123.499 E.03115
G1 X75.659 Y122.875
G1 X76.553 Y121.98 E.03245
G1 X76.698 Y121.29
G1 X75.754 Y122.234 E.03425
G1 X75.891 Y121.552
G1 X76.892 Y120.551 E.03632
G1 X77.137 Y119.76
G1 X76.047 Y120.85 E.03956
G1 X76.252 Y120.1
G1 X77.411 Y118.941 E.04206
G1 X77.783 Y118.023
G1 X76.507 Y119.299 E.04629
G1 X76.833 Y118.427
G1 X78.274 Y116.986 E.05228
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X76.86 Y118.401 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X78.993 Y115.723 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X77.213 Y117.502 E.06456
G1 X77.74 Y116.43
G1 X80.251 Y113.919 E.09112
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X78.837 Y115.333 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X78.499 Y115.126 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X84.609 Y109.015 E.22169
G1 E-.56 F1800
; WIPE_START
G1 F3600
M204 S10000
G1 X83.195 Y110.429 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X84.54 Y117.942 Z3.32 F30000
G1 X89.116 Y143.505 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0825086
G1 F18000
G1 X88.981 Y143.42 E.00051
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X89.116 Y143.505 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X96.748 Y143.425 Z3.32 F30000
G1 X101.219 Y143.378 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.138071
G1 F18000
G1 X100.914 Y143.567 E.00247
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X101.219 Y143.378 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X103.061 Y143.341 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.186574
G1 F18000
G1 X102.935 Y143.427 E.00154
; LINE_WIDTH: 0.144188
G1 X102.81 Y143.513 E.00111
; LINE_WIDTH: 0.101803
G1 X102.684 Y143.599 E.00068
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X102.81 Y143.513 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X103.053 Y142.631 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.101802
G1 F18000
G1 X102.927 Y142.717 E.00068
; LINE_WIDTH: 0.144188
G1 X102.802 Y142.803 E.00111
; LINE_WIDTH: 0.186574
G1 X102.676 Y142.889 E.00154
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X102.802 Y142.803 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X104.184 Y142.044 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.103006
G1 F18000
G1 X104.033 Y142.156 E.00086
; LINE_WIDTH: 0.147799
G1 X103.882 Y142.267 E.00142
; LINE_WIDTH: 0.192593
G1 X103.731 Y142.378 E.00198
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X103.882 Y142.267 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X105.409 Y142.087 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.196812
G1 F18000
G1 X105.232 Y142.224 E.00242
; LINE_WIDTH: 0.150331
G1 X105.055 Y142.361 E.00173
; LINE_WIDTH: 0.10385
G1 X104.878 Y142.498 E.00104
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X105.055 Y142.361 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X105.582 Y141.19 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.0985903
G1 F18000
G1 X105.431 Y141.314 E.00083
; LINE_WIDTH: 0.134552
G1 X105.281 Y141.438 E.0013
; LINE_WIDTH: 0.170942
G1 X105.127 Y141.564 E.00181
; LINE_WIDTH: 0.204782
G1 X104.957 Y141.696 E.00244
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X105.127 Y141.564 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X109.892 Y137.306 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.216994
G1 F18000
G1 X109.62 Y137.608 E.00494
; LINE_WIDTH: 0.179908
G1 X109.345 Y137.912 E.00397
; LINE_WIDTH: 0.128255
G1 X108.572 Y138.72 E.00698
G1 X107.776 Y139.505 E.00699
; LINE_WIDTH: 0.149048
G1 X107.366 Y139.885 E.00426
; LINE_WIDTH: 0.190604
G1 X106.953 Y140.268 E.00586
; LINE_WIDTH: 0.221993
G1 X106.762 Y140.436 E.00318
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X106.953 Y140.268 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X110.951 Y136.972 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.104169
G1 F18000
G1 X110.756 Y137.201 E.0014
; LINE_WIDTH: 0.151291
G1 X110.561 Y137.431 E.00234
; LINE_WIDTH: 0.198621
G1 X110.254 Y137.771 E.00501
; LINE_WIDTH: 0.24616
G1 X109.947 Y138.112 E.00646
; LINE_WIDTH: 0.288964
G1 X109.468 Y138.618 E.01181
; LINE_WIDTH: 0.33357
G3 X108.169 Y139.932 I-19.571 J-18.05 E.03679
; LINE_WIDTH: 0.307624
G1 X107.745 Y140.325 E.0105
; LINE_WIDTH: 0.264855
G1 X107.322 Y140.718 E.00885
; LINE_WIDTH: 0.224138
G1 X107.104 Y140.909 E.00366
; LINE_WIDTH: 0.185478
G1 X106.886 Y141.1 E.00292
; LINE_WIDTH: 0.146817
G1 X106.667 Y141.291 E.00217
; LINE_WIDTH: 0.103821
G3 X106.398 Y141.524 I-4.034 J-4.391 E.00165
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X106.667 Y141.291 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X111.15 Y135.503 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.19937
G1 F18000
G1 X110.992 Y135.701 E.00278
; LINE_WIDTH: 0.151871
G1 X110.834 Y135.899 E.00198
; LINE_WIDTH: 0.104371
G1 X110.675 Y136.097 E.00118
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X110.834 Y135.899 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X111.97 Y135.406 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.0986347
G1 F18000
G1 X111.879 Y135.527 E.00065
; LINE_WIDTH: 0.134369
G1 X111.759 Y135.676 E.00128
; LINE_WIDTH: 0.16987
G1 X111.64 Y135.826 E.00173
; LINE_WIDTH: 0.205371
G1 X111.52 Y135.976 E.00218
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X111.64 Y135.826 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X111.869 Y134.24 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.193858
G1 F18000
G1 X111.749 Y134.4 E.00212
; LINE_WIDTH: 0.148566
G1 X111.629 Y134.559 E.00152
; LINE_WIDTH: 0.103275
G1 X111.509 Y134.719 E.00092
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X111.629 Y134.559 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X112.362 Y133.205 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.187411
G1 F18000
G1 X112.268 Y133.338 E.00166
; LINE_WIDTH: 0.144696
G1 X112.173 Y133.471 E.0012
; LINE_WIDTH: 0.101981
G1 X112.079 Y133.604 E.00073
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X112.173 Y133.471 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X113.066 Y133.228 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.195775
G1 F18000
G1 X112.805 Y133.598 E.00487
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X113.066 Y133.228 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X113.449 Y129.941 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.180829
G1 F18000
G3 X113.301 Y130.209 I-10.797 J-5.807 E.00299
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X113.449 Y129.941 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X107.833 Y124.773 Z3.32 F30000
G1 X89.166 Y107.596 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.138182
G1 F18000
G1 X88.862 Y107.786 E.00248
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X89.166 Y107.596 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X87.396 Y107.565 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.1018
G1 F18000
G1 X87.271 Y107.651 E.00068
; LINE_WIDTH: 0.144182
G1 X87.145 Y107.737 E.00111
; LINE_WIDTH: 0.186564
G1 X87.019 Y107.823 E.00154
G1 X87.404 Y108.275 F30000
; LINE_WIDTH: 0.186577
G1 F18000
G1 X87.279 Y108.361 E.00154
; LINE_WIDTH: 0.14419
G1 X87.153 Y108.447 E.00111
; LINE_WIDTH: 0.101803
G1 X87.027 Y108.533 E.00068
G1 X86.35 Y108.786 F30000
; LINE_WIDTH: 0.192585
G1 F18000
G1 X86.199 Y108.897 E.00197
; LINE_WIDTH: 0.147795
G1 X86.048 Y109.008 E.00142
; LINE_WIDTH: 0.103005
G1 X85.896 Y109.12 E.00086
G1 X85.203 Y108.666 F30000
; LINE_WIDTH: 0.103851
G1 F18000
G1 X85.026 Y108.803 E.00104
; LINE_WIDTH: 0.150335
G1 X84.849 Y108.94 E.00173
; LINE_WIDTH: 0.19682
G1 X84.672 Y109.078 E.00242
G1 X85.123 Y109.468 F30000
; LINE_WIDTH: 0.204504
G1 F18000
G1 X84.95 Y109.602 E.00248
; LINE_WIDTH: 0.170611
G1 X84.799 Y109.726 E.00177
; LINE_WIDTH: 0.13461
G1 X84.649 Y109.85 E.0013
; LINE_WIDTH: 0.0986097
G1 X84.499 Y109.974 E.00083
G1 X83.682 Y109.64 F30000
; LINE_WIDTH: 0.084692
G1 F18000
G1 X83.632 Y109.682 E.00022
; LINE_WIDTH: 0.10808
G1 X83.413 Y109.873 E.00142
; LINE_WIDTH: 0.146731
G1 X83.195 Y110.064 E.00217
; LINE_WIDTH: 0.185381
G1 X82.977 Y110.255 E.00291
; LINE_WIDTH: 0.224032
G1 X82.758 Y110.446 E.00366
; LINE_WIDTH: 0.264712
G1 X82.336 Y110.838 E.00884
; LINE_WIDTH: 0.32175
G2 X80.294 Y112.873 I33.278 J35.42 E.05513
; LINE_WIDTH: 0.27473
G1 X80.036 Y113.16 E.00617
; LINE_WIDTH: 0.234738
G1 X79.778 Y113.447 E.00514
; LINE_WIDTH: 0.194747
G1 X79.519 Y113.733 E.00412
; LINE_WIDTH: 0.151229
G1 X79.325 Y113.962 E.00234
; LINE_WIDTH: 0.104148
G1 X79.13 Y114.192 E.0014
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X79.325 Y113.962 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X83.318 Y110.729 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.221827
G1 F18000
G1 X83.123 Y110.899 E.00323
; LINE_WIDTH: 0.19052
G1 X82.714 Y111.279 E.0058
; LINE_WIDTH: 0.149051
G1 X82.303 Y111.661 E.00428
; LINE_WIDTH: 0.128421
G1 X81.507 Y112.446 E.007
G1 X80.733 Y113.254 E.007
; LINE_WIDTH: 0.180175
G1 X80.461 Y113.556 E.00394
; LINE_WIDTH: 0.217026
G1 X80.19 Y113.857 E.00493
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X80.461 Y113.556 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X79.406 Y115.066 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.104374
G1 F18000
G1 X79.247 Y115.265 E.00118
; LINE_WIDTH: 0.151878
G1 X79.089 Y115.463 E.00198
; LINE_WIDTH: 0.199382
G1 X78.931 Y115.661 E.00278
G1 X78.561 Y115.188 F30000
; LINE_WIDTH: 0.20534
G1 F18000
G1 X78.441 Y115.338 E.00218
; LINE_WIDTH: 0.169804
G1 X78.322 Y115.487 E.00173
; LINE_WIDTH: 0.134269
G1 X78.202 Y115.637 E.00128
; LINE_WIDTH: 0.0985706
G1 X78.111 Y115.758 E.00065
G1 X78.572 Y116.445 F30000
; LINE_WIDTH: 0.103274
G1 F18000
G1 X78.452 Y116.604 E.00092
; LINE_WIDTH: 0.148566
G1 X78.332 Y116.764 E.00152
; LINE_WIDTH: 0.193858
G1 X78.212 Y116.924 E.00212
G1 X78.002 Y117.559 F30000
; LINE_WIDTH: 0.101986
G1 F18000
G1 X77.908 Y117.693 E.00073
; LINE_WIDTH: 0.14471
G1 X77.813 Y117.826 E.0012
; LINE_WIDTH: 0.187434
G1 X77.719 Y117.959 E.00166
G1 X77.276 Y117.565 F30000
; LINE_WIDTH: 0.195949
G1 F18000
G1 X77.018 Y117.931 E.00481
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X77.276 Y117.565 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X76.781 Y120.955 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.180915
G1 F18000
G2 X76.632 Y121.223 I8.101 J4.684 E.00299
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X76.781 Y120.955 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X81.798 Y126.706 Z3.32 F30000
G1 X97.894 Y145.156 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X92.186 Y145.156 E.00854
G1 X91.329 Y145.006 F30000
G1 F3600
G1 X98.751 Y145.006 E.01111
G1 X99.465 Y144.856 F30000
G1 F3600
G1 X90.615 Y144.856 E.01325
G1 X89.995 Y144.706 F30000
G1 F3600
G1 X100.086 Y144.706 E.0151
G1 X100.612 Y144.556 F30000
G1 F3600
G1 X89.468 Y144.556 E.01668
G1 X88.977 Y144.406 F30000
G1 F3600
G1 X101.104 Y144.406 E.01815
G1 X101.556 Y144.256 F30000
G1 F3600
G1 X88.719 Y144.256 E.01921
G1 X88.315 Y144.106 E.00064
G1 X93.058 Y144.106 E.0071
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X91.058 Y144.106 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X91.964 Y143.956 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X87.911 Y143.956 E.00607
G3 X87.527 Y143.806 I1.071 J-3.313 E.00062
G1 X91.148 Y143.806 E.00542
G1 X90.527 Y143.656 F30000
G1 F3600
G1 X87.186 Y143.656 E.005
G1 X86.846 Y143.506 E.00056
G1 X89.953 Y143.506 E.00465
G1 X89.462 Y143.356 F30000
G1 F3600
G1 X86.513 Y143.356 E.00441
G1 X86.221 Y143.206 E.00049
G1 X88.795 Y143.206 E.00385
G1 X88.391 Y143.056 E.00064
G1 X85.929 Y143.056 E.00368
G1 X85.636 Y142.906 E.00049
G1 X87.991 Y142.906 E.00352
G1 X87.65 Y142.756 E.00056
G1 X85.368 Y142.756 E.00342
G1 X85.114 Y142.606 E.00044
G1 X87.31 Y142.606 E.00329
G3 X86.973 Y142.456 I1.095 J-2.911 E.00055
G1 X84.86 Y142.456 E.00316
G1 X84.606 Y142.306 E.00044
G1 X86.681 Y142.306 E.00311
G1 X86.389 Y142.156 E.00049
G1 X84.372 Y142.156 E.00302
G1 X84.149 Y142.006 E.0004
G1 X86.096 Y142.006 E.00291
G3 X85.831 Y141.856 I1.131 J-2.31 E.00046
G1 X83.927 Y141.856 E.00285
G1 X83.704 Y141.706 E.0004
G1 X85.577 Y141.706 E.0028
G1 X85.323 Y141.556 E.00044
G1 X83.489 Y141.556 E.00275
G1 X83.292 Y141.406 E.00037
G1 X85.069 Y141.406 E.00266
G3 X84.845 Y141.256 I1.149 J-1.962 E.0004
G1 X83.096 Y141.256 E.00262
G1 X82.9 Y141.106 E.00037
G1 X84.622 Y141.106 E.00258
G1 X84.4 Y140.956 E.0004
G1 X82.703 Y140.956 E.00254
G3 X82.519 Y140.806 I1.172 J-1.623 E.00036
G1 X84.177 Y140.806 E.00248
G3 X83.976 Y140.656 I1.164 J-1.771 E.00038
G1 X82.345 Y140.656 E.00244
G1 X82.171 Y140.506 E.00034
G1 X83.779 Y140.506 E.00241
G1 X83.583 Y140.356 E.00037
G1 X81.997 Y140.356 E.00237
G1 X81.823 Y140.206 E.00034
G1 X83.386 Y140.206 E.00234
G3 X83.197 Y140.056 I1.17 J-1.668 E.00036
G1 X81.659 Y140.056 E.0023
G1 X81.504 Y139.906 E.00032
G1 X83.023 Y139.906 E.00227
G1 X82.849 Y139.756 E.00034
G1 X81.35 Y139.756 E.00224
G1 X81.195 Y139.606 E.00032
G1 X82.675 Y139.606 E.00222
G1 X82.501 Y139.456 E.00034
G1 X81.041 Y139.456 E.00219
G3 X80.887 Y139.306 I1.181 J-1.362 E.00032
G1 X82.337 Y139.306 E.00217
G1 X82.182 Y139.156 E.00032
G1 X80.75 Y139.156 E.00214
G1 X80.613 Y139.006 E.0003
G1 X82.028 Y139.006 E.00212
G1 X81.873 Y138.856 E.00032
G1 X80.475 Y138.856 E.00209
G1 X80.338 Y138.706 E.0003
G1 X81.719 Y138.706 E.00207
G3 X81.571 Y138.556 I1.188 J-1.323 E.00032
G1 X80.201 Y138.556 E.00205
G3 X80.069 Y138.406 I1.197 J-1.19 E.0003
G1 X81.433 Y138.406 E.00204
G1 X81.296 Y138.256 E.0003
G1 X79.947 Y138.256 E.00202
G1 X79.825 Y138.106 E.00029
G1 X81.159 Y138.106 E.002
M73 P96 R0
G1 X81.022 Y137.956 E.0003
G1 X79.703 Y137.956 E.00197
G1 X79.582 Y137.806 E.00029
G1 X80.885 Y137.806 E.00195
G3 X80.761 Y137.656 I1.206 J-1.116 E.00029
G1 X79.46 Y137.656 E.00195
G3 X79.342 Y137.506 I1.204 J-1.069 E.00029
G1 X80.64 Y137.506 E.00194
G1 X80.518 Y137.356 E.00029
G1 X79.234 Y137.356 E.00192
G1 X79.127 Y137.206 E.00028
G1 X80.396 Y137.206 E.0019
G1 X80.275 Y137.056 E.00029
M73 P97 R0
G1 X79.019 Y137.056 E.00188
G1 X78.911 Y136.906 E.00028
G1 X80.155 Y136.906 E.00186
G1 X80.048 Y136.756 E.00028
G1 X78.804 Y136.756 E.00186
G1 X78.696 Y136.606 E.00028
G1 X79.94 Y136.606 E.00186
G1 X79.832 Y136.456 E.00028
G1 X78.601 Y136.456 E.00184
G1 X78.506 Y136.306 E.00027
G1 X79.725 Y136.306 E.00182
G1 X79.617 Y136.156 E.00028
G1 X78.411 Y136.156 E.00181
G1 X78.317 Y136.006 E.00027
G1 X79.512 Y136.006 E.00179
G1 X79.417 Y135.856 E.00027
G1 X78.222 Y135.856 E.00179
G1 X78.127 Y135.706 E.00027
G1 X79.322 Y135.706 E.00179
G1 X79.228 Y135.556 E.00027
G1 X78.037 Y135.556 E.00178
G1 X77.954 Y135.406 E.00026
G1 X79.133 Y135.406 E.00176
G1 X79.038 Y135.256 E.00027
G1 X77.871 Y135.256 E.00175
G1 X77.789 Y135.106 E.00026
G1 X78.944 Y135.106 E.00173
G3 X78.86 Y134.956 I1.216 J-.777 E.00026
G1 X77.706 Y134.956 E.00173
G1 X77.623 Y134.806 E.00026
G1 X78.777 Y134.806 E.00173
G1 X78.694 Y134.656 E.00026
G1 X77.54 Y134.656 E.00173
G3 X77.464 Y134.506 I1.225 J-.722 E.00025
G1 X78.612 Y134.506 E.00172
G1 X78.529 Y134.356 E.00026
G1 X77.392 Y134.356 E.0017
G1 X77.321 Y134.206 E.00025
G1 X78.446 Y134.206 E.00168
G3 X78.369 Y134.056 I1.225 J-.73 E.00025
G1 X77.249 Y134.056 E.00168
G1 X77.178 Y133.906 E.00025
G1 X78.297 Y133.906 E.00168
G1 X78.226 Y133.756 E.00025
G1 X77.106 Y133.756 E.00168
G1 X77.035 Y133.606 E.00025
G1 X78.154 Y133.606 E.00168
G1 X78.083 Y133.456 E.00025
G1 X76.969 Y133.456 E.00167
G1 X76.908 Y133.306 E.00024
G1 X78.011 Y133.306 E.00165
G1 X77.94 Y133.156 E.00025
G1 X76.847 Y133.156 E.00164
G1 X76.786 Y133.006 E.00024
G1 X77.877 Y133.006 E.00163
G1 X77.816 Y132.856 E.00024
G1 X76.725 Y132.856 E.00163
G1 X76.664 Y132.706 E.00024
G1 X77.755 Y132.706 E.00163
G1 X77.694 Y132.556 E.00024
G1 X76.604 Y132.556 E.00163
G3 X76.546 Y132.406 I1.234 J-.564 E.00024
G1 X77.633 Y132.406 E.00163
G1 X77.573 Y132.256 E.00024
G1 X76.495 Y132.256 E.00161
G1 X76.444 Y132.106 E.00024
G1 X77.512 Y132.106 E.0016
G3 X77.46 Y131.956 I1.245 J-.511 E.00024
G1 X76.393 Y131.956 E.0016
G1 X76.343 Y131.806 E.00024
G1 X77.41 Y131.806 E.0016
G1 X77.359 Y131.656 E.00024
G1 X76.292 Y131.656 E.0016
G1 X76.241 Y131.507 E.00024
G1 X77.308 Y131.507 E.0016
G1 X77.257 Y131.357 E.00024
G1 X76.191 Y131.357 E.0016
G3 X76.149 Y131.207 I1.238 J-.428 E.00023
G1 X77.207 Y131.207 E.00158
G1 X77.156 Y131.057 E.00024
G1 X76.108 Y131.057 E.00157
G1 X76.067 Y130.907 E.00023
G1 X77.114 Y130.907 E.00157
G1 X77.073 Y130.757 E.00023
G1 X76.026 Y130.757 E.00157
G1 X75.985 Y130.607 E.00023
G1 X77.032 Y130.607 E.00157
G1 X76.991 Y130.457 E.00023
G1 X75.944 Y130.457 E.00157
G1 X75.903 Y130.307 E.00023
G1 X76.95 Y130.307 E.00157
G1 X76.909 Y130.157 E.00023
G1 X75.865 Y130.157 E.00156
G1 X75.834 Y130.007 E.00023
G1 X76.868 Y130.007 E.00155
G3 X76.835 Y129.857 I1.249 J-.358 E.00023
G1 X75.802 Y129.857 E.00155
G1 X75.77 Y129.707 E.00023
G1 X76.803 Y129.707 E.00155
G1 X76.772 Y129.557 E.00023
G1 X75.739 Y129.557 E.00155
G1 X75.707 Y129.407 E.00023
G1 X76.74 Y129.407 E.00155
G1 X76.709 Y129.257 E.00023
G1 X75.676 Y129.257 E.00155
G1 X75.644 Y129.107 E.00023
G1 X76.677 Y129.107 E.00155
G1 X76.645 Y128.957 E.00023
G1 X75.619 Y128.957 E.00154
G1 X75.597 Y128.807 E.00023
G1 X76.619 Y128.807 E.00153
G1 X76.597 Y128.657 E.00023
G1 X75.575 Y128.657 E.00153
G1 X75.552 Y128.507 E.00023
G1 X76.574 Y128.507 E.00153
G1 X76.552 Y128.357 E.00023
G1 X75.53 Y128.357 E.00153
G1 X75.508 Y128.207 E.00023
G1 X76.529 Y128.207 E.00153
G1 X76.507 Y128.057 E.00023
G1 X75.485 Y128.057 E.00153
G1 X75.463 Y127.907 E.00023
G1 X76.485 Y127.907 E.00153
G3 X76.464 Y127.757 I1.252 J-.244 E.00023
G1 X75.45 Y127.757 E.00152
G1 X75.436 Y127.607 E.00023
G1 X76.451 Y127.607 E.00152
G1 X76.438 Y127.457 E.00023
G1 X75.423 Y127.457 E.00152
G1 X75.41 Y127.307 E.00023
G1 X76.424 Y127.307 E.00152
G1 X76.411 Y127.157 E.00023
G1 X75.396 Y127.157 E.00152
G1 X75.383 Y127.007 E.00023
G1 X76.398 Y127.007 E.00152
G1 X76.384 Y126.857 E.00023
G1 X75.37 Y126.857 E.00152
G3 X75.359 Y126.707 I1.259 J-.166 E.00023
G1 X76.371 Y126.707 E.00151
G3 X76.365 Y126.557 I1.257 J-.121 E.00022
G1 X75.354 Y126.557 E.00151
G1 X75.35 Y126.407 E.00022
G1 X76.361 Y126.407 E.00151
G1 X76.356 Y126.257 E.00022
G1 X75.345 Y126.257 E.00151
G1 X75.341 Y126.107 E.00022
G1 X76.352 Y126.107 E.00151
G1 X76.348 Y125.957 E.00022
G1 X75.337 Y125.957 E.00151
G1 X75.332 Y125.807 E.00022
G1 X76.343 Y125.807 E.00151
G1 X76.339 Y125.657 E.00022
G1 X75.328 Y125.657 E.00151
G3 X75.328 Y125.507 I1.266 J-.075 E.00022
G1 X76.339 Y125.507 E.00151
G1 X76.343 Y125.357 E.00022
G1 X75.332 Y125.357 E.00151
G1 X75.337 Y125.207 E.00022
G1 X76.348 Y125.207 E.00151
G1 X76.352 Y125.057 E.00022
G1 X75.341 Y125.057 E.00151
G1 X75.345 Y124.907 E.00022
G1 X76.356 Y124.907 E.00151
G1 X76.361 Y124.757 E.00022
G1 X75.35 Y124.757 E.00151
G1 X75.354 Y124.607 E.00022
G1 X76.365 Y124.607 E.00151
G3 X76.371 Y124.457 I1.269 J-.029 E.00022
G1 X75.359 Y124.457 E.00151
G3 X75.37 Y124.307 I1.271 J.016 E.00023
G1 X76.384 Y124.307 E.00152
G1 X76.398 Y124.157 E.00023
G1 X75.383 Y124.157 E.00152
G1 X75.396 Y124.007 E.00023
G1 X76.411 Y124.007 E.00152
G1 X76.424 Y123.857 E.00023
G1 X75.41 Y123.857 E.00152
G1 X75.423 Y123.707 E.00023
G1 X76.438 Y123.707 E.00152
G1 X76.451 Y123.557 E.00023
G1 X75.436 Y123.557 E.00152
G1 X75.45 Y123.407 E.00023
G1 X76.464 Y123.407 E.00152
G3 X76.485 Y123.257 I1.271 J.094 E.00023
G1 X75.463 Y123.257 E.00153
G1 X75.485 Y123.107 E.00023
G1 X76.507 Y123.107 E.00153
G1 X76.529 Y122.957 E.00023
G1 X75.508 Y122.957 E.00153
G1 X75.53 Y122.807 E.00023
G1 X76.552 Y122.807 E.00153
G1 X76.574 Y122.657 E.00023
G1 X75.552 Y122.657 E.00153
G1 X75.575 Y122.507 E.00023
G1 X76.597 Y122.507 E.00153
G1 X76.619 Y122.357 E.00023
G1 X75.597 Y122.357 E.00153
G1 X75.619 Y122.207 E.00023
G1 X76.645 Y122.207 E.00154
G1 X76.677 Y122.057 E.00023
G1 X75.644 Y122.057 E.00155
G1 X75.676 Y121.907 E.00023
G1 X76.709 Y121.907 E.00155
G1 X76.74 Y121.757 E.00023
G1 X75.707 Y121.757 E.00155
G1 X75.739 Y121.607 E.00023
G1 X76.772 Y121.607 E.00155
G1 X76.803 Y121.457 E.00023
G1 X75.77 Y121.457 E.00155
G1 X75.802 Y121.307 E.00023
G1 X76.835 Y121.307 E.00155
G3 X76.868 Y121.157 I1.281 J.208 E.00023
G1 X75.834 Y121.157 E.00155
G1 X75.865 Y121.007 E.00023
G1 X76.909 Y121.007 E.00156
G1 X76.95 Y120.857 E.00023
G1 X75.903 Y120.857 E.00157
G1 X75.944 Y120.707 E.00023
G1 X76.991 Y120.707 E.00157
G1 X77.032 Y120.557 E.00023
G1 X75.985 Y120.557 E.00157
G1 X76.026 Y120.407 E.00023
G1 X77.073 Y120.407 E.00157
G1 X77.114 Y120.257 E.00023
G1 X76.067 Y120.257 E.00157
G1 X76.108 Y120.107 E.00023
G1 X77.156 Y120.107 E.00157
G1 X77.207 Y119.957 E.00024
G1 X76.149 Y119.957 E.00158
G3 X76.191 Y119.807 I1.284 J.279 E.00023
G1 X77.257 Y119.807 E.0016
G1 X77.308 Y119.657 E.00024
G1 X76.241 Y119.657 E.0016
G1 X76.292 Y119.507 E.00024
G1 X77.359 Y119.507 E.0016
G1 X77.41 Y119.357 E.00024
G1 X76.343 Y119.357 E.0016
G1 X76.393 Y119.207 E.00024
G1 X77.46 Y119.207 E.0016
G3 X77.512 Y119.057 I1.284 J.357 E.00024
G1 X76.444 Y119.057 E.0016
G1 X76.495 Y118.907 E.00024
G1 X77.573 Y118.907 E.00161
G1 X77.633 Y118.757 E.00024
G1 X76.546 Y118.757 E.00163
G3 X76.604 Y118.607 I1.294 J.415 E.00024
G1 X77.694 Y118.607 E.00163
G1 X77.755 Y118.457 E.00024
G1 X76.665 Y118.457 E.00163
G1 X76.725 Y118.307 E.00024
G1 X77.816 Y118.307 E.00163
G1 X77.877 Y118.157 E.00024
G1 X76.786 Y118.157 E.00163
G1 X76.847 Y118.007 E.00024
G1 X77.94 Y118.007 E.00164
G1 X78.012 Y117.857 E.00025
G1 X76.908 Y117.857 E.00165
G1 X76.969 Y117.707 E.00024
G1 X78.083 Y117.707 E.00167
G1 X78.154 Y117.557 E.00025
G1 X77.035 Y117.557 E.00168
G1 X77.106 Y117.407 E.00025
G1 X78.226 Y117.407 E.00168
G1 X78.297 Y117.257 E.00025
G1 X77.178 Y117.257 E.00168
G1 X77.249 Y117.107 E.00025
G1 X78.369 Y117.107 E.00168
G3 X78.446 Y116.957 I1.304 J.58 E.00025
G1 X77.321 Y116.957 E.00168
G1 X77.392 Y116.807 E.00025
G1 X78.529 Y116.807 E.0017
G1 X78.612 Y116.657 E.00026
G1 X77.464 Y116.657 E.00172
G3 X77.541 Y116.508 I1.302 J.573 E.00025
G1 X78.695 Y116.508 E.00173
G1 X78.777 Y116.358 E.00026
G1 X77.623 Y116.358 E.00173
G1 X77.706 Y116.208 E.00026
G1 X78.86 Y116.208 E.00173
G3 X78.944 Y116.058 I1.308 J.631 E.00026
G1 X77.789 Y116.058 E.00173
G1 X77.871 Y115.908 E.00026
G1 X79.038 Y115.908 E.00175
G1 X79.133 Y115.758 E.00027
G1 X77.954 Y115.758 E.00176
G1 X78.037 Y115.608 E.00026
G1 X79.228 Y115.608 E.00178
G1 X79.322 Y115.458 E.00027
G1 X78.127 Y115.458 E.00179
G1 X78.222 Y115.308 E.00027
G1 X79.417 Y115.308 E.00179
G1 X79.512 Y115.158 E.00027
G1 X78.317 Y115.158 E.00179
G1 X78.411 Y115.008 E.00027
G1 X79.617 Y115.008 E.00181
G1 X79.725 Y114.858 E.00028
G1 X78.506 Y114.858 E.00182
G1 X78.601 Y114.708 E.00027
G1 X79.833 Y114.708 E.00184
G1 X79.94 Y114.558 E.00028
G1 X78.696 Y114.558 E.00186
G1 X78.804 Y114.408 E.00028
G1 X80.048 Y114.408 E.00186
G1 X80.155 Y114.258 E.00028
G1 X78.911 Y114.258 E.00186
G1 X79.019 Y114.108 E.00028
G1 X80.275 Y114.108 E.00188
G1 X80.396 Y113.958 E.00029
G1 X79.127 Y113.958 E.0019
G1 X79.234 Y113.808 E.00028
G1 X80.518 Y113.808 E.00192
G1 X80.64 Y113.658 E.00029
G1 X79.342 Y113.658 E.00194
G3 X79.46 Y113.508 I1.322 J.919 E.00029
G1 X80.762 Y113.508 E.00195
G3 X80.885 Y113.358 I1.323 J.961 E.00029
G1 X79.582 Y113.358 E.00195
G1 X79.703 Y113.208 E.00029
G1 X81.022 Y113.208 E.00197
G1 X81.159 Y113.058 E.0003
G1 X79.825 Y113.058 E.002
G1 X79.947 Y112.908 E.00029
G1 X81.296 Y112.908 E.00202
G1 X81.434 Y112.758 E.0003
G1 X80.069 Y112.758 E.00204
G3 X80.201 Y112.608 I1.331 J1.042 E.0003
G1 X81.571 Y112.608 E.00205
G3 X81.719 Y112.458 I1.337 J1.174 E.00032
G1 X80.338 Y112.458 E.00207
G1 X80.475 Y112.308 E.0003
G1 X81.874 Y112.308 E.00209
G1 X82.028 Y112.158 E.00032
G1 X80.613 Y112.158 E.00212
G1 X80.75 Y112.008 E.0003
G1 X82.183 Y112.008 E.00214
G1 X82.337 Y111.858 E.00032
G1 X80.887 Y111.858 E.00217
G3 X81.041 Y111.708 I1.346 J1.225 E.00032
G1 X82.501 Y111.708 E.00219
G1 X82.675 Y111.558 E.00034
G1 X81.195 Y111.558 E.00222
G1 X81.35 Y111.408 E.00032
G1 X82.849 Y111.408 E.00224
G1 X83.023 Y111.258 E.00034
G1 X81.504 Y111.258 E.00227
G1 X81.659 Y111.108 E.00032
G1 X83.197 Y111.108 E.0023
G3 X83.386 Y110.958 I1.357 J1.516 E.00036
G1 X81.823 Y110.958 E.00234
G1 X81.997 Y110.808 E.00034
G1 X83.583 Y110.808 E.00237
G1 X83.779 Y110.658 E.00037
G1 X82.171 Y110.658 E.00241
G1 X82.345 Y110.508 E.00034
G1 X83.976 Y110.508 E.00244
G3 X84.177 Y110.358 I1.364 J1.62 E.00038
G1 X82.519 Y110.358 E.00248
G3 X82.703 Y110.208 I1.355 J1.472 E.00036
G1 X84.4 Y110.208 E.00254
G1 X84.622 Y110.058 E.0004
G1 X82.9 Y110.058 E.00258
G1 X83.096 Y109.908 E.00037
G1 X84.845 Y109.908 E.00262
G3 X85.069 Y109.758 I1.375 J1.814 E.0004
G1 X83.293 Y109.758 E.00266
G1 X83.489 Y109.608 E.00037
G1 X85.323 Y109.608 E.00275
G1 X85.577 Y109.458 E.00044
G1 X83.704 Y109.458 E.0028
G1 X83.927 Y109.308 E.0004
G1 X85.831 Y109.308 E.00285
G3 X86.097 Y109.158 I1.397 J2.162 E.00046
G1 X84.149 Y109.158 E.00291
G1 X84.372 Y109.008 E.0004
G1 X86.389 Y109.008 E.00302
G1 X86.681 Y108.858 E.00049
G1 X84.606 Y108.858 E.00311
G1 X84.86 Y108.708 E.00044
G1 X86.973 Y108.708 E.00316
G3 X87.31 Y108.558 I1.431 J2.759 E.00055
G1 X85.114 Y108.558 E.00329
G1 X85.368 Y108.408 E.00044
G1 X87.65 Y108.408 E.00342
G1 X87.991 Y108.258 E.00056
G1 X85.637 Y108.258 E.00352
G1 X85.929 Y108.108 E.00049
G1 X88.391 Y108.108 E.00369
G1 X88.795 Y107.958 E.00064
G1 X86.221 Y107.958 E.00385
G1 X86.513 Y107.808 E.00049
G1 X89.462 Y107.808 E.00441
G1 X89.953 Y107.658 F30000
G1 F3600
G1 X86.846 Y107.658 E.00465
G1 X87.186 Y107.508 E.00056
G1 X90.528 Y107.508 E.005
G1 X91.148 Y107.358 F30000
G1 F3600
G1 X87.527 Y107.358 E.00542
G3 X87.911 Y107.208 I1.456 J3.164 E.00062
G1 X91.964 Y107.208 E.00607
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X89.964 Y107.208 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X93.059 Y107.058 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X88.121 Y107.058 E.00739
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X90.121 Y107.058 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X92.444 Y114.328 Z3.32 F30000
G1 X101.96 Y144.106 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X97.023 Y144.106 E.00739
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X99.023 Y144.106 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X98.117 Y143.956 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X102.17 Y143.956 E.00607
G2 X102.554 Y143.806 I-1.072 J-3.314 E.00062
G1 X98.933 Y143.806 E.00542
G1 X99.553 Y143.656 F30000
G1 F3600
G1 X102.895 Y143.656 E.005
G1 X103.235 Y143.506 E.00056
G1 X100.128 Y143.506 E.00465
G1 X100.619 Y143.356 F30000
G1 F3600
G1 X103.568 Y143.356 E.00441
G1 X103.86 Y143.206 E.00049
G1 X101.286 Y143.206 E.00385
G1 X101.69 Y143.056 E.00064
G1 X104.152 Y143.056 E.00368
G1 X104.444 Y142.906 E.00049
G1 X102.09 Y142.906 E.00352
G1 X102.431 Y142.756 E.00056
G1 X104.713 Y142.756 E.00342
G1 X104.967 Y142.606 E.00044
G1 X102.771 Y142.606 E.00329
G2 X103.108 Y142.456 I-1.096 J-2.912 E.00055
G1 X105.221 Y142.456 E.00316
G1 X105.475 Y142.306 E.00044
G1 X103.4 Y142.306 E.00311
G1 X103.692 Y142.156 E.00049
G1 X105.709 Y142.156 E.00302
G1 X105.931 Y142.006 E.0004
G1 X103.984 Y142.006 E.00291
G2 X104.25 Y141.856 I-1.133 J-2.314 E.00046
G1 X106.154 Y141.856 E.00285
G1 X106.377 Y141.706 E.0004
G1 X104.504 Y141.706 E.0028
G1 X104.757 Y141.556 E.00044
G1 X106.592 Y141.556 E.00275
G1 X106.788 Y141.406 E.00037
G1 X105.011 Y141.406 E.00266
G2 X105.236 Y141.256 I-1.154 J-1.969 E.0004
G1 X106.985 Y141.256 E.00262
G1 X107.181 Y141.106 E.00037
G1 X105.458 Y141.106 E.00258
G1 X105.681 Y140.956 E.0004
G1 X107.378 Y140.956 E.00254
G2 X107.561 Y140.806 I-1.172 J-1.623 E.00036
G1 X105.904 Y140.806 E.00248
G2 X106.105 Y140.656 I-1.162 J-1.769 E.00038
G1 X107.735 Y140.656 E.00244
G1 X107.909 Y140.506 E.00034
G1 X106.302 Y140.506 E.00241
G1 X106.498 Y140.356 E.00037
G1 X108.084 Y140.356 E.00237
G1 X108.258 Y140.206 E.00034
G1 X106.695 Y140.206 E.00234
G2 X106.884 Y140.056 I-1.17 J-1.668 E.00036
G1 X108.422 Y140.056 E.0023
G1 X108.577 Y139.906 E.00032
G1 X107.058 Y139.906 E.00227
G1 X107.232 Y139.756 E.00034
G1 X108.731 Y139.756 E.00224
G1 X108.886 Y139.606 E.00032
G1 X107.406 Y139.606 E.00222
G1 X107.58 Y139.456 E.00034
G1 X109.04 Y139.456 E.00219
G2 X109.194 Y139.306 I-1.182 J-1.363 E.00032
G1 X107.744 Y139.306 E.00217
G1 X107.898 Y139.156 E.00032
G1 X109.331 Y139.156 E.00214
G1 X109.468 Y139.006 E.0003
G1 X108.053 Y139.006 E.00212
G1 X108.207 Y138.856 E.00032
G1 X109.605 Y138.856 E.00209
G1 X109.743 Y138.706 E.0003
G1 X108.362 Y138.706 E.00207
G2 X108.51 Y138.556 I-1.189 J-1.324 E.00032
G1 X109.88 Y138.556 E.00205
G2 X110.012 Y138.406 I-1.197 J-1.19 E.0003
G1 X108.647 Y138.406 E.00204
G1 X108.784 Y138.256 E.0003
G1 X110.134 Y138.256 E.00202
G1 X110.256 Y138.106 E.00029
G1 X108.922 Y138.106 E.002
G1 X109.059 Y137.956 E.0003
G1 X110.377 Y137.956 E.00197
G1 X110.499 Y137.806 E.00029
G1 X109.196 Y137.806 E.00195
G2 X109.319 Y137.656 I-1.199 J-1.11 E.00029
G1 X110.621 Y137.656 E.00195
G2 X110.739 Y137.506 I-1.204 J-1.069 E.00029
G1 X109.441 Y137.506 E.00194
G1 X109.563 Y137.356 E.00029
G1 X110.846 Y137.356 E.00192
G1 X110.954 Y137.206 E.00028
G1 X109.684 Y137.206 E.0019
G1 X109.806 Y137.056 E.00029
G1 X111.062 Y137.056 E.00188
G1 X111.169 Y136.906 E.00028
G1 X109.925 Y136.906 E.00186
G1 X110.033 Y136.756 E.00028
G1 X111.277 Y136.756 E.00186
G1 X111.385 Y136.606 E.00028
G1 X110.141 Y136.606 E.00186
G1 X110.248 Y136.456 E.00028
G1 X111.48 Y136.456 E.00184
G1 X111.575 Y136.306 E.00027
G1 X110.356 Y136.306 E.00182
G1 X110.464 Y136.156 E.00028
G1 X111.67 Y136.156 E.00181
G1 X111.764 Y136.006 E.00027
G1 X110.569 Y136.006 E.00179
G1 X110.664 Y135.856 E.00027
G1 X111.859 Y135.856 E.00179
G1 X111.954 Y135.706 E.00027
G1 X110.758 Y135.706 E.00179
G1 X110.853 Y135.556 E.00027
G1 X112.044 Y135.556 E.00178
G1 X112.127 Y135.406 E.00026
G1 X110.948 Y135.406 E.00176
G1 X111.042 Y135.256 E.00027
G1 X112.21 Y135.256 E.00175
G1 X112.292 Y135.106 E.00026
G1 X111.137 Y135.106 E.00173
G2 X111.221 Y134.956 I-1.216 J-.777 E.00026
G1 X112.375 Y134.956 E.00173
G1 X112.458 Y134.806 E.00026
G1 X111.304 Y134.806 E.00173
G1 X111.386 Y134.656 E.00026
G1 X112.54 Y134.656 E.00173
G2 X112.617 Y134.506 I-1.227 J-.723 E.00025
G1 X111.469 Y134.506 E.00172
G1 X111.552 Y134.356 E.00026
G1 X112.689 Y134.356 E.0017
G1 X112.76 Y134.206 E.00025
G1 X111.634 Y134.206 E.00168
G2 X111.712 Y134.056 I-1.225 J-.73 E.00025
G1 X112.831 Y134.056 E.00168
G1 X112.903 Y133.906 E.00025
G1 X111.783 Y133.906 E.00168
G1 X111.855 Y133.756 E.00025
G1 X112.974 Y133.756 E.00168
G1 X113.046 Y133.606 E.00025
G1 X111.926 Y133.606 E.00168
G1 X111.998 Y133.456 E.00025
G1 X113.112 Y133.456 E.00167
G1 X113.173 Y133.306 E.00024
G1 X112.069 Y133.306 E.00165
G1 X112.141 Y133.156 E.00025
G1 X113.234 Y133.156 E.00164
G1 X113.295 Y133.006 E.00024
G1 X112.204 Y133.006 E.00163
G1 X112.265 Y132.856 E.00024
G1 X113.355 Y132.856 E.00163
G1 X113.416 Y132.706 E.00024
G1 X112.326 Y132.706 E.00163
G1 X112.386 Y132.556 E.00024
G1 X113.477 Y132.556 E.00163
G2 X113.535 Y132.406 I-1.236 J-.565 E.00024
G1 X112.447 Y132.406 E.00163
G1 X112.508 Y132.256 E.00024
G1 X113.586 Y132.256 E.00161
G1 X113.637 Y132.106 E.00024
G1 X112.569 Y132.106 E.0016
G2 X112.62 Y131.956 I-1.238 J-.509 E.00024
G1 X113.687 Y131.956 E.0016
G1 X113.738 Y131.806 E.00024
G1 X112.671 Y131.806 E.0016
G1 X112.722 Y131.656 E.00024
G1 X113.789 Y131.656 E.0016
G1 X113.839 Y131.507 E.00024
G1 X112.773 Y131.507 E.0016
G1 X112.823 Y131.357 E.00024
G1 X113.89 Y131.357 E.0016
G2 X113.932 Y131.207 I-1.242 J-.429 E.00023
G1 X112.874 Y131.207 E.00158
G1 X112.925 Y131.057 E.00024
G1 X113.973 Y131.057 E.00157
G1 X114.014 Y130.907 E.00023
G1 X112.966 Y130.907 E.00157
G1 X113.007 Y130.757 E.00023
G1 X114.055 Y130.757 E.00157
G1 X114.096 Y130.607 E.00023
G1 X113.048 Y130.607 E.00157
G1 X113.089 Y130.457 E.00023
G1 X114.137 Y130.457 E.00157
G1 X114.178 Y130.307 E.00023
G1 X113.13 Y130.307 E.00157
G1 X113.171 Y130.157 E.00023
G1 X114.216 Y130.157 E.00156
G1 X114.247 Y130.007 E.00023
G1 X113.212 Y130.007 E.00155
G2 X113.246 Y129.857 I-1.249 J-.358 E.00023
G1 X114.279 Y129.857 E.00155
G1 X114.31 Y129.707 E.00023
G1 X113.277 Y129.707 E.00155
G1 X113.309 Y129.557 E.00023
G1 X114.342 Y129.557 E.00155
G1 X114.373 Y129.407 E.00023
G1 X113.341 Y129.407 E.00155
G1 X113.372 Y129.257 E.00023
G1 X114.405 Y129.257 E.00155
G1 X114.437 Y129.107 E.00023
G1 X113.404 Y129.107 E.00155
G1 X113.435 Y128.957 E.00023
G1 X114.461 Y128.957 E.00154
G1 X114.484 Y128.807 E.00023
G1 X113.462 Y128.807 E.00153
G1 X113.484 Y128.657 E.00023
G1 X114.506 Y128.657 E.00153
G1 X114.528 Y128.507 E.00023
G1 X113.507 Y128.507 E.00153
G1 X113.529 Y128.357 E.00023
G1 X114.551 Y128.357 E.00153
G1 X114.573 Y128.207 E.00023
G1 X113.551 Y128.207 E.00153
G1 X113.574 Y128.057 E.00023
G1 X114.596 Y128.057 E.00153
G1 X114.618 Y127.907 E.00023
G1 X113.596 Y127.907 E.00153
G2 X113.616 Y127.757 I-1.251 J-.244 E.00023
G1 X114.631 Y127.757 E.00152
G1 X114.644 Y127.607 E.00023
G1 X113.63 Y127.607 E.00152
G1 X113.643 Y127.457 E.00023
G1 X114.658 Y127.457 E.00152
G1 X114.671 Y127.307 E.00023
G1 X113.656 Y127.307 E.00152
G1 X113.67 Y127.157 E.00023
G1 X114.684 Y127.157 E.00152
G1 X114.698 Y127.007 E.00023
G1 X113.683 Y127.007 E.00152
G1 X113.697 Y126.857 E.00023
G1 X114.711 Y126.857 E.00152
G2 X114.722 Y126.707 I-1.259 J-.166 E.00023
G1 X113.71 Y126.707 E.00151
G2 X113.715 Y126.557 I-1.257 J-.121 E.00022
G1 X114.726 Y126.557 E.00151
G1 X114.731 Y126.407 E.00022
G1 X113.72 Y126.407 E.00151
G1 X113.724 Y126.257 E.00022
G1 X114.735 Y126.257 E.00151
G1 X114.74 Y126.107 E.00022
G1 X113.729 Y126.107 E.00151
G1 X113.733 Y125.957 E.00022
G1 X114.744 Y125.957 E.00151
G1 X114.749 Y125.807 E.00022
G1 X113.738 Y125.807 E.00151
G1 X113.742 Y125.657 E.00022
G1 X114.753 Y125.657 E.00151
G2 X114.753 Y125.507 I-1.266 J-.075 E.00022
G1 X113.742 Y125.507 E.00151
G1 X113.738 Y125.357 E.00022
G1 X114.749 Y125.357 E.00151
G1 X114.744 Y125.207 E.00022
G1 X113.733 Y125.207 E.00151
G1 X113.729 Y125.057 E.00022
G1 X114.74 Y125.057 E.00151
G1 X114.735 Y124.907 E.00022
G1 X113.724 Y124.907 E.00151
G1 X113.72 Y124.757 E.00022
G1 X114.731 Y124.757 E.00151
G1 X114.726 Y124.607 E.00022
G1 X113.715 Y124.607 E.00151
G2 X113.71 Y124.457 I-1.269 J-.029 E.00022
G1 X114.722 Y124.457 E.00151
G2 X114.711 Y124.307 I-1.27 J.016 E.00023
G1 X113.697 Y124.307 E.00152
G1 X113.683 Y124.157 E.00023
G1 X114.698 Y124.157 E.00152
G1 X114.684 Y124.007 E.00023
G1 X113.67 Y124.007 E.00152
G1 X113.656 Y123.857 E.00023
G1 X114.671 Y123.857 E.00152
G1 X114.658 Y123.707 E.00023
G1 X113.643 Y123.707 E.00152
G1 X113.63 Y123.557 E.00023
G1 X114.644 Y123.557 E.00152
G1 X114.631 Y123.407 E.00023
G1 X113.616 Y123.407 E.00152
G2 X113.596 Y123.257 I-1.271 J.094 E.00023
G1 X114.618 Y123.257 E.00153
G1 X114.596 Y123.107 E.00023
G1 X113.574 Y123.107 E.00153
G1 X113.551 Y122.957 E.00023
G1 X114.573 Y122.957 E.00153
G1 X114.551 Y122.807 E.00023
G1 X113.529 Y122.807 E.00153
G1 X113.507 Y122.657 E.00023
G1 X114.528 Y122.657 E.00153
G1 X114.506 Y122.507 E.00023
G1 X113.484 Y122.507 E.00153
G1 X113.462 Y122.357 E.00023
G1 X114.484 Y122.357 E.00153
G1 X114.461 Y122.207 E.00023
G1 X113.435 Y122.207 E.00154
G1 X113.404 Y122.057 E.00023
G1 X114.437 Y122.057 E.00155
G1 X114.405 Y121.907 E.00023
G1 X113.372 Y121.907 E.00155
G1 X113.341 Y121.757 E.00023
G1 X114.373 Y121.757 E.00155
G1 X114.342 Y121.607 E.00023
G1 X113.309 Y121.607 E.00155
G1 X113.277 Y121.457 E.00023
G1 X114.31 Y121.457 E.00155
G1 X114.279 Y121.307 E.00023
G1 X113.246 Y121.307 E.00155
G2 X113.212 Y121.157 I-1.281 J.208 E.00023
G1 X114.247 Y121.157 E.00155
G1 X114.216 Y121.007 E.00023
G1 X113.171 Y121.007 E.00156
G1 X113.13 Y120.857 E.00023
G1 X114.178 Y120.857 E.00157
G1 X114.137 Y120.707 E.00023
G1 X113.089 Y120.707 E.00157
G1 X113.048 Y120.557 E.00023
G1 X114.096 Y120.557 E.00157
G1 X114.055 Y120.407 E.00023
G1 X113.007 Y120.407 E.00157
G1 X112.966 Y120.257 E.00023
G1 X114.014 Y120.257 E.00157
G1 X113.973 Y120.107 E.00023
G1 X112.925 Y120.107 E.00157
G1 X112.874 Y119.957 E.00024
G1 X113.932 Y119.957 E.00158
G2 X113.89 Y119.807 I-1.28 J.278 E.00023
G1 X112.823 Y119.807 E.0016
G1 X112.773 Y119.657 E.00024
G1 X113.839 Y119.657 E.0016
G1 X113.789 Y119.507 E.00024
G1 X112.722 Y119.507 E.0016
G1 X112.671 Y119.357 E.00024
G1 X113.738 Y119.357 E.0016
G1 X113.687 Y119.207 E.00024
G1 X112.62 Y119.207 E.0016
G2 X112.569 Y119.057 I-1.29 J.359 E.00024
G1 X113.637 Y119.057 E.0016
G1 X113.586 Y118.907 E.00024
G1 X112.508 Y118.907 E.00161
G1 X112.447 Y118.757 E.00024
G1 X113.535 Y118.757 E.00163
G2 X113.477 Y118.607 I-1.291 J.414 E.00024
G1 X112.386 Y118.607 E.00163
G1 X112.326 Y118.457 E.00024
G1 X113.416 Y118.457 E.00163
G1 X113.355 Y118.307 E.00024
G1 X112.265 Y118.307 E.00163
G1 X112.204 Y118.157 E.00024
G1 X113.295 Y118.157 E.00163
G1 X113.234 Y118.007 E.00024
G1 X112.141 Y118.007 E.00164
G1 X112.069 Y117.857 E.00025
G1 X113.173 Y117.857 E.00165
G1 X113.112 Y117.707 E.00024
G1 X111.998 Y117.707 E.00167
G1 X111.926 Y117.557 E.00025
G1 X113.046 Y117.557 E.00168
G1 X112.974 Y117.407 E.00025
G1 X111.855 Y117.407 E.00168
G1 X111.783 Y117.257 E.00025
G1 X112.903 Y117.257 E.00168
G1 X112.831 Y117.107 E.00025
G1 X111.712 Y117.107 E.00168
G2 X111.634 Y116.957 I-1.302 J.579 E.00025
G1 X112.76 Y116.957 E.00168
G1 X112.689 Y116.807 E.00025
G1 X111.552 Y116.807 E.0017
G1 X111.469 Y116.657 E.00026
G1 X112.617 Y116.657 E.00172
G2 X112.54 Y116.508 I-1.302 J.573 E.00025
G1 X111.386 Y116.508 E.00173
G1 X111.304 Y116.358 E.00026
G1 X112.458 Y116.358 E.00173
G1 X112.375 Y116.208 E.00026
G1 X111.221 Y116.208 E.00173
G2 X111.137 Y116.058 I-1.308 J.631 E.00026
G1 X112.292 Y116.058 E.00173
G1 X112.209 Y115.908 E.00026
G1 X111.042 Y115.908 E.00175
G1 X110.948 Y115.758 E.00027
G1 X112.127 Y115.758 E.00176
G1 X112.044 Y115.608 E.00026
G1 X110.853 Y115.608 E.00178
G1 X110.758 Y115.458 E.00027
G1 X111.954 Y115.458 E.00179
G1 X111.859 Y115.308 E.00027
G1 X110.664 Y115.308 E.00179
G1 X110.569 Y115.158 E.00027
G1 X111.764 Y115.158 E.00179
G1 X111.669 Y115.008 E.00027
G1 X110.463 Y115.008 E.00181
G1 X110.356 Y114.858 E.00028
G1 X111.575 Y114.858 E.00182
G1 X111.48 Y114.708 E.00027
G1 X110.248 Y114.708 E.00184
G1 X110.141 Y114.558 E.00028
G1 X111.384 Y114.558 E.00186
G1 X111.277 Y114.408 E.00028
G1 X110.033 Y114.408 E.00186
G1 X109.925 Y114.258 E.00028
G1 X111.169 Y114.258 E.00186
G1 X111.062 Y114.108 E.00028
G1 X109.806 Y114.108 E.00188
G1 X109.684 Y113.958 E.00029
G1 X110.954 Y113.958 E.0019
G1 X110.846 Y113.808 E.00028
G1 X109.563 Y113.808 E.00192
G1 X109.441 Y113.658 E.00029
G1 X110.739 Y113.658 E.00194
G2 X110.621 Y113.508 I-1.324 J.921 E.00029
G1 X109.319 Y113.508 E.00195
G2 X109.196 Y113.358 I-1.323 J.961 E.00029
G1 X110.499 Y113.358 E.00195
G1 X110.377 Y113.208 E.00029
G1 X109.059 Y113.208 E.00197
G1 X108.922 Y113.058 E.0003
G1 X110.256 Y113.058 E.002
G1 X110.134 Y112.908 E.00029
G1 X108.784 Y112.908 E.00202
G1 X108.647 Y112.758 E.0003
G1 X110.012 Y112.758 E.00204
G2 X109.88 Y112.608 I-1.33 J1.041 E.0003
G1 X108.51 Y112.608 E.00205
G2 X108.362 Y112.458 I-1.337 J1.174 E.00032
G1 X109.743 Y112.458 E.00207
G1 X109.605 Y112.308 E.0003
G1 X108.207 Y112.308 E.00209
G1 X108.053 Y112.158 E.00032
G1 X109.468 Y112.158 E.00212
G1 X109.331 Y112.008 E.0003
G1 X107.898 Y112.008 E.00214
G1 X107.744 Y111.858 E.00032
G1 X109.194 Y111.858 E.00217
G2 X109.04 Y111.708 I-1.342 J1.221 E.00032
G1 X107.58 Y111.708 E.00219
G1 X107.406 Y111.558 E.00034
G1 X108.886 Y111.558 E.00222
G1 X108.731 Y111.408 E.00032
G1 X107.231 Y111.408 E.00224
G1 X107.057 Y111.258 E.00034
G1 X108.577 Y111.258 E.00227
G1 X108.422 Y111.108 E.00032
G1 X106.883 Y111.108 E.0023
G2 X106.694 Y110.958 I-1.357 J1.516 E.00036
G1 X108.257 Y110.958 E.00234
G1 X108.083 Y110.808 E.00034
G1 X106.498 Y110.808 E.00237
G1 X106.301 Y110.658 E.00037
G1 X107.909 Y110.658 E.00241
G1 X107.735 Y110.508 E.00034
G1 X106.105 Y110.508 E.00244
G2 X105.904 Y110.358 I-1.364 J1.62 E.00038
G1 X107.561 Y110.358 E.00248
G2 X107.378 Y110.208 I-1.355 J1.472 E.00036
G1 X105.681 Y110.208 E.00254
G1 X105.458 Y110.058 E.0004
G1 X107.181 Y110.058 E.00258
G1 X106.985 Y109.908 E.00037
G1 X105.236 Y109.908 E.00262
G2 X105.011 Y109.758 I-1.375 J1.814 E.0004
G1 X106.788 Y109.758 E.00266
G1 X106.592 Y109.608 E.00037
G1 X104.757 Y109.608 E.00275
G1 X104.503 Y109.458 E.00044
G1 X106.377 Y109.458 E.0028
G1 X106.154 Y109.308 E.0004
G1 X104.249 Y109.308 E.00285
G2 X103.984 Y109.158 I-1.397 J2.161 E.00046
G1 X105.931 Y109.158 E.00291
G1 X105.709 Y109.008 E.0004
G1 X103.692 Y109.008 E.00302
G1 X103.4 Y108.858 E.00049
G1 X105.475 Y108.858 E.00311
G1 X105.221 Y108.708 E.00044
G1 X103.107 Y108.708 E.00316
G2 X102.771 Y108.558 I-1.431 J2.759 E.00055
G1 X104.967 Y108.558 E.00329
G1 X104.713 Y108.408 E.00044
G1 X102.43 Y108.408 E.00342
G1 X102.09 Y108.258 E.00056
G1 X104.444 Y108.258 E.00352
G1 X104.152 Y108.108 E.00049
G1 X101.69 Y108.108 E.00369
G1 X101.286 Y107.958 E.00064
G1 X103.86 Y107.958 E.00385
G1 X103.567 Y107.808 E.00049
G1 X100.619 Y107.808 E.00441
G1 X100.128 Y107.658 F30000
G1 F3600
G1 X103.235 Y107.658 E.00465
G1 X102.894 Y107.508 E.00056
G1 X99.553 Y107.508 E.005
G1 X98.932 Y107.358 F30000
G1 F3600
G1 X102.554 Y107.358 E.00542
G2 X102.169 Y107.208 I-1.456 J3.164 E.00062
G1 X98.116 Y107.208 E.00607
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X100.116 Y107.208 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X97.022 Y107.058 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X101.766 Y107.058 E.0071
G1 X101.362 Y106.908 E.00064
G1 X88.525 Y106.908 E.01921
G1 X88.977 Y106.758 F30000
G1 F3600
G1 X101.103 Y106.758 E.01815
G1 X100.612 Y106.608 F30000
G1 F3600
G1 X89.469 Y106.608 E.01668
G1 X89.995 Y106.458 F30000
G1 F3600
G1 X100.086 Y106.458 E.0151
G1 X99.465 Y106.308 F30000
G1 F3600
G1 X90.616 Y106.308 E.01324
G1 X91.33 Y106.158 F30000
G1 F3600
G1 X98.751 Y106.158 E.01111
G1 X97.893 Y106.008 F30000
G1 F3600
G1 X92.187 Y106.008 E.00854
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X94.187 Y106.008 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X94.454 Y113.636 Z3.32 F30000
G1 X94.783 Y123.014 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G3 X94.564 Y123.085 I-.21 J-.275 E.00602
G1 X91.889 Y123.084 E.06862
G1 X91.889 Y120.285 E.0718
G1 X94.546 Y120.285 E.06815
G3 X94.918 Y120.592 I.038 J.333 E.01382
G1 X94.919 Y122.753 E.05542
G3 X94.827 Y122.974 I-.346 J-.014 E.00629
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X94.723 Y123.06 E-.01534
G1 X94.564 Y123.085 E-.01838
G1 X92.86 Y123.084 E-.19427
; WIPE_END
G1 E-.012 F1800
G1 X91.889 Y123.591 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X91.889 Y124.645 E.02704
G1 X91.169 Y124.645 E.01848
G1 X91.169 Y119.787 E.12463
G1 X94.751 Y119.788 E.09191
G3 X95.616 Y120.792 I-.075 J.939 E.03771
G1 X95.614 Y122.685 E.04855
G3 X94.666 Y123.592 I-.929 J-.022 E.03738
G1 X91.949 Y123.591 E.06971
M204 S10000
G1 X91.658 Y123.338 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.14198
G1 F18000
G1 X94.707 Y123.332 E.02183
G2 X94.839 Y123.305 I-.057 J-.611 E.00096
; LINE_WIDTH: 0.197579
G2 X95.014 Y123.212 I-.148 J-.488 E.00217
; LINE_WIDTH: 0.241593
G1 X95.104 Y123.131 E.00166
G2 X95.171 Y123.033 I-.933 J-.715 E.00165
; LINE_WIDTH: 0.291304
G1 X95.218 Y122.942 E.00174
G2 X95.26 Y122.767 I-1.1 J-.354 E.00308
; LINE_WIDTH: 0.328547
G2 X95.267 Y122.668 I-1.046 J-.124 E.00196
G2 X95.265 Y120.684 I-46.622 J-.941 E.03881
G2 X95.236 Y120.492 I-.638 J-.004 E.00381
; LINE_WIDTH: 0.274828
G1 X95.205 Y120.404 E.0015
G2 X95.155 Y120.313 I-1.084 J.54 E.00167
; LINE_WIDTH: 0.226817
G2 X94.983 Y120.141 I-.405 J.233 E.00314
; LINE_WIDTH: 0.187828
G1 X94.88 Y120.082 E.00122
; LINE_WIDTH: 0.133059
G2 X94.55 Y120.036 I-.271 J.735 E.0022
G1 X91.689 Y120.036 E.01879
; LINE_WIDTH: 0.156137
G1 X91.529 Y120.116 E.00145
; LINE_WIDTH: 0.20486
G1 X91.369 Y120.196 E.00203
G1 X91.529 Y119.988 F30000
; LINE_WIDTH: 0.354163
G1 F18000
G1 X91.529 Y123.284 E.07014
G3 X91.529 Y123.391 I-.318 J.053 E.00228
G1 X91.529 Y124.445 E.02242
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X91.529 Y123.391 E-.12015
G1 X91.529 Y123.284 E-.01214
G1 X91.529 Y122.445 E-.09571
; WIPE_END
G1 E-.012 F1800
G1 X91.533 Y123.338 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.340714
G1 F18000
G1 X91.564 Y123.338 E.00063
; LINE_WIDTH: 0.296288
G1 X91.595 Y123.338 E.00054
; LINE_WIDTH: 0.251862
G1 X91.627 Y123.338 E.00045
; LINE_WIDTH: 0.207436
G1 X91.658 Y123.338 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X91.627 Y123.338 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X91.882 Y124.457 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X91.244 Y124.457 E.00096
G1 X91.244 Y124.307 E.00022
G1 X91.814 Y124.307 E.00085
G1 X91.814 Y124.157 E.00022
G1 X91.244 Y124.157 E.00085
G1 X91.244 Y124.007 E.00022
G1 X91.814 Y124.007 E.00085
G1 X91.814 Y123.857 E.00022
G1 X91.244 Y123.857 E.00085
G1 X91.244 Y123.707 E.00022
G1 X91.814 Y123.707 E.00085
G1 X91.814 Y123.557 E.00022
G1 X91.244 Y123.557 E.00085
G1 X91.244 Y123.407 E.00022
G1 X95.112 Y123.407 E.00579
G2 X95.299 Y123.257 I-.652 J-1.007 E.00036
G1 X91.244 Y123.257 E.00607
G1 X91.244 Y123.107 E.00022
G1 X95.412 Y123.107 E.00624
G2 X95.484 Y122.957 I-.853 J-.5 E.00025
G1 X94.938 Y122.957 E.00082
G2 X94.987 Y122.807 I-.195 J-.146 E.00024
G1 X95.523 Y122.807 E.0008
G2 X95.54 Y122.657 I-.851 J-.171 E.00023
G1 X94.994 Y122.657 E.00082
G1 X94.994 Y122.507 E.00022
G1 X95.54 Y122.507 E.00082
G1 X95.54 Y122.357 E.00022
G1 X94.994 Y122.357 E.00082
G1 X94.994 Y122.207 E.00022
G1 X95.54 Y122.207 E.00082
G1 X95.54 Y122.057 E.00022
G1 X94.994 Y122.057 E.00082
G1 X94.993 Y121.907 E.00022
G1 X95.54 Y121.907 E.00082
G1 X95.54 Y121.757 E.00022
G1 X94.993 Y121.757 E.00082
G1 X94.993 Y121.607 E.00022
G1 X95.54 Y121.607 E.00082
G1 X95.541 Y121.457 E.00022
M73 P98 R0
G1 X94.993 Y121.457 E.00082
G1 X94.993 Y121.307 E.00022
G1 X95.541 Y121.307 E.00082
G1 X95.541 Y121.157 E.00022
G1 X94.993 Y121.157 E.00082
G1 X94.993 Y121.007 E.00022
G1 X95.541 Y121.007 E.00082
G1 X95.541 Y120.857 E.00022
G1 X94.993 Y120.857 E.00082
G1 X94.993 Y120.707 E.00022
G1 X95.538 Y120.707 E.00082
G2 X95.522 Y120.557 I-.812 J.011 E.00023
G1 X94.987 Y120.557 E.0008
G2 X94.939 Y120.407 I-.364 J.035 E.00024
G1 X95.55 Y120.407 E.00091
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X94.939 Y120.407 E-.06963
G1 X94.987 Y120.557 E-.01797
G1 X95.522 Y120.557 E-.06092
G1 X95.538 Y120.707 E-.0172
G1 X94.993 Y120.707 E-.06211
G1 X94.993 Y120.709 E-.00017
; WIPE_END
G1 E-.012 F1800
G1 X91.882 Y122.957 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X91.244 Y122.957 E.00096
G1 X91.244 Y122.807 E.00022
G1 X91.814 Y122.807 E.00085
G1 X91.814 Y122.657 E.00022
G1 X91.244 Y122.657 E.00085
G1 X91.244 Y122.507 E.00022
G1 X91.814 Y122.507 E.00085
G1 X91.814 Y122.357 E.00022
G1 X91.244 Y122.357 E.00085
G1 X91.244 Y122.207 E.00022
G1 X91.814 Y122.207 E.00085
G1 X91.814 Y122.057 E.00022
G1 X91.244 Y122.057 E.00085
G1 X91.244 Y121.907 E.00022
G1 X91.814 Y121.907 E.00085
G1 X91.814 Y121.757 E.00022
G1 X91.244 Y121.757 E.00085
G1 X91.244 Y121.607 E.00022
G1 X91.814 Y121.607 E.00085
G1 X91.814 Y121.457 E.00022
G1 X91.244 Y121.457 E.00085
G1 X91.244 Y121.307 E.00022
G1 X91.814 Y121.307 E.00085
G1 X91.814 Y121.157 E.00022
G1 X91.244 Y121.157 E.00085
G1 X91.244 Y121.007 E.00022
G1 X91.814 Y121.007 E.00085
G1 X91.814 Y120.857 E.00022
G1 X91.244 Y120.857 E.00085
G1 X91.244 Y120.707 E.00022
G1 X91.814 Y120.707 E.00085
G1 X91.814 Y120.557 E.00022
G1 X91.244 Y120.557 E.00085
G1 X91.244 Y120.407 E.00022
G1 X91.882 Y120.407 E.00096
G1 X91.176 Y120.257 F30000
G1 F3600
G1 X95.403 Y120.257 E.00633
G2 X95.286 Y120.107 I-1.068 J.71 E.00028
G1 X91.244 Y120.107 E.00605
G1 X91.244 Y119.957 E.00022
G1 X95.214 Y119.957 E.00594
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X93.214 Y119.957 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.122 Y121.538 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X85.778 Y121.538 E.08578
G3 X85.384 Y121.257 I-.055 J-.34 E.01377
G1 X85.383 Y120.58 E.01737
G3 X85.593 Y120.304 I.346 J.046 E.0093
G1 X85.701 Y120.285 E.0028
G1 X89.122 Y120.286 E.08777
G1 X89.122 Y121.478 E.03058
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X87.122 Y121.514 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.051 Y122.981 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G2 X89.124 Y122.807 I-.262 J-.212 E.00491
G1 X89.121 Y122.029 E.01994
G1 X85.625 Y122.029 E.0897
G3 X84.762 Y121.12 I.087 J-.946 E.03512
G3 X84.88 Y120.269 I1.699 J-.198 E.02226
G3 X85.635 Y119.789 I.811 J.44 E.02398
G1 X89.743 Y119.788 E.10538
G1 X89.745 Y122.607 E.07233
G3 X88.687 Y123.591 I-.95 J.039 E.04209
G1 X85.133 Y123.591 E.09119
G1 X85.308 Y123.102 E.01333
G1 X88.832 Y123.103 E.09039
G2 X89.009 Y123.024 I-.043 J-.334 E.00505
M204 S10000
G1 X89.271 Y123.142 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.197127
G1 F18000
G2 X89.412 Y122.857 I-.499 J-.424 E.00347
; LINE_WIDTH: 0.254478
G1 X89.431 Y122.728 E.00192
G3 X89.433 Y120.098 I1526.036 J-.438 E.03851
G1 X89.42 Y120.086 E.00026
; LINE_WIDTH: 0.205409
G1 X89.371 Y120.061 E.00062
; LINE_WIDTH: 0.156514
G1 X89.322 Y120.037 E.00044
; LINE_WIDTH: 0.132761
G1 X85.645 Y120.04 E.02408
G2 X85.278 Y120.199 I.058 J.637 E.00266
; LINE_WIDTH: 0.189735
G2 X85.113 Y120.457 I.343 J.401 E.00321
; LINE_WIDTH: 0.24346
G1 X85.086 Y120.557 E.00143
G2 X85.118 Y121.378 I2.229 J.324 E.01149
; LINE_WIDTH: 0.185957
G1 X85.154 Y121.463 E.00094
G2 X85.269 Y121.613 I.636 J-.367 E.00191
; LINE_WIDTH: 0.127494
G2 X85.656 Y121.783 I.439 J-.473 E.00267
G1 X89.322 Y121.784 E.02272
; LINE_WIDTH: 0.148571
G1 X89.358 Y121.784 E.00027
; LINE_WIDTH: 0.195441
G1 X89.393 Y121.785 E.00038
; LINE_WIDTH: 0.24231
G1 X89.428 Y121.785 E.00049
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X89.393 Y121.785 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.271 Y123.142 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.124903
G1 F18000
G3 X89.002 Y123.315 I-.48 J-.45 E.00195
G1 X88.855 Y123.348 E.00091
G1 X85.433 Y123.347 E.02061
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X87.433 Y123.348 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X89.363 Y123.407 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X85.278 Y123.407 E.00611
G1 X85.332 Y123.257 E.00024
G1 X89.428 Y123.257 E.00613
G2 X89.541 Y123.107 I-.645 J-.602 E.00028
G1 X89.03 Y123.106 E.00076
G2 X89.154 Y122.957 I-.16 J-.259 E.00029
G1 X89.609 Y122.957 E.00068
G2 X89.651 Y122.807 I-1.454 J-.487 E.00023
G1 X89.199 Y122.807 E.00068
G1 X89.198 Y122.657 E.00022
G1 X89.668 Y122.657 E.0007
G2 X89.67 Y122.507 I-2.403 J-.099 E.00022
G1 X89.198 Y122.507 E.00071
G1 X89.197 Y122.357 E.00022
G1 X89.67 Y122.357 E.00071
G1 X89.67 Y122.207 E.00022
G1 X89.197 Y122.207 E.00071
G1 X89.196 Y122.057 E.00022
G1 X89.67 Y122.057 E.00071
G1 X89.669 Y121.907 E.00022
G1 X85.399 Y121.907 E.00639
G3 X85.142 Y121.757 I.276 J-.765 E.00045
G1 X89.669 Y121.757 E.00678
G1 X89.669 Y121.607 E.00022
G1 X85.006 Y121.607 E.00698
G3 X84.92 Y121.457 I.774 J-.548 E.00026
G1 X85.39 Y121.457 E.0007
G3 X85.32 Y121.307 I.207 J-.187 E.00025
G1 X84.868 Y121.307 E.00068
G3 X84.842 Y121.157 I1.309 J-.31 E.00023
G1 X85.309 Y121.157 E.0007
G1 X85.309 Y121.007 E.00022
G1 X84.836 Y121.007 E.00071
G1 X84.835 Y120.857 E.00022
G1 X85.309 Y120.857 E.00071
G1 X85.309 Y120.707 E.00022
G1 X84.838 Y120.707 E.0007
G3 X84.857 Y120.557 I1.318 J.094 E.00023
G1 X85.312 Y120.557 E.00068
G3 X85.363 Y120.407 I.194 J-.018 E.00024
G1 X84.828 Y120.407 E.0008
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X85.363 Y120.407 E-.06098
G1 X85.312 Y120.557 E-.01807
G1 X84.857 Y120.557 E-.05178
G1 X84.838 Y120.707 E-.01724
G1 X85.309 Y120.707 E-.05363
G1 X85.309 Y120.857 E-.0171
G1 X85.228 Y120.857 E-.0092
; WIPE_END
G1 E-.012 F1800
G1 X89.13 Y121.457 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X89.669 Y121.457 E.00081
G1 X89.669 Y121.307 E.00022
G1 X89.197 Y121.307 E.00071
G1 X89.197 Y121.157 E.00022
G1 X89.669 Y121.157 E.00071
G1 X89.669 Y121.007 E.00022
G1 X89.197 Y121.007 E.00071
G1 X89.197 Y120.857 E.00022
G1 X89.669 Y120.857 E.00071
G1 X89.669 Y120.707 E.00022
G1 X89.197 Y120.707 E.00071
G1 X89.197 Y120.557 E.00022
G1 X89.669 Y120.557 E.00071
G1 X89.669 Y120.407 E.00022
G1 X89.13 Y120.407 E.00081
G1 X89.736 Y120.257 F30000
G1 F3600
G1 X84.98 Y120.247 E.00712
G3 X85.092 Y120.107 I.801 J.526 E.00027
G1 X89.668 Y120.107 E.00685
G1 X89.668 Y119.957 E.00022
G1 X85.165 Y119.957 E.00674
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X87.165 Y119.957 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.767 Y120.367 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X80.767 Y124.642 E.10965
G1 X80.047 Y124.642 E.01848
G1 X80.047 Y119.787 E.12453
G1 X83.714 Y119.787 E.09408
G1 X83.507 Y120.367 E.0158
G1 X80.827 Y120.367 E.06875
M204 S10000
G1 X80.567 Y120.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23726
G1 F18000
G1 X80.514 Y120.101 E.00078
; LINE_WIDTH: 0.284426
G1 X80.461 Y120.125 E.00097
; LINE_WIDTH: 0.353759
G1 X80.408 Y120.148 E.00123
G1 X80.407 Y120.167 E.0004
G1 X80.407 Y124.441 E.09082
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X80.407 Y122.441 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.567 Y120.077 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.213666
G1 F18000
G1 X83.398 Y120.077 E.03377
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X81.398 Y120.077 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.054 Y124.457 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X80.692 Y124.457 E.00096
G1 X80.692 Y124.307 E.00022
G1 X80.122 Y124.307 E.00085
G1 X80.122 Y124.157 E.00022
G1 X80.692 Y124.157 E.00085
G1 X80.692 Y124.007 E.00022
G1 X80.122 Y124.007 E.00085
G1 X80.122 Y123.857 E.00022
G1 X80.692 Y123.857 E.00085
G1 X80.692 Y123.707 E.00022
G1 X80.122 Y123.707 E.00085
G1 X80.122 Y123.557 E.00022
G1 X80.692 Y123.557 E.00085
G1 X80.692 Y123.407 E.00022
G1 X80.122 Y123.407 E.00085
G1 X80.122 Y123.257 E.00022
G1 X80.692 Y123.257 E.00085
G1 X80.692 Y123.107 E.00022
G1 X80.122 Y123.107 E.00085
G1 X80.122 Y122.957 E.00022
G1 X80.692 Y122.957 E.00085
G1 X80.692 Y122.807 E.00022
G1 X80.122 Y122.807 E.00085
G1 X80.122 Y122.657 E.00022
G1 X80.692 Y122.657 E.00085
G1 X80.692 Y122.507 E.00022
G1 X80.122 Y122.507 E.00085
G1 X80.122 Y122.357 E.00022
G1 X80.692 Y122.357 E.00085
G1 X80.692 Y122.207 E.00022
G1 X80.122 Y122.207 E.00085
G1 X80.122 Y122.057 E.00022
G1 X80.692 Y122.057 E.00085
G1 X80.692 Y121.907 E.00022
G1 X80.122 Y121.907 E.00085
G1 X80.122 Y121.757 E.00022
G1 X80.692 Y121.757 E.00085
G1 X80.692 Y121.607 E.00022
G1 X80.122 Y121.607 E.00085
G1 X80.122 Y121.457 E.00022
G1 X80.692 Y121.457 E.00085
G1 X80.692 Y121.307 E.00022
G1 X80.122 Y121.307 E.00085
G1 X80.122 Y121.157 E.00022
G1 X80.692 Y121.157 E.00085
G1 X80.692 Y121.007 E.00022
G1 X80.122 Y121.007 E.00085
G1 X80.122 Y120.857 E.00022
G1 X80.692 Y120.857 E.00085
G1 X80.692 Y120.707 E.00022
G1 X80.122 Y120.707 E.00085
G1 X80.122 Y120.557 E.00022
G1 X80.692 Y120.557 E.00085
G1 X80.692 Y120.407 E.00022
G1 X80.122 Y120.407 E.00085
G1 X80.122 Y120.257 E.00022
G1 X83.467 Y120.257 E.00501
G1 X83.52 Y120.107 E.00024
G1 X80.122 Y120.107 E.00509
G1 X80.122 Y119.957 E.00022
G1 X83.645 Y119.957 E.00527
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X81.645 Y119.957 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X81.075 Y127.568 Z3.32 F30000
G1 X80.691 Y132.694 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X79.971 Y132.404 E.01993
G1 X79.971 Y131.717 E.01761
G1 X80.691 Y132.008 E.01993
G1 X80.691 Y132.634 E.01607
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X79.971 Y132.404 E-.08622
G1 X79.971 Y131.717 E-.07824
G1 X80.488 Y131.926 E-.06354
; WIPE_END
G1 E-.012 F1800
G1 X80.691 Y127.076 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X83.429 Y127.076 E.07023
G3 X83.476 Y128.902 I.022 J.913 E.07353
G1 X80.691 Y128.899 E.07143
G1 X80.691 Y127.136 E.04523
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X82.691 Y127.092 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.691 Y129.415 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X80.691 Y130.616 E.0308
G1 X79.971 Y130.325 E.01993
G1 X79.971 Y126.579 E.09609
G1 X83.881 Y126.58 E.10031
G3 X85.106 Y127.877 I-.07 J1.292 E.0505
G3 X84.739 Y128.882 I-1.332 J.082 E.02823
G1 X84.514 Y129.099 E.00801
G3 X84.633 Y130.926 I-1.25 J.999 E.05002
G3 X83.149 Y131.656 I-1.431 J-1.037 E.04414
G1 X81.111 Y131.656 E.05229
G1 X81.111 Y131.137 E.01333
G1 X83.351 Y131.136 E.05745
G2 X83.328 Y129.416 I-.08 J-.859 E.06604
G1 X80.751 Y129.415 E.0661
M204 S10000
G1 X80.491 Y129.157 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.149784
G1 F18000
G1 X83.338 Y129.159 E.02186
G1 X83.579 Y129.173 E.00185
; LINE_WIDTH: 0.211747
G1 X83.662 Y129.179 E.00099
; LINE_WIDTH: 0.233789
G1 X84.368 Y129.243 E.0094
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X83.662 Y129.179 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X81.312 Y131.397 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.15198
G1 F18000
G1 X83.144 Y131.396 E.01434
G2 X83.848 Y131.248 I.087 J-1.335 E.0057
G1 X83.925 Y131.205 E.00069
; LINE_WIDTH: 0.19359
G1 X84.153 Y131.025 E.00308
; LINE_WIDTH: 0.237738
G2 X84.277 Y130.878 I-1.278 J-1.207 E.00262
G1 X84.285 Y130.867 E.00018
; LINE_WIDTH: 0.281685
G2 X84.342 Y130.779 I-.851 J-.611 E.00172
G1 X84.405 Y130.654 E.00231
; LINE_WIDTH: 0.330988
G2 X84.481 Y130.392 I-1.007 J-.433 E.00538
G1 X84.486 Y130.355 E.00074
; LINE_WIDTH: 0.373653
G2 X84.465 Y129.924 I-1.963 J-.122 E.00976
; LINE_WIDTH: 0.424561
G2 X84.367 Y129.632 I-1.1 J.209 E.00803
G1 X84.323 Y129.556 E.00228
; LINE_WIDTH: 0.463142
G2 X84.13 Y129.297 I-1.772 J1.115 E.00922
; LINE_WIDTH: 0.512059
G1 X84.056 Y129.215 E.00351
G1 X84.014 Y129.21 E.00134
G1 X84.056 Y129.215 F30000
; LINE_WIDTH: 0.512863
G1 F18000
G1 X84.063 Y129.191 E.0008
; LINE_WIDTH: 0.476145
G1 X84.07 Y129.167 E.00073
; LINE_WIDTH: 0.437521
G1 X84.086 Y129.133 E.001
; LINE_WIDTH: 0.395807
G1 X84.102 Y129.1 E.0009
; LINE_WIDTH: 0.354093
G1 X84.118 Y129.066 E.00079
; LINE_WIDTH: 0.312379
G1 X84.134 Y129.032 E.00069
; LINE_WIDTH: 0.267645
G1 X84.144 Y129.02 E.00024
G2 X84.522 Y128.622 I-1.994 J-2.274 E.00853
; LINE_WIDTH: 0.325941
G1 X84.585 Y128.527 E.00221
G2 X84.662 Y128.367 I-2.863 J-1.474 E.00344
; LINE_WIDTH: 0.379077
G2 X84.388 Y127.126 I-1.09 J-.41 E.03083
; LINE_WIDTH: 0.32674
G2 X84.202 Y126.986 I-.943 J1.053 E.00453
; LINE_WIDTH: 0.284701
G2 X84.091 Y126.933 I-.436 J.78 E.00205
; LINE_WIDTH: 0.244309
G1 X83.941 Y126.878 E.00223
; LINE_WIDTH: 0.210287
G1 X83.873 Y126.863 E.00082
; LINE_WIDTH: 0.178446
G1 X83.725 Y126.842 E.00144
; LINE_WIDTH: 0.130949
G2 X83.396 Y126.828 I-.204 J.933 E.00213
G1 X80.491 Y126.828 E.01867
; LINE_WIDTH: 0.154717
G1 X80.331 Y126.908 E.00143
; LINE_WIDTH: 0.202878
G1 X80.172 Y126.988 E.002
G1 X80.331 Y126.78 F30000
; LINE_WIDTH: 0.354032
G1 F18000
G1 X80.336 Y129.157 E.05056
G1 X80.491 Y129.157 F30000
; LINE_WIDTH: 0.170939
G1 F18000
G1 X80.46 Y129.157 E.00028
; LINE_WIDTH: 0.213903
G1 X80.429 Y129.157 E.00037
; LINE_WIDTH: 0.256867
G1 X80.398 Y129.157 E.00046
; LINE_WIDTH: 0.299832
G1 X80.367 Y129.157 E.00055
; LINE_WIDTH: 0.353868
G1 X80.336 Y129.157 E.00066
G1 X80.331 Y129.215 E.00123
G1 X80.331 Y130.254 E.02209
G1 X80.317 Y130.457 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X80.617 Y130.457 E.00045
G1 X80.617 Y130.307 E.00022
G1 X80.126 Y130.307 E.00073
G1 X80.046 Y130.274 E.00013
G1 X80.046 Y130.157 E.00018
G1 X80.617 Y130.157 E.00085
G1 X80.617 Y130.007 E.00022
G1 X80.046 Y130.007 E.00085
G1 X80.046 Y129.857 E.00022
G1 X80.617 Y129.857 E.00085
G1 X80.617 Y129.707 E.00022
G1 X80.046 Y129.707 E.00085
G1 X80.046 Y129.557 E.00022
G1 X80.684 Y129.557 E.00095
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X80.046 Y129.557 E-.07272
G1 X80.046 Y129.707 E-.0171
G1 X80.617 Y129.707 E-.06503
G1 X80.617 Y129.857 E-.0171
G1 X80.125 Y129.857 E-.05605
; WIPE_END
G1 E-.012 F1800
G1 X81.119 Y131.507 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X83.699 Y131.507 E.00386
G2 X84.05 Y131.357 I-.777 J-2.307 E.00057
G1 X81.119 Y131.357 E.00439
G1 X81.119 Y131.207 F30000
G1 F3600
G1 X84.274 Y131.207 E.00472
G2 X84.432 Y131.057 I-.97 J-1.179 E.00033
G1 X83.797 Y131.057 E.00095
G2 X83.966 Y130.907 I-.497 J-.73 E.00034
G1 X84.555 Y130.907 E.00088
G2 X84.645 Y130.757 I-.83 J-.599 E.00026
G1 X84.078 Y130.753 E.00085
G2 X84.145 Y130.607 I-.736 J-.425 E.00024
G1 X84.712 Y130.607 E.00085
G2 X84.755 Y130.457 I-.734 J-.292 E.00023
G1 X84.187 Y130.457 E.00085
G2 X84.203 Y130.307 I-1.047 J-.19 E.00023
G1 X84.782 Y130.307 E.00087
G1 X84.783 Y130.157 E.00022
G1 X84.194 Y130.157 E.00088
G2 X84.168 Y130.007 I-.66 J.035 E.00023
G1 X84.78 Y130.007 E.00092
G2 X84.768 Y129.857 I-2.17 J.109 E.00023
G1 X84.112 Y129.857 E.00098
G2 X84.024 Y129.707 I-.476 J.179 E.00026
G1 X84.737 Y129.707 E.00107
G2 X84.688 Y129.557 I-1.417 J.381 E.00024
G1 X83.774 Y129.557 E.00137
G1 X84.694 Y129.407 F30000
G1 F3600
G1 X80.046 Y129.407 E.00696
G1 X80.046 Y129.257 E.00022
G1 X84.525 Y129.257 E.0067
G1 X84.43 Y129.107 E.00027
G1 X80.046 Y129.107 E.00656
G1 X80.046 Y128.957 E.00022
G1 X84.553 Y128.957 E.00675
G2 X84.706 Y128.807 I-1.205 J-1.377 E.00032
G1 X84.013 Y128.807 E.00104
G2 X84.182 Y128.657 I-.611 J-.86 E.00034
G1 X84.823 Y128.657 E.00096
G1 X84.91 Y128.507 E.00026
G1 X84.289 Y128.507 E.00093
G2 X84.364 Y128.357 I-.412 J-.3 E.00025
G1 X84.972 Y128.357 E.00091
G2 X85.011 Y128.207 I-.849 J-.302 E.00023
G1 X84.409 Y128.207 E.0009
G2 X84.43 Y128.057 I-.559 J-.155 E.00023
G1 X85.03 Y128.057 E.0009
G1 X85.031 Y127.907 E.00022
G1 X84.428 Y127.907 E.0009
G2 X84.405 Y127.757 I-.419 J-.014 E.00023
G1 X85.023 Y127.757 E.00092
G2 X84.996 Y127.607 I-.791 J.061 E.00023
G1 X84.359 Y127.607 E.00095
G2 X84.284 Y127.457 I-.827 J.319 E.00025
G1 X84.951 Y127.457 E.001
G2 X84.888 Y127.307 I-1.189 J.412 E.00024
G1 X84.17 Y127.307 E.00108
G2 X83.994 Y127.157 I-.644 J.576 E.00035
G1 X84.881 Y127.157 E.00133
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X83.994 Y127.157 E-.10102
G1 X84.17 Y127.307 E-.02632
G1 X84.888 Y127.307 E-.0819
G1 X84.951 Y127.457 E-.01855
G1 X84.95 Y127.457 E-.00021
; WIPE_END
G1 E-.012 F1800
G1 X80.684 Y128.807 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X80.046 Y128.807 E.00095
G1 X80.046 Y128.657 E.00022
G1 X80.617 Y128.657 E.00085
G1 X80.617 Y128.507 E.00022
G1 X80.046 Y128.507 E.00085
G1 X80.046 Y128.357 E.00022
G1 X80.617 Y128.357 E.00085
G1 X80.617 Y128.207 E.00022
G1 X80.046 Y128.207 E.00085
G1 X80.046 Y128.057 E.00022
G1 X80.617 Y128.057 E.00085
G1 X80.617 Y127.907 E.00022
G1 X80.046 Y127.907 E.00085
G1 X80.046 Y127.757 E.00022
G1 X80.617 Y127.757 E.00085
G1 X80.617 Y127.607 E.00022
G1 X80.046 Y127.607 E.00085
G1 X80.046 Y127.457 E.00022
G1 X80.617 Y127.457 E.00085
G1 X80.617 Y127.307 E.00022
G1 X80.046 Y127.307 E.00085
G1 X80.046 Y127.157 E.00022
G1 X80.684 Y127.157 E.00095
G1 X79.979 Y127.007 F30000
G1 F3600
G1 X84.674 Y127.007 E.00703
G2 X84.497 Y126.857 I-.653 J.59 E.00035
G1 X80.046 Y126.857 E.00666
G1 X80.046 Y126.707 E.00022
G1 X84.378 Y126.707 E.00648
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X82.378 Y126.707 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X80.369 Y132.556 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X80.617 Y132.556 E.00037
G1 X80.617 Y132.406 E.00022
G1 X80.178 Y132.406 E.00066
G1 X80.046 Y132.353 E.00021
G1 X80.046 Y132.256 E.00014
G1 X80.617 Y132.256 E.00085
G1 X80.617 Y132.106 E.00022
G1 X80.046 Y132.106 E.00085
G1 X80.046 Y131.956 E.00022
G1 X80.544 Y131.956 E.00074
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X80.046 Y131.956 E-.05672
G1 X80.046 Y132.106 E-.0171
G1 X80.617 Y132.106 E-.06503
G1 X80.617 Y132.256 E-.0171
G1 X80.046 Y132.256 E-.06503
G1 X80.046 Y132.318 E-.00702
; WIPE_END
G1 E-.012 F1800
G1 X87.196 Y129.648 Z3.32 F30000
G1 X90.727 Y128.33 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G1 X87.383 Y128.33 E.08578
G3 X86.989 Y128.049 I-.055 J-.34 E.01377
G1 X86.988 Y127.372 E.01737
G3 X87.198 Y127.096 I.346 J.046 E.0093
G1 X87.306 Y127.077 E.0028
G1 X90.727 Y127.078 E.08777
G1 X90.727 Y128.27 E.03058
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X88.727 Y128.306 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X90.656 Y129.773 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G2 X90.729 Y129.598 I-.262 J-.212 E.00491
G1 X90.727 Y128.821 E.01994
G1 X87.23 Y128.821 E.0897
G3 X86.367 Y127.911 I.087 J-.946 E.03512
G3 X86.485 Y127.061 I1.698 J-.198 E.02225
G3 X87.24 Y126.581 I.811 J.44 E.02398
G1 X91.348 Y126.579 E.10538
G1 X91.349 Y129.32 E.0703
G3 X90.382 Y130.383 I-.939 J.117 E.04187
G1 X86.738 Y130.383 E.09348
G1 X86.914 Y129.894 E.01333
G1 X90.437 Y129.895 E.0904
G2 X90.614 Y129.816 I-.043 J-.334 E.00504
M204 S10000
G1 X90.876 Y129.934 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.197096
G1 F18000
G2 X91.018 Y129.649 I-.489 J-.421 E.00348
; LINE_WIDTH: 0.254073
G1 X91.023 Y129.625 E.00037
G2 X91.038 Y126.89 I-59.095 J-1.686 E.03998
G1 X91.025 Y126.878 E.00026
; LINE_WIDTH: 0.205409
G1 X90.976 Y126.853 E.00062
; LINE_WIDTH: 0.156514
G1 X90.927 Y126.829 E.00044
; LINE_WIDTH: 0.132718
G1 X87.25 Y126.832 E.02407
G2 X86.883 Y126.991 I.049 J.616 E.00267
; LINE_WIDTH: 0.189733
G2 X86.718 Y127.249 I.387 J.429 E.0032
; LINE_WIDTH: 0.243446
G1 X86.691 Y127.349 E.00144
G2 X86.723 Y128.169 I2.229 J.324 E.01149
; LINE_WIDTH: 0.185993
G1 X86.76 Y128.255 E.00095
G2 X86.874 Y128.405 I.636 J-.368 E.0019
; LINE_WIDTH: 0.127494
G2 X87.261 Y128.575 I.439 J-.472 E.00267
G1 X90.927 Y128.575 E.02272
; LINE_WIDTH: 0.148491
G1 X90.963 Y128.576 E.00027
; LINE_WIDTH: 0.1952
G1 X90.998 Y128.576 E.00038
; LINE_WIDTH: 0.24191
G1 X91.033 Y128.577 E.00049
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X90.998 Y128.576 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X90.876 Y129.934 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.125768
G1 F18000
G3 X90.607 Y130.107 I-.465 J-.428 E.00196
G1 X90.461 Y130.14 E.00091
G1 X87.039 Y130.139 E.02081
G1 X86.773 Y130.307 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X90.503 Y130.307 E.00558
G2 X90.912 Y130.157 I-.067 J-.817 E.00066
G1 X86.899 Y130.157 E.00601
G1 X86.953 Y130.007 E.00024
G1 X91.07 Y130.007 E.00616
G2 X91.169 Y129.857 I-.597 J-.502 E.00027
G1 X90.68 Y129.857 E.00073
G2 X90.777 Y129.707 I-.273 J-.281 E.00027
G1 X91.229 Y129.7 E.00068
G2 X91.265 Y129.557 I-.814 J-.279 E.00022
G1 X90.804 Y129.557 E.00069
G1 X90.803 Y129.407 E.00022
G1 X91.273 Y129.407 E.0007
G1 X91.274 Y129.257 E.00022
G1 X90.803 Y129.257 E.00071
G1 X90.802 Y129.107 E.00022
G1 X91.274 Y129.107 E.00071
G1 X91.274 Y128.957 E.00022
G1 X90.802 Y128.957 E.00071
G1 X90.801 Y128.807 E.00022
G1 X91.274 Y128.807 E.00071
G1 X91.274 Y128.657 E.00022
G1 X86.908 Y128.657 E.00653
G3 X86.704 Y128.507 I.572 J-.992 E.00038
G1 X91.274 Y128.507 E.00684
G1 X91.274 Y128.357 E.00022
G1 X86.504 Y128.357 E.00714
G1 X87.048 Y128.207 F30000
G1 F3600
G1 X86.507 Y128.207 E.00081
G3 X86.464 Y128.057 I1.026 J-.377 E.00023
G1 X86.914 Y128.057 E.00067
G1 X86.914 Y127.907 E.00022
G1 X86.442 Y127.907 E.00071
G1 X86.441 Y127.757 E.00022
G1 X86.914 Y127.757 E.00071
G1 X86.914 Y127.607 E.00022
G1 X86.44 Y127.607 E.00071
G3 X86.447 Y127.457 I1.054 J-.022 E.00022
G1 X86.914 Y127.457 E.0007
G3 X86.927 Y127.307 I.324 J-.047 E.00023
G1 X86.472 Y127.307 E.00068
G3 X86.522 Y127.157 I.982 J.245 E.00024
G1 X87.085 Y127.157 E.00084
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X86.522 Y127.157 E-.06417
G1 X86.472 Y127.307 E-.01803
G1 X86.927 Y127.307 E-.05186
G1 X86.914 Y127.457 E-.01716
G1 X86.447 Y127.457 E-.05314
G1 X86.44 Y127.607 E-.01712
G1 X86.497 Y127.607 E-.00652
; WIPE_END
G1 E-.012 F1800
G1 X90.735 Y128.207 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X91.274 Y128.207 E.00081
G1 X91.274 Y128.057 E.00022
G1 X90.802 Y128.057 E.00071
G1 X90.802 Y127.907 E.00022
G1 X91.274 Y127.907 E.00071
G1 X91.274 Y127.757 E.00022
G1 X90.802 Y127.757 E.00071
G1 X90.802 Y127.607 E.00022
G1 X91.274 Y127.607 E.00071
G1 X91.273 Y127.457 E.00022
G1 X90.802 Y127.457 E.00071
G1 X90.802 Y127.307 E.00022
G1 X91.273 Y127.307 E.00071
G1 X91.273 Y127.157 E.00022
G1 X90.735 Y127.157 E.00081
G1 X91.341 Y127.007 F30000
G1 F3600
G1 X86.607 Y127.007 E.00708
G3 X86.742 Y126.857 I1.038 J.794 E.0003
G1 X91.273 Y126.857 E.00678
G1 X91.273 Y126.707 E.00022
G1 X86.834 Y126.707 E.00664
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X88.834 Y126.707 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X96.078 Y129.109 Z3.32 F30000
G1 X98.258 Y129.831 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G2 X98.416 Y129.552 I-.167 J-.279 E.00861
G1 X98.416 Y126.579 E.07627
G1 X99.111 Y126.579 E.01783
G1 X99.111 Y129.472 E.07422
G3 X98.24 Y130.381 I-.936 J-.025 E.03542
G1 X92.774 Y130.383 E.14024
G1 X92.774 Y126.579 E.09758
G1 X93.461 Y126.579 E.01764
G1 X93.461 Y129.256 E.06866
G2 X93.466 Y129.616 I3.782 J.134 E.00926
G2 X93.789 Y129.876 I.309 J-.053 E.01162
G1 X95.263 Y129.876 E.03783
G2 X95.604 Y129.535 I.012 J-.328 E.01389
G1 X95.603 Y126.579 E.07582
G1 X96.296 Y126.579 E.01779
G2 X96.296 Y129.561 I196.56 J1.484 E.0765
G2 X96.633 Y129.876 I.328 J-.013 E.01312
G1 X98.074 Y129.877 E.03697
G2 X98.203 Y129.857 I.017 J-.325 E.00338
M204 S10000
G1 X98.229 Y130.122 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178436
G1 F18000
G2 X98.387 Y130.08 I-.358 J-1.664 E.00157
G1 X98.454 Y130.04 E.00075
; LINE_WIDTH: 0.225551
G2 X98.635 Y129.877 I-.273 J-.485 E.00312
; LINE_WIDTH: 0.26577
G2 X98.718 Y129.712 I-.348 J-.279 E.00287
; LINE_WIDTH: 0.326805
G2 X98.764 Y129.462 I-.871 J-.289 E.00496
G1 X98.764 Y126.779 E.05219
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X98.764 Y128.779 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X95.95 Y126.779 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.327416
G1 F18000
G1 X95.95 Y129.704 E.05702
; LINE_WIDTH: 0.381582
G3 X95.95 Y130.182 I-29.923 J.259 E.01103
G1 X96.246 Y129.917 F30000
; LINE_WIDTH: 0.212791
G1 F18000
G1 X95.564 Y130.096 E.00837
; LINE_WIDTH: 0.182221
G1 X95.436 Y130.12 E.00128
; LINE_WIDTH: 0.145992
G3 X95.273 Y130.129 I-.366 J-5.139 E.00121
G3 X93.773 Y130.129 I-.747 J-28.059 E.01115
G3 X92.974 Y130.03 I.178 J-4.704 E.00598
G1 X93.632 Y130.182 F30000
; LINE_WIDTH: 0.430542
G1 F18000
G1 X93.18 Y129.976 E.01308
G1 X93.168 Y129.929 E.0013
; LINE_WIDTH: 0.400929
G1 X93.147 Y129.823 E.00263
; LINE_WIDTH: 0.359555
G1 X93.126 Y129.717 E.00233
; LINE_WIDTH: 0.321704
G3 X93.117 Y129.519 I1.143 J-.151 E.0038
G1 X93.117 Y129.512 E.00013
G2 X93.118 Y126.779 I-1464.87 J-1.495 E.05224
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X93.117 Y128.779 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X95.623 Y129.949 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.186647
G1 F18000
G1 X96.389 Y130.108 E.00793
; LINE_WIDTH: 0.141421
G1 X96.62 Y130.129 E.00166
G2 X98.083 Y130.129 I.73 J-34.94 E.01042
G2 X98.229 Y130.122 I.018 J-1.085 E.00104
G1 X98.535 Y130.307 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X92.849 Y130.307 E.00851
G1 X92.849 Y130.157 E.00022
G1 X98.67 Y130.157 E.00871
G2 X98.831 Y130.007 I-.655 J-.865 E.00033
G1 X92.849 Y130.007 E.00895
G1 X92.849 Y129.857 E.00022
G1 X93.529 Y129.857 E.00102
G3 X93.422 Y129.707 I.114 J-.195 E.00028
G1 X92.849 Y129.707 E.00086
G1 X92.849 Y129.557 E.00022
G1 X93.388 Y129.557 E.00081
G3 X93.386 Y129.407 I1.573 J-.095 E.00022
G1 X92.849 Y129.407 E.0008
G1 X92.849 Y129.257 E.00022
G1 X93.386 Y129.257 E.00081
G1 X93.386 Y129.107 E.00022
G1 X92.849 Y129.107 E.00081
G1 X92.849 Y128.957 E.00022
G1 X93.386 Y128.957 E.00081
G1 X93.386 Y128.807 E.00022
G1 X92.849 Y128.807 E.00081
G1 X92.849 Y128.657 E.00022
G1 X93.386 Y128.657 E.00081
G1 X93.386 Y128.507 E.00022
G1 X92.849 Y128.507 E.00081
G1 X92.849 Y128.357 E.00022
G1 X93.386 Y128.357 E.00081
G1 X93.386 Y128.207 E.00022
G1 X92.849 Y128.207 E.00081
G1 X92.849 Y128.057 E.00022
G1 X93.386 Y128.057 E.00081
G1 X93.386 Y127.907 E.00022
G1 X92.849 Y127.907 E.00081
G1 X92.849 Y127.757 E.00022
G1 X93.386 Y127.757 E.00081
G1 X93.386 Y127.607 E.00022
G1 X92.849 Y127.607 E.00081
G1 X92.849 Y127.457 E.00022
G1 X93.386 Y127.457 E.00081
G1 X93.386 Y127.307 E.00022
G1 X92.849 Y127.307 E.00081
G1 X92.849 Y127.157 E.00022
G1 X93.386 Y127.157 E.00081
G1 X93.386 Y127.007 E.00022
G1 X92.849 Y127.007 E.00081
G1 X92.849 Y126.857 E.00022
G1 X93.386 Y126.857 E.00081
G1 X93.386 Y126.707 E.00022
G1 X92.781 Y126.707 E.00091
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X93.386 Y126.707 E-.06901
G1 X93.386 Y126.857 E-.0171
G1 X92.849 Y126.857 E-.06132
G1 X92.849 Y127.007 E-.0171
G1 X93.386 Y127.007 E-.06132
G1 X93.386 Y127.026 E-.00215
; WIPE_END
G1 E-.012 F1800
G1 X95.41 Y129.857 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X96.36 Y129.857 E.00142
G3 X96.255 Y129.707 I.139 J-.209 E.00028
G1 X95.644 Y129.707 E.00091
G2 X95.677 Y129.557 I-.254 J-.133 E.00023
G1 X96.221 Y129.557 E.00082
G1 X96.221 Y129.407 E.00022
G1 X95.679 Y129.407 E.00081
G1 X95.679 Y129.257 E.00022
G1 X96.221 Y129.257 E.00081
G1 X96.221 Y129.107 E.00022
G1 X95.679 Y129.107 E.00081
G1 X95.678 Y128.957 E.00022
G1 X96.221 Y128.957 E.00081
G1 X96.221 Y128.807 E.00022
G1 X95.678 Y128.807 E.00081
G1 X95.678 Y128.657 E.00022
G1 X96.221 Y128.657 E.00081
G1 X96.221 Y128.507 E.00022
G1 X95.678 Y128.507 E.00081
G1 X95.678 Y128.357 E.00022
G1 X96.221 Y128.357 E.00081
G1 X96.221 Y128.207 E.00022
G1 X95.678 Y128.207 E.00081
G1 X95.678 Y128.057 E.00022
G1 X96.221 Y128.057 E.00081
G1 X96.221 Y127.907 E.00022
G1 X95.678 Y127.907 E.00081
G1 X95.678 Y127.757 E.00022
G1 X96.221 Y127.757 E.00081
G1 X96.221 Y127.607 E.00022
G1 X95.678 Y127.607 E.00081
G1 X95.678 Y127.457 E.00022
G1 X96.221 Y127.457 E.00081
G1 X96.221 Y127.307 E.00022
G1 X95.678 Y127.307 E.00081
G1 X95.678 Y127.157 E.00022
G1 X96.221 Y127.157 E.00081
G1 X96.221 Y127.007 E.00022
G1 X95.678 Y127.007 E.00081
G1 X95.678 Y126.857 E.00022
G1 X96.221 Y126.857 E.00081
G1 X96.221 Y126.707 E.00022
G1 X95.61 Y126.707 E.00091
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X96.221 Y126.707 E-.06966
G1 X96.221 Y126.857 E-.0171
G1 X95.678 Y126.857 E-.06196
G1 X95.678 Y127.007 E-.0171
G1 X96.221 Y127.007 E-.06195
G1 X96.221 Y127.009 E-.00024
; WIPE_END
G1 E-.012 F1800
G1 X98.218 Y129.857 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X98.926 Y129.857 E.00106
G2 X98.985 Y129.707 I-.721 J-.368 E.00024
G1 X98.459 Y129.707 E.00079
G2 X98.491 Y129.557 I-.451 J-.173 E.00023
G1 X99.029 Y129.557 E.00081
G2 X99.036 Y129.407 I-.964 J-.121 E.00022
G1 X98.491 Y129.407 E.00082
G1 X98.491 Y129.257 E.00022
G1 X99.036 Y129.257 E.00082
G1 X99.036 Y129.107 E.00022
G1 X98.491 Y129.107 E.00082
G1 X98.491 Y128.957 E.00022
G1 X99.036 Y128.957 E.00082
G1 X99.036 Y128.807 E.00022
G1 X98.491 Y128.807 E.00082
G1 X98.491 Y128.657 E.00022
G1 X99.036 Y128.657 E.00082
G1 X99.036 Y128.507 E.00022
G1 X98.491 Y128.507 E.00082
G1 X98.491 Y128.357 E.00022
G1 X99.036 Y128.357 E.00082
G1 X99.036 Y128.207 E.00022
G1 X98.491 Y128.207 E.00082
G1 X98.491 Y128.057 E.00022
G1 X99.036 Y128.057 E.00082
G1 X99.036 Y127.907 E.00022
G1 X98.491 Y127.907 E.00082
G1 X98.491 Y127.757 E.00022
G1 X99.036 Y127.757 E.00082
G1 X99.036 Y127.607 E.00022
G1 X98.491 Y127.607 E.00082
G1 X98.491 Y127.457 E.00022
G1 X99.036 Y127.457 E.00082
G1 X99.036 Y127.307 E.00022
G1 X98.491 Y127.307 E.00082
G1 X98.491 Y127.157 E.00022
G1 X99.036 Y127.157 E.00082
G1 X99.036 Y127.007 E.00022
G1 X98.491 Y127.007 E.00082
G1 X98.491 Y126.857 E.00022
G1 X99.036 Y126.857 E.00082
G1 X99.036 Y126.707 E.00022
G1 X98.423 Y126.707 E.00092
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X99.036 Y126.707 E-.06986
G1 X99.036 Y126.857 E-.0171
G1 X98.491 Y126.857 E-.06217
G1 X98.491 Y127.007 E-.0171
G1 X99.033 Y127.007 E-.06177
; WIPE_END
G1 E-.012 F1800
G1 X104.144 Y127.256 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G3 X104.187 Y127.393 I-.305 J.169 E.00371
G1 X104.187 Y129.533 E.05491
G3 X103.836 Y129.877 I-.326 J.018 E.01428
G1 X101.157 Y129.876 E.06872
G1 X101.157 Y127.077 E.0718
G1 X103.819 Y127.077 E.06828
G3 X104.111 Y127.206 I.021 J.348 E.00851
G1 E-.56 F1800
; WIPE_START
G1 F9600
M204 S10000
G1 X104.187 Y127.393 E-.02305
G1 X104.187 Y129.191 E-.20495
; WIPE_END
G1 E-.012 F1800
G1 X101.157 Y130.383 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F9600
M204 S5000
G1 X101.157 Y131.437 E.02704
G1 X100.437 Y131.437 E.01848
G1 X100.437 Y126.579 E.12463
G1 X104.065 Y126.585 E.09307
G3 X104.884 Y127.533 I-.115 J.927 E.03523
G1 X104.884 Y129.443 E.049
G3 X103.916 Y130.383 I-.938 J.002 E.03865
G1 X101.217 Y130.383 E.06922
M204 S10000
G1 X100.926 Y130.129 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.142385
G1 F18000
G1 X104.005 Y130.121 E.02213
G2 X104.156 Y130.079 I-.211 J-1.039 E.00113
; LINE_WIDTH: 0.208671
G1 X104.183 Y130.065 E.00035
G2 X104.325 Y129.968 I-.184 J-.423 E.00201
; LINE_WIDTH: 0.247809
G2 X104.444 Y129.82 I-.43 J-.466 E.00271
; LINE_WIDTH: 0.291901
G2 X104.526 Y129.562 I-.589 J-.329 E.00466
; LINE_WIDTH: 0.327725
G1 X104.529 Y129.545 E.00033
G2 X104.536 Y129.429 I-.817 J-.109 E.00228
G1 X104.535 Y127.543 E.0368
G2 X104.49 Y127.236 I-.819 J-.035 E.00609
; LINE_WIDTH: 0.262892
G1 X104.385 Y127.053 E.00321
; LINE_WIDTH: 0.222134
G1 X104.25 Y126.93 E.00228
; LINE_WIDTH: 0.188274
G1 X104.141 Y126.874 E.00126
; LINE_WIDTH: 0.133657
G1 X104.001 Y126.833 E.00096
G1 X103.828 Y126.827 E.00114
G2 X100.957 Y126.828 I-1.417 J88.013 E.01897
; LINE_WIDTH: 0.156522
G1 X100.797 Y126.908 E.00145
; LINE_WIDTH: 0.205375
G1 X100.637 Y126.988 E.00203
G1 X100.797 Y126.779 F30000
; LINE_WIDTH: 0.354013
G1 F18000
G1 X100.797 Y130.076 E.07011
G3 X100.797 Y130.183 I-.317 J.053 E.00228
G1 X100.797 Y131.237 E.02241
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X100.797 Y130.183 E-.12015
G1 X100.797 Y130.076 E-.01215
G1 X100.797 Y129.237 E-.09571
; WIPE_END
G1 E-.012 F1800
G1 X100.802 Y130.129 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.340588
G1 F18000
G1 X100.833 Y130.129 E.00063
; LINE_WIDTH: 0.296212
G1 X100.864 Y130.129 E.00054
; LINE_WIDTH: 0.251836
G1 X100.895 Y130.129 E.00045
; LINE_WIDTH: 0.20746
G1 X100.926 Y130.129 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X100.895 Y130.129 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X101.15 Y131.357 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X100.512 Y131.357 E.00095
G1 X100.512 Y131.207 E.00022
G1 X101.082 Y131.207 E.00085
G1 X101.082 Y131.057 E.00022
G1 X100.512 Y131.057 E.00085
G1 X100.512 Y130.907 E.00022
G1 X101.082 Y130.907 E.00085
G1 X101.082 Y130.757 E.00022
G1 X100.512 Y130.757 E.00085
G1 X100.512 Y130.607 E.00022
G1 X101.082 Y130.607 E.00085
G1 X101.082 Y130.457 E.00022
G1 X100.512 Y130.457 E.00085
G1 X100.512 Y130.307 E.00022
G1 X104.315 Y130.307 E.00569
G1 X104.552 Y130.157 F30000
G1 F3600
G1 X100.512 Y130.157 E.00605
G1 X100.512 Y130.007 E.00022
G1 X104.604 Y130.007 E.00612
G2 X104.704 Y129.857 I-.573 J-.493 E.00027
G1 X104.12 Y129.857 E.00087
G2 X104.229 Y129.707 I-.314 J-.343 E.00028
G1 X104.766 Y129.707 E.0008
G1 X104.799 Y129.557 E.00023
G1 X104.26 Y129.557 E.00081
G2 X104.262 Y129.407 I-.612 J-.084 E.00023
G1 X104.809 Y129.407 E.00082
G1 X104.809 Y129.257 E.00022
G1 X104.262 Y129.257 E.00082
G1 X104.262 Y129.107 E.00022
G1 X104.809 Y129.107 E.00082
G1 X104.809 Y128.957 E.00022
G1 X104.262 Y128.957 E.00082
G1 X104.262 Y128.807 E.00022
G1 X104.809 Y128.807 E.00082
G1 X104.809 Y128.657 E.00022
G1 X104.262 Y128.657 E.00082
G1 X104.262 Y128.507 E.00022
G1 X104.809 Y128.507 E.00082
G1 X104.809 Y128.357 E.00022
G1 X104.262 Y128.357 E.00082
G1 X104.262 Y128.207 E.00022
G1 X104.809 Y128.207 E.00082
G1 X104.809 Y128.057 E.00022
G1 X104.262 Y128.057 E.00082
G1 X104.262 Y127.907 E.00022
G1 X104.809 Y127.907 E.00082
G1 X104.809 Y127.757 E.00022
G1 X104.262 Y127.757 E.00082
G1 X104.262 Y127.607 E.00022
G1 X104.809 Y127.607 E.00082
G2 X104.804 Y127.457 I-1.324 J-.035 E.00022
G1 X104.262 Y127.457 E.00081
G2 X104.248 Y127.307 I-.438 J-.035 E.00023
G1 X104.78 Y127.307 E.0008
G2 X104.729 Y127.157 I-.958 J.239 E.00024
G1 X104.084 Y127.157 E.00097
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X104.729 Y127.157 E-.07353
G1 X104.78 Y127.307 E-.01804
G1 X104.248 Y127.307 E-.06065
G1 X104.262 Y127.457 E-.01717
G1 X104.776 Y127.457 E-.0586
; WIPE_END
G1 E-.012 F1800
G1 X101.15 Y129.857 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X100.512 Y129.857 E.00095
G1 X100.512 Y129.707 E.00022
G1 X101.082 Y129.707 E.00085
G1 X101.082 Y129.557 E.00022
G1 X100.512 Y129.557 E.00085
G1 X100.512 Y129.407 E.00022
G1 X101.082 Y129.407 E.00085
G1 X101.082 Y129.257 E.00022
G1 X100.512 Y129.257 E.00085
G1 X100.512 Y129.107 E.00022
G1 X101.082 Y129.107 E.00085
G1 X101.082 Y128.957 E.00022
G1 X100.512 Y128.957 E.00085
G1 X100.512 Y128.807 E.00022
G1 X101.082 Y128.807 E.00085
G1 X101.082 Y128.657 E.00022
G1 X100.512 Y128.657 E.00085
G1 X100.512 Y128.507 E.00022
G1 X101.082 Y128.507 E.00085
G1 X101.082 Y128.357 E.00022
G1 X100.512 Y128.357 E.00085
G1 X100.512 Y128.207 E.00022
G1 X101.082 Y128.207 E.00085
G1 X101.082 Y128.057 E.00022
G1 X100.512 Y128.057 E.00085
G1 X100.512 Y127.907 E.00022
G1 X101.082 Y127.907 E.00085
G1 X101.082 Y127.757 E.00022
G1 X100.512 Y127.757 E.00085
G1 X100.512 Y127.607 E.00022
G1 X101.082 Y127.607 E.00085
G1 X101.082 Y127.457 E.00022
G1 X100.512 Y127.457 E.00085
G1 X100.512 Y127.307 E.00022
G1 X101.082 Y127.307 E.00085
G1 X101.082 Y127.157 E.00022
G1 X100.512 Y127.157 E.00085
G1 X100.512 Y127.007 E.00022
G1 X104.644 Y127.007 E.00618
G2 X104.51 Y126.857 I-.854 J.631 E.0003
G1 X100.512 Y126.857 E.00598
G1 X100.512 Y126.707 E.00022
G1 X104.418 Y126.707 E.00585
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X102.418 Y126.707 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X107.035 Y127.117 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F9600
M204 S5000
G2 X106.864 Y127.406 I.165 J.292 E.00903
G1 X106.865 Y130.383 E.07637
G1 X106.236 Y130.383 E.01614
G1 X106.236 Y127.551 E.07264
G3 X107.09 Y126.581 I.941 J-.033 E.03653
G3 X109.911 Y126.579 I1.542 J194.263 E.07238
G3 X110.794 Y127.517 I-.059 J.94 E.0364
G1 X110.795 Y130.383 E.07351
G1 X110.174 Y130.383 E.01593
G1 X110.175 Y127.367 E.07739
G2 X109.864 Y127.076 I-.333 J.045 E.01181
G1 X107.144 Y127.078 E.06979
G2 X107.09 Y127.092 I.056 J.331 E.00144
M204 S10000
G1 X106.736 Y127.009 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136151
G1 F18000
G3 X107.095 Y126.831 I.466 J.489 E.00276
G1 X109.882 Y126.828 E.01888
G3 X110.217 Y126.94 I-.032 J.65 E.00242
G1 X110.308 Y127.022 E.00083
; LINE_WIDTH: 0.194761
G3 X110.446 Y127.256 I-.423 J.406 E.00292
; LINE_WIDTH: 0.252081
G3 X110.485 Y127.527 I-.696 J.237 E.004
G1 X110.485 Y130.183 E.03846
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X110.485 Y128.183 E-.228
; WIPE_END
G1 E-.012 F1800
G1 X106.551 Y130.183 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.260799
G1 F18000
G1 X106.55 Y127.556 E.03956
G3 X106.583 Y127.268 I1.036 J-.031 E.00439
; LINE_WIDTH: 0.201667
G3 X106.736 Y127.009 I.7 J.24 E.00337
G1 E-.56 F1800
; WIPE_START
G1 F18000
G1 X106.65 Y127.124 E-.10805
G1 X106.583 Y127.268 E-.11995
; WIPE_END
G1 E-.012 F1800
G1 X106.858 Y130.307 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.401931
; LAYER_HEIGHT: 0.009
G1 F3600
G1 X106.311 Y130.307 E.00082
G1 X106.311 Y130.157 E.00022
G1 X106.79 Y130.157 E.00072
G1 X106.79 Y130.007 E.00022
G1 X106.311 Y130.007 E.00072
G1 X106.311 Y129.857 E.00022
G1 X106.79 Y129.857 E.00072
G1 X106.79 Y129.707 E.00022
G1 X106.311 Y129.707 E.00072
G1 X106.311 Y129.557 E.00022
G1 X106.79 Y129.557 E.00072
G1 X106.79 Y129.407 E.00022
G1 X106.311 Y129.407 E.00072
G1 X106.311 Y129.257 E.00022
G1 X106.79 Y129.257 E.00072
G1 X106.79 Y129.107 E.00022
G1 X106.311 Y129.107 E.00072
G1 X106.311 Y128.957 E.00022
G1 X106.79 Y128.957 E.00072
G1 X106.79 Y128.807 E.00022
G1 X106.311 Y128.807 E.00072
G1 X106.311 Y128.657 E.00022
G1 X106.79 Y128.657 E.00072
G1 X106.79 Y128.507 E.00022
G1 X106.311 Y128.507 E.00072
G1 X106.311 Y128.357 E.00022
G1 X106.79 Y128.357 E.00072
G1 X106.79 Y128.207 E.00022
G1 X106.311 Y128.207 E.00072
G1 X106.311 Y128.057 E.00022
G1 X106.79 Y128.057 E.00072
G1 X106.79 Y127.907 E.00022
G1 X106.311 Y127.907 E.00072
G1 X106.311 Y127.757 E.00022
G1 X106.79 Y127.757 E.00072
G1 X106.79 Y127.607 E.00022
G1 X106.311 Y127.607 E.00072
G3 X106.314 Y127.457 I2.397 J-.027 E.00022
G1 X106.79 Y127.457 E.00071
G3 X106.799 Y127.307 I1.291 J.008 E.00023
G1 X106.341 Y127.301 E.00069
G3 X106.392 Y127.157 I.81 J.208 E.00023
G1 X106.965 Y127.157 E.00086
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X106.392 Y127.157 E-.06523
G1 X106.341 Y127.301 E-.01749
G1 X106.799 Y127.307 E-.05227
G1 X106.79 Y127.457 E-.01713
G1 X106.314 Y127.457 E-.05417
G1 X106.311 Y127.607 E-.0171
G1 X106.352 Y127.607 E-.0046
; WIPE_END
G1 E-.012 F1800
G1 X110.182 Y130.307 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
G1 F3600
G1 X110.72 Y130.307 E.00081
G1 X110.72 Y130.157 E.00022
G1 X110.249 Y130.157 E.0007
G1 X110.249 Y130.007 E.00022
G1 X110.72 Y130.007 E.0007
G1 X110.72 Y129.857 E.00022
G1 X110.249 Y129.857 E.0007
G1 X110.249 Y129.707 E.00022
G1 X110.72 Y129.707 E.0007
G1 X110.72 Y129.557 E.00022
G1 X110.249 Y129.557 E.0007
G1 X110.249 Y129.407 E.00022
G1 X110.72 Y129.407 E.0007
G1 X110.72 Y129.257 E.00022
G1 X110.249 Y129.257 E.0007
G1 X110.249 Y129.107 E.00022
G1 X110.72 Y129.107 E.0007
G1 X110.72 Y128.957 E.00022
G1 X110.249 Y128.957 E.0007
G1 X110.249 Y128.807 E.00022
G1 X110.72 Y128.807 E.0007
G1 X110.72 Y128.657 E.00022
G1 X110.249 Y128.657 E.0007
G1 X110.249 Y128.507 E.00022
G1 X110.72 Y128.507 E.0007
G1 X110.72 Y128.357 E.00022
G1 X110.25 Y128.357 E.0007
G1 X110.25 Y128.207 E.00022
G1 X110.72 Y128.207 E.0007
G1 X110.72 Y128.057 E.00022
G1 X110.25 Y128.057 E.0007
G1 X110.25 Y127.907 E.00022
G1 X110.72 Y127.907 E.0007
G1 X110.719 Y127.757 E.00022
G1 X110.25 Y127.757 E.0007
G1 X110.25 Y127.607 E.00022
G1 X110.719 Y127.607 E.0007
G2 X110.716 Y127.457 I-1.86 J-.034 E.00022
G1 X110.25 Y127.457 E.0007
G2 X110.235 Y127.307 I-.251 J-.051 E.00023
G1 X110.691 Y127.307 E.00068
G2 X110.639 Y127.157 I-.942 J.239 E.00024
G1 X110.079 Y127.157 E.00084
G1 X110.635 Y127.007 F30000
G1 F3600
G1 X106.477 Y127.007 E.00622
M73 P99 R0
G3 X106.611 Y126.857 I1.339 J1.061 E.0003
G1 X110.419 Y126.857 E.0057
G2 X110.173 Y126.707 I-.539 J.607 E.00043
G1 X106.703 Y126.707 E.00519
; close powerlost recovery
M1003 S0
G1 E-.56 F1800
; WIPE_START
G1 F3600
G1 X108.703 Y126.707 E-.228
; WIPE_END
G1 E-.012 F1800
; stop printing object, unique label id: 179
M625
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 
;M106 P3 S0
;===== date: 20240528 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z3.42 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z102.92 F600
    G1 Z100.92

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0
;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N100
M1006 A49 B20 L100 C44 D20 M100 E41 F20 N100
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M960 S5 P0 ; turn off logo lamp
M73 P100 R0
; EXECUTABLE_BLOCK_END

