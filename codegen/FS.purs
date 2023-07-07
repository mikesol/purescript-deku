module FS where

import Prelude

import Control.Monad.Except (ExceptT(..), except, withExceptT)
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError, decodeJson, parseJson, printJsonDecodeError)
import Data.Array as Array
import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.String as String
import Effect.Aff (Aff, Error, attempt, error)
import Effect.Aff.Class (liftAff)
import Fetch (fetch)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (mkdir, readTextFile, stat, writeTextFile)
import Node.Path as Path

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

createDir :: String -> ExceptT Error Aff Unit
createDir dirs = do
    let 
        paths :: Array String
        paths = Array.scanl (\l r -> Path.concat [ l, r ] ) "." $ String.split ( String.Pattern Path.sep ) dirs

    for_ paths \dir -> do
        exists <- liftAff $ attempt $ stat dir
        case exists of
            Left _ ->
                liftAff $ mkdir dir

            _ ->
                pure unit