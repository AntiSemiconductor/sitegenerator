{-# LANGUAGE OverloadedStrings #-}
import Clay

main :: IO ()
main = return () -- putCss test

test :: Css
test = header |> nav ?
  do background    white
     color         "#04a"
     fontSize      (px 24)
     --padding       20 0 20 0
     textTransform uppercase
     position      absolute
     --left          0
     --right         0
     bottom        (px (-72))
