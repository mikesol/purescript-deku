module Deku.DOM.Attr.OnMousedown where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMousedown = OnMousedown

instance Attr anything OnMousedown Cb where
  pureAttr OnMousedown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousedown", value: cb' value }
  mapAttr OnMousedown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousedown", value: cb' value }

instance Attr anything OnMousedown (Effect Unit) where
  pureAttr OnMousedown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousedown", value: cb' (Cb (const (value $> true))) }
  mapAttr OnMousedown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousedown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousedown (Effect Boolean) where
  pureAttr OnMousedown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousedown", value: cb' (Cb (const value)) }
  mapAttr OnMousedown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousedown", value: cb' (Cb (const value)) }

type OnMousedownEffect =
  forall element
   . Attr element OnMousedown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousedown Unit where
  pureAttr OnMousedown _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousedown", value: unset' }

  mapAttr OnMousedown evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "mousedown", value: unset' }