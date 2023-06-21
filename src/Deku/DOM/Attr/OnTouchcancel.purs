module Deku.DOM.Attr.OnTouchcancel where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTouchcancel = OnTouchcancel

instance Attr anything OnTouchcancel Cb where
  pureAttr OnTouchcancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchcancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchcancel", value: cb' value }

instance Attr anything OnTouchcancel (Effect Unit) where
  pureAttr OnTouchcancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchcancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchcancel (Effect Boolean) where
  pureAttr OnTouchcancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchcancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchcancel", value: cb' (Cb (const value)) }

type OnTouchcancelEffect =
  forall element
   . Attr element OnTouchcancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchcancel Unit where
  pureAttr OnTouchcancel _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "touchcancel", value: unset' }
