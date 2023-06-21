module Deku.DOM.Attr.OnMouseleave where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMouseleave = OnMouseleave

instance Attr anything OnMouseleave Cb where
  pureAttr OnMouseleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseleave", value: cb' value }

instance Attr anything OnMouseleave (Effect Unit) where
  pureAttr OnMouseleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseleave (Effect Boolean) where
  pureAttr OnMouseleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseleave", value: cb' (Cb (const value)) }

type OnMouseleaveEffect =
  forall element
   . Attr element OnMouseleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseleave Unit where
  pureAttr OnMouseleave _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseleave", value: unset' }
