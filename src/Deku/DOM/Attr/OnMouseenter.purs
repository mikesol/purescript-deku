module Deku.DOM.Attr.OnMouseenter where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMouseenter = OnMouseenter

instance Attr anything OnMouseenter Cb where
  pureAttr OnMouseenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseenter", value: cb' value }
  mapAttr OnMouseenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseenter", value: cb' value }

instance Attr anything OnMouseenter (Effect Unit) where
  pureAttr OnMouseenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
  mapAttr OnMouseenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseenter (Effect Boolean) where
  pureAttr OnMouseenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseenter", value: cb' (Cb (const value)) }
  mapAttr OnMouseenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseenter", value: cb' (Cb (const value)) }

type OnMouseenterEffect =
  forall element
   . Attr element OnMouseenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseenter Unit where
  pureAttr OnMouseenter _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseenter", value: unset' }

  mapAttr OnMouseenter evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "mouseenter", value: unset' }