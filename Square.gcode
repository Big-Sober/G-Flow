; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 9m 35s; total estimated time: 17m 49s
; total layer number: 67
; total filament length [mm] : 3450.14
; total filament volume [cm^3] : 8298.55
; total filament weight [g] : 10.46
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 20.10
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 30
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;=X1 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1C 0.6 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.30mm Standard @BBL X1C 0.6 nozzle
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = enable_prime_tower;is_infill_first;max_travel_detour_distance;prime_tower_infill_gap;prime_tower_rib_wall;seam_slope_entire_loop;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;filament_prime_volume;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
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
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_change_length = 5
; filament_change_length_nc = 10
; filament_colour = #FFFFFF
; filament_colour_type = 1
; filament_cooling_before_tower = 0
; filament_cost = 24.99
; filament_density = 1.26
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFA00
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_multi_colour = #FFFFFF
; filament_notes = 
; filament_nozzle_map = 0
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1,1
; filament_settings_id = "Bambu PLA Basic @BBL X1C 0.6 nozzle"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 50
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8
; independent_support_layer_height = 1
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
; initial_layer_infill_speed = 55
; initial_layer_jerk = 9
; initial_layer_line_width = 0.62
; initial_layer_print_height = 0.3
; initial_layer_speed = 35
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.62
; inner_wall_speed = 150
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.62
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 150
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.31
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 1
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.3
; line_width = 0.62
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
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
; machine_start_gcode = ;===== machine: X1-0.6 ====================\n;===== date: 20251031 ==================\n;===== start printer sound ================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A46 B10 L100 C43 D10 M70 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A43 B10 L100 C0 D10 M60 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A41 B10 L100 C0 D10 M100 E41 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E44 F10 N100\nM1006 A49 B10 L100 C0 D10 M100 E49 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A48 B10 L100 C44 D10 M60 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M90 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A46 B10 L100 C43 D10 M60 E39 F10 N100\nM1006 W\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n{if scan_first_layer}\n;=========register first layer scan=====\nM977 S1 P60\n{endif}\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_no_support_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_no_support_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X128 Y128\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n;===== check scanner clarity ===========================\nG1 X128 Y128 F24000\nG28 Z P0\nM972 S5 P0\nG1 X230 Y15 F24000\n;===== check scanner clarity end =======================\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== mech mode fast check============================\n\n{if scan_first_layer}\n;start heatbed  scan====================================\nM976 S2 P1\nG90\nG1 X128 Y128 F20000\nM976 S3 P2  ;register void printing detection\n{endif}\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature[initial_no_support_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E25 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y15 E1.166 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E1.166\nG0 X231 E1.166 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n\n;===== draw extrinsic para cali paint =================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M1002 gcode_claim_action : 8\n\n    G0 F1200.0 X231 Y12 Z0.2 E1.039\n    G0 F1200.0 X226 Y12 Z0.2 E0.495\n    G0 F1200.0 X226 Y1.5 Z0.2 E1.039\n    G0 F1200.0 X220 Y1.5 Z0.2 E0.594\n    G0 F1200.0 X220 Y8 Z0.2 E0.644\n    G0 F1200.0 X210 Y8 Z0.2 E0.988\n    G0 F1200.0 X210 Y1.5 Z0.2 E0.642\n\n    G0 X48.0 E19.826 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X48.0 Y12 E1.312 F1200.0\n    G0 X45.0 E0.374 F1200.0\n    G0 X35.0 Y6.0 E1.460 F1200.0\n\n    ;=========== extruder cali extrusion ==================\n    T1000\n    M83\n    {if default_acceleration > 0}\n        {if outer_wall_acceleration > 0}\n            M204 S[outer_wall_acceleration]\n        {else}\n            M204 S[default_acceleration]\n        {endif}\n    {endif}\n    G0 X35.000 Y6.000 Z0.300 F30000 E0\n    G1 F1500.000 E0.800\n    M106 S0 ; turn off fan\n    G0 X185.000 E16.9 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G0 X187 Z0\n    G1 F1500.000 E-0.800\n    G0 Z1\n    G0 X180 Z0.3 F18000\n\n    M900 L1000.0 M1.0\n    M900 K0.030\n    G0 X45.000 F30000\n    G0 Y8.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000  E2.25000 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X70.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X75.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X80.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X85.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X90.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X95.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X100.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X105.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X110.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X115.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X120.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X125.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X130.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X135.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X140.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X145.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X150.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X155.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X160.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X165.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X170.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X175.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X180.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.015\n    G0 X45.000 F30000\n    G0 Y10.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000  E2.25000 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X70.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X75.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X80.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X85.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X90.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X95.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X100.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X105.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X110.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X115.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X120.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X125.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X130.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X135.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X140.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X145.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X150.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X155.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X160.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X165.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X170.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X175.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X180.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.000\n    G0 X45.000 F30000\n    G0 Y12.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000  E2.25000 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X70.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X75.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X80.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X85.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X90.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X95.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X100.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X105.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X110.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X115.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X120.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X125.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X130.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X135.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X140.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X145.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X150.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X155.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X160.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X165.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X170.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)/ 4 * 60}\n    G1 X175.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 X180.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.9)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n\n    G0 X45.000 F30000 ; move to start point\n\nM623 ; end of "draw extrinsic para cali paint"\n\nM1002 judge_flag extrude_cali_flag\nM622 J0\n    G0 X231 Y1.5 F30000\n    G0 X18 E23.9 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM623\n\nM104 S140\n\n;=========== laser and rgb calibration ===========\nM400\nM18 E\nM500 R\n\nM973 S3 P14\n\nG1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nT1100\nG1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nM400 P100\nM960 S1 P1\nM400 P100\nM973 S6 P0; use auto exposure for horizontal laser by xcam\nM960 S0 P0\n\nG1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos\nM960 S2 P1\nM400 P100\nM973 S6 P1; use auto exposure for vertical laser by xcam\nM960 S0 P0\n\n;=========== handeye calibration ======================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M973 S3 P1 ; camera start stream\n    M400 P500\n    M973 S1\n    G0 F6000 X228.500 Y4.750 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X215.00 Y4.750\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y6.75\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y6.75\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X215.00 Y4.750\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G1 Z3 F3000\n\n    M400\n    M500 ; save cali data\n\n    M104 S{nozzle_temperature[initial_no_support_extruder]} ; rise nozzle temp now ,to reduce temp waiting time.\n\n    T1100\n    M400 P400\n    M960 S0 P0\n    G0 F30000.000 Y10.000 X65.000 Z0.000\n    M400 P400\n    M960 S1 P1\n    M400 P50\n\n    M969 S1 N3 A2000\n    G0 F360.000 X181.000 Z0.000\n    M980.3 A70.000 B{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60/4} C5.000 D{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60} E5.000 F175.000 H1.000 I0.000 J0.015 K0.030\n    M400 P100\n    G0 F20000\n    G0 Z1 ; rise nozzle up\n    T1000 ; change to nozzle space\n    G0 X45.000 Y4.000 F30000 ; move to test line pos\n    M969 S0 ; turn off scanning\n    M960 S0 P0\n\n\n    G1 Z2 F20000\n    T1000\n    G0 X45.000 Y4.000 F30000 E0\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n    G0 Z0.3\n    G1 F1500.000 E3.600\n    G1 X65.000  E2.25000 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000  E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n\n    ; see if extrude cali success, if not ,use default value\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M400\n        M900 K0.015 M{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*0.015}\n    M623\n\n    G1 X140.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X185.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X190.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X195.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X200.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X205.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X210.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X215.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X220.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X225.000 E0.56250 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    M973 S4\n\nM623\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM973 S4 ; turn off scanner\nM400 ; wait all motion done before implement the emprical L parameters\n;M900 L500.0 ; Empirical parameters\nM109 S[nozzle_temperature_initial_layer]\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n;===== purge line to wipe the nozzle ============================\nG1 E{-retraction_length[initial_no_support_extruder]} F1800\nG1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position\nG1 E{retraction_length[initial_no_support_extruder]} F1800\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG1 Z0.2\nG0 X239 E15 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\nG0 Y12 E0.7 F{outer_wall_volumetric_speed/(0.3*0.5)/4* 60}\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.42
; max_travel_detour_distance = 50
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.12
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.6
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = hardened_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.62
; outer_wall_speed = 120
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 15
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
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
; print_compatible_printers = "Bambu Lab X1 Carbon 0.6 nozzle";"Bambu Lab P1S 0.6 nozzle";"Bambu Lab X1E 0.6 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.30mm Standard @BBL X1C 0.6 nozzle
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab X1 Carbon
; printer_notes = 
; printer_settings_id = Bambu Lab X1 Carbon 0.6 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.6
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
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 1.4
; retraction_minimum_travel = 3
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 1
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 1
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 100%
; skeleton_infill_line_width = 0.62
; skin_infill_density = 100%
; skin_infill_depth = 2
; skin_infill_line_width = 0.62
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 4
; slow_down_min_speed = 20
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
; sparse_infill_density = 100%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.62
; sparse_infill_pattern = zig-zag
; sparse_infill_speed = 100
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
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
; support_line_width = 0.62
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 3
; top_one_wall_type = all top
; top_shell_layers = 3
; top_shell_thickness = 0.8
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.62
; top_surface_pattern = monotonicline
; top_surface_speed = 150
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
; upward_compatible_machine = "Bambu Lab P1S 0.6 nozzle";"Bambu Lab P1P 0.6 nozzle";"Bambu Lab X1 0.6 nozzle";"Bambu Lab X1E 0.6 nozzle";"Bambu Lab A1 0.6 nozzle";"Bambu Lab H2D 0.6 nozzle";"Bambu Lab H2D Pro 0.6 nozzle";"Bambu Lab H2S 0.6 nozzle";"Bambu Lab P2S 0.6 nozzle";"Bambu Lab H2C 0.6 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
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
; wipe_tower_x = 165
; wipe_tower_y = 250
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
M73 P0 R17
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: X1-0.6 ====================
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
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp


