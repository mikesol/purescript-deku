module Deku.DOM.Attr.OnPointerleave where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerleave = OnPointerleave

instance Attr anything OnPointerleave Cb where
  pureAttr OnPointerleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerleave", value: cb' value }

instance Attr anything OnPointerleave (Effect Unit) where
  pureAttr OnPointerleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerleave (Effect Boolean) where
  pureAttr OnPointerleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerleave", value: cb' (Cb (const value)) }

type OnPointerleaveEffect =
  forall element
   . Attr element OnPointerleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerleave Unit where
  pureAttr OnPointerleave _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerleave", value: unset' }
