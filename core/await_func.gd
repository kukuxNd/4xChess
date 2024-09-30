extends Node

signal custom_condition_met

# 异步函数等待一段时间
func wait_seconds(seconds):
    await get_tree().create_timer(seconds).timeout

# 异步函数等待信号
# func wait_for_signal(node:Node, signal:string):
#     await node.to_signal(signal)

# 异步函数等待下一帧
func wait_for_frame():
    await get_tree().process_frame

# 异步函数进行HTTP请求
func make_http_request(url):
    var http_request = HTTPRequest.new()
    add_child(http_request)
    http_request.connect("request_completed", self.n_http_request_completed)
    http_request.request(url)
    await http_request.to_signal("request_completed")

# HTTP请求完成时调用的函数
func _on_http_request_completed(result, response_code, headers, body):
    print("HTTP Request completed with response code: ", response_code)

# 异步函数等待自定义条件
# func wait_for_custom_condition():
#     var condition_met = false
#     while not condition_met:
#         await to_signal("custom_condition_met")
#     print("Custom condition met.")

# 异步函数等待I/O操作
# func save_data(data):
#     var file = File.new()
#     await file.to_signal("idle")
#     file.open("user://savefile.save", File.WRITE)
#     await file.to_signal("idle")
#     file.store_string(data)
#     file.close()

# 异步函数执行循环等待
func loop_wait():
    for i in range(5):
        await get_tree().create_timer(1.0).timeout
        print("Loop iteration: ", i + 1)

# 异步函数等待多个条件
func wait_for_multiple_conditions():
    var timer1 = get_tree().create_timer(2.0)
    var timer2 = get_tree().create_timer(3.0)
    await timer1.to_signal("timeout")
    await timer2.to_signal("timeout")
    print("One of the timers expired.")

func _ready():
    # 调用协程并等待它们完成
    wait_seconds(2)
    #wait_for_signal(self, "custom_condition_met")
    wait_for_frame()
    #await_for_custom_condition()
    
    make_http_request("http://example.com")
    wait_for_multiple_conditions()
    loop_wait()
    await GameGlobal._sg_game_over_

    #save_data("Hello, World!")