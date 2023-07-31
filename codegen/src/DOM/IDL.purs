-- | Utilities to work with the IDL types
module DOM.IDL where

import Prelude
import Prim hiding (Type)

import DOM.Spec (IDL, IDLType(..), Interface, Member(..), Mixin(..), Tag)
import DOM.TypeStub(TypeStub(..))
import Data.Array as Array
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign

validTag :: Tag -> Maybe ( String /\ String )
validTag { obsolete : Just true } = Nothing
validTag { interface : Nothing } = Nothing
validTag { interface : Just interface, name } = Just $ name /\ interface

attributeMember :: Member -> Array ( String /\ IDLType )
attributeMember = case _ of
        -- only emit writeable(not readonly attributes)
        Attribute { idlType, name : attrName, readonly } | maybe true not readonly ->
            [ attrName /\ idlType ]
        
        _ ->
            []
            
-- | Looks up an interface and returns all inherited and mixed in interfaces.
resolveInterface :: IDL -> String -> Maybe ( Interface /\ Array String )
resolveInterface spec name = do
    let
        extensions :: Array Mixin
        extensions =
            fromMaybe []
                $ Foreign.lookup name spec.idlExtendedNames

        extendSuper :: Array String
        extendSuper = 
            Array.mapMaybe included extensions

        extendAttr :: Array Member
        extendAttr =
            bind extensions case _ of
                Interface { members : Just m } ->
                    m

                _ ->
                    []

    intf <- Foreign.lookup name spec.idlNames
    let
        bases :: Array String
        bases = 
            maybe extendSuper ( Array.snoc extendSuper ) intf.inheritance

        members :: Array Member
        members =
            maybe extendAttr ( append extendAttr ) intf.members

    pure $ intf { members = Just members } /\ bases

    where

    included = case _ of
        Includes { includes } ->
            Just includes
        
        _ ->
            Nothing


mapType :: IDLType -> Array TypeStub
mapType = case _ of
    Descriptor t -> mapType t.idlType

    Primitive "boolean" ->
        pure TypeBoolean
    
    Primitive "long" ->
        pure TypeInt

    Primitive "unsigned long" ->
        pure TypeInt

    Primitive "long long" ->
        pure TypeInt
    
    Primitive "unsigned long long" -> 
        pure TypeInt

    Primitive "unsigned short" ->
        pure TypeInt

    Primitive "double" -> 
        pure TypeNumber

    Primitive "unrestricted double" ->
        pure TypeNumber
        
    Primitive "Number" ->
        pure TypeNumber

    Primitive "SVGAnimatedNumber" ->
        pure TypeNumber

    Primitive "EventHandler" ->
        pure TypeEventHandler

    Primitive "any" ->
        pure TypeString

    Primitive "DOMString" ->
        pure TypeString

    Primitive "DOMTokenList" ->
        pure TypeString

    Primitive "USVString" ->
        pure TypeString

    Primitive "SVGAnimatedEnumeration" ->
        pure TypeString

    Union s ->
        bind s mapType

    Primitive _ ->
        []
