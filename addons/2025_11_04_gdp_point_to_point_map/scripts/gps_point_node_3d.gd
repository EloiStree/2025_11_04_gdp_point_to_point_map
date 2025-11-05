class_name GpsPointNode3D
extends Node3D

@export var  map_longitude: float
@export var  map_latitude: float
@export var  map_altitude: float


func set_location(latitude: float, longitude: float, altitude: float) -> void:
	map_latitude = latitude
	map_longitude = longitude
	map_altitude = altitude

func set_longitude(longitude: float) -> void:
	map_longitude = longitude

func set_latitude(latitude: float) -> void:
	map_latitude = latitude

func set_altitude(altitude: float) -> void:
	map_altitude = altitude

func get_latitude() -> float:
	return map_latitude

func get_longitude() -> float:
	return map_longitude

func get_altitude() -> float:
	return map_altitude

func get_game_position_of_node() -> Vector3:
	# Return this node position in Godot
	return global_transform.origin
