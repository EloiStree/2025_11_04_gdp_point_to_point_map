class_name MapGpsStruct extends Resource

class STRUCT_GpsThreePointsOnMapResource extends Resource:
	@export var point_a :STRUCT_GpsPointResource
	@export var point_b :STRUCT_GpsPointResource
	@export var point_c :STRUCT_GpsPointResource


class STRUCT_GpsPointResource extends Resource:
	@export var map_lattitude :float
	@export var map_longitude :float
	@export var map_altitude :float
