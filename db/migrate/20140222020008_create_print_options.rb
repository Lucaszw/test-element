class CreatePrintOptions < ActiveRecord::Migration
  def change
    create_table :print_options do |t|
      
      # Printer Options
      t.float   :nozzle_diameter
      t.float   :center_of_print_x
      t.float   :center_of_print_y
      t.string  :gcode_flavor
      t.string  :use_relative_e_distances
      t.string  :gcode_arcs
      t.string  :g0
      t.float   :vibration_limit

      # Filament Options
      t.float   :filament_diameter
      t.float   :extrusion_multiplier
      t.float   :temperature
      t.float   :first_layer_temperature
      t.float   :bed_temperature
      t.float   :first_layer_bed_temperature
     
      # Speed Options
      t.float   :travel_speed
      t.float   :perimeter_speed
      t.float   :small_perimeter_speed
      t.float   :external_perimeter_speed
      t.float   :infill_speed
      t.float   :solid_infill_speed
      t.float   :top_solid_infill_speed
      t.float   :support_material_speed
      t.float   :bridge_speed
      t.float   :gap_fill_speed
      t.float   :first_layer_speed

      # Acceleration Options
      t.float   :perimeter_acceleration
      t.float   :infill_acceleration
      t.float   :bridge_acceleration
      t.float   :default_acceleration

      # Accuracy Options
      t.float   :layer_height
      t.float   :first_layer_height
      t.integer :infill_every_layers
      t.integer :solid_infill_every_layers

      # Print Options
      t.integer :perimeters
      t.integer :top_solid_layers
      t.integer :bottom_solid_layers
      t.integer :solid_layers
      t.float   :fill_density
      t.float   :fill_angle
      t.string  :fill_pattern
      t.string  :solid_fill_pattern
      t.string  :extra_perimeters
      t.string  :randomize_start
      t.string  :avoid_crossing_perimeters
      t.string  :external_perimeters_first
      t.string  :only_retract_when_crossing_perimeters
      t.float   :solid_infill_below_area
      t.string  :infill_only_where_needed
      t.string  :infill_first

      # Support Material Options
      t.string  :support_material
      t.integer :support_material_threshold
      t.string  :support_material_pattern
      t.float   :support_material_spacing
      t.float   :support_material_angle
      t.integer :support_material_interface_layers
      t.float   :support_material_interface_spacing
      t.integer :raft_layers
      t.integer :support_material_enforce_layers

      # Retract Options
      t.float   :retract_length
      t.float   :retract_speed
      t.float   :retract_restart_extra
      t.float   :retract_before_travel
      t.float   :retract_lift
      t.string  :retract_layer_change
      t.string  :wipe

      # Retract Options for Multi-Extruder Setups 
      t.float   :retract_length_toolchange
      t.float   :retract_restart_extra_toolchange

      # Cooling Options
      t.string  :cooling
      t.float   :min_fan_speed
      t.float   :max_fan_speed
      t.float   :bridge_fan_speed
      t.float   :fan_below_layer_time
      t.float   :slowdown_below_layer_time
      t.float   :min_print_speed
      t.integer :disable_fan_first_N_layers
      t.string  :fan_always_on

      # Skirt Options
      t.integer :skirts
      t.float   :skirt_distance
      t.float   :skirt_height
      t.float   :min_skirt_length
      t.float   :brim_width

      # Transform Options
      t.integer :scale # may also be a float?
      t.integer :rotate
      t.integer :duplicate
      t.integer :bed_size
      t.integer :duplicate_grid
      t.float   :duplicate_distance

      # More Options
      t.float   :resolution


      t.timestamps
    end
  end
end
