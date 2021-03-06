
# --- Version Check ---

# Some linux distributions have qt version 4 already installed. Sometimes this
# can lead to running the wrong qmake version. Notify the user:

!qtVersionCheck(5, 6)::error( \
    This project requires at least Qt version 5.6. \
    Make sure you have Qt 5.6 installed and running the correct qmake. \
)

# --- Project structure ---

TEMPLATE = subdirs

SUBDIRS += plugins

# --- Subdir configurations ---
plugins.subdir      = $$PWD/plugins


!isEmpty(BUILD_DEPENDENCIES):equals($$BUILD_DEPENDENCIES, true){
    SUBDIRS += dependencies

    dependencies.subdir = $$PWD/dependencies
    plugins.depends = dependencies
}

# --- Dependency configuration ---


# Include the global configuration files since otherwise they would never show
# up in your project
OTHER_FILES += \
    .qmake.conf \

OTHER_FILES += \
    $$LIVECV_DEV_PATH/project/*.pri
