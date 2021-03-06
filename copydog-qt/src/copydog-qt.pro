QT       += core gui svg

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    aboutwindow.cpp \
    filetypesetting.cpp \
    ignorefolderitem.cpp \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    aboutwindow.h \
    config.h \
    copydog.h \
    filetypesetting.h \
    ignorefolderitem.h \
    mainwindow.h \
    versions.h \
    watcher.h

FORMS += \
    aboutwindow.ui \
    filetypesetting.ui \
    ignorefolderitem.ui \
    mainwindow.ui

unix: LIBS += -ldl
win32: LIBS += -lws2_32 -luserenv -ladvapi32

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

unix|win32: LIBS += -L$$PWD/../lib/ -lcopydogffi

INCLUDEPATH += $$PWD/.
DEPENDPATH += $$PWD/.

win32:!win32-g++: PRE_TARGETDEPS += $$PWD/../lib/copydogffi.lib
else:unix|win32-g++: PRE_TARGETDEPS += $$PWD/../lib/libcopydogffi.a

RESOURCES += \
    resources.qrc
