/* 系统默认字体分类 */
export enum FontCategory {
  Headline96Light,
  Headline72Light,
  Headline60Light,
  Headline48Regular,
  Headline38Regular,
  Headline30Medium,
  Headline24Medium,
  Headline20Medium,
  Subtitle18Medium,
  Subtitle16Medium,
  Subtitle14Medium,
  Body16Regular,
  Body14Regular,
  Body12Regular,
  Button16Medium,
  Button14Medium,
  Caption10Regular,
  Overline14Regular
}

export namespace FontCategory {
  export function fontSize(category: FontCategory): Resource {
    switch (category) {
      case FontCategory.Headline96Light:
        return $r('app.float.text_size_headline1_96_light');
      case FontCategory.Headline72Light:
        return $r('app.float.text_size_headline2_72_light');
      case FontCategory.Headline60Light:
        return $r('app.float.text_size_headline3_60_light');
      case FontCategory.Headline48Regular:
        return $r('app.float.text_size_headline4_48_regular');
      case FontCategory.Headline38Regular:
        return $r('app.float.text_size_headline5_38_regular');
      case FontCategory.Headline30Medium:
        return $r('app.float.text_size_headline6_30_medium');
      case FontCategory.Headline24Medium:
        return $r('app.float.text_size_headline7_24_medium');
      case FontCategory.Headline20Medium:
        return $r('app.float.text_size_headline8_20_medium');
      case FontCategory.Subtitle18Medium:
        return $r('app.float.text_size_subtitle1_18_medium');
      case FontCategory.Subtitle16Medium:
        return $r('app.float.text_size_subtitle2_16_medium');
      case FontCategory.Subtitle14Medium:
        return $r('app.float.text_size_subtitle3_14_medium');
      case FontCategory.Body16Regular:
        return $r('app.float.text_size_body1_16_regular');
      case FontCategory.Body14Regular:
        return $r('app.float.text_size_body2_14_regular');
      case FontCategory.Body12Regular:
        return $r('app.float.text_size_body3_12_regular');
      case FontCategory.Button16Medium:
        return $r('app.float.text_size_button1_16_medium');
      case FontCategory.Button14Medium:
        return $r('app.float.text_size_button2_14_medium');
      case FontCategory.Caption10Regular:
        return $r('app.float.text_size_caption_10_regular');
      case FontCategory.Overline14Regular:
        return $r('app.float.text_size_overine_14_regular');
      default:
        return $r('app.float.text_size_body1_16_regular');
    }
  }

  export function fontWeight(category: FontCategory): FontWeight {
    switch (category) {
      case FontCategory.Headline96Light:
      case FontCategory.Headline72Light:
      case FontCategory.Headline60Light:
        return FontWeight.Lighter;
      case FontCategory.Headline48Regular:
      case FontCategory.Headline38Regular:
        return FontWeight.Regular;
      case FontCategory.Headline30Medium:
      case FontCategory.Headline24Medium:
      case FontCategory.Headline20Medium:
      case FontCategory.Subtitle18Medium:
      case FontCategory.Subtitle16Medium:
      case FontCategory.Subtitle14Medium:
        return FontWeight.Medium;
      case FontCategory.Body16Regular:
      case FontCategory.Body14Regular:
      case FontCategory.Body12Regular:
        return FontWeight.Regular;
      case FontCategory.Button16Medium:
      case FontCategory.Button14Medium:
        return FontWeight.Medium;
      case FontCategory.Caption10Regular:
      case FontCategory.Overline14Regular:
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
