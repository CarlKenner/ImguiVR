include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_subdirectory(imgui)
add_subdirectory(shared)
# add_subdirectory(lodepng)
# add_subdirectory(Catch)

set(SRC
	${imgui_SRC}
	${shared_SRC}
	# ${cyCodeBase_SRC}
	# ${lodepng_SRC}
	${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt
	${CMAKE_CURRENT_SOURCE_DIR}/CGLRenderModel.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/CGLRenderModel.h
	# ${CMAKE_CURRENT_SOURCE_DIR}/imgui_draw_3d.cpp
	# ${CMAKE_CURRENT_SOURCE_DIR}/imgui_draw_3d.h
	# ${CMAKE_CURRENT_SOURCE_DIR}/imgui_impl_vr.cpp
	# ${CMAKE_CURRENT_SOURCE_DIR}/imgui_impl_vr.h
	${CMAKE_CURRENT_SOURCE_DIR}/InitShader.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/InitShader.h
	${CMAKE_CURRENT_SOURCE_DIR}/Raycast.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/Raycast.h
	${CMAKE_CURRENT_SOURCE_DIR}/hellovr_opengl_main.cpp
	)

set(ImguiVR_SRC ${SRC} PARENT_SCOPE)
