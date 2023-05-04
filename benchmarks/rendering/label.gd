extends Benchmark

const LOREM_IPSUM = "Ullam dolorum consequuntur minima neque soluta ab. Est dolores officiis reiciendis omnis eum inventore. Laboriosam quis magni asperiores officia fuga animi qui. Quisquam repudiandae non quisquam vero aut id. Voluptatem occaecati fugiat officia distinctio omnis nesciunt occaecati."
const FONT_SIZE = 9

# Defined to make the label span the entire viewport.
var label_size := Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"))

func _init() -> void:
	test_render_cpu = true
	test_render_gpu = true


func benchmark_label() -> Label:
	var label = Label.new()
	label.add_theme_font_size_override("font_size", FONT_SIZE)
	label.size = label_size
	label.text = LOREM_IPSUM.repeat(100)
	return label


func benchmark_label_autowrap_arbitrary() -> Label:
	var label := benchmark_label()
	label.autowrap_mode = TextServer.AUTOWRAP_ARBITRARY
	return label


func benchmark_label_autowrap_word() -> Label:
	var label := benchmark_label()
	label.autowrap_mode = TextServer.AUTOWRAP_WORD
	return label


func benchmark_label_autowrap_smart() -> Label:
	var label = benchmark_label()
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	return label
