cmake_minimum_required(VERSION 3.16)

project(test_task VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 REQUIRED)

qt_add_executable(apptest_task
    src/main.cpp
    src/serverlistmodel.cpp
    src/windowcontroller.cpp
)

qt_add_qml_module(apptest_task
    URI test_task
    VERSION 1.0
    QML_FILES
        src/qml/main.qml
        src/qml/BaseDelegate.qml
        src/qml/BorderRectangle.qml
        src/qml/ConnectionIndicator.qml
        src/qml/ServerListDelegate.qml
        src/qml/ServerScreen.qml
        src/qml/StyledButton.qml
        src/qml/Style/Globals.qml
)


set_target_properties(apptest_task PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptest_task
    PRIVATE
        Qt6::Quick
        Qt6::QuickControls2
    )

install(TARGETS apptest_task
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
