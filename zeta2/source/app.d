import std.stdio;

import karasutk.gui;

/// メイン関数
void main() {
    immutable GuiOptions options = {
        windowTitle: "zeta",
        windowWidth: 640,
        windowHeight: 480,
        windowShown: true,
        windowCenterX: true,
        windowCenterY: true,
    };
    doGuiMain(options, &guiMain);
}

void guiMain(Application app) {
    for(;;) {
        final switch(app.eventQueue.process()) {
        case EventResult.EMPTY:
            break;
        case EventResult.NOT_EMPTY:
            break;
        case EventResult.QUIT:
            return;
        }
    }
}

