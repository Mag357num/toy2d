find_package(Vulkan REQUIRED)
if (NOT TARGET Vulkan::Vulkan)
    if (WIN32) # Windows, use clang or MSVC
        set(VULKAN_INCLUDE_DIR "$ENV{VULKAN_SDK}/Include")
        set(VULKAN_LIB_LOCATION "$ENV{VULKAN_SDK}/Lib/vulkan-1.lib")
        add_library(Vulkan::Vulkan STATIC IMPORTED GLOBAL)
        set_target_properties(
            Vulkan::Vulkan
            PROPERTIES
                IMPORTED_LOCATION ${VULKAN_LIB_LOCATION}
                INTERFACE_INCLUDE_DIRECTORIES ${VULKAN_INCLUDE_DIR}
        )
    else() # Unix or MacOSX
        find_package(Vulkan REQUIRED)
    endif()
endif()