;=========register first layer scan=====
M977 S1 P60


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
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
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P8 R16
G1 E50 F200
M400
M104 S220
G92 E0
M73 P32 R11
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P33 R11
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P34 R11
G1 E-0.5 F300

M73 P35 R11
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
M73 P36 R11
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
    G29 A X118 Y118 I20 J20
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

    
    M106 P3 S180
    ;Prevent PLA from jamming
    M142 P1 R35 S40

M106 P2 S100 ; turn on big fan ,to cool down toolhead

M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
M73 P37 R11
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

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
G0 X240 E25 F8000.92
G0 Y15 E1.166 F2000.23
G0 X239.5
G0 E0.2
G0 Y1.5 E1.166
G0 X231 E1.166 F8000.92
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate


;===== draw extrinsic para cali paint =================
M1002 judge_flag extrude_cali_flag
M622 J1

    M1002 gcode_claim_action : 8

    G0 F1200.0 X231 Y12 Z0.2 E1.039
    G0 F1200.0 X226 Y12 Z0.2 E0.495
    G0 F1200.0 X226 Y1.5 Z0.2 E1.039
    G0 F1200.0 X220 Y1.5 Z0.2 E0.594
    G0 F1200.0 X220 Y8 Z0.2 E0.644
    G0 F1200.0 X210 Y8 Z0.2 E0.988
    G0 F1200.0 X210 Y1.5 Z0.2 E0.642

    G0 X48.0 E19.826 F8000.92
    G0 X48.0 Y12 E1.312 F1200.0
    G0 X45.0 E0.374 F1200.0
    G0 X35.0 Y6.0 E1.460 F1200.0

    ;=========== extruder cali extrusion ==================
    T1000
    M83
    
        
            M204 S5000
        
    
    G0 X35.000 Y6.000 Z0.300 F30000 E0
    G1 F1500.000 E0.800
    M106 S0 ; turn off fan
    G0 X185.000 E16.9 F4444.96
    G0 X187 Z0
    G1 F1500.000 E-0.800
    G0 Z1
    G0 X180 Z0.3 F18000

    M900 L1000.0 M1.0
    M900 K0.030
    G0 X45.000 F30000
    G0 Y8.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000  E2.25000 F1111.24
M73 P38 R11
    G1 X70.000  E0.56250 F1111.24
    G1 X75.000  E0.56250 F4444.96
    G1 X80.000  E0.56250 F1111.24
    G1 X85.000  E0.56250 F4444.96
    G1 X90.000  E0.56250 F1111.24
M73 P38 R10
    G1 X95.000  E0.56250 F4444.96
    G1 X100.000 E0.56250 F1111.24
    G1 X105.000 E0.56250 F4444.96
    G1 X110.000 E0.56250 F1111.24
    G1 X115.000 E0.56250 F4444.96
    G1 X120.000 E0.56250 F1111.24
    G1 X125.000 E0.56250 F4444.96
    G1 X130.000 E0.56250 F1111.24
    G1 X135.000 E0.56250 F4444.96
    G1 X140.000 E0.56250 F1111.24
M73 P39 R10
    G1 X145.000 E0.56250 F4444.96
    G1 X150.000 E0.56250 F1111.24
    G1 X155.000 E0.56250 F4444.96
    G1 X160.000 E0.56250 F1111.24
    G1 X165.000 E0.56250 F4444.96
    G1 X170.000 E0.56250 F1111.24
    G1 X175.000 E0.56250 F4444.96
    G1 X180.000 E0.56250 F4444.96
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.015
    G0 X45.000 F30000
    G0 Y10.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000  E2.25000 F1111.24
    G1 X70.000  E0.56250 F1111.24
    G1 X75.000  E0.56250 F4444.96
    G1 X80.000  E0.56250 F1111.24
    G1 X85.000  E0.56250 F4444.96
    G1 X90.000  E0.56250 F1111.24
    G1 X95.000  E0.56250 F4444.96
    G1 X100.000 E0.56250 F1111.24
    G1 X105.000 E0.56250 F4444.96
    G1 X110.000 E0.56250 F1111.24
M73 P40 R10
    G1 X115.000 E0.56250 F4444.96
    G1 X120.000 E0.56250 F1111.24
    G1 X125.000 E0.56250 F4444.96
    G1 X130.000 E0.56250 F1111.24
    G1 X135.000 E0.56250 F4444.96
    G1 X140.000 E0.56250 F1111.24
    G1 X145.000 E0.56250 F4444.96
    G1 X150.000 E0.56250 F1111.24
    G1 X155.000 E0.56250 F4444.96
    G1 X160.000 E0.56250 F1111.24
    G1 X165.000 E0.56250 F4444.96
    G1 X170.000 E0.56250 F1111.24
    G1 X175.000 E0.56250 F4444.96
    G1 X180.000 E0.56250 F4444.96
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
    G1 X65.000  E2.25000 F1111.24
    G1 X70.000  E0.56250 F1111.24
    G1 X75.000  E0.56250 F4444.96
    G1 X80.000  E0.56250 F1111.24
M73 P41 R10
    G1 X85.000  E0.56250 F4444.96
    G1 X90.000  E0.56250 F1111.24
    G1 X95.000  E0.56250 F4444.96
    G1 X100.000 E0.56250 F1111.24
    G1 X105.000 E0.56250 F4444.96
    G1 X110.000 E0.56250 F1111.24
    G1 X115.000 E0.56250 F4444.96
    G1 X120.000 E0.56250 F1111.24
    G1 X125.000 E0.56250 F4444.96
    G1 X130.000 E0.56250 F1111.24
    G1 X135.000 E0.56250 F4444.96
    G1 X140.000 E0.56250 F1111.24
    G1 X145.000 E0.56250 F4444.96
    G1 X150.000 E0.56250 F1111.24
    G1 X155.000 E0.56250 F4444.96
    G1 X160.000 E0.56250 F1111.24
    G1 X165.000 E0.56250 F4444.96
    G1 X170.000 E0.56250 F1111.24
    G1 X175.000 E0.56250 F4444.96
    G1 X180.000 E0.56250 F4444.96
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
    G0 X18 E23.9 F8000.92
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
    M980.3 A70.000 B124.803 C5.000 D499.213 E5.000 F175.000 H1.000 I0.000 J0.015 K0.030
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
    G1 X65.000  E2.25000 F2000.23
    G1 X70.000  E0.56250 F2000.23
    G1 X75.000  E0.56250 F8000.92
    G1 X80.000  E0.56250 F2000.23
    G1 X85.000  E0.56250 F8000.92
    G1 X90.000  E0.56250 F2000.23
    G1 X95.000  E0.56250 F8000.92
    G1 X100.000 E0.56250 F2000.23
    G1 X105.000 E0.56250 F8000.92
    G1 X110.000 E0.56250 F2000.23
    G1 X115.000 E0.56250 F8000.92
    G1 X120.000 E0.56250 F2000.23
    G1 X125.000 E0.56250 F8000.92
    G1 X130.000 E0.56250 F2000.23
    G1 X135.000 E0.56250 F8000.92

    ; see if extrude cali success, if not ,use default value
    M1002 judge_last_extrude_cali_success
    M622 J0
        M400
        M900 K0.015 M0.124803
    M623

    G1 X140.000 E0.56250 F2000.23
    G1 X145.000 E0.56250 F8000.92
    G1 X150.000 E0.56250 F2000.23
    G1 X155.000 E0.56250 F8000.92
    G1 X160.000 E0.56250 F2000.23
    G1 X165.000 E0.56250 F8000.92
    G1 X170.000 E0.56250 F2000.23
    G1 X175.000 E0.56250 F8000.92
    G1 X180.000 E0.56250 F2000.23
    G1 X185.000 E0.56250 F8000.92
    G1 X190.000 E0.56250 F2000.23
    G1 X195.000 E0.56250 F8000.92
    G1 X200.000 E0.56250 F2000.23
