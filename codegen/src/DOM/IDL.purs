-- | Utilities to work with the IDL types. This can be used to implement properties instead of attributes.
module DOM.IDL where

import Prelude
import Prim hiding (Type)

import DOM.Spec (IDLType(..), Member(..), Mixin(..), Tag)
import DOM.TypeStub (TypeStub(..))
import Data.Array as Array
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign

validTag :: Tag -> Maybe (String /\ String)
validTag { obsolete: Just true } = Nothing
validTag { interface: Nothing } = Nothing
validTag { interface: Just interface, name } = Just $ name /\ interface

attributeMember :: Member -> Array (String /\ IDLType)
attributeMember = case _ of
  -- only emit writeable(not readonly attributes)
  Attribute { idlType, name: attrName, readonly } | maybe true not readonly ->
    [ attrName /\ idlType ]

  _ ->
    []

-- | Looks up an interface and returns all inherited and mixed in interfaces.
resolveInterface
  :: Foreign.Object (Array String)
  -> Foreign.Object (Array Mixin)
  -> String
  -> Array String
resolveInterface inheritance extended name = do
  let
    extensions :: Array Mixin
    extensions =
      fromMaybe []
        $ Foreign.lookup name extended

    bases :: Array String
    bases =
      maybe mempty identity (Foreign.lookup name inheritance)

  bases <> Array.mapMaybe included extensions

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
    pure $ TypeEvent "Event" "Web.Event.Internal.Types"

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
