module Deku.DOM.Attr.OnTouchend where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTouchend = OnTouchend

instance Attr anything OnTouchend Cb where
  pureAttr OnTouchend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "touchend", value: cb' value }
  mapAttr OnTouchend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchend", value: cb' value }

instance Attr anything OnTouchend (Effect Unit) where
  pureAttr OnTouchend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "touchend", value: cb' (Cb (const (value $> true))) }
  mapAttr OnTouchend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchend (Effect Boolean) where
  pureAttr OnTouchend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "touchend", value: cb' (Cb (const value)) }
  mapAttr OnTouchend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchend", value: cb' (Cb (const value)) }

type OnTouchendEffect =
  forall element
   . Attr element OnTouchend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchend Unit where
  pureAttr OnTouchend _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "touchend", value: unset' }

  mapAttr OnTouchend evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "touchend", value: unset' }