extends Node
## Autoload for storing and loading user preferences

const USER_PREFERENCES_PATH: String = "user://user_preferences.tres"
@export var _data: UserPreferencesData

func save_user_preferences() -> void:
	if not _data:
		_data = UserPreferencesData.new()
	ResourceSaver.save(_data, USER_PREFERENCES_PATH)
	print("Saved UserPreferencesData to '{0}'.".format([USER_PREFERENCES_PATH]))

func load_user_preferences() -> void:
	if ResourceLoader.exists(USER_PREFERENCES_PATH):
		_data = ResourceLoader.load(USER_PREFERENCES_PATH, "UserPreferencesData") as UserPreferencesData
		if _data:
			print("Loaded UserPreferencesData from '{0}'.".format([USER_PREFERENCES_PATH]))
		else:
			printerr("Failed to load UserPreferencesData from '{0}', invalid resource type.".format([USER_PREFERENCES_PATH]))
	else:
		printerr("Failed to load UserPreferencesData from '{0}', file not found.".format([USER_PREFERENCES_PATH]))
