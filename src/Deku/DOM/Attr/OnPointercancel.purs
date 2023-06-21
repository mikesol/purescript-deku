module Deku.DOM.Attr.OnPointercancel where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointercancel = OnPointercancel

instance Attr anything OnPointercancel Cb where
  pureAttr OnPointercancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointercancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointercancel", value: cb' value }

instance Attr anything OnPointercancel (Effect Unit) where
  pureAttr OnPointercancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointercancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointercancel (Effect Boolean) where
  pureAttr OnPointercancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointercancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointercancel", value: cb' (Cb (const value)) }

type OnPointercancelEffect =
  forall element
   . Attr element OnPointercancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointercancel Unit where
  pureAttr OnPointercancel _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointercancel", value: unset' }
