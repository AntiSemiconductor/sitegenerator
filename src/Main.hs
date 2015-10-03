{-# LANGUAGE OverloadedStrings #-}
module Main (main) where
import Hakyll
import Data.Monoid ((<>))
import Control.Monad

myContext :: Context String
myContext = defaultContext

clayCompiler :: Compiler (Item String)
clayCompiler = getResourceString
                >>= withItemBody (unixFilter "cabal" ["exec","--","runghc"])
headerContext :: Context String
headerContext = field "header" $ \item -> return $ itemBody item
main :: IO ()
main = hakyll $ do
  -- files not modified
  forM_ ["img/*" .||. "img/header/*"
        ,"fonts/*","texts/*"] $ \pat -> match pat $ do
    route idRoute
    compile copyFileCompiler
  -- css files,which is shrinked
  match "css/*.css" $ do
    route idRoute
    compile compressCssCompiler
  -- templates
  match "css/*.hs" $ do
    route $ setExtension "css"
    compile clayCompiler
  match "templates/*" $ do
    compile templateCompiler
  -- specified files
  match "js/*" $ do
    route idRoute
    compile copyFileCompiler
  match ("index.html") $ do
    route idRoute
    compile indexCompiler
  match ("contact.html") $ do
    route idRoute
    compile indexCompiler

indexCompiler :: Compiler (Item String)
indexCompiler = do
  itm <- getResourceBody
  itm' <- applyAsTemplate myContext itm
  addHeader itm' >>= defaultLayout

addHeader :: Item String -> Compiler (Item String)
addHeader = loadAndApplyTemplate "templates/header.html" myContext

defaultLayout :: Item String -> Compiler (Item String)
defaultLayout = loadAndApplyTemplate "templates/default.html" myContext
