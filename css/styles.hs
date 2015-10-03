{-# LANGUAGE OverloadedStrings #-}
import Prelude hiding ((**))
import Clay hiding (div)
import qualified Clay as C

-- Theme Colors
color1 :: Color
color1 = rgb 0x04 0x87 0xD9

color2 :: Color
color2 = rgb 0xF2 0xF2 0xF2

color3 :: Color
color3 = rgb 0x05 0xDB 0xF2

color4 :: Color
color4 = rgb 0x0f 0xf2 0xf2

color5 :: Color
color5 = rgb 0xf2 0xe9 0x6d

main :: IO ()
main = putCss stylesEnabled
newsHead :: Css
newsHead = s1 >> s2
  where s1 = byClass "news-head" & do
          textAlign $ alignSide sideCenter
          color color1
          backgroundColor color2
        s2 = star # (byClass "news-head") ** h1 # (byClass "heading") ? do
          fontSize $ em 5
stylesEnabled :: Css
stylesEnabled = sequence_
                [ mainTextStyle
                , navBarStyle
                , newsHead
                , sectionSetting
                , bodyStyle
                ]
bodyStyle :: Css
bodyStyle = body ? do
  paddingTop $ px 50
sectionSetting :: Css
sectionSetting = section |> (C.div # byClass "container") ? do
  paddingTop    $ px 40
  paddingBottom $ px 40
mainTextStyle :: Css
mainTextStyle = byClass "main-text" & do
  paddingLeft  $ px 30
  paddingRight $ px 30
  background    white
  return ()

navBarStyle :: Css
navBarStyle = nbWrapper
  where
    nbWrapper = byClass "navbar-wrapper" & do
      position absolute
      top    $ px 0
      right  $ px 0
      left   $ px 0
      zIndex $ 20