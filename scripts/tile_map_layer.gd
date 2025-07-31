extends TileMapLayer

const width = 400
const height = 400
const start_generation = 200

var noise = FastNoiseLite.new()

func _ready() -> void:
	noise.frequency = 0.01
	noise.seed = randi()
	
	for x in width:
		for y in height:
			var world_X = x - start_generation
			var world_y = y - start_generation
			
			var value = noise.get_noise_2d(world_X, world_y)
			
			var tile_id = 1
			if value > -0.3:
				tile_id = 2
			if value > -0.2:
				tile_id = 3
			if value > 0.3:
				tile_id = 4
			if value > 0.5:
				tile_id = 5
			
			set_cell(Vector2i(world_X, world_y), tile_id, Vector2i(0, 0))
