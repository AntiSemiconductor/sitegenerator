{-# LANGUAGE OverloadedStrings #-}
module NavBar where
import Clay
import ColorTheme
navBarStyle :: Css
navBarStyle = nbWrapper
  where
    nbWrapper = byClass "navbar-wrapper" & do
      position absolute
      top    $ px 0
      right  $ px 0
      left   $ px 0
      zIndex $ 20
    navBarColors = byClass "navbar-antisemiconductor" & do
      color $ color3
      backgroundColor $ color3
