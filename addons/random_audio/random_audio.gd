@tool
extends EditorPlugin

func _enter_tree():
	# Initialization of the plugin goes here.
	# Add the new type with a name, a parent type, a script and an icon.
	add_custom_type("AudioStreamPlayerRandom", "AudioStreamPlayer", preload("AudioStreamPlayerRandom.gd"), preload("AudioStreamPlayerRandom.svg"))
	add_custom_type("AudioStreamPlayerRandom2D", "AudioStreamPlayer2D", preload("AudioStreamPlayerRandom2D.gd"), preload("AudioStreamPlayerRandom2D.svg"))
	add_custom_type("AudioStreamPlayerRandom3D", "AudioStreamPlayer3D", preload("AudioStreamPlayerRandom3D.gd"), preload("AudioStreamPlayerRandom3D.svg"))

func _exit_tree():
	# Clean-up of the plugin goes here.
	# Always remember to remove it from the engine when deactivated.
	remove_custom_type("AudioStreamPlayerRandom")
	remove_custom_type("AudioStreamPlayerRandom2D")
	remove_custom_type("AudioStreamPlayerRandom3D")
