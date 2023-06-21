module Deku.DOM.Attr.OnMouseover where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMouseover = OnMouseover

instance Attr anything OnMouseover Cb where
  pureAttr OnMouseover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseover", value: cb' value }

instance Attr anything OnMouseover (Effect Unit) where
  pureAttr OnMouseover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseover (Effect Boolean) where
  pureAttr OnMouseover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseover", value: cb' (Cb (const value)) }

type OnMouseoverEffect =
  forall element
   . Attr element OnMouseover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseover Unit where
  pureAttr OnMouseover _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseover", value: unset' }
