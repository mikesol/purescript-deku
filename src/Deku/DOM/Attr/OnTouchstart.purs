module Deku.DOM.Attr.OnTouchstart where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTouchstart = OnTouchstart

instance Attr anything OnTouchstart Cb where
  pureAttr OnTouchstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchstart", value: cb' value }

instance Attr anything OnTouchstart (Effect Unit) where
  pureAttr OnTouchstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchstart (Effect Boolean) where
  pureAttr OnTouchstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchstart", value: cb' (Cb (const value)) }

type OnTouchstartEffect =
  forall element
   . Attr element OnTouchstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchstart Unit where
  pureAttr OnTouchstart _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "touchstart", value: unset' }
