module DOM.Spec where

import Prelude

import Data.Argonaut.Core (isArray, isObject)
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError(..), decodeJson)
import Data.Argonaut.Decode.Decoders (decodeJObject)
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode.Generic (genericEncodeJson)
import Data.Either (Either(..), note)
import Data.Generic.Rep (class Generic)
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
    , interface :: Maybe String
    , obsolete :: Maybe Boolean
    }

type EventSpec =
    { spec :: { title :: String, url :: String }
    , events :: Array EventDef
    }

type EventDef =
    { href :: Maybe String
    , src :: { format :: String, href :: Maybe String }
    , type :: String
    , targets :: Array String
    , interface :: String
    , bubbles :: Maybe Boolean
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
    | Operation { name :: String }
    | Attribute Attribute
    | Const
    | Field { name :: String }
    | Iterable

derive instance Eq Member
derive instance Ord Member
derive instance Generic Member _
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

            "iterable" ->
                pure Iterable

            _ ->
                Left $ UnexpectedValue json

instance EncodeJson Member where
    encodeJson = genericEncodeJson

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
derive instance Generic Mixin _
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
instance EncodeJson Mixin where
    encodeJson = genericEncodeJson

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
derive instance Generic IDLType _
instance DecodeJson IDLType where
    decodeJson json = 
        if isObject json then
            Descriptor <$> decodeJson json

        else if isArray json then
            Union <$> decodeJson json

        else
            Primitive <$> decodeJson json
instance EncodeJson IDLType where
    encodeJson a = genericEncodeJson a

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
        { id :: Maybe String
        , href :: String
        , title :: String
        , number :: Maybe String
        }
    }