M73 P42 R10
    G1 X205.000 E0.56250 F8000.92
    G1 X210.000 E0.56250 F2000.23
    G1 X215.000 E0.56250 F8000.92
    G1 X220.000 E0.56250 F2000.23
    G1 X225.000 E0.56250 F8000.92
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
G1 E-1.4 F1800
G1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position
G1 E1.4 F1800
M109 S220
G1 Z0.2
G0 X239 E15 F8000.92
G0 Y12 E0.7 F2000.23
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.3
G1 E-1.4 F1800
; layer num/total_layer_count: 1/67
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
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

; OBJECT_ID: 114
G1 X136.984 Y134.984
G1 Z.3
G1 E1.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.62
G1 F2100
M204 S500
G1 X119.016 Y134.984 E1.22033
G1 X119.016 Y117.016 E1.22033
G1 X136.984 Y117.016 E1.22033
G1 X136.984 Y134.894 E1.21422
M204 S6000
G1 X137.54 Y135.54 F30000
; FEATURE: Outer wall
G1 F2100
M204 S500
G1 X118.46 Y135.54 E1.2958
G1 X118.46 Y116.46 E1.2958
G1 X137.54 Y116.46 E1.2958
G1 X137.54 Y135.45 E1.28969
; WIPE_START
G1 X135.54 Y135.459 E-1.33
; WIPE_END
G1 E-.07 F1800
M204 S6000
G1 X135.573 Y127.827 Z.7 F30000
G1 X135.619 Y117.238 Z.7
G1 Z.3
G1 E1.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.629411
G1 F3300
M204 S500
G1 X136.512 Y118.131 E.08723
G1 X136.512 Y118.93 E.05519
G1 X135.07 Y117.488 E.14086
G1 X134.271 Y117.488 E.05519
G1 X136.512 Y119.729 E.2189
G1 X136.512 Y120.528 E.05519
G1 X133.472 Y117.488 E.29695
G1 X132.673 Y117.488 E.05519
G1 X136.512 Y121.327 E.375
G1 X136.512 Y122.126 E.05519
G1 X131.874 Y117.488 E.45304
G1 X131.075 Y117.488 E.05519
G1 X136.512 Y122.925 E.53109
G1 X136.512 Y123.724 E.05519
G1 X130.276 Y117.488 E.60914
G1 X129.476 Y117.488 E.05519
G1 X136.512 Y124.524 E.68718
G1 X136.512 Y125.323 E.05519
M73 P43 R10
G1 X128.677 Y117.488 E.76523
G1 X127.878 Y117.488 E.05519
G1 X136.512 Y126.122 E.84328
G1 X136.512 Y126.921 E.05519
G1 X127.079 Y117.488 E.92132
G1 X126.28 Y117.488 E.05519
G1 X136.512 Y127.72 E.99937
G1 X136.512 Y128.519 E.05519
G1 X125.481 Y117.488 E1.07742
G1 X124.682 Y117.488 E.05519
M73 P45 R9
G1 X136.512 Y129.318 E1.15546
G1 X136.512 Y130.117 E.05519
G1 X123.883 Y117.488 E1.23351
G1 X123.084 Y117.488 E.05519
G1 X136.512 Y130.916 E1.31156
G1 X136.512 Y131.715 E.05519
G1 X122.285 Y117.488 E1.3896
G1 X121.486 Y117.488 E.05519
G1 X136.512 Y132.514 E1.46765
G1 X136.512 Y133.313 E.05519
G1 X120.687 Y117.488 E1.5457
G1 X119.888 Y117.488 E.05519
G1 X136.512 Y134.112 E1.62374
G1 X136.512 Y134.512 E.02761
G1 X136.113 Y134.512 E.02758
G1 X119.488 Y117.887 E1.62378
G1 X119.488 Y118.686 E.05519
G1 X135.314 Y134.512 E1.54574
G1 X134.515 Y134.512 E.05519
G1 X119.488 Y119.485 E1.46769
G1 X119.488 Y120.284 E.05519
G1 X133.716 Y134.512 E1.38964
G1 X132.916 Y134.512 E.05519
G1 X119.488 Y121.083 E1.3116
G1 X119.488 Y121.883 E.05519
G1 X132.117 Y134.512 E1.23355
G1 X131.318 Y134.512 E.05519
G1 X119.488 Y122.682 E1.1555
G1 X119.488 Y123.481 E.05519
G1 X130.519 Y134.512 E1.07746
G1 X129.72 Y134.512 E.05519
G1 X119.488 Y124.28 E.99941
G1 X119.488 Y125.079 E.05519
G1 X128.921 Y134.512 E.92136
G1 X128.122 Y134.512 E.05519
G1 X119.488 Y125.878 E.84332
G1 X119.488 Y126.677 E.05519
G1 X127.323 Y134.512 E.76527
G1 X126.524 Y134.512 E.05519
G1 X119.488 Y127.476 E.68722
G1 X119.488 Y128.275 E.05519
G1 X125.725 Y134.512 E.60918
G1 X124.926 Y134.512 E.05519
G1 X119.488 Y129.074 E.53113
G1 X119.488 Y129.873 E.05519
M73 P46 R9
G1 X124.127 Y134.512 E.45308
G1 X123.328 Y134.512 E.05519
G1 X119.488 Y130.672 E.37504
G1 X119.488 Y131.471 E.05519
G1 X122.529 Y134.512 E.29699
G1 X121.729 Y134.512 E.05519
G1 X119.488 Y132.271 E.21894
G1 X119.488 Y133.07 E.05519
G1 X120.93 Y134.512 E.1409
G1 X120.131 Y134.512 E.05519
G1 X119.238 Y133.619 E.08727
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F3300
G1 X120.131 Y134.512 E-.84028
G1 X120.868 Y134.512 E-.48972
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 2/67
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M976 S1 P1 ; scan model before printing 2nd layer
M400 P100
G1 E1.4
G1 E-1.4
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z.6
G1 E1.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.626281
G1 F7474.639
G1 X136.662 Y134.026 E.0861
G1 X136.662 Y133.231 E.05458
G1 X135.231 Y134.662 E.139
G1 X134.436 Y134.662 E.05458
G1 X136.662 Y132.436 E.21619
G1 X136.662 Y131.642 E.05458
G1 X133.642 Y134.662 E.29337
G1 X132.847 Y134.662 E.05458
G1 X136.662 Y130.847 E.37056
G1 X136.662 Y130.052 E.05458
G1 X132.052 Y134.662 E.44774
G1 X131.258 Y134.662 E.05458
G1 X136.662 Y129.258 E.52493
G1 X136.662 Y128.463 E.05458
G1 X130.463 Y134.662 E.60211
G1 X129.669 Y134.662 E.05458
G1 X136.662 Y127.669 E.67929
G1 X136.662 Y126.874 E.05458
G1 X128.874 Y134.662 E.75648
G1 X128.079 Y134.662 E.05458
G1 X136.662 Y126.079 E.83366
G1 X136.662 Y125.285 E.05458
G1 X127.285 Y134.662 E.91085
G1 X126.49 Y134.662 E.05458
G1 X136.662 Y124.49 E.98803
G1 X136.662 Y123.695 E.05458
G1 X125.695 Y134.662 E1.06522
G1 X124.901 Y134.662 E.05458
G1 X136.662 Y122.901 E1.1424
G1 X136.662 Y122.106 E.05458
G1 X124.106 Y134.662 E1.21959
M73 P47 R9
G1 X123.311 Y134.662 E.05458
G1 X136.662 Y121.311 E1.29677
G1 X136.662 Y120.517 E.05458
G1 X122.517 Y134.662 E1.37395
G1 X121.722 Y134.662 E.05458
G1 X136.662 Y119.722 E1.45114
G1 X136.662 Y118.927 E.05458
G1 X120.927 Y134.662 E1.52832
G1 X120.133 Y134.662 E.05458
G1 X136.662 Y118.133 E1.60551
G1 X136.662 Y117.338 E.05458
G1 X119.338 Y134.662 E1.6827
G1 X119.338 Y133.868 E.05456
G1 X135.868 Y117.338 E1.60555
G1 X135.073 Y117.338 E.05458
G1 X119.338 Y133.073 E1.52837
G1 X119.338 Y132.278 E.05458
G1 X134.278 Y117.338 E1.45118
G1 X133.484 Y117.338 E.05458
G1 X119.338 Y131.484 E1.374
G1 X119.338 Y130.689 E.05458
G1 X132.689 Y117.338 E1.29682
G1 X131.894 Y117.338 E.05458
G1 X119.338 Y129.894 E1.21963
G1 X119.338 Y129.1 E.05458
G1 X131.1 Y117.338 E1.14245
G1 X130.305 Y117.338 E.05458
G1 X119.338 Y128.305 E1.06526
G1 X119.338 Y127.511 E.05458
G1 X129.511 Y117.338 E.98808
G1 X128.716 Y117.338 E.05458
G1 X119.338 Y126.716 E.91089
G1 X119.338 Y125.921 E.05458
G1 X127.921 Y117.338 E.83371
G1 X127.127 Y117.338 E.05458
G1 X119.338 Y125.127 E.75653
G1 X119.338 Y124.332 E.05458
G1 X126.332 Y117.338 E.67934
G1 X125.537 Y117.338 E.05458
G1 X119.338 Y123.537 E.60216
G1 X119.338 Y122.743 E.05458
G1 X124.743 Y117.338 E.52497
G1 X123.948 Y117.338 E.05458
G1 X119.338 Y121.948 E.44779
G1 X119.338 Y121.153 E.05458
G1 X123.153 Y117.338 E.3706
G1 X122.359 Y117.338 E.05458
G1 X119.338 Y120.359 E.29342
G1 X119.338 Y119.564 E.05458
G1 X121.564 Y117.338 E.21623
G1 X120.769 Y117.338 E.05458
G1 X119.338 Y118.769 E.13905
G1 X119.338 Y117.975 E.05458
G1 X120.225 Y117.088 E.08615
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z1 F30000
G1 X137.134 Y135.134 Z1
G1 Z.6
G1 E1.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.62
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
M73 P48 R9
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 3/67
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z.9
G1 E1.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.626281
G1 F7474.639
G1 X119.975 Y134.662 E.08615
G1 X120.769 Y134.662 E.05458
G1 X119.338 Y133.231 E.13905
G1 X119.338 Y132.436 E.05458
G1 X121.564 Y134.662 E.21623
G1 X122.359 Y134.662 E.05458
G1 X119.338 Y131.641 E.29342
G1 X119.338 Y130.847 E.05458
G1 X123.153 Y134.662 E.3706
G1 X123.948 Y134.662 E.05458
G1 X119.338 Y130.052 E.44779
G1 X119.338 Y129.257 E.05458
G1 X124.743 Y134.662 E.52497
G1 X125.537 Y134.662 E.05458
G1 X119.338 Y128.463 E.60216
G1 X119.338 Y127.668 E.05458
G1 X126.332 Y134.662 E.67934
G1 X127.127 Y134.662 E.05458
G1 X119.338 Y126.873 E.75653
G1 X119.338 Y126.079 E.05458
G1 X127.921 Y134.662 E.83371
G1 X128.716 Y134.662 E.05458
G1 X119.338 Y125.284 E.91089
G1 X119.338 Y124.489 E.05458
G1 X129.511 Y134.662 E.98808
G1 X130.305 Y134.662 E.05458
G1 X119.338 Y123.695 E1.06526
G1 X119.338 Y122.9 E.05458
G1 X131.1 Y134.662 E1.14245
G1 X131.894 Y134.662 E.05458
G1 X119.338 Y122.105 E1.21963
G1 X119.338 Y121.311 E.05458
G1 X132.689 Y134.662 E1.29682
G1 X133.484 Y134.662 E.05458
G1 X119.338 Y120.516 E1.374
G1 X119.338 Y119.722 E.05458
G1 X134.278 Y134.662 E1.45119
G1 X135.073 Y134.662 E.05458
G1 X119.338 Y118.927 E1.52837
G1 X119.338 Y118.132 E.05458
G1 X135.868 Y134.662 E1.60555
G1 X136.662 Y134.662 E.05456
G1 X119.338 Y117.338 E1.6827
G1 X120.133 Y117.338 E.05458
G1 X136.662 Y133.867 E1.60551
G1 X136.662 Y133.073 E.05458
G1 X120.927 Y117.338 E1.52832
G1 X121.722 Y117.338 E.05458
G1 X136.662 Y132.278 E1.45114
G1 X136.662 Y131.483 E.05458
G1 X122.517 Y117.338 E1.37395
G1 X123.311 Y117.338 E.05458
G1 X136.662 Y130.689 E1.29677
G1 X136.662 Y129.894 E.05458
G1 X124.106 Y117.338 E1.21959
G1 X124.901 Y117.338 E.05458
G1 X136.662 Y129.099 E1.1424
G1 X136.662 Y128.305 E.05458
G1 X125.695 Y117.338 E1.06522
G1 X126.49 Y117.338 E.05458
G1 X136.662 Y127.51 E.98803
G1 X136.662 Y126.715 E.05458
G1 X127.285 Y117.338 E.91085
G1 X128.079 Y117.338 E.05458
G1 X136.662 Y125.921 E.83366
G1 X136.662 Y125.126 E.05458
G1 X128.874 Y117.338 E.75648
G1 X129.669 Y117.338 E.05458
G1 X136.662 Y124.331 E.67929
G1 X136.662 Y123.537 E.05458
G1 X130.463 Y117.338 E.60211
G1 X131.258 Y117.338 E.05458
G1 X136.662 Y122.742 E.52493
G1 X136.662 Y121.948 E.05458
G1 X132.052 Y117.338 E.44774
G1 X132.847 Y117.338 E.05458
G1 X136.662 Y121.153 E.37056
G1 X136.662 Y120.358 E.05458
G1 X133.642 Y117.338 E.29337
G1 X134.436 Y117.338 E.05458
G1 X136.662 Y119.564 E.21619
G1 X136.662 Y118.769 E.05458
G1 X135.231 Y117.338 E.139
G1 X136.026 Y117.338 E.05458
G1 X136.912 Y118.224 E.0861
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z1.3 F30000
G1 X137.134 Y135.134 Z1.3
G1 Z.9
G1 E1.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.62
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 4/67
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1.3 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z1.2
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
M73 P49 R9
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z1.6 F30000
G1 X137.134 Y135.134 Z1.6
G1 Z1.2
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 5/67
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z1.5
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
M73 P49 R8
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
M73 P50 R8
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z1.9 F30000
G1 X137.134 Y135.134 Z1.9
G1 Z1.5
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 6/67
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.9 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z1.8
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z2.2 F30000
G1 X137.134 Y135.134 Z2.2
G1 Z1.8
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 7/67
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z2.1
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
M73 P51 R8
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z2.5 F30000
G1 X137.134 Y135.134 Z2.5
G1 Z2.1
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 8/67
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z2.5 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z2.4
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
M73 P52 R8
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z2.8 F30000
G1 X137.134 Y135.134 Z2.8
G1 Z2.4
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 9/67
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z2.7
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
M73 P53 R8
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z3.1 F30000
G1 X137.134 Y135.134 Z3.1
G1 Z2.7
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 10/67
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z3.1 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z3
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z3.4 F30000
G1 X137.134 Y135.134 Z3.4
G1 Z3
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 11/67
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z3.4 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z3.3
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
M73 P54 R8
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z3.7 F30000
G1 X137.134 Y135.134 Z3.7
G1 Z3.3
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 12/67
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z3.7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z3.6
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
M73 P55 R8
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
M73 P55 R7
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z4 F30000
G1 X137.134 Y135.134 Z4
G1 Z3.6
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 13/67
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z4 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z3.9
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
M73 P56 R7
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z4.3 F30000
G1 X137.134 Y135.134 Z4.3
G1 Z3.9
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 14/67
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z4.3 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z4.2
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z4.6 F30000
G1 X137.134 Y135.134 Z4.6
G1 Z4.2
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
M73 P57 R7
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 15/67
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z4.6 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z4.5
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z4.9 F30000
G1 X137.134 Y135.134 Z4.9
G1 Z4.5
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 16/67
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z4.9 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z4.8
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
M73 P58 R7
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z5.2 F30000
G1 X137.134 Y135.134 Z5.2
G1 Z4.8
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 17/67
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z5.2 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z5.1
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
M73 P59 R7
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z5.5 F30000
G1 X137.134 Y135.134 Z5.5
G1 Z5.1
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 18/67
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z5.5 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z5.4
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
M73 P60 R7
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z5.8 F30000
G1 X137.134 Y135.134 Z5.8
G1 Z5.4
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 19/67
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z5.8 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z5.7
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
M73 P60 R6
G1 E-.07 F1800
G1 X136.071 Y124.929 Z6.1 F30000
G1 X137.134 Y135.134 Z6.1
G1 Z5.7
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 20/67
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z6.1 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z6
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
M73 P61 R6
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z6.4 F30000
G1 X137.134 Y135.134 Z6.4
G1 Z6
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 6.3
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 21/67
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z6.4 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z6.3
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
M73 P62 R6
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z6.7 F30000
G1 X137.134 Y135.134 Z6.7
G1 Z6.3
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 22/67
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z6.7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z6.6
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
M73 P63 R6
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z7 F30000
G1 X137.134 Y135.134 Z7
G1 Z6.6
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 23/67
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z6.9
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z7.3 F30000
G1 X137.134 Y135.134 Z7.3
G1 Z6.9
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 24/67
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z7.3 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z7.2
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
M73 P64 R6
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z7.6 F30000
G1 X137.134 Y135.134 Z7.6
G1 Z7.2
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 7.5
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 25/67
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z7.6 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z7.5
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
M73 P65 R6
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z7.9 F30000
G1 X137.134 Y135.134 Z7.9
G1 Z7.5
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 26/67
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
G17
G3 Z7.9 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z7.8
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
M73 P66 R6
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z8.2 F30000
G1 X137.134 Y135.134 Z8.2
G1 Z7.8
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 8.1
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 27/67
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z8.2 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z8.1
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
M73 P66 R5
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z8.5 F30000
G1 X137.134 Y135.134 Z8.5
G1 Z8.1
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 28/67
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
G17
G3 Z8.5 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z8.4
G1 E1.4 F1800
; FEATURE: Sparse infill
M73 P67 R5
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z8.8 F30000
G1 X137.134 Y135.134 Z8.8
G1 Z8.4
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 8.7
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 29/67
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
G17
G3 Z8.8 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z8.7
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
M73 P68 R5
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z9.1 F30000
G1 X137.134 Y135.134 Z9.1
G1 Z8.7
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 30/67
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z9.1 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z9
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
M73 P69 R5
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z9.4 F30000
G1 X137.134 Y135.134 Z9.4
G1 Z9
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 9.3
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 31/67
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z9.4 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z9.3
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z9.7 F30000
G1 X137.134 Y135.134 Z9.7
G1 Z9.3
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
M73 P70 R5
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 32/67
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
G17
G3 Z9.7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z9.6
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z10 F30000
G1 X137.134 Y135.134 Z10
G1 Z9.6
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 9.9
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 33/67
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
G17
G3 Z10 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z9.9
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
M73 P71 R5
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z10.3 F30000
G1 X137.134 Y135.134 Z10.3
G1 Z9.9
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 34/67
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z10.3 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z10.2
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
M73 P72 R4
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z10.6 F30000
G1 X137.134 Y135.134 Z10.6
G1 Z10.2
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 10.5
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 35/67
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z10.6 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z10.5
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
M73 P73 R4
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z10.9 F30000
G1 X137.134 Y135.134 Z10.9
G1 Z10.5
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 36/67
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z10.9 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z10.8
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z11.2 F30000
G1 X137.134 Y135.134 Z11.2
G1 Z10.8
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 11.1
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 37/67
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z11.2 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z11.1
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
M73 P74 R4
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z11.5 F30000
G1 X137.134 Y135.134 Z11.5
G1 Z11.1
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 38/67
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z11.5 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z11.4
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
M73 P75 R4
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z11.8 F30000
G1 X137.134 Y135.134 Z11.8
G1 Z11.4
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 11.7
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 39/67
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
G17
G3 Z11.8 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z11.7
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
M73 P76 R4
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z12.1 F30000
G1 X137.134 Y135.134 Z12.1
G1 Z11.7
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 40/67
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
G17
G3 Z12.1 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z12
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z12.4 F30000
G1 X137.134 Y135.134 Z12.4
G1 Z12
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 12.3
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 41/67
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
G17
G3 Z12.4 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z12.3
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
M73 P77 R4
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
M73 P77 R3
G1 E-.07 F1800
G1 X136.071 Y124.929 Z12.7 F30000
G1 X137.134 Y135.134 Z12.7
G1 Z12.3
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 42/67
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
G17
G3 Z12.7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z12.6
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
M73 P78 R3
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z13 F30000
G1 X137.134 Y135.134 Z13
G1 Z12.6
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 12.9
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 43/67
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
G17
G3 Z13 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z12.9
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
M73 P79 R3
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z13.3 F30000
G1 X137.134 Y135.134 Z13.3
G1 Z12.9
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 44/67
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
G17
G3 Z13.3 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z13.2
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z13.6 F30000
G1 X137.134 Y135.134 Z13.6
G1 Z13.2
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 13.5
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 45/67
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
G17
G3 Z13.6 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z13.5
G1 E1.4 F1800
; FEATURE: Sparse infill
M73 P80 R3
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z13.9 F30000
G1 X137.134 Y135.134 Z13.9
G1 Z13.5
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 46/67
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
G17
G3 Z13.9 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z13.8
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
M73 P81 R3
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z14.2 F30000
G1 X137.134 Y135.134 Z14.2
G1 Z13.8
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 14.1
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 47/67
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
G17
G3 Z14.2 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z14.1
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
M73 P82 R3
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z14.5 F30000
G1 X137.134 Y135.134 Z14.5
G1 Z14.1
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 48/67
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
G17
G3 Z14.5 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z14.4
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z14.8 F30000
M73 P83 R3
G1 X137.134 Y135.134 Z14.8
G1 Z14.4
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 14.7
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 49/67
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
G17
G3 Z14.8 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z14.7
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
M73 P83 R2
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z15.1 F30000
G1 X137.134 Y135.134 Z15.1
G1 Z14.7
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 50/67
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
G17
G3 Z15.1 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z15
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
M73 P84 R2
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z15.4 F30000
G1 X137.134 Y135.134 Z15.4
G1 Z15
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 15.3
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 51/67
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
G17
G3 Z15.4 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z15.3
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
M73 P85 R2
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z15.7 F30000
G1 X137.134 Y135.134 Z15.7
G1 Z15.3
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.3
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 52/67
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
G17
G3 Z15.7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z15.6
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
M73 P86 R2
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z16 F30000
G1 X137.134 Y135.134 Z16
G1 Z15.6
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 15.9
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 53/67
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
G17
G3 Z16 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z15.9
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z16.3 F30000
G1 X137.134 Y135.134 Z16.3
G1 Z15.9
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.300001
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 54/67
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
G17
G3 Z16.3 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z16.2
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
M73 P87 R2
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z16.6 F30000
G1 X137.134 Y135.134 Z16.6
G1 Z16.2
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 16.5
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 55/67
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
G17
G3 Z16.6 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z16.5
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
M73 P88 R2
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z16.9 F30000
G1 X137.134 Y135.134 Z16.9
G1 Z16.5
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 56/67
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
G17
G3 Z16.9 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z16.8
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
M73 P88 R1
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
M73 P89 R1
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z17.2 F30000
G1 X137.134 Y135.134 Z17.2
G1 Z16.8
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 17.1
; LAYER_HEIGHT: 0.300001
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 57/67
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
G17
G3 Z17.2 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z17.1
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z17.5 F30000
G1 X137.134 Y135.134 Z17.5
G1 Z17.1
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 58/67
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
G17
G3 Z17.5 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z17.4
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
M73 P90 R1
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z17.8 F30000
G1 X137.134 Y135.134 Z17.8
G1 Z17.4
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 17.7
; LAYER_HEIGHT: 0.300001
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 59/67
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
G17
G3 Z17.8 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z17.7
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
M73 P91 R1
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z18.1 F30000
G1 X137.134 Y135.134 Z18.1
G1 Z17.7
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 60/67
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
G17
G3 Z18.1 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z18
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
M73 P92 R1
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z18.4 F30000
G1 X137.134 Y135.134 Z18.4
G1 Z18
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 18.3
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 61/67
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
G17
G3 Z18.4 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z18.3
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z18.7 F30000
G1 X137.134 Y135.134 Z18.7
G1 Z18.3
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.300001
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 62/67
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
G17
G3 Z18.7 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z18.6
G1 E1.4 F1800
; FEATURE: Sparse infill
M73 P93 R1
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z19 F30000
G1 X137.134 Y135.134 Z19
G1 Z18.6
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 18.9
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 63/67
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
G17
G3 Z19 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z18.9
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X119.975 Y134.662 E.08519
G1 X120.769 Y134.662 E.05397
G1 X119.338 Y133.231 E.1375
G1 X119.338 Y132.436 E.05397
G1 X121.564 Y134.662 E.21382
G1 X122.359 Y134.662 E.05397
G1 X119.338 Y131.641 E.29014
G1 X119.338 Y130.847 E.05397
G1 X123.153 Y134.662 E.36646
G1 X123.948 Y134.662 E.05397
G1 X119.338 Y130.052 E.44278
G1 X119.338 Y129.257 E.05397
G1 X124.743 Y134.662 E.5191
G1 X125.537 Y134.662 E.05397
G1 X119.338 Y128.463 E.59543
G1 X119.338 Y127.668 E.05397
G1 X126.332 Y134.662 E.67175
G1 X127.127 Y134.662 E.05397
G1 X119.338 Y126.873 E.74807
G1 X119.338 Y126.079 E.05397
G1 X127.921 Y134.662 E.82439
G1 X128.716 Y134.662 E.05397
G1 X119.338 Y125.284 E.90071
G1 X119.338 Y124.489 E.05397
G1 X129.511 Y134.662 E.97703
G1 X130.305 Y134.662 E.05397
G1 X119.338 Y123.695 E1.05336
M73 P94 R1
G1 X119.338 Y122.9 E.05397
G1 X131.1 Y134.662 E1.12968
G1 X131.894 Y134.662 E.05397
G1 X119.338 Y122.105 E1.206
G1 X119.338 Y121.311 E.05397
G1 X132.689 Y134.662 E1.28232
G1 X133.484 Y134.662 E.05397
G1 X119.338 Y120.516 E1.35864
G1 X119.338 Y119.722 E.05397
G1 X134.278 Y134.662 E1.43496
G1 X135.073 Y134.662 E.05397
G1 X119.338 Y118.927 E1.51129
G1 X119.338 Y118.132 E.05397
G1 X135.868 Y134.662 E1.58761
G1 X136.662 Y134.662 E.05395
G1 X119.338 Y117.338 E1.6639
G1 X120.133 Y117.338 E.05397
G1 X136.662 Y133.867 E1.58756
G1 X136.662 Y133.073 E.05397
G1 X120.927 Y117.338 E1.51124
G1 X121.722 Y117.338 E.05397
G1 X136.662 Y132.278 E1.43492
G1 X136.662 Y131.483 E.05397
G1 X122.517 Y117.338 E1.3586
G1 X123.311 Y117.338 E.05397
G1 X136.662 Y130.689 E1.28227
G1 X136.662 Y129.894 E.05397
G1 X124.106 Y117.338 E1.20595
G1 X124.901 Y117.338 E.05397
G1 X136.662 Y129.099 E1.12963
G1 X136.662 Y128.305 E.05397
G1 X125.695 Y117.338 E1.05331
G1 X126.49 Y117.338 E.05397
G1 X136.662 Y127.51 E.97699
G1 X136.662 Y126.715 E.05397
G1 X127.285 Y117.338 E.90067
G1 X128.079 Y117.338 E.05397
G1 X136.662 Y125.921 E.82434
G1 X136.662 Y125.126 E.05397
G1 X128.874 Y117.338 E.74802
G1 X129.669 Y117.338 E.05397
G1 X136.662 Y124.331 E.6717
G1 X136.662 Y123.537 E.05397
G1 X130.463 Y117.338 E.59538
G1 X131.258 Y117.338 E.05397
G1 X136.662 Y122.742 E.51906
G1 X136.662 Y121.948 E.05397
G1 X132.052 Y117.338 E.44274
G1 X132.847 Y117.338 E.05397
G1 X136.662 Y121.153 E.36641
G1 X136.662 Y120.358 E.05397
G1 X133.642 Y117.338 E.29009
G1 X134.436 Y117.338 E.05397
G1 X136.662 Y119.564 E.21377
G1 X136.662 Y118.769 E.05397
G1 X135.231 Y117.338 E.13745
G1 X136.026 Y117.338 E.05397
G1 X136.912 Y118.224 E.08514
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
M73 P94 R0
G1 E-.07 F1800
G1 X136.071 Y124.929 Z19.3 F30000
G1 X137.134 Y135.134 Z19.3
G1 Z18.9
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.300001
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 64/67
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
G17
G3 Z19.3 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z19.2
G1 E1.4 F1800
; FEATURE: Sparse infill
G1 F6000
G1 X136.662 Y134.026 E.08514
G1 X136.662 Y133.231 E.05397
G1 X135.231 Y134.662 E.13745
G1 X134.436 Y134.662 E.05397
G1 X136.662 Y132.436 E.21377
G1 X136.662 Y131.642 E.05397
G1 X133.642 Y134.662 E.29009
G1 X132.847 Y134.662 E.05397
G1 X136.662 Y130.847 E.36641
G1 X136.662 Y130.052 E.05397
G1 X132.052 Y134.662 E.44274
G1 X131.258 Y134.662 E.05397
G1 X136.662 Y129.258 E.51906
G1 X136.662 Y128.463 E.05397
G1 X130.463 Y134.662 E.59538
G1 X129.669 Y134.662 E.05397
G1 X136.662 Y127.669 E.6717
G1 X136.662 Y126.874 E.05397
G1 X128.874 Y134.662 E.74802
G1 X128.079 Y134.662 E.05397
G1 X136.662 Y126.079 E.82434
G1 X136.662 Y125.285 E.05397
G1 X127.285 Y134.662 E.90067
G1 X126.49 Y134.662 E.05397
G1 X136.662 Y124.49 E.97699
G1 X136.662 Y123.695 E.05397
G1 X125.695 Y134.662 E1.05331
G1 X124.901 Y134.662 E.05397
G1 X136.662 Y122.901 E1.12963
G1 X136.662 Y122.106 E.05397
G1 X124.106 Y134.662 E1.20595
G1 X123.311 Y134.662 E.05397
G1 X136.662 Y121.311 E1.28227
G1 X136.662 Y120.517 E.05397
G1 X122.517 Y134.662 E1.3586
G1 X121.722 Y134.662 E.05397
G1 X136.662 Y119.722 E1.43492
G1 X136.662 Y118.927 E.05397
G1 X120.927 Y134.662 E1.51124
G1 X120.133 Y134.662 E.05397
G1 X136.662 Y118.133 E1.58756
G1 X136.662 Y117.338 E.05397
G1 X119.338 Y134.662 E1.66389
G1 X119.338 Y133.868 E.05395
G1 X135.868 Y117.338 E1.58761
G1 X135.073 Y117.338 E.05397
G1 X119.338 Y133.073 E1.51129
G1 X119.338 Y132.278 E.05397
G1 X134.278 Y117.338 E1.43496
G1 X133.484 Y117.338 E.05397
G1 X119.338 Y131.484 E1.35864
M73 P95 R0
G1 X119.338 Y130.689 E.05397
G1 X132.689 Y117.338 E1.28232
G1 X131.894 Y117.338 E.05397
G1 X119.338 Y129.894 E1.206
G1 X119.338 Y129.1 E.05397
G1 X131.1 Y117.338 E1.12968
G1 X130.305 Y117.338 E.05397
G1 X119.338 Y128.305 E1.05336
G1 X119.338 Y127.511 E.05397
G1 X129.511 Y117.338 E.97703
G1 X128.716 Y117.338 E.05397
G1 X119.338 Y126.716 E.90071
G1 X119.338 Y125.921 E.05397
G1 X127.921 Y117.338 E.82439
G1 X127.127 Y117.338 E.05397
G1 X119.338 Y125.127 E.74807
G1 X119.338 Y124.332 E.05397
G1 X126.332 Y117.338 E.67175
G1 X125.537 Y117.338 E.05397
G1 X119.338 Y123.537 E.59543
G1 X119.338 Y122.743 E.05397
G1 X124.743 Y117.338 E.5191
G1 X123.948 Y117.338 E.05397
G1 X119.338 Y121.948 E.44278
G1 X119.338 Y121.153 E.05397
G1 X123.153 Y117.338 E.36646
G1 X122.359 Y117.338 E.05397
G1 X119.338 Y120.359 E.29014
G1 X119.338 Y119.564 E.05397
G1 X121.564 Y117.338 E.21382
G1 X120.769 Y117.338 E.05397
G1 X119.338 Y118.769 E.1375
G1 X119.338 Y117.975 E.05397
G1 X120.225 Y117.088 E.08519
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z19.6 F30000
G1 X137.134 Y135.134 Z19.6
G1 Z19.2
G1 E1.4 F1800
; FEATURE: Inner wall
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 19.5
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 65/67
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
G17
G3 Z19.6 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X119.088 Y133.775
G1 Z19.5
G1 E1.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.626281
G1 F7474.639
G1 X119.975 Y134.662 E.08615
G1 X120.769 Y134.662 E.05458
G1 X119.338 Y133.231 E.13905
G1 X119.338 Y132.436 E.05458
G1 X121.564 Y134.662 E.21623
G1 X122.359 Y134.662 E.05458
G1 X119.338 Y131.641 E.29342
G1 X119.338 Y130.847 E.05458
G1 X123.153 Y134.662 E.3706
G1 X123.948 Y134.662 E.05458
G1 X119.338 Y130.052 E.44779
G1 X119.338 Y129.257 E.05458
G1 X124.743 Y134.662 E.52497
G1 X125.537 Y134.662 E.05458
G1 X119.338 Y128.463 E.60216
G1 X119.338 Y127.668 E.05458
G1 X126.332 Y134.662 E.67934
G1 X127.127 Y134.662 E.05458
G1 X119.338 Y126.873 E.75653
G1 X119.338 Y126.079 E.05458
G1 X127.921 Y134.662 E.83371
G1 X128.716 Y134.662 E.05458
G1 X119.338 Y125.284 E.91089
G1 X119.338 Y124.489 E.05458
G1 X129.511 Y134.662 E.98808
G1 X130.305 Y134.662 E.05458
G1 X119.338 Y123.695 E1.06526
G1 X119.338 Y122.9 E.05458
G1 X131.1 Y134.662 E1.14245
G1 X131.894 Y134.662 E.05458
G1 X119.338 Y122.105 E1.21963
G1 X119.338 Y121.311 E.05458
G1 X132.689 Y134.662 E1.29682
G1 X133.484 Y134.662 E.05458
G1 X119.338 Y120.516 E1.374
G1 X119.338 Y119.722 E.05458
G1 X134.278 Y134.662 E1.45119
G1 X135.073 Y134.662 E.05458
G1 X119.338 Y118.927 E1.52837
G1 X119.338 Y118.132 E.05458
G1 X135.868 Y134.662 E1.60555
G1 X136.662 Y134.662 E.05456
G1 X119.338 Y117.338 E1.6827
G1 X120.133 Y117.338 E.05458
G1 X136.662 Y133.867 E1.60551
G1 X136.662 Y133.073 E.05458
G1 X120.927 Y117.338 E1.52832
G1 X121.722 Y117.338 E.05458
G1 X136.662 Y132.278 E1.45114
G1 X136.662 Y131.483 E.05458
G1 X122.517 Y117.338 E1.37395
G1 X123.311 Y117.338 E.05458
G1 X136.662 Y130.689 E1.29677
G1 X136.662 Y129.894 E.05458
G1 X124.106 Y117.338 E1.21959
G1 X124.901 Y117.338 E.05458
G1 X136.662 Y129.099 E1.1424
G1 X136.662 Y128.305 E.05458
G1 X125.695 Y117.338 E1.06522
G1 X126.49 Y117.338 E.05458
G1 X136.662 Y127.51 E.98803
G1 X136.662 Y126.715 E.05458
G1 X127.285 Y117.338 E.91085
G1 X128.079 Y117.338 E.05458
G1 X136.662 Y125.921 E.83366
G1 X136.662 Y125.126 E.05458
G1 X128.874 Y117.338 E.75648
G1 X129.669 Y117.338 E.05458
G1 X136.662 Y124.331 E.67929
G1 X136.662 Y123.537 E.05458
G1 X130.463 Y117.338 E.60211
G1 X131.258 Y117.338 E.05458
G1 X136.662 Y122.742 E.52493
G1 X136.662 Y121.948 E.05458
G1 X132.052 Y117.338 E.44774
G1 X132.847 Y117.338 E.05458
G1 X136.662 Y121.153 E.37056
G1 X136.662 Y120.358 E.05458
G1 X133.642 Y117.338 E.29337
G1 X134.436 Y117.338 E.05458
G1 X136.662 Y119.564 E.21619
G1 X136.662 Y118.769 E.05458
G1 X135.231 Y117.338 E.139
G1 X136.026 Y117.338 E.05458
G1 X136.912 Y118.224 E.0861
; WIPE_START
G1 X136.026 Y117.338 E-.83369
G1 X135.279 Y117.338 E-.49632
; WIPE_END
G1 E-.07 F1800
G1 X136.071 Y124.929 Z19.9 F30000
M73 P96 R0
G1 X137.134 Y135.134 Z19.9
G1 Z19.5
G1 E1.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.62
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.299999
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 66/67
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
G17
G3 Z19.9 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X135.776 Y134.912
G1 Z19.8
G1 E1.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.626281
G1 F7474.639
G1 X136.662 Y134.026 E.0861
G1 X136.662 Y133.231 E.05458
G1 X135.231 Y134.662 E.139
G1 X134.436 Y134.662 E.05458
G1 X136.662 Y132.436 E.21619
G1 X136.662 Y131.642 E.05458
G1 X133.642 Y134.662 E.29337
G1 X132.847 Y134.662 E.05458
G1 X136.662 Y130.847 E.37056
G1 X136.662 Y130.052 E.05458
G1 X132.052 Y134.662 E.44774
G1 X131.258 Y134.662 E.05458
G1 X136.662 Y129.258 E.52493
G1 X136.662 Y128.463 E.05458
G1 X130.463 Y134.662 E.60211
G1 X129.669 Y134.662 E.05458
G1 X136.662 Y127.669 E.67929
G1 X136.662 Y126.874 E.05458
G1 X128.874 Y134.662 E.75648
G1 X128.079 Y134.662 E.05458
G1 X136.662 Y126.079 E.83366
G1 X136.662 Y125.285 E.05458
G1 X127.285 Y134.662 E.91085
G1 X126.49 Y134.662 E.05458
G1 X136.662 Y124.49 E.98803
G1 X136.662 Y123.695 E.05458
G1 X125.695 Y134.662 E1.06522
G1 X124.901 Y134.662 E.05458
G1 X136.662 Y122.901 E1.1424
G1 X136.662 Y122.106 E.05458
G1 X124.106 Y134.662 E1.21959
G1 X123.311 Y134.662 E.05458
G1 X136.662 Y121.311 E1.29677
G1 X136.662 Y120.517 E.05458
G1 X122.517 Y134.662 E1.37395
G1 X121.722 Y134.662 E.05458
G1 X136.662 Y119.722 E1.45114
G1 X136.662 Y118.927 E.05458
G1 X120.927 Y134.662 E1.52832
G1 X120.133 Y134.662 E.05458
G1 X136.662 Y118.133 E1.60551
G1 X136.662 Y117.338 E.05458
G1 X119.338 Y134.662 E1.6827
G1 X119.338 Y133.868 E.05456
G1 X135.868 Y117.338 E1.60555
G1 X135.073 Y117.338 E.05458
G1 X119.338 Y133.073 E1.52837
G1 X119.338 Y132.278 E.05458
G1 X134.278 Y117.338 E1.45118
G1 X133.484 Y117.338 E.05458
G1 X119.338 Y131.484 E1.374
G1 X119.338 Y130.689 E.05458
G1 X132.689 Y117.338 E1.29682
G1 X131.894 Y117.338 E.05458
G1 X119.338 Y129.894 E1.21963
G1 X119.338 Y129.1 E.05458
G1 X131.1 Y117.338 E1.14245
G1 X130.305 Y117.338 E.05458
G1 X119.338 Y128.305 E1.06526
G1 X119.338 Y127.511 E.05458
G1 X129.511 Y117.338 E.98808
G1 X128.716 Y117.338 E.05458
G1 X119.338 Y126.716 E.91089
G1 X119.338 Y125.921 E.05458
G1 X127.921 Y117.338 E.83371
G1 X127.127 Y117.338 E.05458
G1 X119.338 Y125.127 E.75653
G1 X119.338 Y124.332 E.05458
G1 X126.332 Y117.338 E.67934
G1 X125.537 Y117.338 E.05458
G1 X119.338 Y123.537 E.60216
G1 X119.338 Y122.743 E.05458
G1 X124.743 Y117.338 E.52497
G1 X123.948 Y117.338 E.05458
G1 X119.338 Y121.948 E.44779
G1 X119.338 Y121.153 E.05458
G1 X123.153 Y117.338 E.3706
G1 X122.359 Y117.338 E.05458
G1 X119.338 Y120.359 E.29342
G1 X119.338 Y119.564 E.05458
G1 X121.564 Y117.338 E.21623
G1 X120.769 Y117.338 E.05458
G1 X119.338 Y118.769 E.13905
G1 X119.338 Y117.975 E.05458
G1 X120.225 Y117.088 E.08615
; WIPE_START
G1 X119.338 Y117.975 E-.83414
G1 X119.338 Y118.72 E-.49586
; WIPE_END
G1 E-.07 F1800
G1 X124.948 Y123.895 Z20.2 F30000
G1 X137.134 Y135.134 Z20.2
G1 Z19.8
G1 E1.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.62
G1 F7559.13
G1 X118.866 Y135.134 E1.2407
G1 X118.866 Y116.866 E1.2407
G1 X137.134 Y116.866 E1.2407
G1 X137.134 Y135.044 E1.23459
G1 X137.69 Y135.69 F30000
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; CHANGE_LAYER
; Z_HEIGHT: 20.1
; LAYER_HEIGHT: 0.300001
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
; layer num/total_layer_count: 67/67
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
G17
G3 Z20.2 I1.217 J0 P1  F30000
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

