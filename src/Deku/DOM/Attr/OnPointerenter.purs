module Deku.DOM.Attr.OnPointerenter where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter Cb where
  pureAttr OnPointerenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerenter", value: cb' value }

instance Attr anything OnPointerenter (Effect Unit) where
  pureAttr OnPointerenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerenter (Effect Boolean) where
  pureAttr OnPointerenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerenter", value: cb' (Cb (const value)) }

type OnPointerenterEffect =
  forall element
   . Attr element OnPointerenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerenter Unit where
  pureAttr OnPointerenter _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerenter", value: unset' }
