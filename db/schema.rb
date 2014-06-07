# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140607044754) do

  create_table "catagories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "username"
    t.string   "title"
    t.text     "thumbnail"
    t.text     "description"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_model_id"
  end

  create_table "model_uploads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stlfile_file_name"
    t.string   "stlfile_content_type"
    t.integer  "stlfile_file_size"
    t.datetime "stlfile_updated_at"
  end

  create_table "print_options", force: true do |t|
    t.float    "nozzle_diameter"
    t.float    "center_of_print_x"
    t.float    "center_of_print_y"
    t.string   "gcode_flavor"
    t.string   "use_relative_e_distances"
    t.string   "gcode_arcs"
    t.string   "g0"
    t.float    "vibration_limit"
    t.float    "filament_diameter"
    t.float    "extrusion_multiplier"
    t.float    "temperature"
    t.float    "first_layer_temperature"
    t.float    "bed_temperature"
    t.float    "first_layer_bed_temperature"
    t.float    "travel_speed"
    t.float    "perimeter_speed"
    t.float    "small_perimeter_speed"
    t.float    "external_perimeter_speed"
    t.float    "infill_speed"
    t.float    "solid_infill_speed"
    t.float    "top_solid_infill_speed"
    t.float    "support_material_speed"
    t.float    "bridge_speed"
    t.float    "gap_fill_speed"
    t.float    "first_layer_speed"
    t.float    "perimeter_acceleration"
    t.float    "infill_acceleration"
    t.float    "bridge_acceleration"
    t.float    "default_acceleration"
    t.float    "layer_height"
    t.float    "first_layer_height"
    t.integer  "infill_every_layers"
    t.integer  "solid_infill_every_layers"
    t.integer  "perimeters"
    t.integer  "top_solid_layers"
    t.integer  "bottom_solid_layers"
    t.integer  "solid_layers"
    t.float    "fill_density"
    t.float    "fill_angle"
    t.string   "fill_pattern"
    t.string   "solid_fill_pattern"
    t.string   "extra_perimeters"
    t.string   "randomize_start"
    t.string   "avoid_crossing_perimeters"
    t.string   "external_perimeters_first"
    t.string   "only_retract_when_crossing_perimeters"
    t.float    "solid_infill_below_area"
    t.string   "infill_only_where_needed"
    t.string   "infill_first"
    t.string   "support_material"
    t.integer  "support_material_threshold"
    t.string   "support_material_pattern"
    t.float    "support_material_spacing"
    t.float    "support_material_angle"
    t.integer  "support_material_interface_layers"
    t.float    "support_material_interface_spacing"
    t.integer  "raft_layers"
    t.integer  "support_material_enforce_layers"
    t.float    "retract_length"
    t.float    "retract_speed"
    t.float    "retract_restart_extra"
    t.float    "retract_before_travel"
    t.float    "retract_lift"
    t.string   "retract_layer_change"
    t.string   "wipe"
    t.float    "retract_length_toolchange"
    t.float    "retract_restart_extra_toolchange"
    t.string   "cooling"
    t.float    "min_fan_speed"
    t.float    "max_fan_speed"
    t.float    "bridge_fan_speed"
    t.float    "fan_below_layer_time"
    t.float    "slowdown_below_layer_time"
    t.float    "min_print_speed"
    t.integer  "disable_fan_first_N_layers"
    t.string   "fan_always_on"
    t.integer  "skirts"
    t.float    "skirt_distance"
    t.float    "skirt_height"
    t.float    "min_skirt_length"
    t.float    "brim_width"
    t.integer  "scale"
    t.integer  "rotate"
    t.integer  "duplicate"
    t.integer  "bed_size"
    t.integer  "duplicate_grid"
    t.float    "duplicate_distance"
    t.float    "resolution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_models", force: true do |t|
    t.string   "name"
    t.string   "thumbnail"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "description"
    t.string   "stlfile_file_name"
    t.string   "stlfile_content_type"
    t.integer  "stlfile_file_size"
    t.datetime "stlfile_updated_at"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.float    "price"
    t.string   "calculated_volumes"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "sketchfab_token"
    t.string   "email"
    t.integer  "verificationcode"
    t.boolean  "didVerify"
  end

end