; OBJECT_ID: 114
G1 X136.295 Y116.616
G1 Z20.1
G1 E1.4 F1800
; FEATURE: Top surface
G1 F7559.13
M204 S2000
G1 X137.384 Y117.705 E.10464
G1 X137.384 Y118.491
G1 X135.509 Y116.616 E.18011
G1 X134.723 Y116.616
G1 X137.384 Y119.277 E.25558
G1 X137.384 Y120.062
G1 X133.938 Y116.616 E.33104
G1 X133.152 Y116.616
G1 X137.384 Y120.848 E.40651
G1 X137.384 Y121.634
G1 X132.366 Y116.616 E.48198
G1 X131.58 Y116.616
G1 X137.384 Y122.42 E.55744
G1 X137.384 Y123.205
G1 X130.795 Y116.616 E.63291
G1 X130.009 Y116.616
G1 X137.384 Y123.991 E.70838
G1 X137.384 Y124.777
G1 X129.223 Y116.616 E.78385
G1 X128.437 Y116.616
G1 X137.384 Y125.563 E.85931
G1 X137.384 Y126.348
G1 X127.652 Y116.616 E.93478
G1 X126.866 Y116.616
G1 X137.384 Y127.134 E1.01025
G1 X137.384 Y127.92
G1 X126.08 Y116.616 E1.08572
G1 X125.294 Y116.616
G1 X137.384 Y128.706 E1.16118
G1 X137.384 Y129.491
G1 X124.509 Y116.616 E1.23665
G1 X123.723 Y116.616
G1 X137.384 Y130.277 E1.31212
G1 X137.384 Y131.063
G1 X122.937 Y116.616 E1.38759
M73 P97 R0
G1 X122.151 Y116.616
G1 X137.384 Y131.849 E1.46305
G1 X137.384 Y132.634
G1 X121.366 Y116.616 E1.53852
G1 X120.58 Y116.616
G1 X137.384 Y133.42 E1.61399
G1 X137.384 Y134.206
G1 X119.794 Y116.616 E1.68945
G1 X119.008 Y116.616
G1 X137.384 Y134.992 E1.76492
G1 X136.991 Y135.384
G1 X118.616 Y117.009 E1.76491
G1 X118.616 Y117.794
G1 X136.206 Y135.384 E1.68944
G1 X135.42 Y135.384
G1 X118.616 Y118.58 E1.61398
G1 X118.616 Y119.366
G1 X134.634 Y135.384 E1.53851
G1 X133.848 Y135.384
G1 X118.616 Y120.152 E1.46304
G1 X118.616 Y120.937
G1 X133.063 Y135.384 E1.38757
G1 X132.277 Y135.384
G1 X118.616 Y121.723 E1.31211
G1 X118.616 Y122.509
G1 X131.491 Y135.384 E1.23664
G1 X130.705 Y135.384
G1 X118.616 Y123.295 E1.16117
G1 X118.616 Y124.08
G1 X129.92 Y135.384 E1.0857
G1 X129.134 Y135.384
G1 X118.616 Y124.866 E1.01024
G1 X118.616 Y125.652
G1 X128.348 Y135.384 E.93477
G1 X127.562 Y135.384
G1 X118.616 Y126.438 E.8593
G1 X118.616 Y127.223
G1 X126.777 Y135.384 E.78384
G1 X125.991 Y135.384
G1 X118.616 Y128.009 E.70837
G1 X118.616 Y128.795
G1 X125.205 Y135.384 E.6329
G1 X124.419 Y135.384
G1 X118.616 Y129.581 E.55743
G1 X118.616 Y130.366
G1 X123.634 Y135.384 E.48197
G1 X122.848 Y135.384
G1 X118.616 Y131.152 E.4065
G1 X118.616 Y131.938
G1 X122.062 Y135.384 E.33103
G1 X121.276 Y135.384
G1 X118.616 Y132.724 E.25556
G1 X118.616 Y133.509
G1 X120.491 Y135.384 E.1801
G1 X119.705 Y135.384
G1 X118.616 Y134.295 E.10463
; WIPE_START
M204 S10000
G1 X119.705 Y135.384 E-1.02451
G1 X120.164 Y135.384 E-.30549
; WIPE_END
G1 E-.07 F1800
G1 X127.796 Y135.517 Z20.5 F30000
G1 X137.69 Y135.69 Z20.5
G1 Z20.1
G1 E1.4 F1800
; FEATURE: Outer wall
G1 F7200
M204 S5000
G1 X118.31 Y135.69 E1.31617
G1 X118.31 Y116.31 E1.31617
G1 X137.69 Y116.31 E1.31617
G1 X137.69 Y135.6 E1.31006
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F7200
M204 S10000
G1 X135.69 Y135.609 E-1.33
; WIPE_END
G1 E-.07 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20240528 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z20.6 F900 ; lower z a little
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

    G1 Z120.1 F600
    G1 Z118.1

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

