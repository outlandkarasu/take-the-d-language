import std.stdio;

import karasutk.gui;

/// メイン関数
void main() {
    // 各種ウィンドウ設定
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

/// GUIメイン関数
void guiMain(Application app) {
    // テクスチャ生成
    auto texture = app.textureFactory.makeRgbTexture2d(256, 256);
    foreach(x, y, ref p; texture) {
        p = Rgb(cast(ubyte) x, cast(ubyte) y, cast(ubyte)((x + y) / 2));
    }

    // メッシュ生成
    auto mesh = app.meshFactory.makeTriangles((va, ta, ca){
        va(-1.0f,  1.0f, 0.0f); ca(1.0f, 0.0f, 0.0f);
        va( 1.0f,  1.0f, 0.0f); ca(0.0f, 1.0f, 0.0f);
        va( 1.0f, -1.0f, 0.0f); ca(0.0f, 0.0f, 1.0f);
        va(-1.0f, -1.0f, 0.0f); ca(0.0f, 0.0f, 0.0f);

        ta(0, 2, 1);
        ta(0, 3, 2);
    });

    mesh.transferToGpu();
    scope(exit) mesh.releaseFromGpu();

    auto shader = app.shaderFactory.makeShader(ShaderSource(
                import("basic.vs"), import("basic.fs")));
    shader.transferToGpu();
    scope(exit) shader.releaseFromGpu();

    void drawFrame() {
        shader.duringUse({mesh.draw();});
    }

    for(;;) {
        final switch(app.eventQueue.process()) {
        case EventResult.EMPTY:
            app.drawFrame(&drawFrame);
            break;
        case EventResult.NOT_EMPTY:
            break;
        case EventResult.QUIT:
            return;
        }
    }
}

