extends GutTest

func test_sanity_check():
	assert_eq(1, 1, "Math should still work")

func test_testbed_project_exists():
	assert_true(FileAccess.file_exists("res://project.godot"), "The hidden workbench project should exist")
