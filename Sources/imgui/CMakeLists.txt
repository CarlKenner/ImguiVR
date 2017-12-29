include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(imgui_SRC
	${CMAKE_CURRENT_SOURCE_DIR}/imconfig.h
	${CMAKE_CURRENT_SOURCE_DIR}/imgui.h
	${CMAKE_CURRENT_SOURCE_DIR}/imgui.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/imgui_demo.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/imgui_draw.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/imgui_draw_3d.h
	${CMAKE_CURRENT_SOURCE_DIR}/imgui_draw_3d.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/imgui_internal.h
	${CMAKE_CURRENT_SOURCE_DIR}/stb_rect_pack.h
	${CMAKE_CURRENT_SOURCE_DIR}/stb_textedit.h
	${CMAKE_CURRENT_SOURCE_DIR}/stb_truetype.h
	${CMAKE_CURRENT_SOURCE_DIR}/imgui_impl_vr.h
	${CMAKE_CURRENT_SOURCE_DIR}/imgui_impl_vr.cpp
	PARENT_SCOPE)