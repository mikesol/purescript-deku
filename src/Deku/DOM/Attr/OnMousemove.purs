module Deku.DOM.Attr.OnMousemove where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMousemove = OnMousemove

instance Attr anything OnMousemove Cb where
  pureAttr OnMousemove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousemove", value: cb' value }
  mapAttr OnMousemove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousemove", value: cb' value }

instance Attr anything OnMousemove (Effect Unit) where
  pureAttr OnMousemove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousemove", value: cb' (Cb (const (value $> true))) }
  mapAttr OnMousemove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousemove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousemove (Effect Boolean) where
  pureAttr OnMousemove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousemove", value: cb' (Cb (const value)) }
  mapAttr OnMousemove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousemove", value: cb' (Cb (const value)) }

type OnMousemoveEffect =
  forall element
   . Attr element OnMousemove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousemove Unit where
  pureAttr OnMousemove _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousemove", value: unset' }

  mapAttr OnMousemove evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "mousemove", value: unset' }