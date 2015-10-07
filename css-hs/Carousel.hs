{-# LANGUAGE OverloadedStrings #-}
module Carousel
       ( carouselHeaderStyle
  )where
import Prelude hiding ((**))
import qualified Clay as C
import Clay hiding (div)
carouselHeaderStyle :: Css
carouselHeaderStyle =
  carousel ** star # byClass "item" ? do
    height $ px 400
    width  $ auto
    backgroundSize $ cover
    backgroundPosition $ placed sideCenter sideBottom
    return ()
  where
    carousel = star # byClass "carousel"
--    carouselImage = star # byClass "carousel" ** star # item |> img
