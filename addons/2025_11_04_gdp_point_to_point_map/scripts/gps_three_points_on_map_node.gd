@tool
extends Node
class_name GpsThreePointsOnMapNode

@export_group("Reference")
@export var point_a: GpsPointNode3D
@export var point_b: GpsPointNode3D
@export var point_c: GpsPointNode3D

@export var given_real_world_distance_a_b_meter: float = 0.0 :
	set(value):
		if given_real_world_distance_a_b_meter != value:
			given_real_world_distance_a_b_meter = value
			update_distance_compute_data()
	get:
		return given_real_world_distance_a_b_meter

# @export_tool_button("Update Distance Compute Data","Callable")
# var some_func_right_after: Callable = func(): update_distance_compute_data()

@export_group("Computed data")
@export var ratio_game_to_real_world_meter: float
@export var game_world_distance_a_b: float



@export var deduced_real_world_distance_b_c: float
@export var game_world_distance_b_c: float

@export var deduced_real_world_distance_c_a: float
@export var game_world_distance_c_a: float

@export var total_distance_in_game: float
@export var total_distance_in_real_life: float

@export var point_a_engine_position: Vector3
@export var point_b_engine_position: Vector3
@export var point_c_engine_position: Vector3




func _ready() -> void:
	update_distance_compute_data()
	
func update_distance_compute_data() -> void:
	game_world_distance_a_b = point_a.global_transform.origin.distance_to(point_b.global_transform.origin)
	game_world_distance_b_c = point_b.global_transform.origin.distance_to(point_c.global_transform.origin)
	game_world_distance_c_a = point_c.global_transform.origin.distance_to(point_a.global_transform.origin)
	ratio_game_to_real_world_meter = given_real_world_distance_a_b_meter / game_world_distance_a_b
	deduced_real_world_distance_b_c = (ratio_game_to_real_world_meter) * game_world_distance_b_c
	deduced_real_world_distance_c_a = (ratio_game_to_real_world_meter) * game_world_distance_c_a
	total_distance_in_real_life = given_real_world_distance_a_b_meter + deduced_real_world_distance_b_c + deduced_real_world_distance_c_a
	total_distance_in_game = game_world_distance_a_b + game_world_distance_b_c + game_world_distance_c_a
	point_a_engine_position = point_a.global_transform.origin
	point_b_engine_position = point_b.global_transform.origin
	point_c_engine_position = point_c.global_transform.origin
	
func get_gps_location_from_vector3(position: Vector3) -> MapGpsStruct.STRUCT_GpsPointResource:
	var result = MapGpsStruct.STRUCT_GpsPointResource.new()
	return result
