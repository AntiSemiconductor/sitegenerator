{-# LANGUAGE OverloadedStrings #-}
module Carousel
       ( carouselHeaderStyle
  )where
import Prelude hiding ((**))
import qualified Clay as C
import Clay hiding (div)
carousel :: Selector
carousel = star # byClass "carousel"

carouselHeaderStyle :: Css
carouselHeaderStyle = do
  carousel ? do
    star # byClass "item" ? do
      height $ px 400
      width  $ pct 100
      backgroundSize $ cover
      backgroundPosition $ placed sideCenter sideBottom
      return ()

carouselStyle :: Css
carouselStyle = carousel ? do
  star # byClass "item" ? do
    --height $ px 400
    width  $ pct 100
    backgroundSize $ cover
    backgroundPosition $ placed sideCenter sideBottom
    return ()
