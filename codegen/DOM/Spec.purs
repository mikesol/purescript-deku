module DOM.Spec where

import Prelude

import Data.Argonaut.Core (isArray, isObject)
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError(..), decodeJson)
import Data.Argonaut.Decode.Decoders (decodeJObject)
import Data.Either (Either(..), note)
import Data.Maybe (Maybe)
import Foreign.Object as Foreign

type TagSpec =
    { spec :: 
        { title :: String 
        , url :: String
        }
    , elements :: Array Tag
    }

type Tag =
    { name :: String
    , interface :: String
    }


type InterfaceSpec =
    {  spec :: 
        { title :: String 
        , url :: String
        }
    , idlparsed :: IDL
    }

type IDL =
    { idlNames :: Foreign.Object Interface
    , idlExtendedNames :: Foreign.Object ( Array Mixin )
    }

type Interface =
    { type :: String
    , name :: String
    , inheritance :: Maybe String
    , members :: Maybe ( Array Member )
    , fragment :: String
    }

mergeIDL :: IDL -> IDL -> IDL
mergeIDL { idlNames : nl, idlExtendedNames : enl } { idlNames : nr, idlExtendedNames : enr } =
    { idlNames : Foreign.union nl nr
    , idlExtendedNames : Foreign.unionWith append enl enr
    }

data Member 
    = Constructor
    | Operation Attribute
    | Attribute Attribute
    | Const
    | Field { name :: String }

derive instance Eq Member
derive instance Ord Member
instance DecodeJson Member where
    decodeJson json = do
        member <- decodeJObject json
        type_ <- decodeJson =<< note MissingValue ( Foreign.lookup "type" member )
        case type_ of
            "constructor" ->
                pure Constructor

            "operation" ->
                Operation <$> decodeJson json

            "attribute" ->
                Attribute <$> decodeJson json

            "const" ->
                pure Const
            
            "field" ->
                Field <$> decodeJson json

            _ ->
                Left $ UnexpectedValue json

data Mixin 
    = Includes 
        { fragment :: String
        , includes :: String
        }
    | Interface
        { inheritance :: Maybe String
        , members :: Maybe ( Array Member )
        , partial :: Boolean
        }


derive instance Eq Mixin
derive instance Ord Mixin
instance DecodeJson Mixin where
    decodeJson json = do
        member <- decodeJObject json
        type_ <- decodeJson =<< note MissingValue ( Foreign.lookup "type" member )
        case type_ of
            "includes" ->
                Includes <$> decodeJson json

            "interface" ->
                Interface <$> decodeJson json
                
            "interface mixin" ->
                Interface <$> decodeJson json

            _ ->
                Left $ UnexpectedValue json


type Attribute = 
    { name :: String
    , idlType :: IDLType
    , readonly :: Maybe Boolean
    }

data IDLType
    = Union ( Array IDLType )
    | Descriptor IDLDescriptor
    | Primitive String
derive instance Eq IDLType
derive instance Ord IDLType
instance DecodeJson IDLType where
    decodeJson json = 
        if isObject json then
            Descriptor <$> decodeJson json

        else if isArray json then
            Union <$> decodeJson json

        else
            Primitive <$> decodeJson json

type IDLDescriptor =
    { nullable :: Boolean
    , idlType :: IDLType
    }

type KeywordSpec =
    { spec ::
        { title :: String
        , url :: String
        }
    , dfns :: Array Definition
    }

type Definition =
    { id :: String
    , href :: String
    , linkingText :: Array String
    , localLinkingText :: Array String
    , informative :: Boolean
    , access :: String
    , for :: Array String
    , type :: String
    , definedIn :: String
    , heading ::
        { id :: String
        , href :: String
        , title :: String
        , number :: Maybe String
        }
    }