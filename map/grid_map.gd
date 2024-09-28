extends CanvasGroup


const CELL_SIZE = 50  # 格子大小
const GRID_WIDTH = 3  # 格子宽度
const GRID_HEIGHT = 3  # 格子高度

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _draw() -> void:
	draw_grid()
	pass

func draw_grid() -> void:
	for y in range(GRID_HEIGHT):
		for x in range(GRID_WIDTH):
			draw_rect(Rect2(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE), Color(1, 1, 1))  # 白色格子
			draw_rect(Rect2((x + 0.5) * CELL_SIZE, (y + 0.5) * CELL_SIZE, CELL_SIZE / 2, CELL_SIZE / 2), Color(0, 0, 0))  # 黑色中心点，可选
#     # 绘制格子分隔线
	for y in range(GRID_HEIGHT + 1):
		draw_line(Vector2(0, y * CELL_SIZE), Vector2(GRID_WIDTH * CELL_SIZE, y * CELL_SIZE), Color(0, 0, 0))
	for x in range(GRID_WIDTH + 1):
		draw_line(Vector2(x * CELL_SIZE, 0), Vector2(x * CELL_SIZE, GRID_HEIGHT * CELL_SIZE), Color(0, 0, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
