extends Node

class_name  SaveFunctions

# 使用ConfigFile保存和加载INI格式数据
func save_and_load_config():
    var config = ConfigFile.new()
    config.set_value("player", "name", "Kimi")
    config.set_value("player", "level", 5)
    config.save("user://config.ini")

    if config.load("user://config.ini") == OK:
        var name = config.get_value("player", "name", "DefaultName")
        var level = config.get_value("player", "level", 1)
        print("Loaded name: ", name)
        print("Loaded level: ", level)

# 使用JSON保存和加载数据
func save_and_load_json():
    var data = { "key": "value", "number": 42 }
    var json_data = JSON.parse_string(data)
    var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
    file.store_string(json_data)

    var file2 = FileAccess.open("user://data.json", FileAccess.READ)
    if file2 == OK:
        var loaded_json = file2.get_as_text()
        var parsed_data = JSON.parse_string(loaded_json)
        if parsed_data.error == OK:
            print("Loaded JSON: ", parsed_data.result)

# 使用二进制格式保存和加载数据
func save_and_load_binary():
    var save_game = { "lives": 3, "score": 12345 }
    var stream = StreamPeerBuffer.new()
    stream.put_var(save_game)
    FileAccess.open("user://savegame.bin", FileAccess.WRITE).store_buffer(stream.data_array)

    var file = FileAccess.open("user://savegame.bin", FileAccess.READ) 
    if file == OK:
        var stream_read = StreamPeerBuffer.new()
        stream_read.put_data_array(file.get_buffer(file.get_len()))
        var loaded_data = stream_read.get_var()
        print("Loaded binary lives: ", loaded_data.lives)
        print("Loaded binary score: ", loaded_data.score)

# 使用ResourceSaver保存和加载资源
func save_and_load_resource():
    var resource = Resource.new()
    resource.set_name("ExampleResource")
    resource.set_property_list(["some_property"])
    resource.some_property = "value"
    ResourceSaver.save(resource,"user://resource.res")

    var loaded_resource = ResourceLoader.load("user://resource.res")
    if loaded_resource != null:
        print("Loaded resource property: ", loaded_resource.some_property)

# 使用File类保存和加载文本文件
func save_and_load_text_file():
    var file = FileAccess.open("user://data.txt", FileAccess.WRITE)
    file.store_string("Hello, World!")
    file.close()

    var file_read = FileAccess.open("user://data.txt", FileAccess.READ)
    if file_read == OK:
        var content = file_read.get_as_text()
        print("Loaded text file content: ", content)

# 调用所有保存和加载函数
func _ready():
    save_and_load_config()
    save_and_load_json()
    save_and_load_binary()
    save_and_load_resource()
    save_and_load_text_file()