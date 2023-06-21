module Deku.DOM.Attr.OnMouseup where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMouseup = OnMouseup

instance Attr anything OnMouseup Cb where
  pureAttr OnMouseup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "mouseup", value: cb' value }
  mapAttr OnMouseup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mouseup", value: cb' value }

instance Attr anything OnMouseup (Effect Unit) where
  pureAttr OnMouseup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseup", value: cb' (Cb (const (value $> true))) }
  mapAttr OnMouseup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseup (Effect Boolean) where
  pureAttr OnMouseup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseup", value: cb' (Cb (const value)) }
  mapAttr OnMouseup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseup", value: cb' (Cb (const value)) }

type OnMouseupEffect =
  forall element
   . Attr element OnMouseup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseup Unit where
  pureAttr OnMouseup _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseup", value: unset' }

  mapAttr OnMouseup evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "mouseup", value: unset' }