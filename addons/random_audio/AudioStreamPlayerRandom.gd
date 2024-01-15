@tool
extends AudioStreamPlayer

## Use this instead of "volume_db"
@export_range(-80.0, 24.0, 0.001) var volume: float
@export_range(0.0, 24.0, 0.001) var volume_deviation: float

## Use this instead of "pitch_scale"
@export_range(0.01, 4.0, 0.01) var pitch: float = 1.0
@export_range(0.0, 5.0, 0.01) var pitch_deviation: float = 0.0

## Use this instead of "playing"
@export var playing_random: bool = false:
	set(value):
		if value:
			play_random()
## Use this instead of "autoplay"
@export var autoplay_random: bool = false:
	set(value):
		if Engine.is_editor_hint() and value and autoplay:
			autoplay = false
		autoplay_random = value

@export_group("Stream Array Settings")
@export var use_stream_array: bool = false
@export var stream_array: AudioStreamArray:
	set(value):
		stream_array = value
		counter = 0
@export var round_robin: bool = true

var counter: int:
	set(value):
		counter = value
		if stream_array:
			counter %= stream_array.streams.size()

func _ready() -> void:
	if autoplay_random:
		play_random()

## use this function to trigger random sound playback
func play_random() -> void:
	if use_stream_array:
		if not stream_array: return
		if round_robin:
			if counter == 0:
				stream_array.streams.shuffle()
			stream = stream_array.streams[counter]
			counter += 1
		else:
			stream_array.streams.shuffle()
			stream = stream_array.streams[0]
	
	pitch_scale = max(pitch + ((randf() - 1.0) * 2.0) * pitch_deviation, 0.01)
	volume_db = volume + ((randf() - 1.0) * 2.0) * volume_deviation
	play()
