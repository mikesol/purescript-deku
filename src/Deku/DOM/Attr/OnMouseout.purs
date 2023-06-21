module Deku.DOM.Attr.OnMouseout where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMouseout = OnMouseout

instance Attr anything OnMouseout Cb where
  pureAttr OnMouseout value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "mouseout", value: cb' value }
  mapAttr OnMouseout evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mouseout", value: cb' value }

instance Attr anything OnMouseout (Effect Unit) where
  pureAttr OnMouseout value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseout evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseout (Effect Boolean) where
  pureAttr OnMouseout value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnMouseout evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mouseout", value: cb' (Cb (const value)) }

type OnMouseoutEffect =
  forall element
   . Attr element OnMouseout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseout Unit where
  pureAttr OnMouseout _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mouseout", value: unset' }
