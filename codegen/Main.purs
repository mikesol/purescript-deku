module Main where

import Prelude

import Control.Monad.Except (ExceptT(..), except, runExceptT, withExceptT)
import DOM.Indexed as Indexed
import DOM.Spec (InterfaceSpec, KeywordSpec, TagSpec, ifReference, keywordReference, tagReference)
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError, decodeJson, parseJson, printJsonDecodeError)
import Data.Either (Either(..), blush)
import Data.Foldable (for_)
import Effect (Effect)
import Effect.Aff (Aff, Error, attempt, error, launchAff_, message)
import Effect.Aff.Class (liftAff)
import Effect.Class.Console as Console
import Fetch (fetch)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (readTextFile, writeTextFile)
import Parser as Parser

main :: Effect Unit
main = launchAff_ do
    r <- runExceptT generate
    for_ ( blush r ) \e -> do
        Console.log $ message e

cachedFetch :: forall t . DecodeJson t => String -> String -> ExceptT Error Aff t
cachedFetch cacheName url = do
    file <- liftAff $ attempt $ readTextFile UTF8 cacheName
    text <- case file of
        Left _ -> do
            tagFetch <- ExceptT $ attempt $ fetch url {}
            txt <- liftAff tagFetch.text
            void $ liftAff $ attempt $ writeTextFile UTF8 cacheName txt
            pure txt

        Right txt ->
            pure txt

    json <- withExceptT fromJsonError $ except $ parseJson text
    withExceptT fromJsonError $ except $ decodeJson json :: _ t

    where
    
    fromJsonError :: JsonDecodeError -> Error
    fromJsonError = 
        printJsonDecodeError >>> error


generate :: ExceptT Error Aff Unit
generate = do
    tagSpec <- cachedFetch "tags.json" tagReference :: _ TagSpec
    ifSpec <- cachedFetch "interface.json" ifReference :: _ InterfaceSpec
    keywordSpec <- cachedFetch "keyword.json" keywordReference :: _ KeywordSpec

    Indexed.generate tagSpec ifSpec keywordSpec

    Parser.generate

    pure unit
