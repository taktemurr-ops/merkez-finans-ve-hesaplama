#!/usr/bin/env python3
"""Finans ve Hesaplama merkezinin özgün simge, açılış ve mağaza görselleri (Pillow).
Üçüncü taraf görsel kullanılmaz.  pip install pillow && python tool/generate_assets.py"""
import os
from PIL import Image, ImageDraw

BG_TOP, BG_BOTTOM, ACCENT, LIGHT = (20, 67, 47), (6, 23, 16), (123, 224, 161), (236, 244, 238)


def gradient(w, h):
    im = Image.new("RGB", (w, h))
    d = ImageDraw.Draw(im)
    for y in range(h):
        t = y / max(1, h - 1)
        d.line([(0, y), (w, y)], fill=tuple(int(BG_TOP[i] * (1 - t) + BG_BOTTOM[i] * t) for i in range(3)))
    return im


def glyph(d, cx, cy, s, color=ACCENT):
    """Yükselen sütunlar ve bir madeni para: özgün, sade çizim."""
    w = max(2, int(s // 14))
    base = cy + s * 0.36
    for i, h in enumerate((0.28, 0.46, 0.66)):
        x0 = cx - s * 0.42 + i * s * 0.22
        d.rounded_rectangle([x0, base - s * h, x0 + s * 0.16, base], radius=w, fill=color if i == 2 else LIGHT)
    r = s * 0.17
    ox, oy = cx + s * 0.27, cy - s * 0.22
    d.ellipse([ox - r, oy - r, ox + r, oy + r], fill=color, outline=LIGHT, width=w)
    d.line([(ox, oy - r * 0.55), (ox, oy + r * 0.55)], fill=BG_BOTTOM, width=w)
    d.line([(cx - s * 0.46, base + w), (cx + s * 0.46, base + w)], fill=LIGHT, width=w)


def icon(size=1024):
    im = gradient(size, size)
    glyph(ImageDraw.Draw(im), size / 2, size / 2, size * 0.62)
    return im


def main():
    os.makedirs("assets/branding", exist_ok=True)
    os.makedirs("store", exist_ok=True)
    ic = icon()
    ic.save("assets/branding/icon.png")
    fg = Image.new("RGBA", (1024, 1024), (0, 0, 0, 0))
    glyph(ImageDraw.Draw(fg), 512, 512, 420)
    fg.save("assets/branding/icon_foreground.png")
    sp = Image.new("RGBA", (768, 768), (0, 0, 0, 0))
    glyph(ImageDraw.Draw(sp), 384, 384, 300)
    sp.save("assets/branding/splash.png")
    a12 = Image.new("RGBA", (1152, 1152), (0, 0, 0, 0))
    glyph(ImageDraw.Draw(a12), 576, 576, 380)
    a12.save("assets/branding/splash_android12.png")
    ic.resize((512, 512)).save("store/icon_512.png")
    fe = gradient(1024, 500)
    glyph(ImageDraw.Draw(fe), 512, 250, 300)
    fe.save("store/feature_graphic.png")
    print("assets ok")


if __name__ == "__main__":
    main()
