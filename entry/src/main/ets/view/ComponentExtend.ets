/* 系统默认字体分类 */
export enum FontCategory {
  Headline1,
  Headline2,
  Headline3,
  Headline4,
  Headline5,
  Headline6,
  Headline7,
  Headline8,
  Subtitle1,
  Subtitle2,
  Subtitle3,
  Body1,
  Body2,
  Body3,
  Button1,
  Button2,
  Caption,
  Overline
}

export namespace FontCategory {
  export function fontSize(category: FontCategory) {
    switch (category) {
      case FontCategory.Headline1:
        return $r('app.float.text_size_headline1_96_light');
      case FontCategory.Headline2:
        return $r('app.float.text_size_headline2_72_light');
      case FontCategory.Headline3:
        return $r('app.float.text_size_headline3_60_light');
      case FontCategory.Headline4:
        return $r('app.float.text_size_headline4_48_regular');
      case FontCategory.Headline5:
        return $r('app.float.text_size_headline5_38_regular');
      case FontCategory.Headline6:
        return $r('app.float.text_size_headline6_30_medium');
      case FontCategory.Headline7:
        return $r('app.float.text_size_headline7_24_medium');
      case FontCategory.Headline8:
        return $r('app.float.text_size_headline8_20_medium');
      case FontCategory.Subtitle1:
        return $r('app.float.text_size_subtitle1_18_medium');
      case FontCategory.Subtitle2:
        return $r('app.float.text_size_subtitle2_16_medium');
      case FontCategory.Subtitle3:
        return $r('app.float.text_size_subtitle3_14_medium');
      case FontCategory.Body1:
        return $r('app.float.text_size_body1_16_regular');
      case FontCategory.Body2:
        return $r('app.float.text_size_body2_14_regular');
      case FontCategory.Body3:
        return $r('app.float.text_size_body3_12_regular');
      case FontCategory.Button1:
        return $r('app.float.text_size_button1_16_medium');
      case FontCategory.Button2:
        return $r('app.float.text_size_button2_14_medium');
      case FontCategory.Caption:
        return $r('app.float.text_size_caption_10_regular');
      case FontCategory.Overline:
        return $r('app.float.text_size_overine_14_regular');
      default:
        return $r('app.float.text_size_body1_16_regular');
    }
  }

  export function fontWeight(category: FontCategory) {
    switch (category) {
      case FontCategory.Headline1:
      case FontCategory.Headline2:
      case FontCategory.Headline3:
        return FontWeight.Lighter;
      case FontCategory.Headline4:
      case FontCategory.Headline5:
        return FontWeight.Regular;
      case FontCategory.Headline6:
      case FontCategory.Headline7:
      case FontCategory.Headline8:
      case FontCategory.Subtitle1:
      case FontCategory.Subtitle2:
      case FontCategory.Subtitle3:
        return FontWeight.Medium;
      case FontCategory.Body1:
      case FontCategory.Body2:
      case FontCategory.Body3:
        return FontWeight.Regular;
      case FontCategory.Button1:
      case FontCategory.Button2:
        return FontWeight.Medium;
      case FontCategory.Caption:
      case FontCategory.Overline:
        return FontWeight.Regular;
      default:
        return FontWeight.Regular;
    }
  }
}

/* HarmonyOS Sans 系统默认字体字号规范 */
@Extend(Text) function systemFont(category: FontCategory) {
  .fontSize(FontCategory.fontSize(category))
  .fontWeight(FontCategory.fontWeight(category))
}

