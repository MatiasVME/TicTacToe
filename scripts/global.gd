
extends Node

const RES = 360

var board = [[0, 0, 0],
			 [0, 0, 0],
			 [0, 0, 0]]

var current_figure = 1 # 0 vacio | 1 x | 2 o
var figure = load("res://scenes/xo.tscn")

var win = -1 # -1 nothing | 0 draw | 1 x | 2 o

func figure_pos(x, y):
	if x == 0 and y == 0:
		_generate_figure(RES / 4 - 35, RES / 4 - 40)
		print("x: ", x, " y: ", y)
	elif x == 1 and y == 0:
		_generate_figure(RES / 4 - 35, RES / 2)
		print("x: ", x, " y: ", y)
	elif x == 2 and y == 0:
		_generate_figure(RES / 4 - 35, RES - 60)
		print("x: ", x, " y: ", y)
	elif x == 0 and y == 1:
		_generate_figure(RES / 2, RES / 4 - 35)
		print("x: ", x, " y: ", y)
	elif x == 1 and y == 1:
		_generate_figure(RES / 2, RES / 2)
		print("x: ", x, " y: ", y)
	elif x == 2 and y == 1:
		_generate_figure(RES / 2, RES - 60)
		print("x: ", x, " y: ", y)
	elif x == 0 and y == 2:
		_generate_figure(RES - 60, RES / 4 - 35)
		print("x: ", x, " y: ", y)
	elif x == 1 and y == 2:
		_generate_figure(RES - 60, RES / 2)
		print("x: ", x, " y: ", y)
	elif x == 2 and y == 2:
		_generate_figure(RES - 60, RES - 60)
		print("x: ", x, " y: ", y)
		
	_add_element_to_board(x,y)
	check_win(current_figure)
	current_figure()
	
	print(board)
	
func _generate_figure(x, y):
	var xo = figure.instance()
	add_child(xo)
		
	if current_figure == 2:
		xo.change_o()
	
	xo.set_pos(Vector2(x,y))

func _add_element_to_board(x, y):
	board[x][y] = current_figure
	print(board)

func current_figure():
	if current_figure == 1:
		current_figure = 2
	elif current_figure == 2:
		current_figure = 1

func check_win(current_pos):
	# check horizontal
	var i = 0
	
	while i <= 2:
		if board[i][0] == board[i][1] and board[i][0] == board[i][2] and board[i][0] != 0:
			win = current_figure
			get_tree().change_scene("res://scenes/final.tscn")
			print("epic win ", current_figure)
		i += 1

	# check vertical
	var j = 0
	
	while j <= 2:
		if board[0][j] == board[1][j] and board[0][j] == board[2][j] and board[0][j] != 0:
			win = current_figure
			get_tree().change_scene("res://scenes/final.tscn")
			print("epic win ", current_figure)
		j += 1
	
	# check diagonal
	if board[0][0] == board[1][1] and board[0][0] == board[2][2] and board[0][0] != 0:
		win = current_figure
		get_tree().change_scene("res://scenes/final.tscn")
		print("epic win ", current_figure)
	elif board[2][0] == board[1][1] and board[2][0] == board[0][2] and board[2][0] != 0:
		win = current_figure
		get_tree().change_scene("res://scenes/final.tscn")
		print("epic win ", current_figure)