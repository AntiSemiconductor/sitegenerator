{-# LANGUAGE OverloadedStrings #-}
module Main where
import Prelude hiding ((**))
import Data.Text (Text())
import Carousel
import ColorTheme
import NavBar
import Clay hiding (div)
import qualified Clay as C

main :: IO ()
main = putCss stylesEnabled
  where
    stylesEnabled = sequence_
                    [ mainTextStyle
                    , navBarStyle
                    , newsHead
                    , sectionSetting
                    , bodyStyle
                    , footerStyle
                    , carouselHeaderStyle
                    , headingStyle
                    , soraProfileStyle
                    ]
newsHead :: Css
newsHead = s1 >> s2
  where s1 = byClass "news-head" & do
          textAlign $ alignSide sideCenter
          color color1
          backgroundColor color2
        s2 = star # (byClass "news-head") ** h1 # (byClass "heading") ? do

          fontSize $ em 5
headingStyle :: Css
headingStyle = byClass "heading" & do
  headerFontFamily

defaultFonts :: [Text]
defaultFonts = [ "Arial"
               , "ヒラギノ角ゴ Pro W3"
               , "Hiragino Kaku Gothic Pro"
               , "Osaka"
               , "メイリオ"
               , "Meiryo"
               , "ＭＳ Ｐゴシック"
               , "MS PGothic"
               ]

headerFontFamily :: Css
headerFontFamily = fontFamily defaultFonts [sansSerif]

defaultFontFamily :: Css
defaultFontFamily = fontFamily
                    ([ "Shuei KakuGo Gin L"
                    ] ++ defaultFonts) [sansSerif]


soraProfileStyle :: Css
soraProfileStyle = do
  return ()

footerStyle :: Css
footerStyle = footer ? do
  marginTop    $ px 20
  marginBottom $ px 50
bodyStyle :: Css
bodyStyle = body ? do
  defaultFontFamily
  paddingTop $ px 50
sectionSetting :: Css
sectionSetting = section |> (C.div # byClass "container") ? do
  paddingTop    $ px 40
  paddingBottom $ px 40
mainTextStyle :: Css
mainTextStyle = byClass "main-text" & do
  paddingLeft  $ px 60
  paddingRight $ px 60
  background    white
  return ()
